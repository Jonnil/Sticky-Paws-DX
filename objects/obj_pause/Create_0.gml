depth = -20;

#region /*Mouse x and mouse y initializing*/
mx = mouse_x;
my = mouse_y;
#endregion /*Mouse x and mouse y initializing END*/

scr_set_arrays();

///Narrator Voice variable handeling

///No Narrator
if (global.narrator >= 0)
{
	menuvoice_titlesplash = noone;
	menuvoice_1player = noone;
	menuvoice_2player = noone;
	menuvoice_3player = noone;
	menuvoice_4player = noone;
	menuvoice_leveleditor = noone;
	menuvoice_leveleditor_denied = noone;
	voice_options= noone;
}

pause_text_alpha= 0;
pause_text_lerp = 1;
menu = "continue";
menu_delay = 10;
lastkey = noone;

#region /*Remapping options variables*/
remapping_player = 0;
/*remapping_player 0 = player 1.
remapping_player 1 = player 2.
remapping_player 2 = player 3.
remapping_player 3 = player 4 */
input_key = false;
can_remap_key = false;
#endregion /*Remapping options variables END*/

open_dropdown = false;
menu_joystick_delay = 0;
can_navigate = true;
remap_y_pos= 0;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resourcepack;
can_navigate_settings_sidebar = true;
navigate_slider = false;
menu_remap_key_number = 0;
menu_y_offset = 0; /*This is the y offset that will have lerping to make the menu scrolling smooth*/
menu_y_offset_real = 0; /*This is the real y offset for the menu, used for menu scrolling*/
menu_cursor_y_position = 0;
background_brightness_menu_lerp = 0;

darken_settings_alpha = 0;
darken_settings_sidebar_alpha = 0;
accessibility_settings_y = 40;
game_text_y = 40 * 2;
game_settings_y = 40 * 3;
multiplayer_settings_y = 40 * 4;
controls_text_y = 40 * 5;
keyboard_and_mouse_settings_y = 40 * 6;
controller_settings_y = 40 * 7;
touch_settings_y = 40 * 8;
general_text_y = 40 * 9;
profile_settings_y = 40 * 10;
video_settings_y = 40 * 11;
audio_settings_y = 40 * 12;
global_resources_settings_y = 40 * 13;
storage_settings_y = 40 * 14;
language_settings_y = 40 * 15;
broadcast_settings_y = 40 * 16;
how_to_play_y = 40 * 17;
left_sidebar_x =-400;
hide_menu_for_clean_screenshots = false;
hide_menu_for_clean_screenshots_alpha = 0;
hide_menu_for_clean_screenshots_timer = 0;

#region /*Character Name*/
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
or(file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
						
	#region /*Character Name*/
	if (ini_key_exists("values", "character_name"))
	{
		narrator_name = ini_read_string("values", "character_name", "");
	}
	else
	{
		narrator_name = string(global.narrator + 1);
	}
	#endregion /*Character Name END*/
						
	ini_close();
}
else
{
	narrator_name = string(global.narrator + 1);
}
#endregion /*Character Name END*/

#region /*Customize look of Options Menu*/
c_menu_outline = c_black;
c_menu_fill = c_white;
#endregion /*Customize look of Options Menu END*/

audio_pause_all(); /*Pause sound effects and music*/

#region /*Save Level Editor Checkpoint*/
if (asset_get_type("room_leveleditor") == asset_room)
and (room = room_leveleditor)
and (global.character_select_in_this_menu = "main_game")
{
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "x_checkpoint", global.x_checkpoint);
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "y_checkpoint", global.y_checkpoint);
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_second", global.timeattack_second);
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_minute", global.timeattack_minute);
	ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close();
}
else
if (asset_get_type("room_leveleditor") == asset_room)
and (room = room_leveleditor)
and (global.character_select_in_this_menu = "level_editor")
{
	ini_open(working_directory + "/custom_level_save.ini");
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", global.x_checkpoint);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", global.y_checkpoint);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", global.timeattack_second);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", global.timeattack_minute);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	ini_close();
}
#endregion /*Save Level Editor Checkpoint END*/