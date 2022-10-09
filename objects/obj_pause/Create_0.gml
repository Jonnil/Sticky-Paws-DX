mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();

depth = -20;

loading_spinning_angle = 0;
show_loading_icon = false;

#region /* Mouse x and mouse y initializing */
mx = mouse_x;
my = mouse_y;
#endregion /* Mouse x and mouse y initializing END */

#region /* Narrator Voice variable handeling */

menuvoice_1player = noone;
menuvoice_2player = noone;
menuvoice_3player = noone;
menuvoice_4player = noone;
menuvoice_leveleditor = noone;
menuvoice_leveleditor_denied = noone;

#region /* No Narrator */
if (global.narrator = -1)
{
	voice_game_title = noone;
	voice_options = noone;
}
#endregion /* No Narrator END */

else

#region /* Character as Narrator */
if (global.narrator >= 0)
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg"))
	{
		voice_game_title = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg"))
	{
		voice_game_title = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg");
	}
	else
	{
		voice_game_title = noone;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg"))
	{
		voice_options = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg");
	}
	else
	if (file_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg"))
	{
		voice_options = audio_create_stream(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg");
	}
	else
	{
		voice_options = noone;
	}
}
#endregion /* Character as Narrator END */

#endregion /* Narrator Voice variable handeling END */

pause_text_alpha = 0;
pause_text_lerp = 1;
menu = "continue";
menu_delay = 10;
last_key = noone;

#region /* Remapping options variables */
remapping_player = 0; /* remapping_player 0 = player 1. remapping_player 1 = player 2. remapping_player 2 = player 3. remapping_player 3 = player 4 */
input_key = false;
can_remap_key = false;
input_gamepad_button = false;
can_remap_gamepad_button = false;
allow_player1_tongue = false;
allow_player2_tongue = false;
allow_player3_tongue = false;
allow_player4_tongue = false;
allow_player1_dive = false;
allow_player2_dive = false;
allow_player3_dive = false;
allow_player4_dive = false;
#endregion /* Remapping options variables END */

open_dropdown = false;
menu_joystick_delay = 0;
menu_joystick1_delay = 0; /* These variables shouldn't be used unless specific player input is needed, but they are here still as failsafe */
menu_joystick2_delay = 0;
menu_joystick3_delay = 0;
menu_joystick4_delay = 0;
can_navigate = true;
remap_y_pos = 0;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = true;
navigate_slider = false;
menu_remap_key_number = 0;
menu_remap_gamepad_button_number = 0;
menu_y_offset = 0; /* This is the y offset that will have lerping to make the menu scrolling smooth */
menu_y_offset_real = 0; /* This is the real y offset for the menu, used for menu scrolling */
menu_cursor_y_position = 0;
background_brightness_menu_lerp = 0;
language_index = global.language_localization + 1;
language_mouse_scroll = 0;

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

#region /* Character Name */
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
						
	#region /* Character Name */
	var uppercase_narrator_name;
	uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
	uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
	narrator_name = string(uppercase_narrator_name);
	#endregion /* Character Name END */
						
	ini_close();
}
else
{
	narrator_name = string(global.narrator + 1);
}
#endregion /* Character Name END */

#region /* Customize look of Options Menu */
c_menu_outline = c_black;
c_menu_fill = c_white;
#endregion /* Customize look of Options Menu END */

audio_pause_all(); /* Pause sound effects and music */

#region /* Save Level Editor Checkpoint */
if (asset_get_type("room_leveleditor") == asset_room)
and (room == room_leveleditor)
and (global.character_select_in_this_menu == "main_game")
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
	
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close();
}
else
if (asset_get_type("room_leveleditor") == asset_room)
and (room == room_leveleditor)
and (global.character_select_in_this_menu == "level_editor")
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
	
	ini_open(working_directory + "/save_files/custom_level_save.ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close();
}
#endregion /* Save Level Editor Checkpoint END */