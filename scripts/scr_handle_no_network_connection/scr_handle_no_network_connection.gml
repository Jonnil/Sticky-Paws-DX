/// @function scr_handle_no_network_connection()
/// @description Handles cases where there is no network connection.
function scr_handle_no_network_connection()
{
	if (content_type == "character")
	{
		in_online_download_list_menu = false;
		caution_online_takes_you_back_to = "download_online_search_id";
		menu = "no_internet_character";
	}
	else
	if (content_type == "level")
	{
		in_online_download_list_menu = false;
		select_custom_level_menu_open = true;
		show_level_editor_corner_menu = false;
		caution_online_takes_you_back_to = "level_editor_upload";
		menu = "no_internet_level";
	}
}