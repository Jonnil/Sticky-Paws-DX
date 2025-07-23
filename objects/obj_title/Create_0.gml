player = 1;
selected_skin = 0;
selected_voicepack = 0;
for(var p = 1; p <= global.max_players; p += 1)
{
	gamepad_set_vibration(p - 1, 0, 0);
	
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

scr_delete_sprite_properly(global.custom_background1);
scr_delete_sprite_properly(global.custom_background2);
scr_delete_sprite_properly(global.custom_background3);
scr_delete_sprite_properly(global.custom_background4);
scr_delete_sprite_properly(global.custom_foreground1);
scr_delete_sprite_properly(global.custom_foreground1_5);
scr_delete_sprite_properly(global.custom_foreground2);
scr_delete_sprite_properly(global.custom_foreground_secret);

in_character_select_menu = false;
in_edit_character_menu = false;
in_online_download_list_menu = false; /* If you are in the online download list menu or not */
in_online_download_list_load_menu = false; /* If you are loading online download list or not */
in_online_search_id = false;
in_settings = false;
target_length_confirmed = false;

caution_online_takes_you_to = "";
caution_online_takes_you_back_to = "";
loading_assets = false;
allowed_to_load_template_level = false;
downloaded_level_is_daily_build = false;
masked_username = "";
masked_character_name = "";
masked_level_name = "";
draw_download_name = "";
all_download_id = "";
spr_download_list_thumbnail = noone;
top_left_of_thumbnail_x = 0;
top_left_of_thumbnail_y = 0;
load_ok = 0;
hovering_over_level_editor_corner_menu = false;
have_downloaded_from_server = false;
scrolling_menu_with_mousewheel = false;
finished_level = undefined; /* This needs to be set to undefined by default */
liked_content = undefined;
i = 0;
creating_daily_build = false; /* If you are going to create a daily build or not */
downloaded_content_is_unlisted = 0; /* If downloaded content is unlisted or not */
development_stage_index = 1 /* What development stage custom content is being published by. 0 = Early Access. 1 = Complete/Stable */
visibility_index = 0; /* If custom content should show up publicly in online list or not. 0 = Public. 1 = Unlisted */

information_menu_open = ""; /* If the information menu is opened or not */

menu = "";

key_a_pressed = noone;
key_b_pressed = noone;
key_up = noone;
key_down = noone;
key_left = noone;
key_right = noone;

thumbnail_clear_check[0] = noone;
thumbnail_daily_build[0] = noone;
thumbnail_level_id[0] = "";
thumbnail_level_unlisted[0] = 0;
thumbnail_level_name[0] = "";
thumbnail_level_description[0] = "";
thumbnail_level_username[0] = "";
thumbnail_custom_background[0] = false;

level_id = "";
character_id = "";

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

inform_about_report_feature = true; /* When you download user-generated content for the first time, inform the player about the report feature */
inform_about_report_feature_alpha = -3; /* Fade in the inform report feature menu */
remember_keyboard_string = ""; /* In case you want to click "Cancel", revert back to whatever was already written before entering name input screen */
report_back_to_menu = "";
search_id = "";
search_for_id_still = false;
content_type = "level"; /* What kind of ID you are searching for. Either "level" or "character" */
downloaded_character_name = ""; /* After loading the downloaded custom character, save the character name for later use */
global.online_download_list = ""; /* Get the uploaded online levels as a list */
global.online_download_list_info = ""; /* Get the uploaded online level thumbnails as a list */
global.download_items_per_page = 10; /* How many items per "page" */
global.download_current_page = 0; /* Which page we’re on (0‑based) */
global.download_total_pages = 0;
global.download_offset = 0;
online_content_data = undefined; /* The uploaded online content will be json parsed into this variable */
info_data = undefined; /* The uploaded online content information will be json parsed into this variable */
automatically_search_for_id = false; /* When downloading from online download list, you want to automatically search for the selected ID */
currently_selected_id = ""; /* In the online list, what level/character are you currently selecting? */
old_currently_selected_id = ""; /* this is just to compare to "currently selected id" once it changes, so that information about that specific id only have to load once */

info_queue_index = 0;
info_queue_http_request = false;

load_from_where = "characters";
can_save_to_character_config = false; /* Only turn true when playing as custom character */

initialized_copy = false;
first_copy_file = "";

levels_added_today_text = ""; /* The text should say "+n levels added today!" */
characters_added_today_text = ""; /* The text should say "+n characters added today!" */
copied_character_name = ""; /* When you have copied a character, get the name for later use */
downloaded_thumbnail_sprite = noone; /* When downloading a level, you want to show a thumbnail temporarely */
level_editor_edit_name = false; /* If you are editing an already made level's name or not */
old_level_name = ""; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
old_level_description = ""; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
old_level_index = ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index);
show_level_editor_corner_menu = true; /* If the top-left corner menu should be shown and navigatable or not. In some cases like uploading a level, the menu should not show up */
show_delete_button = true; /* If delete custom level buttons should show up or not. Sometimes you don't want it to show up when the feature is unavailable */
file_found = "";
file_load_timer = 0;
level_find_pos = 0;
first_level = string(file_find_first(game_save_id + "custom_levels/*", fa_directory));
open_sub_menu = false;
open_upload_menu = false;
select_custom_level_menu_open = false;
scroll = 0;
row = 4;
if (display_get_gui_width() >= 1670)
{
	thumbnail_x_offset = 0; /* Level thumbnail x offset, for when windows size is too small to fit every thumbnail, you need to shift the x position a bit to fit everything */
	row = 4;
}
else
if (display_get_gui_width() >= 1276)
{
	thumbnail_x_offset = 0;
	row = 3;
}
else
if (display_get_gui_width() >= 882)
{
	thumbnail_x_offset = - 64;
	row = 3;
}
else
if (display_get_gui_width() >= 488)
{
	thumbnail_x_offset = - 64;
	row = 1;
}
scroll_to = floor(global.select_level_index / row);
scroll_to_timer = 3;
level_editor_template_select = false;
language_mouse_scroll = 0;
narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator)); /* Character Name */
player_start_game = false; /* Character select Accept Selection */
can_input_level_name = false;
global.player_has_entered_goal = false;
global.actually_play_edited_level = false;
global.play_edited_level = false;
global.basic_collectibles = 0;
for(var b = 1; b <= global.max_big_collectible; b += 1)
{
	global.big_collectible[b] = false;
}
for(var b = 1; b <= global.max_key_fragment; b += 1)
{
	global.key_fragment[b] = false;
}
global.lives_until_assist = 0;
global.checkpoint_x = false;
global.checkpoint_y = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;
global.doing_clear_check_level = false; /* After the timeattack variables are reset, then set the "doing clear check level" variable to false */
global.checkpoint_millisecond = 0; /* Checkpoint Timer */
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

scr_set_default_language(false);

lives = 5; /* Starting lives */

#region /* If title screen should start at the level editor menu or the main menu */
if (global.character_select_in_this_menu == "level_editor")
{
	scr_load_custom_level_initializing();
	
	for(var p = 1; p <= global.max_players; p += 1)
	{
		can_input_player_name[p] = false;
		player_accept_selection[p] = false;
	}
	
	can_navigate = true;
	open_sub_menu = false;
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
#endregion /* Remapping options variables END */

custom_levels_folder_megabytes = 0; /* Display how big the custom levels folder is */
open_dropdown = false;
menu_delay = 3;
menu_joystick_delay = 0;
black_screen_at_start_delay = 0;
remap_y_pos = 0;
version_y_pos = 0;
menu_cursor_index = 0;
old_selected_resource_pack = global.selected_resource_pack;
can_navigate_settings_sidebar = false;
navigate_slider = false;
menu_remap_key_number = 0;
menu_remap_gamepad_button_number = 0;
name_enter_blink = 0;
can_navigate = true;
menu_y_offset = 0; /* This is the y offset that will have lerping to make the menu scrolling smooth */
menu_y_offset_real = 0; /* This is the real y offset for the menu, used for menu scrolling */
menu_cursor_y_position = 0;
menu_cursor_y_position_end = 0;
background_brightness_menu_lerp = 0;
title_x = 0;
title_y = - 800;
title_alpha = 0;
show_title_logo = true;
title_xscale = 1;
title_yscale = 1;
voice_select_character = noone;

darken_settings_alpha = 0;
darken_settings_sidebar_alpha = 0;
left_sidebar_x = -400;
iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;
c_menu_outline = c_white; /* Customize look of Options Menu */
c_menu_fill = c_black;

audio_stop_all(); /* Stop certain sounds from playing on the title screen */
audio_stop_sound(snd_skidding);
audio_stop_sound(snd_skidding_ice);

#region /* Update Music */
if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
}
else
if (file_exists(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg"))
{
	title_music = audio_create_stream(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/title_screen.ogg");
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
if (file_exists(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg"))
{
	global.loading_music = audio_create_stream(game_save_id + "custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/loading.ogg");
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

#region /* Custom Title Screen Background */
if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[1]))))
{
	title_screen_background[1] = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[1])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background1")), true);
}
else
if (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[1]))))
{
	title_screen_background[1] = sprite_add(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[1])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background1")), true);
}
else
{
	title_screen_background[1] = spr_noone;
	layer_background_visible(layer_background_get_id(layer_get_id("Background1")), false);
}
if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background1"))) != title_screen_background[1])
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background1")), title_screen_background[1]);
	layer_background_speed(layer_background_get_id(layer_get_id("Background1")), 1);
}

if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[2]))))
{
	title_screen_background[2] = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[2])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background2")), true);
}
else
if (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[2]))))
{
	title_screen_background[2] = sprite_add(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[2])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background2")), true);
}
else
{
	title_screen_background[2] = spr_noone;
	layer_background_visible(layer_background_get_id(layer_get_id("Background2")), false);
}
if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background2"))) != title_screen_background[2])
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background2")), title_screen_background[2]);
	layer_background_speed(layer_background_get_id(layer_get_id("Background2")), 1);
}

if (file_exists("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[3]))))
{
	title_screen_background[3] = sprite_add("title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[3])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background3")), true);
}
else
if (file_exists(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[3]))))
{
	title_screen_background[3] = sprite_add(game_save_id + "custom_title_background/" + string(ds_list_find_value(global.all_loaded_title_backgrounds, global.selected_title_background[3])), 0, false, false, 0, 0);
	layer_background_visible(layer_background_get_id(layer_get_id("Background3")), true);
}
else
{
	title_screen_background[3] = spr_noone;
	layer_background_visible(layer_background_get_id(layer_get_id("Background3")), false);
}
if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background3"))) != title_screen_background[3])
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background3")), title_screen_background[3]);
	layer_background_speed(layer_background_get_id(layer_get_id("Background3")), 1);
}
#endregion /* Custom Title Screen Background */

#region /* Reset level zoom */
if (global.reset_level_zoom_on_return)
{
	global.zoom_level = global.default_zoom_level;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_level", global.default_zoom_level);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Reset level zoom END */

#region /* Reset world map zoom */
if (global.reset_world_zoom_on_return)
{
	global.zoom_world = global.default_zoom_world;
	ini_open("save_file/config.ini");
	ini_write_real("config", "zoom_world", global.default_zoom_world);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Reset world map zoom END */

ini_open(game_save_id + "save_file/config.ini");
var latest_whats_new_version = ini_read_string("config", "latest_whats_new_version", "");
var latest_whats_new_text = ini_read_string("config", "latest_whats_new_text", "");
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
placable_object_unlock_notify = ini_read_real("Player", "placable_object_unlock_notify", 0);
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

if (latest_whats_new_version != "v" + scr_get_build_date()
&& latest_whats_new_text != global.whats_new)
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

scr_audio_play(voice_game_title, volume_source.voice); /* Say the games title */

set_controller_sprites_to_use();

scr_get_todays_upload_count();