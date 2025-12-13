#region /* Things you could change */
global.max_players = 4; /* How many players you want to be able to play */
global.company_name = "Jonnil"; /* String of what the company is called */
global.game_name = "Sticky Paws"; /* String of what the game is called */
global.game_name_appdata = "Sticky_Paws_DX"; /* String of what the game is called at appdata folder */
global.demo_enable = false; /* Enable this when exporting demo versions of the game */
global.demo_number_of_levels = 3; /* How many levels the player should be able to play in the demo version */
var character_for_unassigned_player_default = "sticky"; /* Default character for unassigned players */
var character_for_player1 = "sticky"; /* Player 1 Select Character 1 */
var character_for_player2 = "catlyn"; /* Player 2 Select Character 2 */
var character_for_player3 = "sticky"; /* Player 3 Select Character 3 */
var character_for_player4 = "catlyn"; /* Player 4 Select Character 4 */

/* Links to websites */
/* Note: all links to jonnil.games are not working as intended. This is a known issue and will be fixed prior to release */
global.link_to_bug_report_form = "https://www.jonnil.games/sticky-paws/bug-report";
global.link_to_changelog_history = "https://www.jonnil.games/sticky-paws/changelog";
global.link_to_discord = "https://discord.jonnil.games";
global.link_to_gamebanana = "https://gamebanana.com/games/7722";
global.link_to_instagram = "https://www.instagram.com/jonnilll";
global.link_to_reddit = "https://www.reddit.com/r/Jonnil";
global.link_to_steam_page = "https://store.steampowered.com/app/1129090/Sticky_Paws";
global.link_to_twitter = "https://twitter.com/jonnilll";
global.link_to_update_schedule = "https://www.jonnil.games/sticky-paws/update-schedule";
global.link_to_website = "https://www.jonnil.games/";
global.link_to_website_guide = "https://www.jonnil.games/sticky-paws/guide";
global.link_to_website_guide_custom_character = "https://www.jonnil.games/sticky-paws/custom-character";
global.link_to_wiki = "https://www.jonnil.wiki"; //TODO: buy domain name
global.link_to_youtube = "https://www.youtube.com/Jonnilescom";
global.link_to_privacy_policy = "https://www.jonnil.games/sticky-paws/privacy-policy";
global.link_to_check_server_status = "";
global.email_support = "contact@jonnil.games"; /* This is the email address for an email support, which is required by most game platforms. Will show up whenever you report content in the game */

#region /* Retrieve What's New Text */
/* Update this text explaining what is new in each update */
/* Initialize an empty string to store the text */
global.whats_new = "";

/* Check if the file exists */
if (file_exists("whats_new.txt"))
{
	/* Open the file for reading */
	var file = file_text_open_read("whats_new.txt");
	
	/* Loop through each line until the end of the file */
	while (!file_text_eof(file))
	{
		/* Read a line and append it to the "global.whats_new" variable */
		global.whats_new += file_text_read_string(file) + "\n";
		
		/* Move to the next line */
		file_text_readln(file);
	}
	
	/* Close the file */
	file_text_close(file);
}
#endregion /* Retrieve What's New Text END */

/* There needs to be limits to the custom characters and levels. Upload and download limits are important */
global.max_file_upload_megabytes = 16; /* There needs to be a max file upload size (in megabytes), otherwise people can download files that are too big for their system to handle. Default is 16 MB */
global.max_custom_characters = 100; /* You should be able to only store a certain amount of custom characters, these are both characters you have made, and characters you have downloaded */
global.max_custom_levels = 100; /* You should be able to only store a certain amount of custom levels, these are both levels you have made, and levels you have downloaded */
global.max_level_name_lenght = 32; /* There needs to be a limit to how long a level name can be */

#region /* Change how menus look and function */
global.enable_how_to_play_settings = false; /* Enable How to play settings */
global.enable_multiplayer_settings = false; /* Enable Multiplayer settings */
global.enable_controller_settings = true; /* Enable Controller settings */
global.enable_touch_settings = false; /* Enable Touch settings */
global.enable_account_settings = true; /* Enable Profile settings */
global.enable_custom_resources_settings = true; /* Enable Custom Resources settings */
global.enable_storage_settings = true; /* Enable Storage settings */
global.enable_broadcast_settings = false; /* Enable Broadcast settings */
global.enable_add_ons_settings = false; /* Enable Add-ons settings */
global.enable_ranks = false; /* Enable the option to show ranks in the game */
global.enable_difficutly_layers_in_level_editor = false; /* If you can change difficulty layers in level editor. You need to unlock this feature first by using the difficulty settings */
global.enable_challenge_mode_settings = false; /* Enable Challenge Mode settings */

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

global.switch_account_name = noone;
global.switch_account_handle = noone;

global.switch_account_netid = noone;
global.switch_account_network_service_available = false;
global.switch_logged_in = noone;

#region /* If you're playing on console, then some things should not show up that is for PC */
if (os_type == os_switch)
{

	#region /* Need to set these Switch specific functions */
	var switch_controller_style = switch_controller_handheld | switch_controller_joycon_left | switch_controller_joycon_right | switch_controller_pro_controller | switch_controller_joycon_dual;
	switch_controller_set_supported_styles(switch_controller_style);
	switch_controller_support_set_singleplayer_only(false);
	switch_controller_support_set_player_min(1);
	switch_controller_support_set_player_max(global.max_players);
	#endregion /* Need to set these Switch specific functions END */

	/* If free communication is disabled, you shouldn't be able to upload or download custom content */
	/* If free communication is disabled, you shouldn't even see the buttons for going online */
	/* But if switch_accounts_network_service_available is false, you should be able to see the buttons for going online, but stop you from going online and instead show a notification telling you to link a Switch Account before proceeding */
	/* Free communication is basically what determines if you are using parental controls or not */
	global.free_communication_available = switch_free_communication_available();

	global.can_load_photographic_images = false; /* It's against Switch guidelines to be able to view photographic images in UGC */
	global.show_prompt_when_changing_to_gamepad = false;
	global.show_prompt_when_changing_to_keyboard_and_mouse = false;
	global.enable_open_custom_folder = false; /* Enable the option to open custom folders in the game */
	global.enable_option_for_pc = false; /* Enable if options related to gamepad, but only intended for when playing with gamepad on PC should show up */
	global.enable_keyboard_and_mouse_settings = false; /* Enable Keyboard and Mouse settings */
	global.always_show_gamepad_buttons = true;
	global.enable_translation_file_logging = false;
}
else
{
	global.free_communication_available = true; /* If free communication is disabled, you shouldn't be able to upload or download custom content. Set this to true by default on PC. Free communication is basically what determines if you are using parental controls or not */
	global.can_load_photographic_images = true; /* Default: true. There are no guidelines preventing other platfroms to view photographic images in UGC */
	global.show_prompt_when_changing_to_gamepad = true;
	global.show_prompt_when_changing_to_keyboard_and_mouse = true;
	global.enable_open_custom_folder = true; /* Enable the option to open custom folders in the game */
	global.enable_option_for_pc = true; /* Enable if options related to gamepad, but only intended for when playing with gamepad on PC should show up */
	global.enable_keyboard_and_mouse_settings = true; /* Enable Keyboard and Mouse settings */
	global.always_show_gamepad_buttons = false; /* You can force to show gamepad buttons, even if playing with keyboard, mouse or touch controls. Default = false */
	global.enable_translation_file_logging = true; /* Always log missing translation keywords on other platforms */
}
#endregion /* If you're playing on console, then some things should not show up that is for PC END */

#region /* What settings can be changed */
global.enable_verbosity_slider = false;
global.enable_narrator = true;
#endregion /* What settings can be changed END */

#endregion /* Change how menus look and function END */

global.max_fps = 60; /* Targeted fps that you want the game to run in, you never want the default to be under 60 fps, default: 60 */
global.default_text_size = 0.8 /* This is the default text size, but text size should be able to be changed by the player in settings. Default = 0.8 */

global.number_of_chain_kills_for_1up = 8; /* How many chain reaction kills you need to get 1-ups. Default is 8 */

global.all_loaded_main_levels = ds_list_create(); /* The main game will load every level folder. Don't change this variable, it just needs to be set before you can add more main levels */
ds_list_add(global.all_loaded_main_levels, "intro", "level1", "level2", "level3", "level4", "level5", "level6", "level7", "level8", "ending", "level9", "levelA");

#region /* Server stuff */
global.base_url = "sticky-paws.uc.r.appspot.com";
global.api_key = "eMCnsR7k2dq_jGHijae6_3tazPYp!UUL";

#region /* Ensure your Google Sheet is published to the web as CSV */
global.google_sheet_language_id = "2PACX-1vTrxRvkYTC9qwzNyEwWeYeBFpIwK9wa4ZERhpP7_pAhYPdcLOFzpvFmgKO_dJZj_F-U0NIuLE50J3CD"; /* In that particular "Publish to the web" URL, the DOC_ID is the portion right after /spreadsheets/d/e/ and before /pub */

global.google_sheet_language_url = "https://docs.google.com/spreadsheets/d/e/" + string(global.google_sheet_language_id) + "/pub?gid=159041004&single=true&output=csv"; /* This one works on PC */
//global.google_sheet_language_url = "https://docs.google.com/spreadsheets/d/" + string(global.google_sheet_language_id) + "/export?format=csv"
//global.google_sheet_language_url = "https://doc-04-3g-sheets.googleusercontent.com/pub/54bogvaave6cua4cdnls17ksc4/f3nml7vvup2emrba3vd9ipi404/1742166965000/113505071816264220762/*/e@" + string(global.google_sheet_language_id) + "?output=csv";
#endregion /* Ensure your Google Sheet is published to the web as CSV END */

global.http_request_info = noone;
global.http_request_id = noone;
global.content_added_today = noone;
global.online_token_validated = false; /* Can only be a boolean value */
global.online_token_request = -1; /* HTTP request handle */
global.language_http_request_id = -1;
global.http_request_contexts = ds_map_create(); /* Track HTTP request IDs to their purpose */
global.online_primary_request_active = noone;   /* Last primary download request id */
global.language_update_blocked = false;         /* Block language updates while other HTTP is active */
global.language_update_pending = false;         /* Remember that a deferred language update is waiting */
global.online_token_error_message = ""; /* Can only be a string value */
global.server_timeout_end = undefined;
global.online_list_loaded = false;
global.force_online_list_refresh = false;
/* These must always be arrays; start empty to avoid type flaps later */
global.online_content_data_level = array_create(0); /* The uploaded online content will be json parsed into this variable */
global.online_content_data_character = array_create(0);
global.info_data = undefined; /* The uploaded online content information will be json parsed into this variable */
global.draw_download_name = "";
#endregion /* Server stuff END */

#endregion /* Things you could change END */










#region /* Things you shouldn't change, warning, don't change any of these options or you might break the game! */
window_set_caption(string(global.game_name) + " v" + scr_get_build_date()); /* Set the window caption to be the game name and version number, so it's always obvious what game and version you're playing */
global.os_info = os_get_info();
audio_falloff_set_model(audio_falloff_linear_distance);

randomize(); /* You need to get random level ID codes when you upload a new level */

made_with_gamemaker_alpha = -6;
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

global.option_description = ""; /* Description that shows up when changing certain options. Should describe what the option does */
global.option_default = -1; /* Show wether the current option selected have a default setting, and tell the player this */
global.can_save_length_variable = false; /* This function saves object_placement_all.json size, but lags the game. Make this optional and false by default */
global.can_load_official_and_custom_resources = true; /* For debug, you might not want to load included files, but by default set this to true */

global.debug_screen = false; /* Toggles the visibility of the debug screen. When set to true, the debug screen appears overlayed on the game. Useful for displaying live debugging information */
global.debug_mode_activated_once = false; /* If debug mode has been activated at any point during the level, don't save fastest time and score */
global.debug_collapsed_sections = {}; /* Tracks which debug sections are collapsed. Using a struct instead of a ds_map follows modern GML best practices and benefits from automatic garbage collection. Keys are section names; values are booleans. */
global.debug_detailed_mode = false; /* Determines whether the debug screen displays detailed variable names or simplified, user-friendly labels. Set to true for detailed mode, showing exact variable names, which is helpful for developers familiar with the codebase. */
global.show_fps = false; /* Show fps for optimization debug */
global.show_instance_count = false; /* Show instance count for optimization debug */
global.show_all_instance_count = false; /* Show all the different instances within a room and how many there are for optimization debug */
global.enable_transitions = true; /* During transitions when going from one room to another, the game could crash, and you can't see what's going on when the transition animation is playing and making the screen black, so turn off this for debug */
global.enable_background_layer1 = true; /* Toggles the visibility of the first background layer. This layer is typically used for distant scenery or static visuals in the game. */
global.enable_background_layer2 = true; /* Toggles the visibility of the second background layer. Often used for mid-range background elements, such as buildings or trees. */
global.enable_background_layer3 = true; /* Toggles the visibility of the third background layer. This layer can represent closer background visuals, adding depth to the scene. */
global.enable_background_layer4 = true; /* Toggles the visibility of the fourth background layer. Typically used for the closest and most detailed background elements. */
global.enable_foreground_layer1 = true; /* Toggles the visibility of the first foreground layer. This layer is usually used for objects close to the player but not interactive. */
global.enable_foreground_layer_1_5 = true; /* Toggles the visibility of an additional foreground layer between layer 1 and layer 2. This provides more granularity in layering for visuals closer to the player. */
global.enable_foreground_layer2 = true; /* Toggles the visibility of the second foreground layer. Often used for interactive or visually significant foreground elements. */
global.enable_foreground_layer_secret = true; /* Toggles the visibility of the secret foreground layer. Typically used for hidden or unlockable elements that may only appear in certain conditions. */
global.auto_open_crash_docs = false;
global.debug_force_network_error = false; /* Default false for release */

if (GM_build_type == "run")
{
	/* Enable useful debug tools when testing inside the IDE */
	global.debug_screen = false;
	global.debug_force_network_error = false;
	//show_debug_log(true);



	show_debug_message("[Debug] GM_build_type is 'run'. Enabling development debug toggles.");
}
else
{
	show_debug_message("[Debug] GM_build_type is 'exe'. Debug toggles are set to safe defaults.");
}
#endregion /* Debug toggles END */

/* Equipped Upgrades. All of these should be true so you automatically equip the upgrades so don't change the variables here, but you can unequipp the upgrades in the pause menu */
global.equipped_upgrade_double_jump = true; /* If you have equipped the Double Jump Upgrade */

#region /* Show HUD Global Variables */
global.hud_hide_time = 3;
#endregion /* Show HUD Global Variables END */

/* Game Start Event */

scr_create_game_directories();

scr_initialize_object_id_enums(); /* Initialize the object ID enums when the game starts so you never have to initialize the object ID's ever again */

title_bg_layer = 1; /* Selected Title Background Layer to change */

can_save_to_character_config = false; /* Only turn true when playing as custom character */
initialized_characters = false;
initialized_resource_pack = false;
initialized_title_backgrounds = false;
initialized_title_logo = false;
load_ok = 0;
sprite_splash_easteregg_yoffset = +228;
goto_title_screen = false; /* If game is allowed to go to title screen yet or not. Need to load everything before going to title screen */

global.saveid = noone;
global.savebuff = noone;
global.username = ""; /* Account name for when you upload levels, you enter an username in account settings, and the levels uploaded will be credited under this name. Never set the username as the same as device name by default, because of security concerns */
global.keyboard_virtual_timer = 0; /* Delay for when virtual keyboard can show up */
global.selected_level_editing_music = 0;
global.gui_scale = -1;
global.gui_scale_modifier = 0;
global.draw_text_outline = true; /* Let it be an option that the player can disable text outline, because it can help improve performance */
global.demo_over_popup = false; /* Show the "demo over" pop-up when the last demo level is cleared */

global.resolution_setting = 0; /* Preset resolution settings */
/* 0 = Current Display Size,
1 = 1920x1080,
2 = 1600x900,
3 = 1280x720,
4 = 1024x576,
5 = 960x540,
6 = 480x270 */

global.part_limit_text_alpha = 0; /* The text showing part limit should fade out when you aren't placing or erasing objects */
global.part_limit = 0; /* How many objects are currently placed in the level editor */
global.part_limit_entity = 0; /* How many enteties are currently placed in the level editor. Enteties are object that have a lot of step events, so they can lag the game the most */
global.part_limit_entity_text_alpha = 0; /* The text showing entity limit should fade out when you aren't placing or erasing enteties */

#region /* Set default backgrounds and music */
global.default_background1 = "";
global.default_background2 = "";
global.default_background3 = "";
global.default_background4 = "";
global.default_foreground1 = "";
global.default_foreground1_5 = "";
global.default_foreground2 = "";
global.default_foreground_secret = "";
global.default_music_overworld = "";
global.default_music_underwater = "";
global.default_ambience_overworld = "";
global.default_ambience_underwater = "";
global.default_clear_melody = "";
#endregion /* Set default backgrounds and music END */

global.upload_rules_do_not_show_level = false;
global.upload_rules_do_not_show_character = false;
global.initial_gamepad_status = array_create(max(global.max_players, gamepad_get_device_count()) + 1, false); /* Create an array to store initial status for all gamepads */
global.can_load_custom_level_assets = true; /* Should be able to turn off loading custom assets */
global.playtest_invincibility = false;
global.playtest_moonjump = false;
global.save_data_size_is_sufficient = true; /* If you don't have enough save data size, then tell the player that save data is not sufficient and they should delete save data */
global.search_id = ""; /* The online ID you are searching for */
global.button_design_color = 2;
global.button_design_shape = 1;
global.button_design_transparency = 0;
global.menu_button_subimg = 16; /* In the menu button sprites are several sub-images, each with its own design that the button can use */
global.menu_navigation_speed = 60; /* Make the menu navigation go faster the longer you hold down a direction */
global.collectible_index = 0; /* Make all collectibles animate in sync */
global.caution_online_do_not_show = false; /* When the game shows the online caution screen, you should be able to disable that screen from showing up again */
global.send_crash_logs = true;
global.crash_requests = ds_map_create();
global.online_enabled = false; /* You need to accept the online caution screen before you can go online */

/* Initialize our debug tracking variables */
global.online_last_successful_check = "Never";
global.connected_server = global.base_url; /* Which server we're talking to */
global.online_environment = "SD1/SP1"; /* Lotcheck slot */
global.online_token_source = ""; /* e.g. "Switch Account Services" */
global.online_token_present = false; /* Did we actually get back a token? */
global.online_token_expired = false; /* Set true if you detect an expiry */
global.online_retry_attempts = 0; /* Count of retry‐loops */
global.online_current_attempt_result = ""; /* Last high-level failure reason */
global.online_error_code = ""; /* Your NWT-### code */

global.report_reason = "";
global.report_message = "";
global.clicking_cancel_input_screen = false;
global.clicking_ok_input_screen = false;
global.max_length_iterations = 0;
global.gui_width = window_get_width();
global.gui_height = window_get_height();
global.doing_clear_check_level = false; /* You will play the level like normal, but the game will watch you to make sure that the level can be completed befre being able to upload */
global.doing_clear_check_character = false; /* When uploading a character, the character should at least be able to complete level 1 before it can be uploaded */
global.actually_play_edited_level = false; /* Actually playing finished edited level */
global.all_loaded_characters = ds_list_create();
global.all_loaded_custom_levels = ds_list_create(); /* The level editor will load every custom level folder */
global.all_loaded_resource_pack = ds_list_create();
global.all_loaded_title_backgrounds = ds_list_create();
global.all_loaded_title_logo = ds_list_create();
global.automatically_pause_when_window_is_unfocused = true; /* Whenever you unfocus the window by clicking off the window, the game pauses by itself */
global.automatically_play_downloaded_level = false; /* If the player wants to immediately play the downloaded level, then set this variable to true */
global.use_temp_or_working = game_save_id; /* When downloading levels from online and temporarily playing the level, you have to use the "temp directory", but normally you need to use the "game save id" or "working directory". On Switch if you don't enable "Cache storage data save area size" in AuthoringEditor, you can't use "cache directory" without crashing the game */
global.character_select_in_this_menu = "main_game"; /* In what menu character select is going to appear in */
global.online_level_list_back = ""; /* What menu to go back to when clicking back in online level list */
global.controls_used_for_navigation = "keyboard"; /* keyboard, mouse, or controller */
global.create_level_from_template = false; /* If you're currently creating a level from template or not */
global.custom_background1 = noone;
global.custom_background2 = noone;
global.custom_background3 = noone;
global.custom_background4 = noone;
global.custom_foreground1 = noone;
global.custom_foreground2 = noone;
global.custom_foreground1_5 = noone;
global.custom_foreground_secret = noone;
global.custom_tileset = noone;
global.selected_font = 0;
global.selected_online_download_index = 0; /* Game should remember what file you have selected in Online List for later use */
global.download_items_per_page = 10; /* How many items per "page" */
global.download_current_page = 0; /* Which page we’re on (0‑based) */
global.download_total_pages = 0;
global.download_offset = 0;
global.spr_download_list_thumbnail = noone;
global.difficulty = 1; /* Difficulty levels: 0 = easy, 1 = normal (default), 2 = hard */
global.grid_hsnap = 32; /* Horizontal grid snapping */
global.grid_vsnap = 32; /* Vertical grid snapping */
global.iris_zoom_in = false; /* When you want to enable and disable iris zoom in code */
global.player_can_go_outside_view = false; /* Let the player go outside view in specific scenarios */
global.level_editor_level = 0; /* What level is selected in the custom level editor */
global.first_time_opened_level_editor = true; /* If you have never opened the level editor before, then automatically show the level editor help menu */
global.playing_level_from_beginning = false; /* If you are playtesting a level from beginning, need to remember that */
global.narrator = 0; /* Select Narrator */
global.narrator_selection = -1; /* The actual narrator selection, this will include "Match Player 1 Character", so that "global.narrator" can be set to whatever Player 1 has currently selected */
global.pause = false; /* If game is paused or not */
global.play_edited_level = false; /* Playtest edited level */

#region /* Automatic assigned player variables for every player */
for(var i = 1; i <= global.max_players; i += 1)
{
	global.character_index[i] = 0;
	global.player_can_play[i] = false; /* Player needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title */
	global.actual_skin_for_player[i] = i - 1; /* Player Select Skin, make default skin match the player number */
	global.sprite_select_player[i] = noone;
	global.sprite_player_stand[i] = noone;
	global.voicepack_for_player[i] = 0; /* Player Select Voicepack, make default voicepack always 0 for every player */
	global.player_color[i] = c_gray; /* Player Color, default for players without set colors should be gray */
	global.level_player_start_x[i] = 0;
	global.level_player_start_y[i] = 0;
	global.player_crouch_toggle[i] = false; /* If crouch toggle for player 1 is true or false (false by default) */
	global.player_run_toggle[i] = false; /* If run toggle for player 1 is true or false (false by default) */
	global.player_cancel_dive_by_jump_or_dive[i] = false;
	global.player_cancel_dive_by_pressing_opposite_direction[i] = false;
	global.player_down_and_jump_to_groundpound[i] = false;
	global.player_name[i] = "";
	global.player_slot[i] = i - 1; /* Controller ports */
	global.player_profile[i] = 0; /* Remap Profiles */
	global.chosen_controller_used[i] = 0; /* What controller buttons to use for button prompts. 0 = autodetect, 1 = xboxone, 2 = xboxseriesxs, 3 = nintendoswitch, 4 = playstation4, 5 = playstation5 */
	global.character_for_player[i] = string(character_for_unassigned_player_default); /* Player Select Character */
	global.skin_for_player[i] = i - 1; /* In case the player selected a character that doesn't have skins, use this variable */
	global.what_controller_sprites_to_use[i] = spr_noone;
	global.vibration_strength[i] = 0.7;
}
#endregion /* Automatic assigned player variables for every player END */

#region /* Custom assigned player variables for each player */
global.player_color[1] = c_aqua; /* Player 1 Color, default: aqua */
global.player_color[2] = c_red; /* Player 2 Color, default: red */
global.player_color[3] = c_lime; /* Player 3 Color, default: lime */
global.player_color[4] = c_yellow; /* Player 4 Color, default: yellow */
global.player_color[5] = c_orange; /* Player 5 Color, default: orange */
global.character_for_player[1] = string(character_for_player1); /* Player 1 Select Character 1 */
global.character_for_player[2] = string(character_for_player2); /* Player 2 Select Character 2 */
global.character_for_player[3] = string(character_for_player3); /* Player 3 Select Character 3 */
global.character_for_player[4] = string(character_for_player4); /* Player 4 Select Character 4 */
#endregion /* Custom assigned player variables for each player END */

global.select_level_index = 0; /* What level is selected in the custom level editor */
global.selected_resource_pack = 0; /* 0 = default */
global.show_defeats_counter = true; /* Show a defeats counter or not */
global.show_ranks = false; /* Show ranks you get at the end of the level */
global.show_timer = false; /* Show a countup timer or not */
global.thumbnail_sprite = ds_list_create();
global.thumbnail_load_queue = []; /* Queue for thumbnails to be loaded */

global.selected_title_background[1] = 0; /* 0 = default */
global.selected_title_background[2] = -1; /* -1 = nothing */
global.selected_title_background[3] = -1; /* -1 = nothing */
global.title_background_scale[1] = 1;
global.title_background_scale[2] = 1;
global.title_background_scale[3] = 1;
global.background_layer_x_scroll[1] = 1;
global.background_layer_y_scroll[1] = 1;
global.background_layer_x_scroll[2] = 1;
global.background_layer_y_scroll[2] = 1;
global.background_layer_x_scroll[3] = 1;
global.background_layer_y_scroll[3] = 1;

global.title_logo_index = spr_noone;
global.world_editor = false; /* If you're editing world or not */
global.go_to_menu_when_going_back_to_title = ""; /* Sometimes you want to go to another menu after loading custom levels, instead of the default */
device_mouse_dbclick_enable(false); /* Game should be playable on mobile without right click. Makes it harder to press the buttons in quick succession when this is enabled */
ds_list_add(global.all_loaded_custom_levels, "");
font_add_enable_aa(false);
gamepad_set_axis_deadzone(0, 0.5);
gamepad_set_axis_deadzone(1, 0.5);
gamepad_set_axis_deadzone(2, 0.5);
gamepad_set_axis_deadzone(3, 0.5);
gamepad_set_axis_deadzone(4, 0.5);
window_set_cursor(cr_none);

#region /* Select title logo depending on what language the OS is set to */
switch (os_get_language())
{
	case "ja": global.selected_title_logo = 1; /* 1 = Japanese Logo */ break;
	default: global.selected_title_logo = 0; /* 0 = English Logo */ break;
}
#endregion /* Select title logo depending on what language the OS is set to END */

global.default_zoom_level = 1; /* if "reset level zoom on return" is true, then set zoom to this number */
global.default_zoom_world = 1; /* if "reset world zoom on return" is true, then set zoom to this number */

global.zoom_level = 1; /* Zooming the view in and out, by default it's set to 1 */
global.zoom_world = 1; /* Zooming the view in and out, by default it's set to 1 */
global.reset_level_zoom_on_return = false;
global.reset_world_zoom_on_return = false;

global.language_file_requests = false;
global.language_last_update_string = "";
global.language_update_status_message = "";
global.language_update_status_color = c_white;
global.language_auto_update_interval = 1; /* 0 = Never. 1 = On Startup. 2 = Each Week. 3 = Each Month. 4 = Each Year */
global.selected_language_id = 2; /* 2 Should be the English language by default */
global.current_language_menu_position = 1;
global.language_local_data = 0;
global.language_column_start = 2; /* Languages start at column 2 (i.e. index 2) */
global.translation_debug = false; /* If you can see debug information about translations */
preload_translation_missing_keywords(); /* This cache keeps track of already logged translation keywords to prevent duplicates */
/* Shows csv cell letter and cell number, to more easily find the cell to translate */
/* Will be false by defaul and can be enabled or disabled if you click on "Translation Completion" on the language options in-game */

global.settings_sidebar_menu = "accessibility_settings"; /* Settings sidebar */
global.show_tutorial_signs = true;
global.show_new_items_notification = true; /* In level editor, items you haven't used before show a "New" notification on top of the item, but you should be able to set this to not show up */
global.players_can_collide = false;
global.player_has_entered_goal = false;
global.pause_room = noone;
global.pause_player = 0;
global.playergame = 0; /* This variable will match the amount of player_can_play that are set to true */
global.basic_collectibles = 0;
global.level_clear_rate = noone;
global.current_level_clear_rate = "";
global.increase_number_of_levels_cleared = true; /* Some levels shouldn't increase the number of levels cleared, so switch this true or false for certain levels */
global.how_many_big_collectible_collected = 0;
global.max_big_collectible = 5;
for(var i = 1; i <= 99; i += 1)
{
	global.big_collectible[i] = false; /* If you have Big Collectible or not */
	global.big_collectible_already_collected[i] = false;
}
global.max_key_fragment = 0;
for(var i = 1; i <= 99; i += 1)
{
	global.key_fragment[i] = false; /* If you have Key Fragment or not */
	global.key_fragment_already_collected[i] = false;
}
global.lives_until_assist = 0;

#region /* Assist Settings */
global.assist_enable = false;
global.assist_item_appear = 10;
global.assist_extra_hp = 0;
global.assist_above_1_hp = false;
global.assist_invincibility = false;
global.assist_moonjump = false;
global.assist_hover_when_holding_jump = false;
global.assist_floor_over_bottomless_pit = false;
global.assist_breathe_underwater = false;
global.assist_guiding_arrows = false;
global.assist_normal_arrows = true;
global.assist_enable_enemies = true; /* Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true */
global.assist_enable_spikes = true; /* Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true */
#endregion /* Assist Settings END */

#region /* Challenge Mode Settings */
global.challenge_mode_score_multiplier = 1;
global.challenge_mode_enable = false;
global.challenge_one_hit_defeat = false;
global.challenge_no_health_pickups = false;
global.challenge_no_checkpoints = false;
global.challenge_limited_lives = false;
global.challenge_lower_hp = false;
global.challenge_no_post_hit_invincibility = false;
global.challenge_stronger_gravity = false;
global.challenge_no_coyote_time = false;
global.challenge_slippery_physics = false;
global.challenge_smaller_ledge = false;
global.challenge_no_midair_control = false;
global.challenge_faster_autoscroll = false;
global.challenge_spikes_always_kill = false;
global.challenge_more_bottomless_pits = false;
global.challenge_platforms_crumble = false;
global.challenge_extra_enemy_spawns = false;
global.challenge_larger_hazard_hitboxes = false;
global.challenge_stronger_enemies = false;
global.challenge_faster_enemies = false;
global.challenge_more_aggressive_enemies = false;
global.challenge_enemies_respawn_quickly = false;
global.challenge_enemies_double_damage = false;
global.challenge_enemy_projectiles_faster = false;
global.challenge_enemies_no_stun = false;
global.challenge_permanent_darkness = false;
global.challenge_limited_air = false;
global.challenge_no_pause = false;
global.challenge_game_speed = false;
global.challenge_randomized_controls = false;
global.challenge_invisible_elements = false;
global.challenge_strict_time_limits = false;
global.challenge_iron_paw_mode = false;
global.challenge_limited_inputs = false;
global.challenge_pacifist_mode = false;
global.challenge_speedrun_mode = false;
global.challenge_no_hud_mode = false;
global.challenge_perma_death_mode = false;
global.challenge_roguelike_mode = false;
#endregion /* Challenge Mode Settings END */

global.checkpoint_x = false;
global.checkpoint_y = false;
global.enable_time_countdown = false; /* If timer should be enabled in specific level, default should be "false" so most levels don't have a countdown */
global.time_countdown = 500; /* Countdown timer before you get a Time Over, default should be "500" in case there is a countdown */
global.time_countdown_bonus = 500; /* Bonus countdown timer that gives extra points if you finish a level quickly, default should be "500" so you get bonus points if you win a level less than 8 minutes */
global.effect_rain = false;
global.effect_snow = false;
global.effect_wind = false;
global.deactivate_timer = 999; /* A timer that counts up, and determines when certain "activate" and "deactivate" functions will run. Running these functions every time will slow the game down. Only run these functions when absolutely necessary */
global.make_every_tileset_into_default_tileset = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;
global.enable_level_length_target = false;
global.target_length_minutes_min = 3;
global.target_length_minutes_max = 5;

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
global.music_boss = noone;
global.ambience = noone;
global.ambience_underwater = noone;
global.level_clear_melody = noone;
global.trigger_ending = false;
global.spikes_emerge_time = 0;
global.goal_active = false;
global.interpolate = true
global.show_collision_mask = false;
global.pause_screenshot = noone;
global.restart_level = false;
global.quit_level = false;
global.quit_to_world = false;
global.quit_to_title = false;
global.full_level_map_screenshot = false;
global.appear_block_timer = 0;

global.fullscreen_key = vk_f11;

global.level_name = ""; /* In the level editor, the name of the currently selected level will be stored here */
global.level_name = ""; /* The actual level path name will be store here, without being censored */
global.level_description = ""; /* In the level editor, the description of the currently selected level will be stored here */
global.creating_zip_file_description = "";

#region /* Set controls */
enum action
{
	dive = 0,
	jump = 1,
	double_jump = 15,
	crouch = 2,
	crouch_toggle = 3,
	run = 4,
	run_toggle = 5,
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

for(var i = 1; i <= global.max_players; i += 1)
{
	scr_set_default_remapping_player_keyboard(i, false);
	scr_set_default_remapping_player_gamepad(i, false);
}
#endregion /* Set controls END */

#region /* Resource Packs (put this code after the "scr config load" so the right sprites can load) */
global.resource_pack_sprite_logo_youtube = spr_noone;
global.resource_pack_sprite_logo_discord = spr_noone;
global.resource_pack_sprite_logo_gamebanana = spr_noone;
global.resource_pack_sprite_logo_instagram = spr_noone;
global.resource_pack_sprite_logo_reddit = spr_noone;
global.resource_pack_sprite_logo_twitter = spr_noone;
global.resource_pack_sprite_logo_wiki = spr_noone;
global.resource_pack_sprite_artwork_collection = spr_noone;
global.resource_pack_sprite_basic_collectible = spr_noone;
global.resource_pack_sprite_bulk_collectible = spr_noone;
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
global.resource_pack_sprite_enemy_vengeful_spirit = spr_noone;
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
global.resource_pack_sprite_buttons_nintendoswitch_horizontal = spr_noone;
global.resource_pack_sprite_buttons_nintendoswitch_vertical = spr_noone;
global.resource_pack_sprite_buttons_playstation4 = spr_noone;
global.resource_pack_sprite_buttons_playstation5 = spr_noone;
#endregion /* Resource Packs END */

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
file_load_timer = 0;
file_found = "";
time = 0;
sprite_index = spr_company_logo;

enum MOUSE_BUTTON_VALUE
{
	MOUSEB_LEFT = 132125620,
	MOUSEB_MIDDLE = 13213944125,
	MOUSEB_RIGHT = 1321897820,
	MOUSEB_SIDE1 = 1321994515145,
	MOUSEB_SIDE2 = 13219945202315,
	MOUSEWHEEL_DOWN = 13234,
	MOUSEWHEEL_UP = 132321
}
enum JOYSTICK_VALUE
{
	JOYLEFT_LEFT = 1000,
	JOYLEFT_RIGHT = 1001,
	JOYLEFT_DOWN = 1002,
	JOYLEFT_UP = 1003,
	JOYRIGHT_LEFT = 1004,
	JOYRIGHT_RIGHT = 1005,
	JOYRIGHT_DOWN = 1006,
	JOYRIGHT_UP = 1007,
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

scr_set_font();

#endregion /* Things you shouldn't change, warning, don't change any of these options or you might break the game! END */

/* Set network settings before starting game */
network_set_config(network_config_use_non_blocking_socket, 1);

scr_config_load(); /* Load Config */

instance_create_depth(x, y, 0, obj_debug_manager);

alarm[0] = 60;
alarm[1] = 60;

global.ps_above = part_system_create();
part_system_depth(global.ps_above, +10); /* Set its depth */

global.pt_flare_particles = part_type_create();

/* Choose a sphere shape, then scale it to be a thin horizontal line */
part_type_shape(global.pt_flare_particles, pt_shape_sphere);
part_type_size(global.pt_flare_particles, 0.30, 0.30, 0, 0);
part_type_scale(global.pt_flare_particles, 3, 1);  /* Makes it 3 times wider than its height */

/* Orientation is initially set but will be updated per particle spawn */
part_type_orientation(global.pt_flare_particles, 0, 0, 0, 0, 0);

/* Set alpha to fade out: start at 0, then 0.05, and end at 0 */
part_type_alpha3(global.pt_flare_particles, 0, 0.05, 0);

/* Blending mode, life span, and speed/direction settings */
part_type_blend(global.pt_flare_particles, 1);
part_type_life(global.pt_flare_particles, 30, 30);
part_type_speed(global.pt_flare_particles, 0, 0, 0, 0);
part_type_direction(global.pt_flare_particles, 0, 360, 0, 0);
part_type_gravity(global.pt_flare_particles, 0, 0);
