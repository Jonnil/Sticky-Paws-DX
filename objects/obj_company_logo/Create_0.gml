#region /* Things you could change */
var max_players = 4; /* How many players you want to be able to play */

global.company_name = "Jonnil"; /* String of what the company is called */
global.game_name = "Sticky Paws"; /* String of what the game is called */
global.game_name_appdata = "Sticky_Paws_DX"; /* String of what the game is called at appdata folder */
global.character_for_player[1] = "sticky"; /* Player 1 Select Character 1 */
global.character_for_player[2] = "catlyn"; /* Player 2 Select Character 2 */
global.character_for_player[3] = "sticky"; /* Player 3 Select Character 3 */
global.character_for_player[4] = "catlyn"; /* Player 4 Select Character 4 */
global.link_to_steam_page = "https://store.steampowered.com/app/1129090/Sticky_Paws/";
global.link_to_discord = "https://discord.com/invite/fGCy36x";
global.link_to_gamebanana = "https://gamebanana.com/games/7722";
global.link_to_instagram = "https://www.instagram.com/jonnilll/";
global.link_to_reddit = "https://www.reddit.com/r/Jonnil/";
global.link_to_twitter = "https://twitter.com/jonnilll";
global.link_to_wiki = "https://stickypedia.miraheze.org/wiki/Main_Page";

leveleditor_readme = noone; /* Readme textfile for how to use the level editor */

#region /* Change how menus look and function */
global.skip_how_many_people_are_playing_screen = true; /* If the game should skip the "How many people are playing?" screen */
global.show_language_shortcut = false; /* If a shortcut for the language options should appear in the main menu to the left of the settings menu */
global.show_accessibility_shortcut = false; /* If a shortcut for the accessibility options should appear in the main menu to the right of the settings menu */
global.enable_how_to_play_settings = false; /* Enable How to play settings */
global.show_profile_shortcut = false; /* If a shortcut for the profile options should appear in the main menu to the right of the settings menu */
global.enable_multiplayer_settings = false; /* Enable Multiplayer settings */
global.enable_controller_settings = true; /* Enable Controller settings */
global.enable_touch_settings = false; /* Enable Touch settings */
global.enable_account_settings = true; /* Enable Profile settings */
global.enable_global_resources_settings = true; /* Enable Global Resources settings */
global.enable_storage_settings = true; /* Enable Storage settings */
global.enable_language_settings = true; /* Enable Language settings */
global.enable_broadcast_settings = false; /* Enable Broadcast settings */
global.enable_add_ons_settings = false; /* Enable Add-ons settings */
global.enable_ranks = false; /* Enable the option to show ranks in the game */
global.enable_manage_characters = true; /* Enable the option to copy characters in the game */
global.enable_difficulty_selection_settings = true; /* Enable the option to change difficulty in the game */
global.enable_difficutly_layers_in_level_editor = false; /* If you can change difficulty layers in level editor. You need to unlock this feature first by using the difficulty settings */
global.how_many_files = -1;

#region /* If you're playing on mobile, then some things should show up that is not on PC */
if (os_type == os_android)
|| (os_type == os_ios)
{
	global.show_virtual_controls = true; /* Show virtual controls on desktop or not, false by default */
}
else
{
	global.show_virtual_controls = false; /* Show virtual controls on desktop or not, false by default */
}
#endregion /* If you're playing on mobile, then some things should show up that is not on PC END */

#region /* If you're playing on console, then some things should not show up that is for PC */
if (os_type == os_switch)
{
	global.chosen_controller_used = 2; /* What controller buttons to use for button prompts */
	/* 0 = xboxone, 1 = xboxseriesxs, 2 = nintendoswitch, 3 = playstation4, 4 = playstation5 */
	global.show_prompt_when_changing_to_gamepad = false;
	global.show_prompt_when_changing_to_keyboard_and_mouse = false;	
	global.enable_open_custom_folder = false; /* Enable the option to open custom folders in the game */
	global.enable_options_for_pc = false; /* Enable if options related to gamepad, but only intended for when playing with gamepad on PC should show up */
	global.enable_keyboard_and_mouse_settings = false; /* Enable Keyboard and Mouse settings */
}
else
{
	global.chosen_controller_used = 0; /* What controller buttons to use for button prompts */
	/* 0 = xboxone, 1 = xboxseriesxs, 2 = nintendoswitch, 3 = playstation4, 4 = playstation5 */
	global.show_prompt_when_changing_to_gamepad = true;
	global.show_prompt_when_changing_to_keyboard_and_mouse = true;
	global.enable_open_custom_folder = true; /* Enable the option to open custom folders in the game */
	global.enable_options_for_pc = true; /* Enable if options related to gamepad, but only intended for when playing with gamepad on PC should show up */
	global.enable_keyboard_and_mouse_settings = true; /* Enable Keyboard and Mouse settings */
}
#endregion /* If you're playing on console, then some things should not show up that is for PC END */

#region /* What settings can be changed */
global.enable_verbosity_slider = false;
global.enable_narrator = true;
#endregion /* What settings can be changed END */

#endregion /* Change how menus look and function END */

global.max_fps = 60; /* Targeted fps that you want the game to run in, you never want the default to be under 60 fps, default: 60 */
global.default_text_size = 0.8 /* This is the default text size, but text size should be able to be changed by the player in settings. Default = 0.8 */
global.default_view_width = 1920; /* Default = 1920 */
global.default_view_height = 1080; /* Default = 1080 */

global.demo = false; /* When making a demo version of the game, turn this to true, otherwise turn this to false for the full version */
global.demo_max_levels = 3; /* Set how many levels the demo version have unlocked */

global.number_of_chain_kills_for_1up = 8; /* How many chain reaction kills you need to get 1-ups. Default is 8 */

global.all_loaded_main_levels = ds_list_create(); /* The main game will load every level folder. Don't change this variable, it just needs to be set before you can add more main levels */
ds_list_add(global.all_loaded_main_levels, "intro", "level1", "level2", "level3", "level4", "level5", "level6", "level7", "level8", "ending", "level9", "levelA");

#region /* Server stuff */
global.base_url = "sticky-paws.uc.r.appspot.com";
global.upload_endpoint = "/upload";
global.download_endpoint = "/download/";
global.api_key = "eMCnsR7k2dq_jGHijae6_3tazPYp!UUL";
global.http_request_info = noone;
#endregion /* Server stuff END */

#endregion /* Things you could change END */










#region /* Things you shouldn't change, warning, don't change any of these options or you might break the game! */

scr_sync_saving_create();
randomize(); /* You need to get random level ID codes when you upload a new level */

skip_button = gp_start;
skip_key = vk_escape;
show_skip_button = false;
show_skip_button_alpha = 0;
mouse_x_position = device_mouse_x_to_gui(0);
mouse_y_position = device_mouse_y_to_gui(0);

display_xscale = 1.5;
display_yscale = 1.5;
display_xoffset = 0;
display_yoffset = 0;

#region /* Debug toggles */
/* There are more debug toggles in different objects, so click ctrl + shift + F and search "Debug toggles" to find the other debug toggles */
/* Most of these can be toggled on or off within the games settings, so you don't have to change these settings here */
global.can_load_official_and_custom_resources = true; /* For debug, you might not want to load included files, but by default set this to true */
global.debug_screen = false;
global.show_fps = false; /* Show fps for optimization debug */
global.show_fps_real = false; /* Show fps real for optimization debug */
global.show_instance_count = false; /* Show instance count for optimization debug */
global.show_all_instance_count = false; /* Show all the different instances within a room and how many there are for optimization debug */
global.enable_transitions = true; /* During transitions when going from one room to another, the game could crash, and you can't see what's going on when the transition animation is playing and making the screen black, so turn off this for debug */
global.enable_background_layer1 = true;
global.enable_background_layer2 = true;
global.enable_background_layer3 = true;
global.enable_background_layer4 = true;
global.enable_foreground_layer1 = true;
global.enable_foreground_layer_above_static_objects = true;
global.enable_foreground_layer2 = true;
global.enable_foreground_layer_secret = true;
#endregion /* Debug toggles END */

/* Equipped Upgrades. All of these should be true so you automatically equip the upgrades so don't change the variables here, but you can unequipp the upgrades in the pause menu */
global.equipped_upgrade_double_jump = true; /* If you have equipped the Double Jump Upgrade */

global.convention_mode = false; /* When showing the game on a convention, turn this to true */
global.arcade_mode = false; /* When turning the game into an arcade machine, turn this to true */
global.arcade_credit = 0; /* How many coins you've inserted into the arcade mode */

#region /* Show HUD Global Variables */
global.hud_hide_time = 3;
#endregion /* Show HUD Global Variables END */

/* Game Start Event */

#region /* File Handeling */

#region /* Create directory for saving custom levels */
if (!directory_exists(working_directory + "\custom_levels"))
{
	directory_create(working_directory + "\custom_levels");
}
#endregion /* Create directory for saving custom levels END */

#region /* Create a readme file in custom levels folder explaining how to use the level editor */
if (leveleditor_readme > noone)
{
	leveleditor_readme_file = file_text_open_write(working_directory + "\custom_levels\readme.txt");
	file_text_write_string(leveleditor_readme_file, leveleditor_readme); /* Write readme textfile */
	file_text_close(leveleditor_readme_file);
}
#endregion /* Create a readme file in custom levels folder explaining how to use the level editor END */

#region /* Create directory for saving custom characters */
if (!directory_exists(working_directory + "\custom_characters"))
{
	directory_create(working_directory + "\custom_characters");
}
#endregion /* Create directory for saving custom characters END */

#endregion /* File Handeling END */

scr_initialize_object_id_enums(); /* Initialize the object ID enums when the game starts so you never have to initialize the object ID's ever again */

can_save_to_character_config = false; /* Only turn true when playing as custom character */
initialized_characters = false;
initialized_resource_pack = false;
initialized_title_backgrounds = false;
initialized_title_logos = false;
load_ok = 0;
sprite_splash_easteregg_yoffset = +228;
view_hview_lerp = 0;
view_wview_lerp = 0;
goto_title_screen = false; /* If game is allowed to go to title screen yet or not. Need to load everything before going to title screen */
global.saveid = noone;
global.savebuff = noone;
if (os_type == os_switch)
{
	global.username = switch_accounts_get_nickname(0);
}
else
{
	global.username = environment_get_variable("USERNAME"); /* Account name for when you upload levels, you enter an username in account settings, and the levels uploaded will be credited under this name */
}
global.keyboard_virtual_timer = 0; /* Delay for when virtual keyboard can show up */
global.selected_level_editing_music = 0;
global.gui_scale = -1;
if (os_type == os_android || os_type == os_ios)
{
	global.gui_scale_modifier = 0;
}
else
{
	global.gui_scale_modifier = 3;
}
global.clicking_cancel_input_screen = false;
global.clicking_ok_input_screen = false;
global.max_length_iterations = 0;
global.gui_width = window_get_width();
global.gui_height = window_get_height();
global.doing_clear_check = false; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
global.actually_play_edited_level = false; /* Actually playing finished edited level */
global.all_loaded_characters = ds_list_create();
global.all_loaded_custom_levels = ds_list_create(); /* The level editor will load every custom level folder */
global.all_loaded_resource_pack = ds_list_create();
global.all_loaded_title_backgrounds = ds_list_create();
global.all_loaded_title_logos = ds_list_create();
global.automatically_pause_when_window_is_unfocused = true; /* Whenever you unfocus the window by clicking off the window, the game pauses by itself */
global.background_layer_x_scroll = 1;
global.background_layer_y_scroll = 1;
global.character_select_in_this_menu = "main_game"; /* In what menu character select is going to appear in */
global.controls_used_for_menu_navigation = "keyboard"; /* keyboard, mouse, or controller */
global.create_level_from_template = false; /* If you're currently creating a level from template or not */
global.custom_background1 = noone;
global.custom_background2 = noone;
global.custom_background3 = noone;
global.custom_background4 = noone;
global.custom_foreground1 = noone;
global.custom_foreground2 = noone;
global.custom_foreground_above_static_objects = noone;
global.custom_foreground_secret = noone;
global.custom_tileset = noone;
global.selected_font = 0;
global.difficulty = 1; /* Difficulty levels: 0 = easy, 1 = normal (default), 2 = hard */
global.grid_hsnap = 32; /* Horizontal grid snapping */
global.grid_vsnap = 32; /* Vertical grid snapping */
global.hex_color_for_player1 = c_white; /* Player 1 Hex Value Color */
global.hex_color_for_player2 = c_white; /* Player 1 Hex Value Color */
global.hex_color_for_player3 = c_white; /* Player 1 Hex Value Color */
global.hex_color_for_player4 = c_white; /* Player 1 Hex Value Color */
global.iris_zoom_in = false; /* When you want to enable and disable iris zoom in code */
global.player_can_go_outside_view = false; /* Let the player go outside view in specific scenarios */
global.level_editor_level = 0; /* What level is selected in the custom level editor */
global.narrator = 0; /* Select Narrator */
global.pause = false; /* If game is paused or not */
global.play_edited_level = false; /* Playtest edited level */
global.player1_can_play = false; /* Player 1 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title */
global.player1_color = c_aqua; /* Player 1 Color, default:aqua */
global.player2_can_play = false; /* Player 2 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title */
global.player2_color = c_red; /* Player 1 Color, default:red */
global.player3_can_play = false; /* Player 3 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title */
global.player3_color = c_lime; /* Player 1 Color, default:lime */
global.player4_can_play = false; /* Player 4 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title */
global.player4_color = c_yellow; /* Player 1 Color, default:yellow */
global.select_level_index = 0; /* What level is selected in the custom level editor */
global.selected_resource_pack = 0; /* 0 = default */
global.selected_title_background = 0; /* 0 = default */
global.show_deaths_counter = false; /* Show a deaths counter or not */
global.show_ranks = false; /* Show ranks you get at the end of the level */
global.show_timer = false; /* Show a countup timer or not */
global.actual_skin_for_player[1] = 0; /* Player 1 Select Skin, make default skin 1 */
global.actual_skin_for_player[2] = 1; /* Player 2 Select Skin, make default skin 2 */
global.actual_skin_for_player[3] = 2; /* Player 3 Select Skin, make default skin 3 */
global.actual_skin_for_player[4] = 3; /* Player 4 Select Skin, make default skin 4 */
global.sprite_select_player[1] = noone;
global.sprite_select_player[2] = noone;
global.sprite_select_player[3] = noone;
global.sprite_select_player[4] = noone;
global.sprite_player_stand[1] = noone;
global.sprite_player_stand[2] = noone;
global.sprite_player_stand[3] = noone;
global.sprite_player_stand[4] = noone;
global.thumbnail_sprite = ds_list_create();
global.title_background_scale = 1;
global.title_logo_index = spr_noone;
global.voicepack_for_player[1] = 0; /* Player 1 Select Voicepack */
global.voicepack_for_player[2] = 0; /* Player 2 Select Voicepack */
global.voicepack_for_player[3] = 0; /* Player 3 Select Voicepack */
global.voicepack_for_player[4] = 0; /* Player 4 Select Voicepack */
global.world_editor = false; /* If you're editing world or not */
global.go_to_menu_after_loading_custom_levels = ""; /* Sometimes you want to go to another menu after loading custom levels, instead of the default */
device_mouse_dbclick_enable(false); /* Game should be playable on mobile without right click. Makes it harder to press the buttons in quick succession when this is enabled */
ds_list_add(global.all_loaded_custom_levels, "");
font_add_enable_aa(false);
gamepad_set_axis_deadzone(0, 0.50);
gamepad_set_axis_deadzone(1, 0.50);
gamepad_set_axis_deadzone(2, 0.50);
gamepad_set_axis_deadzone(3, 0.50);
window_set_cursor(cr_none);

#region /* Set Max Players */
var max_players = 4; /* How many players you want to be able to play */
var i = max_players - 1;
repeat(max_players)
{
	global.character_index[i] = 0;
	i --;
}
#endregion /* Set Max Players END */

#region /* Select title logo depending on what language the OS is set to */
switch (os_get_language())
{
	case "ja": global.selected_title_logo = 1; /* 1 = Japanese Logo */ break;
	default: global.selected_title_logo = 0; /* 0 = English Logo */ break;
}
#endregion /* Select title logo depending on what language the OS is set to END */

global.default_zoom_level = 1; /* if reset_level_zoom_when_going_back_to_map = true, then set zoom to this number */
global.default_zoom_world_map = 1; /* if reset_world_map_zoom_when_going_back_to_map = true, then set zoom to this number */

global.zoom_level = 1; /* Zooming the view in and out, by default it's set to 1 */
global.zoom_world_map = 1; /* Zooming the view in and out, by default it's set to 1 */
global.reset_level_zoom_when_going_back_to_map = false;
global.reset_world_map_zoom_when_going_back_to_map = false;

global.language_localization = 0;
global.language_completion = 0;
global.translation_debug = false; /* If you can see debug information about translations */
/* Shows csv cell letter and cell number, to more easily find the cell to translate */
/* Will be false by defaul and can be enabled or disabled if you click on "Translation Completion" on the language options in-game */

scr_set_default_language();

global.settings_sidebar_menu = "accessibility_settings"; /* Settings sidebar */
global.show_tutorial_signs = true;
global.show_new_items_notification = true; /* In level editor, items you haven't used before show a "New" notification on top of the item, but you should be able to set this to not show up */
global.enable_attract_demo = true; /* If the attract demo can play or not */
global.enable_links = true; /* If links to websites should show up on the title screen or not */
global.players_can_collide = false;
global.player_has_entered_goal = false;
global.pause_room = noone;
global.pause_player = 0;
global.playergame = 0;
global.basic_collectibles = 0;
global.level_clear_rate = noone;
global.current_level_clear_rate = noone;
global.increase_number_of_levels_cleared = true; /* Some levels shouldn't increase the number of levels cleared, so switch this true or false for certain levels */
global.big_collectible1 = false; /* If you have Big Collectible 1 or not */
global.big_collectible2 = false; /* If you have Big Collectible 2 or not */
global.big_collectible3 = false; /* If you have Big Collectible 3 or not */
global.big_collectible4 = false; /* If you have Big Collectible 4 or not */
global.big_collectible5 = false; /* If you have Big Collectible 5 or not */
global.big_collectible1_already_collected = false;
global.big_collectible2_already_collected = false;
global.big_collectible3_already_collected = false;
global.big_collectible4_already_collected = false;
global.big_collectible5_already_collected = false;
global.lives_until_assist = 0;

#region /* Assist Settings */
global.assist_enable = false;
global.assist_item_appear = 10;
global.assist_extra_hp = 0;
global.assist_invincible = false;
global.assist_breathe_underwater = false;
global.assist_guiding_arrows = false;
global.assist_normal_arrows = true;
global.assist_enable_enemies = true; /* Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true */
global.assist_enable_spikes = true; /* Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true */
global.assist_show_assist_mode_text = true;
#endregion /* Assist Settings END */

global.checkpoint_x = false;
global.checkpoint_y = false;
global.enable_time_countdown = false; /* If timer should be enabled in specific level, default should be "false" so most levels don't have a countdown */
global.time_countdown = 500; /* Countdown timer before you get a Time Over, default should be "500" in case there is a countdown */
global.time_countdown_bonus = 500; /* Bonus countdown timer that gives extra points if you finish a level quickly, default should be "500" so you get bonus points if you win a level less than 8 minutes */
global.rain = false;
global.deactivate_objects_from_most_zoomed_out = false; /* In some levels, you want to deactivate objects from most zoomed out state, so objects are working outside view */
global.make_every_tileset_into_default_tileset = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;

#region /* Checkpoint Timer */
global.checkpoint_millisecond = 0;
global.checkpoint_second = 0;
global.checkpoint_minute = 0;
global.checkpoint_realmillisecond = 0;
#endregion /* Checkpoint Timer END */

global.win = false;
global.enemy_counter = 0;
global.file = 1;
global.controls_layout = 1;
global.background_brightness_gameplay = 0; /* Background brightness in gameplay. full_black = -1, normal = 0 (default), full_white = +1 */
global.background_brightness_menu = 0; /* Background brightness in menus. full_black = -1, normal = 0 (default), full_white = +1 */

scr_set_default_audio_settings();

global.music = noone;
global.music_underwater = noone;
global.ambience = noone;
global.ambience_underwater = noone;
global.trigger_ending = false;
global.spikes_emerge_time = 0;
global.goal_active = false;
global.interpolate = true
global.show_collision_mask = false;
global.pause_screenshot = noone;
global.restart_level = false;
global.quit_level = false;
global.quit_to_map = false;
global.quit_to_title = false;
global.trigger_demo_ending = 0;
global.full_level_map_screenshot = false;

global.player1_crouch_toggle = false; /* If crouch toggle for player 1 is true or false (false by default) */
global.player2_crouch_toggle = false; /* If crouch toggle for player 2 is true or false (false by default) */
global.player3_crouch_toggle = false; /* If crouch toggle for player 3 is true or false (false by default) */
global.player4_crouch_toggle = false; /* If crouch toggle for player 4 is true or false (false by default) */

global.player1_sprint_toggle = false; /* If sprint toggle for player 1 is true or false (false by default) */
global.player2_sprint_toggle = false; /* If sprint toggle for player 2 is true or false (false by default) */
global.player3_sprint_toggle = false; /* If sprint toggle for player 3 is true or false (false by default) */
global.player4_sprint_toggle = false; /* If sprint toggle for player 4 is true or false (false by default) */

global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player3_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;

global.player1_cancel_dive_by_pressing_opposite_direction = false;
global.player2_cancel_dive_by_pressing_opposite_direction = false;
global.player3_cancel_dive_by_pressing_opposite_direction = false;
global.player4_cancel_dive_by_pressing_opposite_direction = false;

global.player1_down_and_jump_to_groundpound = false;
global.player2_down_and_jump_to_groundpound = false;
global.player3_down_and_jump_to_groundpound = false;
global.player4_down_and_jump_to_groundpound = false;

global.fullscreen_key = vk_f11;

global.level_name = ""; /* In the level editor, the name of the currently selected level will be stored here */
global.level_description = ""; /* In the level editor, the description of the currently selected level will be stored here */

global.player_name[1] = "";
global.player_name[2] = "";
global.player_name[3] = "";
global.player_name[4] = "";

#region /* Controller ports */
global.player1_slot = 0;
global.player2_slot = 1;
global.player3_slot = 2;
global.player4_slot = 3;
#endregion /* Controller ports END */

#region /* Remap Profiles */
global.player1_profile = 0;
global.player2_profile = 0;
global.player3_profile = 0;
global.player4_profile = 0;
#endregion /* Remap Profiles END */

#region /* Set controls */
enum action
{
	dive = 0,
	jump = 1,
	double_jump = 15,
	crouch = 2,
	crouch_toggle = 3,
	sprint = 4,
	sprint_toggle = 5,
	left = 6,
	right = 7,
	down = 8,
	up = 9,
	tongue = 10,
	zoom_in = 11,
	zoom_out = 12,
	accept = 13,
	back = 14
}
enum inp
{
	key = 0,
	gp = 1
}

scr_set_default_remapping_player1_keyboard(false);
scr_set_default_remapping_player1_gamepad(false);
scr_set_default_remapping_player2_keyboard(false);
scr_set_default_remapping_player2_gamepad(false);
scr_set_default_remapping_player3_keyboard(false);
scr_set_default_remapping_player3_gamepad(false);
scr_set_default_remapping_player4_keyboard(false);
scr_set_default_remapping_player4_gamepad(false);
#endregion /* Set controls END */

#region /* Set default language */
if (file_exists("localization.csv"))
{
	if (global.language_localization > ds_grid_width(global.language_local_data))
	|| (global.language_localization < 0)
	{
		scr_set_default_language();
	}
}
#endregion /* Set default language END */

#region /* Resource Packs (put this code after the "scr config load" so the right sprites can load) */
global.resource_pack_sprite_logo_discord = spr_noone;
global.resource_pack_sprite_logo_gamebanana = spr_noone;
global.resource_pack_sprite_logo_instagram = spr_noone;
global.resource_pack_sprite_logo_reddit = spr_noone;
global.resource_pack_sprite_logo_twitter = spr_noone;
global.resource_pack_sprite_logo_wiki = spr_noone;
global.resource_pack_sprite_artwork_collection = spr_noone;
global.resource_pack_sprite_basic_collectible = spr_noone;
global.resource_pack_sprite_basic_enemy = spr_noone;
global.resource_pack_sprite_basic_enemy_angry = spr_noone;
global.resource_pack_sprite_basic_enemy_blind = spr_noone;
global.resource_pack_sprite_basic_enemy_flattened = spr_noone;
global.resource_pack_sprite_big_collectible = spr_noone;
global.resource_pack_sprite_big_collectible_outline = spr_noone;
global.resource_pack_sprite_big_stationary_enemy = spr_noone;
global.resource_pack_sprite_big_stationary_enemy_flattened = spr_noone;
global.resource_pack_sprite_blaster = spr_noone;
global.resource_pack_sprite_eye_block = spr_noone;
global.resource_pack_sprite_eye_block_enemy = spr_noone;
global.resource_pack_sprite_eye_block_enemy_player = spr_noone;
global.resource_pack_sprite_bowlingball = spr_noone;
global.resource_pack_sprite_bowlingball_shine = spr_noone;
global.resource_pack_sprite_bullet = spr_noone;
global.resource_pack_sprite_bullet_flattened = spr_noone;
global.resource_pack_sprite_cake = spr_noone;
global.resource_pack_sprite_coil_spring = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_blind_revive = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_blind_stomped = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_blind_walk = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_revive = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_stomped = spr_noone;
global.resource_pack_sprite_enemy_bowlingball_walk = spr_noone;
global.resource_pack_sprite_hp_pickup = spr_noone;
global.resource_pack_sprite_invincibility_powerup = spr_noone;
global.resource_pack_sprite_menu_button_1player = spr_noone;
global.resource_pack_sprite_menu_button_2player = spr_noone;
global.resource_pack_sprite_menu_button_3player = spr_noone;
global.resource_pack_sprite_menu_button_4player = spr_noone;
global.resource_pack_sprite_ranks = spr_noone;
global.resource_pack_sprite_splash_controller = spr_noone;
global.resource_pack_sprite_splash_easteregg = spr_noone;
global.resource_pack_sprite_tileset_default = spr_noone;
global.resource_pack_sprite_tileset_dirt = spr_noone;
global.resource_pack_sprite_tileset_glass = spr_noone;
global.resource_pack_sprite_tileset_grass = spr_noone;
global.resource_pack_sprite_tileset_gravel = spr_noone;
global.resource_pack_sprite_tileset_metal = spr_noone;
global.resource_pack_sprite_tileset_path = spr_noone;
global.resource_pack_sprite_tileset_stone = spr_noone;
global.resource_pack_sprite_tileset_wood = spr_noone;
global.resource_pack_sprite_buttons_xboxone = spr_noone;
global.resource_pack_sprite_buttons_xboxseriesxs = spr_noone;
global.resource_pack_sprite_buttons_nintendoswitch = spr_noone;
global.resource_pack_sprite_buttons_playstation4 = spr_noone;
global.resource_pack_sprite_buttons_playstation5 = spr_noone;
#endregion /* Resource Packs END */

if (os_type == os_switch)
{
	global.always_show_gamepad_buttons = true;
}
else
{
	global.always_show_gamepad_buttons = false; /* You can force to show gamepad buttons, even if playing with keyboard, mouse or touch controls. Default = false */
}

company_splash = noone;
company_splash_1 = noone;
company_splash_2 = noone;
company_splash_3 = noone;
controller_splash = noone;

#region /* Interpolation */
if (global.interpolate)
{
	gpu_set_texfilter(true);
}
else
{
	global.interpolate = false;
	gpu_set_texfilter(false);
}
#endregion /* Interpolation END */

can_navigate = false;
global.loading_spinning_angle = 0;
file_load_timer = 0;
file_found = "";
time = 0;
sprite_index = spr_company_logo;

calculate_translation_completion();

enum mouse_button_value
{
	mb_left = 132125620,
	mb_middle = 13213944125,
	mb_right = 1321897820,
	mb_side1 = 1321994515145,
	mb_side2 = 13219945202315,
	mwheel_down = 13234,
	mwheel_up = 132321
}
enum joystick_value
{
	joyleft_left = 1000,
	joyleft_right = 1001,
	joyleft_down = 1002,
	joyleft_up = 1003,
	joyright_left = 1004,
	joyright_right = 1005,
	joyright_down = 1006,
	joyright_up = 1007,
}
enum volume_source
{
	ambient = 1,
	footstep = 2,
	melody = 3,
	music = 4,
	sound = 5,
	voice = 6
}

alarm[0] = 3;

#region /* Set these global variables after loading config file */
global.skin_for_player[1] = global.actual_skin_for_player[1]; /* In case the player selected a character that doesn't have skins, use this variable */
global.skin_for_player[2] = global.actual_skin_for_player[2]; /* In case the player selected a character that doesn't have skins, use this variable */
global.skin_for_player[3] = global.actual_skin_for_player[3]; /* In case the player selected a character that doesn't have skins, use this variable */
global.skin_for_player[4] = global.actual_skin_for_player[4]; /* In case the player selected a character that doesn't have skins, use this variable */
scr_set_font();
#endregion /* Set these global variables after loading config file END */

#endregion /* Things you shouldn't change, warning, don't change any of these options or you might break the game! END */