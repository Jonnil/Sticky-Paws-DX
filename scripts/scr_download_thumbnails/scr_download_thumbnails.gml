/// @function scr_download_thumbnails(download_all, what_num_items = 0)
/// @description Handles downloading and processing of thumbnail images and metadata.
/// This function works in two modes:
/// 1. Download All: Iterates over a queue of items if download_all is true.
/// 2. Single Download: Processes a specific item (based on global.selected_online_download_index) if download_all is false.
function scr_download_thumbnails(download_all, what_num_items = 0)
{
	// If we are not in "download all" mode,
	// set the queue index to the one selected by the user.
	if (!download_all)
	{
		info_queue_index = global.selected_online_download_index;
	}
	
	// The following complex conditional determines whether to send a new HTTP request to download thumbnail metadata.
	// It checks two scenarios:
	// Scenario 1: "Download All" mode is active.
	//   - Ensure there are more items to process (info_queue_index < what_num_items)
	//   - And that we are allowed to make a new HTTP request (info_queue_http_request is true).
	// Scenario 2: Not in "download all" mode, meaning we process the single selected item.
	// Additionally, in either case, it verifies that the list of download IDs (all_download_id) is a valid array.
	if (
		(
			(download_all
			&& info_queue_index < what_num_items
			&& info_queue_http_request)
			|| (!download_all)
		)
		&& is_array(all_download_id)
	)
	{
		// Prevent additional HTTP requests until the current one is finished.
		info_queue_http_request = false;
		// Reset any previous metadata.
		info_data = undefined;
		global.online_download_list_info = "";
		
		// Only send the HTTP request if the device is connected to the network.
		if (os_is_network_connected())
		{
			// Construct and send an HTTP GET request to fetch metadata.
			// URL format: "https://<base_url>/metadata/<content_type>s/<downloadID>?os_type=<os_type>"
			global.http_request_info = http_request(
				"https://" + global.base_url + "/metadata/" + string(content_type) + "s/" +
				string_upper(all_download_id[info_queue_index]) +
				"?os_type=" + string(os_type),
				"GET",
				global.online_download_request_headers, /* Need to retrieve the header information from "scr_initialize_online_download_menu" */
				""
			);
			show_debug_message("HTTP request sent for: " + string_upper(all_download_id[info_queue_index]));
		}
	}
	
	// Once an HTTP response is received, info_data is still undefined until processed.
	// This block checks that:
	// - We haven't processed the info yet (info_data is undefined)
	// - We're still in the online download list menu (in_online_download_list_menu is true)
	// - No HTTP request is currently pending (info_queue_http_request is false)
	if (info_data == undefined
		&& in_online_download_list_menu
		&& !info_queue_http_request)
	{
		// Check that the server response (global.online_download_list_info) is valid.
		// It must not be empty, nor indicate a failed HTTP request ("HTTP request exception") or lack proper authorization ("Unauthorized").
		if (global.online_download_list_info != ""
			&& global.online_download_list_info != "HTTP request exception"
			&& global.online_download_list_info != "Unauthorized")
		{
			try
			{
				// Attempt to parse the JSON response into info_data.
				info_data = json_parse(global.online_download_list_info);
				// Convert the parsed JSON into an array for uniform processing.
				info_data = array_create(1, info_data);
			}
			catch (e)
			{
				// Log an error if JSON parsing fails and reset info_data.
				show_debug_message("Failed to get JSON for " + string_upper(all_download_id[info_queue_index]) +
								   " Invalid JSON format: " + string(global.online_download_list_info));
				info_data = undefined;
			}
		}
		
		// If info_data is now a valid array, process each item in the array.
		if (is_array(info_data))
		{
			var num_info_items = array_length(info_data);
			for (var j = 0; j < num_info_items; j++)
			{
				var item = info_data[j];
				
				// If no display name has been set for this download item, set it now.
				if (draw_download_name[info_queue_index] == "")
				{
					// Check the item's name for profanity.
					if (switch_check_profanity(item.name))
					{
						// Mask any profanity found in the name.
						draw_download_name[info_queue_index] = string(switch_mask_profanity(item.name));
					}
					else
					{
						// Otherwise, use the item's name as is.
						draw_download_name[info_queue_index] = string(item.name);
					}
				}
				show_debug_message("draw_download_name[" + string(info_queue_index) + "] = " + string(draw_download_name[info_queue_index]));
				
				// Check if the thumbnail sprite is still missing.
				if (spr_download_list_thumbnail[info_queue_index] == spr_thumbnail_missing)
				{
					// Build the file path where the thumbnail image will be saved.
					var downloaded_thumbnail_path = temp_directory + "thumbnail_" + string(info_queue_index) + ".png";
					show_debug_message(string(downloaded_thumbnail_path));
					// Decode the base64 thumbnail data from the JSON item.
					var buffer = buffer_base64_decode(item.thumbnail);
					// Save the decoded image buffer to a file.
					buffer_save(buffer, downloaded_thumbnail_path);
					// Create a sprite from the saved thumbnail image file.
					spr_download_list_thumbnail[info_queue_index] = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
				}
			}
		}
	}
	
	// Final check: if there is no pending HTTP request and the current item's download name has been set,
	// then move to the next item in the queue.
	if (!info_queue_http_request
		&& (draw_download_name[info_queue_index] != ""))
	{
		// Increment the queue index to process the next thumbnail.
		info_queue_index++;
		// Allow a new HTTP request for the next item.
		info_queue_http_request = true;
	}
}