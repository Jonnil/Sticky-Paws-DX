scr_delete_sprite_properly(global.custom_background1);
scr_delete_sprite_properly(global.custom_background2);
scr_delete_sprite_properly(global.custom_background3);
scr_delete_sprite_properly(global.custom_background4);
scr_delete_sprite_properly(global.custom_foreground1);
scr_delete_sprite_properly(global.custom_foreground1_5);
scr_delete_sprite_properly(global.custom_foreground2);
scr_delete_sprite_properly(global.custom_foreground_secret);
loading_assets = false;
allowed_to_load_template_level = false;
masked_username = "";
masked_character_name = "";
masked_level_name = "";
thumbnail_level_name = "";
thumbnail_level_description = "";
thumbnail_level_id = "";
thumbnail_level_username = "";
draw_download_name = "";
spr_download_list_thumbnail = noone;
top_left_of_thumbnail_y = 0;
load_ok = 0;

information_menu_open = false; /* If the information menu is opened or not */

menu = "";

key_a_pressed = noone;
key_b_pressed = noone;
key_up = noone;
key_down = noone;
key_left = noone;
key_right = noone;

thumbnail_clear_check[0] = noone;
thumbnail_level_id[0] = "";

character_portrait_for_player_update_directory[1] = false;
character_portrait_for_player_update_directory[2] = false;
character_portrait_for_player_update_directory[3] = false;
character_portrait_for_player_update_directory[4] = false;
character_portrait_for_player_dir_exists_1[1] = false;
character_portrait_for_player_dir_exists_2[1] = false;
character_portrait_for_player_dir_exists_3[1] = false;
character_portrait_for_player_dir_exists_4[1] = false;
character_portrait_for_player_dir_exists_1[2] = false;
character_portrait_for_player_dir_exists_2[2] = false;
character_portrait_for_player_dir_exists_3[2] = false;
character_portrait_for_player_dir_exists_4[2] = false;
character_portrait_for_player_dir_exists_1[3] = false;
character_portrait_for_player_dir_exists_2[3] = false;
character_portrait_for_player_dir_exists_3[3] = false;
character_portrait_for_player_dir_exists_4[3] = false;
character_portrait_for_player_dir_exists_1[4] = false;
character_portrait_for_player_dir_exists_2[4] = false;
character_portrait_for_player_dir_exists_3[4] = false;
character_portrait_for_player_dir_exists_4[4] = false;

mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);

play_the_game_text_y_lerp = display_get_gui_height() + 100;

tag_art = false;
tag_boss_battle = false;
tag_dont_move = false;
tag_kaizo = false;
tag_multiplayer = false;
tag_music = false;
tag_puzzle_solving = false;
tag_short_and_sweet = false;
tag_singleplayer = false;
tag_speedrun = false;
tag_standard = false;
tag_technical = false;
tag_themed = false;
tag_glitch_showcase = false;
intended_level_difficulty = 1; /* Easy = 0. Normal = 1. Hard = 2. Super Hard = 3 */

scr_unzip_all() /* Unzip any .zip folder found in AppData */

upload_rules_do_not_show_level = false;
upload_rules_do_not_show_character = false;
inform_about_report_feature = true; /* When you download user-generated content for the first time, inform the player about the report feature */
inform_about_report_feature_alpha = -3; /* Fade in the inform report feature menu */
remember_keyboard_string = ""; /* In case you want to click "Cancel", revert back to whatever was already written before entering name input screen */
caution_online_do_not_show = false;
report_back_to_menu = "";
search_id = "";
search_for_id_still = false;
content_type = "level"; /* What kind of ID you are searching for. Either "level" or "character" */
downloaded_character_name = ""; /* After loading the downloaded custom character, save the character name for later use */
global.online_download_list = ""; /* Get the uploaded online levels as a list */
global.online_download_list_info = ""; /* Get the uploaded online level thumbnails as a list */
data = undefined; /* The uploaded online levels will be json parsed into this variable */
info_data = undefined; /* The uploaded online levels information will be json parsed into this variable */
automatically_search_for_id = false; /* When downloading from online download list, you want to automatically search for the selected ID */
in_online_download_list_menu = false; /* If you are in the online download list menu or not */
in_online_download_list_load_menu = false; /* If you are loading online download list or not */
currently_selected_id = ""; /* In the online list, what level/character are you currently selecting? */
old_currently_selected_id = ""; /* this is just to compare to "currently selected id" once it changes, so that information about that specific id only have to load once */
spr_download_list_thumbnail = noone;

load_from_where = "characters";
can_save_to_character_config = false; /* Only turn true when playing as custom character */

initialized_copy = false;
first_copy_file = "";

player = 1;
selected_skin = 0;

background_layer_x = 0;
background_layer_y = 0;

copied_character_name = ""; /* When you have copied a character, get the name for later use */
downloaded_thumbnail_sprite = noone; /* When downloading a level, you want to show a thumbnail temporarely */
level_editor_edit_name = false; /* If you are editing an already made level's name or not */
old_level_name = ""; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
old_level_description = ""; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
show_level_editor_corner_menu = true; /* If the top-left corner menu should be shown and navigatable or not. In some cases like uploading a level, the menu should not show up */
thumbnail_x_offset = 0; /* Level thumbnail x offset, for when windows size is too small to fit every thumbnail, you need to shift the x position a bit to fit everything */
show_delete_button = true; /* If delete custom level buttons should show up or not. Sometimes you don't want it to show up when the feature is unavailable */
file_found = "";
file_load_timer = 0;
level_find_pos = 0;
first_level = string(file_find_first(working_directory + "custom_levels/*", fa_directory));
open_sub_menu = false;
select_custom_level_menu_open = false;
scroll = 0;
scroll_to = 0;
lerp_on = false;
level_editor_template_select = false;
language_index = global.language_localization + 1;
language_mouse_scroll = 0;
title_background_scale_lerp = global.title_background_scale;

#region /* Character Name */
narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
#endregion /* Character Name END */

#region /* Create directories */

#region /* Create directory for saving custom characters */
if (!directory_exists(working_directory + "custom_characters"))
{
	directory_create(working_directory + "custom_characters");
}
#endregion /* Create directory for saving custom characters END */

#region /* Create directory for saving custom levels */
if (!directory_exists(working_directory + "custom_levels"))
{
	directory_create(working_directory + "custom_levels");
}
#endregion /* Create directory for saving custom levels END */

#region /* Create directory for saving custom resource_pack */
if (!directory_exists(working_directory + "custom_resource_pack"))
{
	directory_create(working_directory + "custom_resource_pack");
}
#endregion /* Create directory for saving custom resource_pack END */

#region /* Create directory for saving custom title backgrounds */
if (!directory_exists(working_directory + "custom_title_background"))
{
	directory_create(working_directory + "custom_title_background");
}
#endregion /* Create directory for saving custom title backgrounds END */

#region /* Create directory for saving custom title logos */
if (!directory_exists(working_directory + "custom_title_logo"))
{
	directory_create(working_directory + "custom_title_logo");
}
#endregion /* Create directory for saving custom title logos END */

#region /* Create directory for saving files */
if (!directory_exists(working_directory + "save_file"))
{
	directory_create(working_directory + "save_file");
}
#endregion /* Create directory for saving files END */

#endregion /* Create directories END */

#region /* Custom Title Screen Background */
if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
{
	title_screen_background = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
}
else
if (file_exists(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background))))
{
	title_screen_background = sprite_add(working_directory + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background)), 0, false, false, 0, 0);
}
else
{
	title_screen_background = noone;
}

if (variable_instance_exists(self, "title_screen_background"))
{
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
		layer_background_speed(layer_background_get_id(layer_get_id("Background")), 1);
	}
}
#endregion /* Custom Title Screen Background */

#region /* Character select Accept Selection */
player1_accept_selection = -1;
player2_accept_selection = -1;
player3_accept_selection = -1;
player4_accept_selection = -1;
player1_automatically_join = false;
player2_automatically_join = false;
player3_automatically_join = false;
player4_automatically_join = false;
player_start_game = false;
#endregion /* Character select Accept Selection END */

#region /* Color Select for CharacterSelect */
player_menu[1] = "select_character";
player_menu[2] = "select_character";
player_menu[3] = "select_character";
player_menu[4] = "select_character";
#endregion /* Color Select for CharacterSelect END */

#region /* What player can enter a name */
can_input_player1_name = 2;
can_input_player2_name = 2;
can_input_player3_name = 2;
can_input_player4_name = false;
can_input_level_name = false;
#endregion /* What player can enter a name END */

global.playergame = 0; /* Make the game singleplayer at the start of the game */
global.player_has_entered_goal = false;
global.doing_clear_check = false;
global.actually_play_edited_level = false;
global.play_edited_level = false;
global.basic_collectibles = 0;
global.big_collectible1 = false;
global.big_collectible2 = false;
global.big_collectible3 = false;
global.big_collectible4 = false;
global.big_collectible5 = false;
global.lives_until_assist = 0;
global.checkpoint_x = false;
global.checkpoint_y = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;
/* Checkpoint Timer */
global.checkpoint_millisecond = 0;
global.checkpoint_second = 0;
global.checkpoint_minute = 0;
global.checkpoint_realmillisecond = 0; /* Checkpoint Timer END */
global.win = false;
global.enemy_counter = 0;
global.file = 1;
global.controls_layout = 1;
global.trigger_ending = false;
global.spikes_emerge_time = 0;
global.goal_active = false;
global.quit_level = false;
global.always_show_level_editor_buttons = true; /* If level editor buttons should always show or not. Should be true by default */

scr_config_load(); /* Load Config */

if (file_exists("localization.csv"))
{
	if (global.language_localization > ds_grid_width(global.language_local_data))
	|| (global.language_localization < 0)
	{
		scr_set_default_language();
	}
}

lives = 5; /* Starting lives */

#region /* If title screen should start at the level editor menu or the main menu */
if (global.character_select_in_this_menu == "level_editor")
{
	scr_load_custom_level_initializing();
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = false;
	can_navigate = true;
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
#endregion /* If title screen should start at the level editor menu or the main menu END */

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

custom_levels_folder_megabytes = 0; /* Display how big the custom levels folder is */
open_dropdown = false;
menu_delay = 3;
menu_joystick_delay = 3;
menu_specific_joystick_delay[1] = 3;
menu_specific_joystick_delay[2] = 3;
menu_specific_joystick_delay[3] = 3;
menu_specific_joystick_delay[4] = 3;
black_screen_at_start_delay = 0;
player_display_x[1] = 0;
player_display_x[2] = 0;
player_display_x[3] = 0;
player_display_x[4] = 0;
xx[1] = 0;
xx[2] = 0;
xx[3] = 0;
xx[4] = 0;
xx_delay[1] = 0;
xx_delay[2] = 0;
xx_delay[3] = 0;
xx_delay[4] = 0;
remap_y_pos = 0;
version_y_pos = 0;
menu_cursor_index = 0;
in_settings = false;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = true;
navigate_slider = false;
menu_remap_key_number = 0;
menu_remap_gamepad_button_number = 0;
name_enter_blink = 0;
can_navigate = true;
menu_y_offset = 0; /* This is the y offset that will have lerping to make the menu scrolling smooth */
menu_y_offset_real = 0; /* This is the real y offset for the menu, used for menu scrolling */
menu_cursor_y_position = 0;
background_brightness_menu_lerp = 0;
title_x = 0;
title_y = - 800;
title_alpha = 0;
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
account_settings_y = 40 * 10;
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
#region /* Customize look of Options Menu */
c_menu_outline = c_white;
c_menu_fill = c_black;
#endregion /* Customize look of Options Menu END */

#region /* Stop certain sounds from playing on the title screen */
audio_stop_all();
audio_stop_sound(snd_skidding);
audio_stop_sound(snd_skidding_ice);
#endregion /* Stop certain sounds from playing on the title screen END */

#region /* Update Music */
if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
}
else
if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
}
else
{
	title_music = noone;
}
title_music_lerp = 0;
#endregion /* Update Music END */

#region /* Loading Music */
if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg"))
{
	global.loading_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg");
}
else
if (file_exists(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg"))
{
	global.loading_music = audio_create_stream(working_directory + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg");
}
else
{
	global.loading_music = noone;
}
#endregion /* Loading Music END */

#region /* Update Trailer Sound */
if (file_exists("video/trailer.ogg"))
{
	trailer_sound = audio_create_stream("video/trailer.ogg");
}
else
{
	trailer_sound = noone;
}
#endregion /* Update Trailer Sound END */

scr_audio_play(title_music, volume_source.music); /* Play title screen music */

scr_audio_play(trailer_sound, volume_source.music); /* Play trailer sound */

#region /* Reset level zoom */
if (global.reset_level_zoom_when_going_back_to_map)
{
	global.zoom_level = global.default_zoom_level;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_level", global.default_zoom_level);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Reset level zoom END */

#region /* Reset world map zoom */
if (global.reset_world_map_zoom_when_going_back_to_map)
{
	global.zoom_world_map = global.default_zoom_world_map;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_world_map", global.default_zoom_world_map);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Reset world map zoom END */

ini_open(working_directory + "save_file/config.ini");
var latest_whats_new_version = ini_read_string("config", "latest_whats_new_version", "");
var latest_whats_new_text = ini_read_string("config", "latest_whats_new_text", "");
ini_close();

if (latest_whats_new_version != "v" + string(scr_get_build_date()) && latest_whats_new_text != global.whats_new)
{
	latest_whats_new_read = false; /* The player have not read the latest what's new tab */
}
else
{
	latest_whats_new_read = true;
}

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

scr_audio_play(voice_game_title, volume_source.voice); /* Say the games title */