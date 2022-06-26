scr_unzip_all() /*Unzip any .zip folder found in AppData*/

global.play_attract_demo = false;
play_attract_demo_time = 0;

load_from_where = "characters";
saved_file_exists = false;
can_save_to_character_config = false; /*Only turn true when playing as custom character*/
unused_x_origin_point = noone;
unused_y_origin_point = noone;

initialized_copy = false;
first_copy_file = "";

player = 1;
selected_skin = 0;

background_layer_x = 0;
background_layer_y = 0;

options_and_quit_y = display_get_gui_height() / 2 + 100 + 120;
file_found = "";
file_load_timer = 0;
level_find_pos = 0;
first_level = string(file_find_first(working_directory + "/custom_levels/*", fa_directory));
open_sub_menu = false;
select_custom_level_menu_open = false;
loading_spinning_angle = 0;
custom_level_select_blinking = 0;
custom_level_select_blinking_old = 0;
scroll = 0;
scroll_to = 0;
lerp_on = false;
level_editor_template_select = false;
language_index = global.language_localization + 1;
language_mouse_scroll = 0;
title_background_scale_lerp = global.title_background_scale;

#region /*Character Name*/
var uppercase_narrator_name;
uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
narrator_name = string(uppercase_narrator_name);
#endregion /*Character Name END*/

#region /*Create directories*/

#region /*Create directory for saving custom characters*/
if (!directory_exists(working_directory + "/custom_characters"))
{
	directory_create(working_directory + "/custom_characters");
}
#endregion /*Create directory for saving custom characters END*/

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory + "/custom_levels"))
{
	directory_create(working_directory + "/custom_levels");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create directory for saving custom resource_pack*/
if (!directory_exists(working_directory + "/custom_resource_pack"))
{
	directory_create(working_directory + "/custom_resource_pack");
}
#endregion /*Create directory for saving custom resource_pack END*/

#region /*Create directory for saving custom title backgrounds*/
if (!directory_exists(working_directory + "/custom_title_backgrounds"))
{
	directory_create(working_directory + "/custom_title_backgrounds");
}
#endregion /*Create directory for saving custom title backgrounds END*/

#region /*Create directory for saving custom title logos*/
if (!directory_exists(working_directory + "/custom_title_logos"))
{
	directory_create(working_directory + "/custom_title_logos");
}
#endregion /*Create directory for saving custom title logos END*/

#region /*Create directory for saving files*/
if (!directory_exists(working_directory + "/save_files"))
{
	directory_create(working_directory + "/save_files");
}
#endregion /*Create directory for saving files END*/

#endregion /*Create directories END*/

#region /*Any save file outside the save_files folder should copy over to that folder and then delete the save file outside the folder*/
index_file_copy = 0;
repeat(50)
{
	if (file_exists(working_directory + "file" + string(index_file_copy) + ".ini"))
	{
		if (!file_exists(working_directory + "/save_files/file" + string(index_file_copy) + ".ini"))
		{
			file_copy(working_directory + "file" + string(index_file_copy) + ".ini", working_directory + "/save_files/file" + string(index_file_copy) + ".ini");
		}
		file_delete(working_directory + "file" + string(index_file_copy) + ".ini");
	}
	index_file_copy += 1;
}
#endregion /*Any save file outside the save_files folder should copy over to that folder and then delete the save file outside the folder END*/

#region /*Custom Title Screen Background*/
if (file_exists("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
{
	title_screen_background = sprite_add("title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
}
else
if (file_exists(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
{
	title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 1, false, false, 0, 0);
}
else
{
	title_screen_background = noone;
}

if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
}
#endregion /*Custom Title Screen Background*/

#region /*Character select Accept Selection*/
player1_accept_selection = - 1;
player2_accept_selection = - 1;
player3_accept_selection = - 1;
player4_accept_selection = - 1;
player_start_game = false;
#endregion /*Character select Accept Selection END*/

#region /*Color Select for CharacterSelect*/
player1_menu = "select_character";
player2_menu = "select_character";
player3_menu = "select_character";
player4_menu = "select_character";
#endregion /*Color Select for CharacterSelect END*/

#region /*What player can enter a name*/
can_input_player1_name = false;
can_input_player2_name = false;
can_input_player3_name = false;
can_input_player4_name = false;
can_input_level_name = false;
#endregion /*What player can enter a name END*/

#region /*Hide certain HUD elements*/
global.hud_show_lives = true;
global.hud_show_deaths = false;
global.hud_show_basic_collectibles = false;
global.hud_show_big_collectibles = false;
global.hud_show_score = false;
#endregion /*Hide certain HUD elements END*/

global.playergame = 0; /*Make the game singleplayer at the start of the game*/
global.player_has_entered_goal = false;
global.actually_play_edited_level = false;
global.play_edited_level = false;
global.basic_collectibles = 0;
global.level_clear_rate = noone;
global.big_collectible1 = false;
global.big_collectible2 = false;
global.big_collectible3 = false;
global.big_collectible4 = false;
global.big_collectible5 = false;
global.lives_until_assist = 0;
global.x_checkpoint = false;
global.y_checkpoint = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;
/*Checkpoint Timer*/
global.checkpoint_millisecond = 0;
global.checkpoint_second = 0;
global.checkpoint_minute = 0;
global.checkpoint_realmillisecond = 0; /*Checkpoint Timer END*/
global.win = false;
global.enemy_counter = 0;
global.file = 1;
global.controls_layout = 1;
global.trigger_ending = false;
global.spikes_emerge_time = 0;
global.goal_active = false;
global.quit_level = false;
global.always_show_level_editor_buttons = true; /*If level editor buttons should always show or not. Should be true by default*/

scr_config_load(); /*Load Config*/

if (file_exists("localization.csv"))
{
	if (global.language_localization > ds_grid_width(global.language_local_data))
	or (global.language_localization < 0)
	{
		scr_set_default_language();
	}
}

lives = 5; /*Starting lives*/

#region /*If title screen should start at the level editor menu or the main menu*/
if (global.character_select_in_this_menu = "level_editor")
{
	scr_load_custom_level_initializing();
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = false;
	can_navigate = true;
	menu_delay = 30;
	open_sub_menu = false;
	player1_accept_selection = false;
	player2_accept_selection = false;
	player3_accept_selection = false;
	player4_accept_selection = false;
	menu = "load_custom_level";
}
else
{
	menu = "main_game";
}
#endregion /*If title screen should start at the level editor menu or the main menu END*/

last_key = noone;

#region /*Remapping options variables*/
remapping_player = 0; /*remapping_player 0 = player 1. remapping_player 1 = player 2. remapping_player 2 = player 3. remapping_player 3 = player 4 */
input_key = false;
can_remap_key = false;
input_gamepad_button = false;
can_remap_gamepad_button = false;
allow_player1_tongue = false;
allow_player2_tongue = false;
allow_player3_tongue = false;
allow_player4_tongue = false;
#endregion /*Remapping options variables END*/

open_dropdown = false;
menu_delay = 3;
menu_joystick_delay = 3;
menu_joystick1_delay = 3;
menu_joystick2_delay = 3;
menu_joystick3_delay = 3;
menu_joystick4_delay = 3;
black_screen_at_start_delay = 0;
player1_display_x = 0;xx1 = 0;
player2_display_x = 0;xx2 = 0;
player3_display_x = 0;xx3 = 0;
player4_display_x = 0;xx4 = 0;
remap_y_pos = 0;
version_y_pos = 0;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = true;
navigate_slider = false;
menu_remap_key_number = 0;
menu_remap_gamepad_button_number = 0;
name_enter_blink= 0;
can_navigate = true;
menu_y_offset = 0; /*This is the y offset that will have lerping to make the menu scrolling smooth*/
menu_y_offset_real = 0; /*This is the real y offset for the menu, used for menu scrolling*/
menu_cursor_y_position = 0;
background_brightness_menu_lerp = 0;
title_x = 0;
title_y = - 800;
title_alpha = 0;
title_logo_index = spr_wall;
show_title_logo = true;
title_xscale = 1;
title_yscale = 1;
voice_select_character = noone;
show_convention_mode_enable_text = 0;
show_arcade_mode_enable_text = 0;

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
left_sidebar_x = -400;
iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;
#region /*Customize look of Options Menu*/
c_menu_outline = c_white;
c_menu_fill = c_black;
#endregion /*Customize look of Options Menu END*/

#region /*Stop certain sounds from playing on the title screen*/
audio_stop_all();
if (asset_get_type("snd_slip") == asset_sound)
{
	audio_stop_sound(snd_skidding);
}
if (asset_get_type("snd_slip_ice") == asset_sound)
{
	audio_stop_sound(snd_skidding_ice);
}
#endregion /*Stop certain sounds from playing on the title screen END*/

#region /*Update Music*/
if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
}
else
if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
}
else
{
	title_music = noone;
}
title_music_lerp = 0;
#endregion /*Update Music END*/

#region /*Update Trailer Sound*/
if (file_exists("video/trailer.ogg"))
{
	trailer_sound = audio_create_stream("video/trailer.ogg");
}
else
{
	trailer_sound = noone;
}
#endregion /*Update Trailer Sound END*/

#region /*Play title screen music*/
if (title_music > noone)
{
	audio_play_sound(title_music, 0, true);
	audio_sound_gain(title_music, 0, 0);
}
#endregion /*Play title screen music END*/

#region /*Play trailer sound*/
if (trailer_sound > noone)
{
	audio_stop_sound(trailer_sound);
	audio_sound_gain(trailer_sound, 0, 0);
}
#endregion /*Play trailer sound END*/

#region /*Reset level zoom*/
if (global.reset_level_zoom_when_going_back_to_map = true)
{
	global.zoom_level = global.default_zoom_level;
	ini_open("config.ini");
	ini_write_real("config", "zoom_level", global.default_zoom_level);
	ini_close();
}
#endregion /*Reset level zoom END*/

#region /*Reset world map zoom*/
if (global.reset_world_map_zoom_when_going_back_to_map = true)
{
	global.zoom_world_map = global.default_zoom_world_map;
	ini_open("config.ini");
	ini_write_real("config", "zoom_world_map", global.default_zoom_world_map);
	ini_close();
}
#endregion /*Reset world map zoom END*/

#region /*Narrator Voice variable handeling*/

menuvoice_1player = noone;
menuvoice_2player = noone;
menuvoice_3player = noone;
menuvoice_4player = noone;
menuvoice_leveleditor = noone;
menuvoice_leveleditor_denied = noone;

#region /*No Narrator*/
if (global.narrator = -1)
{
	voice_game_title = noone;
	voice_options = noone;
}
#endregion /*No Narrator END*/

else

#region /*Character as Narrator*/
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
#endregion /*Character as Narrator END*/

#endregion /*Narrator Voice variable handeling END*/

#region /*Say the games title*/
if (voice_game_title > noone)
{
	audio_stop_sound(voice_game_title);
	audio_play_sound(voice_game_title, 0, 0);
	audio_sound_gain(voice_game_title, global.voices_volume * global.main_volume, 0);
}
#endregion /*Say the games title END*/