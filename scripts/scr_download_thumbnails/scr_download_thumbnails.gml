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
		show_debug_message("[scr_download_thumbnails] Single download mode: info_queue_index set to " + string(info_queue_index));
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
		show_debug_message("[scr_download_thumbnails] Condition met for HTTP request. download_all: " + string(download_all)
							+ ", info_queue_index: " + string(info_queue_index)
							+ ", what_num_items: " + string(what_num_items));
		
		/* Prevent additional HTTP requests until the current one is finished. */
		info_queue_http_request = false; show_debug_message("[scr_download_thumbnails] 'info_queue_http_request' is set to false. Prevent additional HTTP requests until the current one is finished");
		/* Reset any previous metadata. */
		caution_online_takes_you_back_to = "download_online_" + string(global.selected_online_download_index)
		
		show_debug_message("[scr_download_thumbnails] Resetting metadata. info_data = undefined. menu = " + string(menu) + ", caution_online_takes_you_back_to = " + string(caution_online_takes_you_back_to));
		
		info_data = undefined;
		global.online_download_list_info = "";
		
		/* Only send the HTTP request if the device is connected to the network. */
		if (scr_check_network_connection(network_connect_active))
		{
			show_debug_message("[scr_download_thumbnails] Network active. Sending HTTP request for item: " + string_upper(all_download_id[info_queue_index]));
			
			/* Construct and send an HTTP GET request to fetch metadata.
			URL format: "https://<base_url>/metadata/<content_type>s/<downloadID>?os_type=<os_type>" */
			var http_request_content_url = "https://" + global.base_url + "/metadata/" + string(content_type) + "s/" +
				string_upper(all_download_id[info_queue_index]) +
				"?os_type=" + string(os_type)
			
			global.http_request_info = http_request(
				http_request_content_url,
				"GET",
				global.online_download_request_headers, /* Need to retrieve the header information from "scr initialize online download menu" */
				""
			);
			
			show_debug_message("[scr_download_thumbnails] HTTP request sent for: " + string(all_download_id[info_queue_index]));
			show_debug_message("[scr_download_thumbnails] 'global.http_request_info' : " + string(global.http_request_info));
			show_debug_message("[scr_download_thumbnails] Request URL (http_request_content_url): " + string(http_request_content_url));
		}
		else
		{
			show_debug_message("[scr_download_thumbnails] No network connection detected. Cannot send HTTP request for item: " + string_upper(all_download_id[info_queue_index]));
			in_online_download_list_menu = false;
			show_debug_message("[scr_download_thumbnails] 'In online download list menu' is set to false when we are about to handle no network connection\n");
			scr_handle_no_network_connection("scr_download_thumbnails", "download_online_" + string(global.selected_online_download_index));
		}
	}
	
	/* Once an HTTP response is received, info_data is still undefined until processed.
	This block checks that:
	- We haven't processed the info yet (info data is undefined)
	- We don't HAVE to be in the online download list menu, this should be able to download in the background when able to
	- No HTTP request is currently pending (info queue http request is false) */
	if (info_data == undefined
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
				show_debug_message("[scr_download_thumbnails] Attempting to parse JSON for item: " + string_upper(all_download_id[info_queue_index]));
				/* Attempt to parse the JSON response into info_data. */
				info_data = json_parse(global.online_download_list_info);
				/* Convert the parsed JSON into an array for uniform processing. */
				info_data = array_create(1, info_data);
				show_debug_message("[scr_download_thumbnails] JSON parsed successfully for item: " + string_upper(all_download_id[info_queue_index]));
			}
			catch (e)
			{
				/* Log an error if JSON parsing fails and reset info_data. */
				show_debug_message("[scr_download_thumbnails] Failed to get JSON for " + string_upper(all_download_id[info_queue_index]) +
								   " Invalid JSON format: " + string(global.online_download_list_info));
				
				info_data = undefined;
			}
		}
		
		/* If info_data is now a valid array, process each item in the array. */
		if (is_array(info_data))
		{
			var num_info_items = array_length(info_data);
			
			show_debug_message("[scr_download_thumbnails] Processing " + string(num_info_items)
								+ " info items for item: " + string_upper(all_download_id[info_queue_index]));
			
			for (var j = 0; j < num_info_items; j++)
			{
				var item = info_data[j];
				
				/* If no display name has been set for this download item, set it now. */
				if (draw_download_name[info_queue_index] == "")
				{
					/* Check the item's name for profanity. */
					if (switch_check_profanity(item.name))
					{
						/* Mask any profanity found in the name. */
						draw_download_name[info_queue_index] = string(switch_mask_profanity(item.name));
						
						show_debug_message("[scr_download_thumbnails] Profanity detected and masked for item: " + string_upper(all_download_id[info_queue_index])
											+ ". New name: " + draw_download_name[info_queue_index]);
					}
					else
					{
						/* Otherwise, use the item's name as is. */
						draw_download_name[info_queue_index] = string(item.name);
						
						show_debug_message("[scr_download_thumbnails] Set download name for item: " + string_upper(all_download_id[info_queue_index])
											+ " to: " + draw_download_name[info_queue_index]);
					}
				}
				
				show_debug_message("[scr_download_thumbnails] draw_download_name[" + string(info_queue_index) + "] = " + string(draw_download_name[info_queue_index]));
				
				/* Check if the thumbnail sprite is still missing. */
				if (global.spr_download_list_thumbnail[info_queue_index] == spr_thumbnail_missing)
				{
					/* Build the file path where the thumbnail image will be saved. */
					var downloaded_thumbnail_path = temp_directory + "thumbnail_" + string(info_queue_index) + ".png";
					
					show_debug_message("[scr_download_thumbnails] Downloading thumbnail for item: " + string_upper(all_download_id[info_queue_index])
										+ " to path: " + downloaded_thumbnail_path);
					
					/* Decode the base64 thumbnail data from the JSON item. */
					var buffer = buffer_base64_decode(item.thumbnail);
					
					/* Save the decoded image buffer to a file. Otherwise the thumbnails will show up as blank */
					buffer_save(buffer, downloaded_thumbnail_path);
					
					/* Create a sprite from the saved thumbnail image file. */
					global.spr_download_list_thumbnail[info_queue_index] = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
					
					show_debug_message("[scr_download_thumbnails] Thumbnail sprite created for item: " + string_upper(all_download_id[info_queue_index]));
				}
			}
		}
	}
	
	/* Final check: if there is no pending HTTP request and the current item's download name has been set,
	then move to the next item in the queue. */
	if (
		!info_queue_http_request &&
		is_array(draw_download_name) &&
		is_array(all_download_id) &&
		info_queue_index < array_length(draw_download_name) &&
		info_queue_index < array_length(all_download_id) &&
		draw_download_name[info_queue_index] != ""
	)
	{
		show_debug_message("[scr_download_thumbnails] Finished processing item: " + string_upper(all_download_id[info_queue_index])
							+ ". Moving to next item.");
		
		/* Increment the queue index to process the next thumbnail. */
		info_queue_index++;
		/* Allow a new HTTP request for the next item. */
		info_queue_http_request = true;
		show_debug_message("[scr_download_thumbnails] 'info_queue_http_request' is set to true. Allow a new HTTP request for the next item\n");
	}
	//else
	//{
	//	/* Debug messages checking what if checks are failing or not */
	//	var current_name = "undefined";
	    
	//	if (is_array(draw_download_name)
	//	&& info_queue_index < array_length(draw_download_name))
	//	{
	//        current_name = draw_download_name[info_queue_index];
	//    }
		
	//    show_debug_message("[scr_download_thumbnails] Final check did not pass. " +
	//        "info_queue_http_request: " + string(info_queue_http_request) +
	//        ", draw_download_name[info_queue_index]: " + current_name +
	//        ", info_queue_index: " + string(info_queue_index) +
	//        ", array_length(draw_download_name): " + (is_array(draw_download_name) ? string(array_length(draw_download_name)) : "not an array") + "\n");
	//}
}