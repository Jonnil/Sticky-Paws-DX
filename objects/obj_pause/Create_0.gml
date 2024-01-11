unpause = false;
hud_show_big_collectibles_y = -32;
content_type = "level";

mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);

depth = -20;
room_speed = global.max_fps;

show_loading_icon = false;

var get_window_height = display_get_gui_height();

continue_y = get_window_height * 0.5;
if (global.character_select_in_this_menu == "level_editor")
&& (!file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
&& (ds_list_size(global.all_loaded_custom_levels) - 1 < global.max_custom_levels) /* Don't let player download levels if they have reached the max amount of levels stored */
|| (global.character_select_in_this_menu == "level_editor")
&& (file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini"))
{
	edit_level_y = get_window_height * 0.5 + (42 * 1);
	options_y = get_window_height * 0.5 + (42 * 2);
	restart_y = get_window_height * 0.5 + (42 * 3);
	quit_y = get_window_height * 0.5 + (42 * 4);
}
else
{
	edit_level_y = -999;
	options_y = get_window_height * 0.5 + (42 * 1);
	restart_y = get_window_height * 0.5 + (42 * 2);
	quit_y = get_window_height * 0.5 + (42 * 3);
}

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

holding_key_timer = 0; /* Player needs to hold down button to reset level or quit level, so you can't misclick */

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
	if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg"))
	{
		voice_game_title = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/game_title.ogg");
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
	if (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg"))
	{
		voice_options = audio_create_stream(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack0/options.ogg");
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
menu_delay = 3;
last_key = noone;

#region /* Remapping options variables */
remapping_player = 0; /* remapping_player 0 = player 1. remapping_player 1 = player 2. remapping_player 2 = player 3. remapping_player 3 = player 4 */
input_key = false;
can_remap_key = false;
input_gamepad_button = false;
can_remap_gamepad_button = false;
allow_player1_tongue = scr_initialize_custom_character_abilities(0, "allow_tongue", false);
allow_player2_tongue = scr_initialize_custom_character_abilities(1, "allow_tongue", false);
allow_player3_tongue = scr_initialize_custom_character_abilities(2, "allow_tongue", false);
allow_player4_tongue = scr_initialize_custom_character_abilities(3, "allow_tongue", false);

allow_player1_double_jump = scr_initialize_custom_character_abilities(0, "number_of_jumps", 1, "values");
allow_player2_double_jump = scr_initialize_custom_character_abilities(1, "number_of_jumps", 1, "values");
allow_player3_double_jump = scr_initialize_custom_character_abilities(2, "number_of_jumps", 1, "values");
allow_player4_double_jump = scr_initialize_custom_character_abilities(3, "number_of_jumps", 1, "values");

allow_player1_dive = scr_initialize_custom_character_abilities(0, "allow_dive", false);
allow_player2_dive = scr_initialize_custom_character_abilities(1, "allow_dive", false);
allow_player3_dive = scr_initialize_custom_character_abilities(2, "allow_dive", false);
allow_player4_dive = scr_initialize_custom_character_abilities(3, "allow_dive", false);
#endregion /* Remapping options variables END */

open_dropdown = false;
menu_joystick_delay = 0;
menu_specific_joystick_delay[1] = 0; /* These variables shouldn't be used unless specific player input is needed, but they are here still as failsafe */
menu_specific_joystick_delay[2] = 0;
menu_specific_joystick_delay[3] = 0;
menu_specific_joystick_delay[4] = 0;
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
scrolling_menu_with_mousewheel = false;
background_brightness_menu_lerp = 0;
language_index = global.language_localization + 1;
language_mouse_scroll = 0;

fade_in_pause_alpha = 0.001;
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
account_settings_y = 40 * 10;
video_settings_y = 40 * 11;
audio_settings_y = 40 * 12;
custom_resources_settings_y = 40 * 13;
storage_settings_y = 40 * 14;
language_settings_y = 40 * 15;
broadcast_settings_y = 40 * 16;
how_to_play_y = 40 * 17;
left_sidebar_x =-400;
hide_menu_for_clean_screenshots = false;
hide_menu_for_clean_screenshots_alpha = 0;
hide_menu_for_clean_screenshots_timer = 0;

#region /* Load Custom Title Background */
title_bg_layer = 1; /* Selected Title Background Layer to change */
title_background_scale_lerp[1] = global.title_background_scale[1];
title_background_scale_lerp[2] = global.title_background_scale[2];
title_background_scale_lerp[3] = global.title_background_scale[3];
background_layer_x[1] = 0;
background_layer_x[2] = 0;
background_layer_x[3] = 0;
background_layer_y[1] = 0;
background_layer_y[2] = 0;
background_layer_y[3] = 0;
title_background_blink[1] = 1;
title_background_blink[2] = 1;
title_background_blink[3] = 1;
#endregion /* Load Custom Title Background END */

#region /* Character Name */
if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
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
	narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
	#endregion /* Character Name END */
						
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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
if (room == rm_leveleditor)
&& (global.character_select_in_this_menu == "main_game")
{
	var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
	
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
if (room == rm_leveleditor)
&& (global.character_select_in_this_menu == "level_editor")
{
	var level_name = global.level_name;
	
	ini_open(working_directory + "save_file/custom_level_save.ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Save Level Editor Checkpoint END */