randomize();

/*Create Event*/
mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();

display_xscale = 1.5;
display_yscale = 1.5;
display_xoffset = 0;
display_yoffset = 0;

#region /*Things you could change*/
global.company_name = "Jonnil"; /*String of what the company is called*/
global.game_name = "Sticky Paws"; /*String of what the game is called*/
global.game_name_appdata = "Sticky_Paws_DX"; /*String of what the game is called at appdata folder*/
global.character_for_player_1 = "sticky"; /*Player 1 Select Character 1*/
global.character_for_player_2 = "catlyn"; /*Player 2 Select Character 2*/
global.character_for_player_3 = "sticky"; /*Player 3 Select Character 3*/
global.character_for_player_4 = "catlyn"; /*Player 4 Select Character 4 */
global.link_to_steam_page = "https://store.steampowered.com/app/1129090/Sticky_Paws/";
global.link_to_discord = "https://discord.com/invite/fGCy36x";
global.link_to_gamebanana = "https://gamebanana.com/games/7722";
global.link_to_instagram = "https://www.instagram.com/jonnilll/";
global.link_to_reddit = "https://www.reddit.com/r/Jonnil/";
global.link_to_twitter = "https://twitter.com/jonnilll";
global.link_to_wiki = "https://stickypedia.miraheze.org/wiki/Main_Page";

leveleditor_readme = noone; /*Readme textfile for how to use the level editor*/

#region /*Change how menus look and function*/

#region /*What settings tabs to show up*/
global.show_language_shortcut = false; /*If a shortcut for the language options should appear in the main menu to the left of the settings menu*/
global.show_accessibility_shortcut = false; /*If a shortcut for the accessibility options should appear in the main menu to the right of the settings menu*/
global.enable_how_to_play_settings = false; /*Enable How to play settings*/
global.show_profile_shortcut = false; /*If a shortcut for the profile options should appear in the main menu to the right of the settings menu*/
global.enable_multiplayer_settings = false; /*Enable Multiplayer settings*/
global.enable_controller_settings = true; /*Enable Controller settings*/
global.enable_touch_settings = false; /*Enable Touch settings*/
global.enable_profile_settings = false; /*Enable Profile settings*/
global.enable_global_resources_settings = true; /*Enable Global Resources settings*/
global.enable_storage_settings = true; /*Enable Storage settings*/
global.enable_language_settings = true; /*Enable Language settings*/
global.enable_broadcast_settings = false; /*Enable Broadcast settings*/
global.enable_add_ons_settings = false; /*Enable Add-ons settings*/
global.enable_ranks = false; /*Enable the option to show ranks in the game*/
if (os_type = os_switch)
{
	global.enable_open_custom_folder = false; /*Enable the option to open custom folders in the game*/
	global.enable_copy_characters = false; /*Enable the option to copy characters in the game*/
	global.enable_chosen_controller_used = false; /*Enable the chosen controller used in the game*/
}
else
{
	global.enable_open_custom_folder = true; /*Enable the option to open custom folders in the game*/
	global.enable_copy_characters = true; /*Enable the option to copy characters in the game*/
	global.enable_chosen_controller_used = true; /*Enable the chosen controller used in the game*/
}
#endregion /*What settings tabs to show up END*/

#region /*What settings can be changed*/
global.enable_verbosity_slider = false;
global.enable_narrator = true;
#endregion /*What settings can be changed END*/

#endregion /*Change how menus look and function END*/

global.max_fps = 60; /*Targeted fps that you want the game to run in, you never want the default to be under 60 fps, default: 60*/
global.default_text_size = 0.8 //0.1125;
global.default_view_width = 1920;
global.default_view_height = 1080;

global.demo = false; /*When making a demo version of the game, turn this to true, otherwise turn this to false for the full version*/
global.demo_max_levels = 3; /*Set how many levels the demo version have unlocked*/

global.deactivate_objects_outsiede_view = true; /*This global variable is for debug purposes, and should always be set to true when playing the game normally*/

global.number_of_chain_kills_for_1up = 8; /*How many chain reaction kills you need to get 1-ups. Default is 8*/

global.all_loaded_main_levels = ds_list_create(); /*The main game will load every level folder*/
ds_list_add(global.all_loaded_main_levels, "intro", "level1", "level2", "level3", "level4", "level5", "level6", "level7", "level8", "ending", "level9", "levelA");

#endregion /*Things you could change END*/





#region /*Things you shouldn't change, warning, don't change any of these options or you might break the game!*/

device_mouse_dbclick_enable(false); /*Game should be playable on mobile without right click. Makes it harder to press the buttons in quick succession when this is enabled*/

/*Equipped Upgrades. All of these should be true so you automatically equip the upgrades so don't change the variables here, but you can unequipp the upgrades in the pause menu*/
global.equipped_upgrade_double_jump = true; /*If you have equipped the Double Jump Upgrade*/

global.convention_mode = false; /*When showing the game on a convention, turn this to true*/
global.arcade_mode = false; /*When turning the game into an arcade machine, turn this to true*/
global.arcade_credit = 0; /*How many coins you've inserted into the arcade mode*/

#region /*Show HUD Global Variables*/
global.hud_hide_time = 3;
global.hud_show_lives = true;
global.hud_show_deaths = true;
global.hud_show_basic_collectibles = false;
global.hud_show_big_collectibles = false;
global.hud_show_score = false;
#endregion /*Show HUD Global Variables END*/

/*Game Start Event*/

#region /*File Handeling*/

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory + "\custom_levels"))
{
	directory_create(working_directory + "\custom_levels");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create a readme file in custom levels folder explaining how to use the level editor*/
if (leveleditor_readme > noone)
{
	leveleditor_readme_file = file_text_open_write(working_directory + "\custom_levels\readme.txt");
	file_text_write_string(leveleditor_readme_file, leveleditor_readme); /*Write readme textfile*/
	file_text_close(leveleditor_readme_file);
}
#endregion /*Create a readme file in custom levels folder explaining how to use the level editor END*/

#region /*Create directory for saving custom characters*/
if (!directory_exists(working_directory + "\custom_characters"))
{
	directory_create(working_directory + "\custom_characters");
}
#endregion /*Create directory for saving custom characters END*/

#endregion /*File Handeling END*/

font_add_enable_aa(false);
global.default_font = font_add("gamefont.ttc", 24, true, false, 32, 128);
draw_set_font(global.default_font);
saved_file_exists = false;
can_save_to_character_config = false; /*Only turn true when playing as custom character*/
unused_x_origin_point = noone;
unused_y_origin_point = noone;
view_hview_lerp = 0;
view_wview_lerp = 0;
sprite_splash_easteregg_yoffset = +128;
window_set_cursor(cr_none);
global.all_loaded_custom_levels = ds_list_create(); /*The level editor will load every custom level folder*/
ds_list_add(global.all_loaded_custom_levels, "");
load_ok = 0;
initialized_characters = false;
initialized_resource_pack = false;
initialized_title_backgrounds = false;
initialized_title_logos = false;
global.all_loaded_characters = ds_list_create();
global.all_loaded_resource_pack = ds_list_create();
global.all_loaded_title_backgrounds = ds_list_create();
global.all_loaded_title_logos = ds_list_create();
global.title_logo_index = spr_noone;
global.select_level_index = 0; /*What level is selected in the custom level editor*/

max_players = 4; /*How many players you want to be able to play*/
var i = max_players - 1;

repeat(max_players)
{
	global.character_index[i] = 0;
	i -= 1;
}

gamepad_set_axis_deadzone(0, 0.50);
gamepad_set_axis_deadzone(1, 0.50);
gamepad_set_axis_deadzone(2, 0.50);
gamepad_set_axis_deadzone(3, 0.50);

global.thumbnail_sprite = ds_list_create();
global.grid_hsnap = 32; /*Horizontal grid snapping*/
global.grid_vsnap = 32; /*Vertical grid snapping*/
global.narrator = 0; /*Select Narrator*/
global.voicepack_for_player_1 = 0; /*Player 1 Select Voicepack*/
global.voicepack_for_player_2 = 0; /*Player 2 Select Voicepack*/
global.voicepack_for_player_3 = 0; /*Player 3 Select Voicepack*/
global.voicepack_for_player_4 = 0; /*Player 4 Select Voicepack*/
global.skin_for_player_1 = 0; /*Player 1 Select Skin, make default skin 1*/
global.skin_for_player_2 = 1; /*Player 2 Select Skin, make default skin 2*/
global.skin_for_player_3 = 2; /*Player 3 Select Skin, make default skin 3*/
global.skin_for_player_4 = 3; /*Player 4 Select Skin, make default skin 4 */
global.player1_color = c_aqua; /*Player 1 Color, default:aqua*/
global.player2_color = c_red; /*Player 1 Color, default:red*/
global.player3_color = c_lime; /*Player 1 Color, default:lime*/
global.player4_color = c_yellow; /*Player 1 Color, default:yellow*/
global.player1_can_play = false; /*Player 1 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player2_can_play = false; /*Player 2 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player3_can_play = false; /*Player 3 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player4_can_play = false; /*Player 4 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.hex_color_for_player_1 = c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_2 = c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_3 = c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_4 = c_white; /*Player 1 Hex Value Color*/
global.level_editor_level = 0; /*What level is selected in the custom level editor*/
global.world_editor = false; /*If you're editing world or not*/
global.play_edited_level = false; /*Playtest edited level*/
global.actually_play_edited_level = false; /*Actually playing finished edited level*/
global.create_level_from_template = false; /*If you're currently creating a level from template or not*/
global.character_select_in_this_menu = "main_game"; /*In what menu character select is going to appear in*/
global.difficulty = 1; /*Difficulty levels: 0 = easy, 1 = normal (default), 2 = hard*/
global.automatically_pause_when_window_is_unfocused = true; /*Whenever you unfocus the window by clicking off the window, the game pauses by itself*/
global.show_timer = false; /*Show a countup timer or not*/
global.show_ranks = false; /*Show ranks you get at the end of the level*/
global.show_deaths_counter = false; /*Show a deaths counter or not*/
global.controls_used_for_menu_navigation = "keyboard"; /*keyboard, mouse, or controller*/
global.pause = false; /*If game is paused or not*/
global.custom_background1 = noone;
global.custom_background2 = noone;
global.custom_background3 = noone;
global.custom_background4 = noone;
global.custom_foreground1 = noone;
global.custom_foreground_above_static_objects = noone;
global.custom_foreground2 = noone;
global.custom_foreground_secret = noone;
global.custom_tileset = noone;
global.sprite_select_player_1 = noone;
global.sprite_select_player_2 = noone;
global.sprite_select_player_3 = noone;
global.sprite_select_player_4 = noone;
global.selected_resource_pack = 0; /* 0 = default*/
global.selected_title_background = 0; /* 0 = default*/
global.title_background_scale = 1;
global.background_layer_x_scroll = 1;
global.background_layer_y_scroll = 1;
switch (os_get_language())
{
    case "ja": global.selected_title_logo = 1; /* 1 = Japanese Logo*/ break;
    default: global.selected_title_logo = 0; /* 0 = English Logo*/ break;
}
global.show_virtual_controls = false; /*Show virtual controls on desktop or not, false by default*/

global.default_zoom_level = 1; /*if reset_level_zoom_when_going_back_to_map = true, then set zoom to this number*/
global.default_zoom_world_map = 1; /*if reset_world_map_zoom_when_going_back_to_map = true, then set zoom to this number*/

global.zoom_level = 1; /*Zooming the view in and out, by default it's set to 1*/
global.zoom_world_map = 1; /*Zooming the view in and out, by default it's set to 1*/
global.reset_level_zoom_when_going_back_to_map = false;
global.reset_world_map_zoom_when_going_back_to_map = false;

global.language_localization = 0;
global.language_completion = 0;

scr_set_default_language();

global.settings_sidebar_menu = "accessibility_settings"; /*Settings sidebar*/
global.show_tutorial_signs = true;
global.enable_transitions = true;
global.enable_background_layer1 = true;
global.enable_background_layer2 = true;
global.enable_background_layer3 = true;
global.enable_background_layer4 = true;
global.enable_foreground_layer1 = true;
global.enable_foreground_layer_above_static_objects = true;
global.enable_foreground_layer2 = true;
global.enable_foreground_layer_secret = true;
global.enable_attract_demo = true; /*If the attract demo can play or not*/
global.enable_links = true; /*If links to websites should show up on the title screen or not*/
global.players_can_collide = false;
global.player_has_entered_goal = false;
global.pause_room = noone;
global.pause_player = 0;
global.playergame = 0;
global.basic_collectibles = 0;
global.level_clear_rate = noone;
global.current_level_clear_rate = noone;
global.increase_number_of_levels_cleared = true; /*Some levels shouldn't increase the number of levels cleared, so switch this true or false for certain levels*/
global.big_collectible1 = false; /*If you have Big Collectible 1 or not*/
global.big_collectible2 = false; /*If you have Big Collectible 2 or not*/
global.big_collectible3 = false; /*If you have Big Collectible 3 or not*/
global.big_collectible4 = false; /*If you have Big Collectible 4 or not*/
global.big_collectible5 = false; /*If you have Big Collectible 5 or not*/
global.lives_until_assist = 0;

#region /*Assist Settings*/
global.assist_enable = false;
global.assist_item_appear = 10;
global.assist_extra_hp = 0;
global.assist_invincible = false;
global.assist_breathe_underwater = false;
global.assist_guiding_arrows = false;
global.assist_normal_arrows = true;
global.assist_enable_enemies = true; /*Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true*/
global.assist_enable_spikes = true; /*Option to enable or disable all enemies in the game, the player can change this themselves in assist settings. Default: true*/
global.assist_show_assist_mode_text = true;
#endregion /*Assist Settings END*/

global.x_checkpoint = false;
global.y_checkpoint = false;
global.enable_time_countdown = false; /*If timer should be enabled in specific level, default should be "false" so most levels don't have a countdown*/
global.time_countdown = 500; /*Countdown timer before you get a Time Over, default should be "500" in case there is a countdown*/
global.time_countdown_bonus = 500; /*Bonus countdown timer that gives extra points if you finish a level quickly, default should be "500" so you get bonus points if you win a level less than 8 minutes*/
global.rain = false;
global.make_every_tileset_into_default_tileset = false;
global.timeattack_millisecond = 0;
global.timeattack_second = 0;
global.timeattack_minute = 0;
global.timeattack_realmillisecond = 0;
global.timeattack_realmillisecond_real = 0;

#region /*Checkpoint Timer*/
global.checkpoint_millisecond = 0;
global.checkpoint_second = 0;
global.checkpoint_minute = 0;
global.checkpoint_realmillisecond = 0;
#endregion /*Checkpoint Timer END*/

global.win = false;
global.enemy_counter = 0;
global.file = 1;
global.controls_layout = 1;
global.background_brightness_gameplay = 0; /*Background brightness in gameplay. full_black =- 1, normal = 0 (default), full_white = +1*/
global.background_brightness_menu = 0; /*Background brightness in menus. full_black =- 1, normal = 0 (default), full_white = +1*/

#region /*Music and Sound Volume*/
global.main_volume = 0.7; /*Make the volumes set to 7000 by default*/
global.music_volume = 0.7; /*This number is then *0.0001 so it becomes 0.7*/
global.sound_volume = 0.7; /*Because Linux can't load decimal numbers from .ini files*/
global.ambient_volume = 0.7; /*By default volumes are 70% so it doesn't hurt ears*/
global.footstep_volume = 0.7;
global.voices_volume = 0.7;
global.verbosity_slider = 1;
global.number_of_audio_channels = 3; /*How many audio channels there should be. Default: 3 = 128 audio channels*/
#endregion /*Music and Sound Volume END*/

global.music = noone;
global.music_underwater = noone;
global.ambience = noone;
global.ambience_underwater = noone;
global.trigger_ending = false;
global.spikes_emerge_time = 0;
global.goal_active = false;
global.interpolate = true
global.show_fps = false;
global.show_fps_real = false;
global.show_instance_count = false;
global.show_collision_mask = false;
global.pause_screenshot = noone;
global.restart_level = false;
global.quit_level = false;
global.quit_to_map = false;
global.quit_to_title = false;
global.trigger_demo_ending = 0;
global.full_level_map_screenshot = false;

global.player1_crouch_toggle = false; /*If crouch toggle for player 1 is true or false (false by default)*/
global.player2_crouch_toggle = false; /*If crouch toggle for player 2 is true or false (false by default)*/
global.player3_crouch_toggle = false; /*If crouch toggle for player 3 is true or false (false by default)*/
global.player4_crouch_toggle = false; /*If crouch toggle for player 4 is true or false (false by default)*/

global.player1_sprint_toggle = false; /*If sprint toggle for player 1 is true or false (false by default)*/
global.player2_sprint_toggle = false; /*If sprint toggle for player 2 is true or false (false by default)*/
global.player3_sprint_toggle = false; /*If sprint toggle for player 3 is true or false (false by default)*/
global.player4_sprint_toggle = false; /*If sprint toggle for player 4 is true or false (false by default)*/

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

global.show_prompt_when_changing_to_gamepad = true;
global.show_prompt_when_changing_to_keyboard_and_mouse = true;

#region /*Universal Keyboard Remapping*/
global.fullscreen_key = vk_f11;
#endregion /*Universal Keyboard Remapping*/

global.level_name = ""; /*In the level editor, the name of the currently selected level will be stored here*/

global.player1_name = "";
global.player2_name = "";
global.player3_name = "";
global.player4_name = "";

scr_set_default_remapping();

#region /*Load Config*/
if (asset_get_type("scr_config_load") == asset_script)
{
	scr_config_load();
}
#endregion /*Load Config END*/

if (file_exists("localization.csv"))
{
	if (global.language_localization > ds_grid_width(global.language_local_data))
	or (global.language_localization < 0)
	{
		scr_set_default_language();
	}
}

#region /*Resource Packs (put this code after the scr_config_load so the right sprites can load)*/
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
global.resource_pack_sprite_block_only_when_player_is_near = spr_noone;
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
global.resource_pack_sprite_ranks = spr_noone;
global.resource_pack_sprite_splash_controller = spr_noone;
global.resource_pack_sprite_splash_easteregg = spr_noone;
global.resource_pack_sprite_tileset_default = spr_noone;
global.resource_pack_sprite_tileset_dirt = spr_noone;
global.resource_pack_sprite_tileset_glass = spr_noone;
global.resource_pack_sprite_tileset_grass = spr_noone;
global.resource_pack_sprite_tileset_gravel = spr_noone;
global.resource_pack_sprite_tileset_metal = spr_noone;
global.resource_pack_sprite_tileset_stone = spr_noone;
global.resource_pack_sprite_tileset_wood = spr_noone;
global.resource_pack_sprite_title_logo_christmas = spr_noone;
global.resource_pack_sprite_buttons_xboxone = spr_noone;
global.resource_pack_sprite_buttons_xboxseriesxs = spr_noone;
global.resource_pack_sprite_buttons_nintendoswitch = spr_noone;
global.resource_pack_sprite_buttons_playstation4 = spr_noone;
global.resource_pack_sprite_buttons_playstation5 = spr_noone;
#endregion /*Resource Packs END*/

global.chosen_controller_used = 0; /*What controller buttons to use for button prompts*/
/*0 = xboxone, 1 = xboxseriesxs, 2 = nintendoswitch, 3 = playstation4, 4 = playstation5*/

company_splash = noone;
company_splash_1 = noone;
company_splash_2 = noone;
company_splash_3 = noone;
controller_splash = noone;

#region /*Interpolation*/
if (global.interpolate = true)
{
	gpu_set_texfilter(true);
}
else
{
	global.interpolate = false;
	gpu_set_texfilter(false);
}
#endregion /*Interpolation END*/

can_navigate = false;
loading_spinning_angle = 0;
file_load_timer = 0;
file_found = "";
time = 0;
sprite_index = spr_company_logo;

#endregion /*Things you shouldn't change, warning, don't change any of these options or you might break the game! END*/

calculate_translation_completion()