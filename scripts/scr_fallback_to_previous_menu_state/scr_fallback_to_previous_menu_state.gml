/// @function scr_fallback_to_previous_menu_state()
/// @description Forces a fallback to the previous menu state if no longer in the online download list.
function scr_fallback_to_previous_menu_state()
{
	
	#region /* Force fallback if not in online download list */
	if (!in_online_download_list_menu
	&& (menu_delay == 0
	&& menu_joystick_delay == 0))
	{
		if (string_copy(menu, 1, string_length("download_online")) == "download_online")
		{
			if (content_type == "level")
			{
				if (variable_instance_exists(self, "show_level_editor_corner_menu"))
				{
					show_level_editor_corner_menu = true;
				}
				menu = "online_level_list";
				select_custom_level_menu_open = true;
			}
			else
			{
				menu = "online_character_list";
			}
			global.online_download_list = "";
			data = undefined;
			info_data = undefined;
			automatically_search_for_id = false;
			in_online_download_list_menu = false;
			in_online_download_list_load_menu = false;
			keyboard_string = "";
			menu_delay = 3;
			search_id = "";
		}
	}
	#endregion /* Force fallback if not in online download list END */
	
}