/// @function scr_download_thumbnails(download_all, what_num_items = 0)
/// @description Handles downloading and processing of thumbnail images and metadata.
/// This function works in two modes:
/// 1. Download All: Iterates over a queue of items if download_all is true.
/// 2. Single Download: Processes a specific item (based on global.selected_online_download_index) if download_all is false.
function scr_download_thumbnails(download_all, what_num_items = 0)
{
	/* If we are not in "download all" mode,
	set the queue index to the one selected by the user. */
	if (!download_all)
	{
		info_queue_index = global.selected_online_download_index;
		scr_log("INFO", "THUMBNAILS", "single_download_mode", "info_queue_index=" + string(info_queue_index));
	}
	
	/* The following complex conditional determines whether to send a new HTTP request to download thumbnail metadata.
	It checks two scenarios:
	Scenario 1: "Download All" mode is active.
	- Ensure there are more items to process (info queue index < what num items)
	- And that we are allowed to make a new HTTP request (info queue http request is true).
	Scenario 2: Not in "download all" mode, meaning we process the single selected item.
	Additionally, in either case, it verifies that the list of download IDs (all download id) is a valid array. */
	if (
		(
			(download_all
			&& info_queue_http_request)
			|| (!download_all)
		)
		&& is_array(all_download_id)
	)
	&& (info_queue_index < array_length(all_download_id)) /* Make sure index is in bounds */
	&& (string(all_download_id[info_queue_index]) != "") /* Make sure that the 'Download ID' string isn't empty */
	{
		scr_log("DEBUG", "THUMBNAILS", "begin_http_request",
			"download_all=" + string(download_all) + ", info_queue_index=" + string(info_queue_index) + ", what_num_items=" + string(what_num_items));
		
		/* Prevent additional HTTP requests until the current one is finished. */
		info_queue_http_request = false; scr_log("DEBUG", "THUMBNAILS", "queue_http_lock", "info_queue_http_request=false");
		/* Reset any previous metadata. */
		caution_online_takes_you_back_to = "download_online_" + string(global.selected_online_download_index)
		
		scr_log("DEBUG", "THUMBNAILS", "reset_metadata",
			"menu=" + string(menu) + ", back_to=" + string(caution_online_takes_you_back_to));
		
		global.info_data = undefined;
		global.online_download_list_info = "";
		
		/* Only send the HTTP request if the device is connected to the network. */
		if (scr_check_network_connection(network_connect_active))
		{
			scr_log("INFO", "THUMBNAILS", "http_request_start", "download_id=" + string_upper(all_download_id[info_queue_index]));
			
			/* Construct and send an HTTP GET request to fetch metadata.
			URL format: "https://<base_url>/metadata/<content_type>s/<downloadID>?os_type=<os_type>" */
			var http_request_content_url = "https://" + global.base_url + "/metadata/" + string(content_type) + "s/" +
				string_upper(all_download_id[info_queue_index]) +
				"?os_type=" + string(os_type)
			
        /* Build request-scoped headers for robustness */
        var info_headers = ds_map_create();
        ds_map_add(info_headers, "Content-Type", "application/json");
        ds_map_add(info_headers, "User-Agent", "gmdownloader");
        ds_map_add(info_headers, "X-API-Key", global.api_key);

        global.http_request_info = http_request(
            http_request_content_url,
            "GET",
            info_headers,
            ""
        );
        ds_map_destroy(info_headers);
			
			scr_log("DEBUG", "THUMBNAILS", "http_request_sent",
				"download_id=" + string(all_download_id[info_queue_index]) + ", request_id=" + string(global.http_request_info));
			scr_log("TRACE", "THUMBNAILS", "request_url", http_request_content_url);
		}
		else
		{
				scr_log("ERROR", "THUMBNAILS", "network_unavailable", "download_id=" + string_upper(all_download_id[info_queue_index]));
			in_online_download_list_menu = false;
				scr_log("DEBUG", "THUMBNAILS", "set_flag", "in_online_download_list_menu=false");
			scr_handle_no_network_connection("scr_download_thumbnails", "download_online_" + string(global.selected_online_download_index));
		}
	}
    else
    {
        // Rate‑limit identical skip logs to avoid spamming the console
        if (!variable_global_exists("thumb_skip_log_key"))
        {
            global.thumb_skip_log_key = "";
            global.thumb_skip_log_time = 0;
        }

        var _key = string(info_queue_http_request) + ":" + string(info_queue_index);
        var _now = get_timer(); // microseconds since game start

        // Log only if the state changed or at least 1 second passed
        if ((_key != global.thumb_skip_log_key) || (_now - global.thumb_skip_log_time > 1000000))
        {
            scr_log("DEBUG", "THUMBNAILS", "skip_http_request",
                "info_queue_http_request=" + string(info_queue_http_request) + ", info_queue_index=" + string(info_queue_index));
            global.thumb_skip_log_key = _key;
            global.thumb_skip_log_time = _now;
        }
    }
	
	/* Once an HTTP response is received, info_data is still undefined until processed.
	This block checks that:
	- We haven't processed the info yet (info data is undefined)
	- We don't HAVE to be in the online download list menu, this should be able to download in the background when able to
	- No HTTP request is currently pending (info queue http request is false) */
	if (global.info_data == undefined
	&& !info_queue_http_request)
	{
		/* Check that the server response (global online download list info) is valid.
		It must not be empty, nor indicate a failed HTTP request ("HTTP request exception") or lack proper authorization ("Unauthorized"). */
		if (global.online_download_list_info != ""
		&& global.online_download_list_info != "HTTP request exception"
		&& global.online_download_list_info != "Unauthorized")
		{
			try
			{
					scr_log("DEBUG", "THUMBNAILS", "parse_json_start", "download_id=" + string_upper(all_download_id[info_queue_index]));
				/* Attempt to parse the JSON response into info_data. */
				global.info_data = json_parse(global.online_download_list_info);
				/* Convert the parsed JSON into an array for uniform processing. */
				global.info_data = array_create(1, global.info_data);
					scr_log("DEBUG", "THUMBNAILS", "parse_json_ok", "download_id=" + string_upper(all_download_id[info_queue_index]));
			}
			catch (e)
			{
				/* Log an error if JSON parsing fails and reset info_data. */
					scr_log("ERROR", "THUMBNAILS", "parse_json_failed", "download_id=" + string_upper(all_download_id[info_queue_index]));
				
				global.info_data = undefined;
			}
		}
		
		/* If info_data is now a valid array, process each item in the array. */
		if (is_array(global.info_data))
		{
			var num_info_items = array_length(global.info_data);
			
				scr_log("DEBUG", "THUMBNAILS", "process_info_items",
					"count=" + string(num_info_items) + ", download_id=" + string_upper(all_download_id[info_queue_index]));
			
			for (var j = 0; j < num_info_items; j++)
			{
				var item = global.info_data[j];
				
				/* If no display name has been set for this download item, set it now. */
				if (global.draw_download_name[info_queue_index] == "")
				{
					/* Check the item's name for profanity. */
					if (switch_check_profanity(item.name))
					{
						/* Mask any profanity found in the name. */
						global.draw_download_name[info_queue_index] = string(switch_mask_profanity(item.name));
						
							scr_log("WARN", "THUMBNAILS", "name_masked_for_profanity",
								"download_id=" + string_upper(all_download_id[info_queue_index]) + ", new_name=" + string(global.draw_download_name[info_queue_index]));
					}
					else
					{
						/* Otherwise, use the item's name as is. */
						global.draw_download_name[info_queue_index] = string(item.name);
						
							scr_log("INFO", "THUMBNAILS", "set_download_name",
								"download_id=" + string_upper(all_download_id[info_queue_index]) + ", name=" + string(global.draw_download_name[info_queue_index]));
					}
				}
				
					scr_log("TRACE", "THUMBNAILS", "name_slot",
						"index=" + string(info_queue_index) + ", name=" + string(global.draw_download_name[info_queue_index]));
				
				/* Check if the thumbnail sprite is still missing. */
				if (is_array(global.spr_download_list_thumbnail) /* Only index if it’s a real array and the index is valid */
				&& info_queue_index >= 0
				&& info_queue_index < array_length(global.spr_download_list_thumbnail)
				&& global.spr_download_list_thumbnail[info_queue_index] == spr_thumbnail_missing)
				{
					/* Build the file path where the thumbnail image will be saved. */
					var downloaded_thumbnail_path = temp_directory + "thumbnail_" + string(info_queue_index) + ".png";
					
		scr_log("INFO", "THUMBNAILS", "thumbnail_decode_save",
			"download_id=" + string_upper(all_download_id[info_queue_index]) + ", path=" + string(downloaded_thumbnail_path));
					
					/* Decode the base64 thumbnail data from the JSON item. */
					var buffer = buffer_base64_decode(item.thumbnail);
					
					/* Save the decoded image buffer to a file. Otherwise the thumbnails will show up as blank */
					buffer_save(buffer, downloaded_thumbnail_path);
					
					/* Create a sprite from the saved thumbnail image file. */
					global.spr_download_list_thumbnail[info_queue_index] = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
					
					scr_log("INFO", "THUMBNAILS", "thumbnail_sprite_created", "download_id=" + string_upper(all_download_id[info_queue_index]));
				}
			}
		}
	}
	
	/* Final check: if there is no pending HTTP request and the current item's download name has been set,
	then move to the next item in the queue. */
	if (
		!info_queue_http_request &&
		is_array(global.draw_download_name) &&
		is_array(all_download_id) &&
		info_queue_index < array_length(global.draw_download_name) &&
		info_queue_index < array_length(all_download_id) &&
		global.draw_download_name[info_queue_index] != ""
	)
	{
		scr_log("INFO", "THUMBNAILS", "item_processed", "download_id=" + string_upper(all_download_id[info_queue_index]) + ", action=advance");
		
		/* Increment the queue index to process the next thumbnail. */
		info_queue_index++;
		/* Allow a new HTTP request for the next item. */
		info_queue_http_request = true;
		scr_log("DEBUG", "THUMBNAILS", "queue_http_unlock", "info_queue_http_request=true");
	}
	//else
	//{
	//	/* Debug messages checking what if checks are failing or not */
	//	var current_name = "undefined";
	    
	//	if (is_array(global.draw_download_name)
	//	&& info_queue_index < array_length(global.draw_download_name))
	//	{
	//        current_name = global.draw_download_name[info_queue_index];
	//    }
		
	//    show_debug_message("[scr_download_thumbnails] Final check did not pass. " +
	//        "info_queue_http_request: " + string(info_queue_http_request) +
	//        ", global.draw_download_name[info_queue_index]: " + current_name +
	//        ", info_queue_index: " + string(info_queue_index) +
	//        ", array_length(global.draw_download_name): " + (is_array(global.draw_download_name) ? string(array_length(global.draw_download_name)) : "not an array") + "\n");
	//}
}
