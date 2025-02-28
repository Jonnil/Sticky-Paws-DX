/// @function scr_download_thumbnails()
/// @description Handles downloading and processing of thumbnail images and metadata.
function scr_download_thumbnails(download_all, what_num_items = 0)
{
	if (!download_all)
	{
		info_queue_index = global.selected_online_download_index;
	}
	
	if (((download_all
	&& info_queue_index < what_num_items
	&& info_queue_http_request)
	|| !download_all)
	&& is_array(all_download_id))
	{
		info_queue_http_request = false;
		info_data = undefined;
		global.online_download_list_info = "";
		
		if (os_is_network_connected())
		{
			global.http_request_info = http_request("https://" + global.base_url + "/metadata/" + string(content_type) + "s/" + string_upper(all_download_id[info_queue_index]) + "?os_type=" + string(os_type), "GET", map, "");
			show_debug_message("HTTP request sent for: " + string_upper(all_download_id[info_queue_index]));
		}
	}
	
	if (info_data == undefined
	&& in_online_download_list_menu
	&& !info_queue_http_request)
	{
		if (global.online_download_list_info != ""
		&& global.online_download_list_info != "HTTP request exception"
		&& global.online_download_list_info != "Unauthorized")
		{
			try
			{
				info_data = json_parse(global.online_download_list_info);
				info_data = array_create(1, info_data);
			}
			catch (e)
			{
				show_debug_message("Failed to get JSON for " + string_upper(all_download_id[info_queue_index]) + " Invalid JSON format: " + string(global.online_download_list_info));
				info_data = undefined;
			}
		}
		
		if (is_array(info_data))
		{
			var num_info_items = array_length(info_data);
			for (var j = 0; j < num_info_items; j++)
			{
				var item = info_data[j];
				if (draw_download_name[info_queue_index] == "")
				{
					if (switch_check_profanity(item.name))
					{
						draw_download_name[info_queue_index] = string(switch_mask_profanity(item.name));
					}
					else
					{
						draw_download_name[info_queue_index] = string(item.name);
					}
				}
				show_debug_message("draw_download_name[" + string(info_queue_index) + "] = " + string(draw_download_name[info_queue_index]));
				
				if (spr_download_list_thumbnail[info_queue_index] == spr_thumbnail_missing)
				{
					var downloaded_thumbnail_path = temp_directory + "thumbnail_" + string(info_queue_index) + ".png";
					show_debug_message(string(downloaded_thumbnail_path));
					var buffer = buffer_base64_decode(item.thumbnail);
					buffer_save(buffer, downloaded_thumbnail_path);
					spr_download_list_thumbnail[info_queue_index] = sprite_add(downloaded_thumbnail_path, 0, false, true, 0, 0);
				}
			}
		}
	}
	
	if (!info_queue_http_request
	&& (draw_download_name[info_queue_index] != ""))
	{
		info_queue_index++;
		info_queue_http_request = true;
	}
}