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
		try
		{
			data = json_parse(global.online_download_list);
			for (var i = 0; i < array_length(data); i++;)
			{
				draw_download_name[i] = "";
				if (is_array(spr_download_list_thumbnail))
				{
					if (i < array_length(spr_download_list_thumbnail))
					{
						scr_delete_sprite_properly(spr_download_list_thumbnail[i]);
					}
				}
				spr_download_list_thumbnail[i] = spr_thumbnail_missing;
				all_download_id[i] = "";
			}
		}
	}
	else
	if (global.online_download_list == "HTTP request exception")
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("HTTP request exception"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("HTTP request exception"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
	else
	if (global.online_download_list == "Unauthorized")
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("Unauthorized"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 84, 
			l10n_text("Unauthorized"), global.default_text_size, c_white, c_red, scr_wave(0, 1, 1, 0));
	}
	#endregion /* Interpret the online download list as JSON END */
	
}