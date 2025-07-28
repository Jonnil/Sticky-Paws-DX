/// @function scr_process_online_download_list_data()
/// @description Processes the online download list data by parsing JSON and initializing arrays.
function scr_process_online_download_list_data()
{
	scr_draw_loading(1, , , "Loading from server");
	scr_server_timeout(15);
	
	#region /* Interpret the online download list as JSON */
	if (global.online_download_list != ""
	&& global.online_download_list != "HTTP request exception"
	&& global.online_download_list != "Unauthorized")
	{
		show_debug_message("[scr_process_online_download_list_data] Valid online download list received. Attempting to parse JSON...");
		
		try
		{
			online_content_data = json_parse(global.online_download_list);
			var total = array_length(online_content_data);
			global.download_total_pages = ceil(total / global.download_items_per_page);
			show_debug_message("[scr_process_online_download_list_data] JSON parsed successfully. Number of items: " + string(array_length(online_content_data)));
			
			for (var i = 0; i < array_length(online_content_data); i++;)
			{
				draw_download_name[i] = "";
				
				show_debug_message("[scr_process_online_download_list_data] Initializing item " + string(i) + ", draw_download_name[" + string(i) + "] = ''");
				
				if (is_array(global.spr_download_list_thumbnail))
				//&& (global.spr_download_list_thumbnail[i] != spr_thumbnail_missing) /* Never delete the actual missing thumbnail sprite. WARNING: THIS LINE BREAKS THE THUMBNAIL LOADING FOR SOME REASON */
				{
					if (i < array_length(global.spr_download_list_thumbnail))
					{
						scr_delete_sprite_properly(global.spr_download_list_thumbnail[i]);
						show_debug_message("[scr_process_online_download_list_data] Deleting existing sprite for thumbnail index " + string(i));
					}
				}
				
				global.spr_download_list_thumbnail[i] = spr_thumbnail_missing;
				show_debug_message("[scr_process_online_download_list_data] Setting thumbnail " + string(i) + " to spr_thumbnail_missing");
				
				all_download_id[i] = "";
			}
		}
		catch (e)
		{
			show_debug_message("[scr_process_online_download_list_data] ERROR: Exception occurred while parsing JSON. " + string(e));
		}
	}
	else
	if (global.online_download_list == "HTTP request exception")
	{
		show_debug_message("[scr_process_online_download_list_data] ERROR: Received 'HTTP request exception' from server.");
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("HTTP request exception"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("HTTP request exception"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
	else
	if (global.online_download_list == "Unauthorized")
	{
		show_debug_message("[scr_process_online_download_list_data] ERROR: Received 'Unauthorized' response from server.");
		
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("Unauthorized"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("Unauthorized"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
	#endregion /* Interpret the online download list as JSON END */
	
}