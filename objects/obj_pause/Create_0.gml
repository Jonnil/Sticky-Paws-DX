selected_skin = 0;
quit_nevermind_y = 0;

#region /* Set variables for character select in pause menu */
for(var p = 1; p <= global.max_players; p += 1)
{
	show_player_controls_y[p] = -64;
	
	show_player_controller_cant_use[p] = 0;
	show_player_controller_cant_use_y[p] = display_get_gui_height() + 64;
	
	if (global.character_select_in_this_menu == "level_editor" && global.search_id != "")
	{
		var show_controls_x = 128 + 74;
	}
	else
	{
		var show_controls_x = 32;
	}
	scr_set_show_controls_x(p, show_controls_x);
	
	player_accept_selection[p] = -1;
	player_automatically_join[p] = false;
	player_menu[p] = "select_character";
	can_input_player_name[p] = 2; /* What player can enter a name */
	
	scr_set_character_folder(p);
	ini_open(character_folder + "/data/character_config.ini"); /* First open the character folder ini before initializing custom character abilities */
	allow_player_tongue[p] = scr_initialize_character_abilities(p - 1, "allow_tongue", false);
	allow_player_double_jump[p] = scr_initialize_character_abilities(p - 1, "number_of_jumps", 1, "values");
	allow_player_dive[p] = scr_initialize_character_abilities(p - 1, "allow_dive", false);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	
	menu_specific_joystick_delay[p] = 3;
	player_display_x[p] = 0;
	xx[p] = 0;
	xx_delay[p] = 0;
	/* Player Key Accept Pressed */ player_key_a_pressed[p] = noone;
	/* Player Key Back Pressed */ player_key_b_pressed[p] = noone;
	/* Player Key Accept Hold */ player_key_a_hold[p] = noone;
	character_portrait_for_player_dir_exists_1[p] = false;
	character_portrait_for_player_dir_exists_2[p] = false;
	character_portrait_for_player_dir_exists_3[p] = false;
	character_portrait_for_player_dir_exists_4[p] = false;
}
in_character_select_menu = false;
file_load_timer = 0;
player_start_game = false;
voice_select_character = noone;
initialized_copy = false;
can_save_to_character_config = false;
#endregion /* Set variables for character select in pause menu END */

hud_show_big_collectibles_y = -32;
content_type = "level";

mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);

depth = -20;
room_speed = global.max_fps;

show_loading_icon = false;

set_pause_button_y_positions();

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
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/game_title.ogg"))
	{
		voice_game_title = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/game_title.ogg");
	}
	else
	if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/game_title.ogg"))
	{
		voice_game_title = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/game_title.ogg");
	}
	else
	{
		voice_game_title = noone;
	}
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/options.ogg"))
	{
		voice_options = audio_create_stream("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/options.ogg");
	}
	else
	if (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/options.ogg"))
	{
		voice_options = audio_create_stream(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/sound/voicepack" + string(global.voicepack_for_player[1]) + "/options.ogg");
	}
	else
	{
		voice_options = noone;
	}
}
#endregion /* Character as Narrator END */

#endregion /* Narrator Voice variable handeling END */

menu = "continue";
menu_delay = 3;
last_key = noone;

#region /* Remapping options variables */
remapping_player = 0;
input_key = false;
can_remap_key = false;
input_gamepad_button = false;
can_remap_gamepad_button = false;
#endregion /* Remapping options variables END */

in_edit_character_menu = false;
open_dropdown = false;
menu_joystick_delay = 0;
can_navigate = true;
remap_y_pos = 0;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = false;
navigate_slider = false;
menu_remap_key_number = 0;
menu_remap_gamepad_button_number = 0;
menu_y_offset = 0; /* This is the y offset that will have lerping to make the menu scrolling smooth */
menu_y_offset_real = 0; /* This is the real y offset for the menu, used for menu scrolling */
menu_cursor_y_position = 0;
scrolling_menu_with_mousewheel = false;
background_brightness_menu_lerp = 0;
language_index = global.language_localization;
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
|| (file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
	else
	{
		ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
	}
						
	#region /* Character Name */
	narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
	#endregion /* Character Name END */
						
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
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
	var level_name = global.level_name;
	
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
else
if (room == rm_leveleditor)
&& (global.character_select_in_this_menu == "level_editor")
{
	var level_name = global.level_name;
	
	ini_open(game_save_id + "save_file/custom_level_save.ini");
	
	ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
	ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
	ini_write_real(level_name, "checkpoint_millisecond", global.timeattack_millisecond);
	ini_write_real(level_name, "checkpoint_second", global.timeattack_second);
	ini_write_real(level_name, "checkpoint_minute", global.timeattack_minute);
	ini_write_real(level_name, "checkpoint_realmillisecond", global.timeattack_realmillisecond);
	
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Save Level Editor Checkpoint END */

set_controller_sprites_to_use();

#region /* Load level information that can be displayed in pause menu */
if (global.character_select_in_this_menu == "main_game")
{
	var level_path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
}
else
if (global.character_select_in_this_menu == "level_editor")
{
	var level_path = global.use_temp_or_working + "custom_levels/" + global.level_name;
}
ini_open(level_path + "/data/level_information.ini");
display_level_name = ini_read_string("info", "level_name", global.level_name);
display_level_author = ini_read_string("info", "username", "");
display_level_id = ini_read_string("info", "level_id", "");
ini_close();
scr_load_level_tags(level_path);
#endregion /* Load level information that can be displayed in pause menu END */