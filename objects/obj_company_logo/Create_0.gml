/*Create Event*/

#region /*Things you could change*/

leveleditor_readme = noone; /*Readme textfile for how to use the level editor*/

/*Change how menus look and function*/
global.can_select_number_of_players = true; /* if this is true, there will be a number of players select screen before you start the game*/
global.character_select_screen = true; /* if this is true, there will be a character select screen before you start the game*/
global.character_clothes_customization = false; /* if this is true, you can costumize the character's clothes in the menu*/
global.character_color_select = false; /* if this is true, you can choose the character's color in the menu*/
global.select_number_of_players_before_selecting_characters = false; /* if you should select how many players are going to play before you select what character to play as*/
global.max_number_of_official_characters = 2; /*Update this whenever you add more official playable characters! 1 = default*/
global.max_number_of_official_resourcepacks = 1; /*Update this whenever you add more official resource packs! 1 = default*/
global.max_number_of_official_title_backgrounds = 2; /*Update this whenever you add more official title backgrounds! 1 = default, but more title backgrounds can be added, for example: 1 = light theme, 2 = dark theme*/

#region /*What settings tabs to show up*/
global.show_language_shortcut = false; /* if a shortcut for the language options should appear in the main menu to the left of the settings menu*/
global.show_accessibility_shortcut = false; /* if a shortcut for the accessibility options should appear in the main menu to the right of the settings menu*/
global.show_profile_shortcut = false; /* if a shortcut for the profile options should appear in the main menu to the right of the settings menu*/
global.enable_multiplayer_settings = false; /*Enable Multiplayer settings*/
global.enable_controller_settings = false; /*Enable Controller settings*/
global.enable_touch_settings = false; /*Enable Touch settings*/
global.enable_profile_settings = false; /*Enable Profile settings*/
global.enable_global_resources_settings = true; /*Enable Global Resources settings*/
global.enable_storage_settings = true; /*Enable Storage settings*/
global.enable_language_settings = false; /*Enable Language settings*/
global.enable_broadcast_settings = false; /*Enable Broadcast settings*/
global.enable_how_to_play_settings = false; /*Enable How to play settings*/
global.enable_add_ons_settings = false; /*Enable Add-ons settings*/
#endregion /*What settings tabs to show up END*/

#region /*What settings can be changed*/
global.enable_verbosity_slider = false;
global.enable_narrator = true;
#endregion /*What settings can be changed END*/

global.max_fps = 60; /*Targeted fps that you want the game to run in, you never want the default to be under 60 fps, default: 60*/
global.default_text_size = 0.2 //0.1125;
global.default_view_width = 1920;
global.default_view_height = 1080;

global.demo = false; /*When making a demo version of the game, turn this to true, otherwise turn this to false for the full version*/
global.demo_max_levels = 3; /*Set how many levels the demo version have unlocked*/

/*Upgrades. Choose what abilities the player character have when they start the game*/
global.has_upgrade_double_jump = false; /* if you have the Double Jump Upgrade*/

global.deactivate_objects_outsiede_view = true; /*This global variable is for debug purposes, and should always be set to true when playing the game normally*/

global.number_of_chain_kills_for_1up = 8; /*How many chain reaction kills you need to get 1-ups. Default is 8*/

global.all_loaded_main_levels = ds_list_create(); /*The main game will load every level folder*/
ds_list_add(global.all_loaded_main_levels, "Intro", "Level1", "Level2", "Level3", "Level4", "Level5", "Level6", "Level7", "Level8", "Ending", "Level9");

#endregion /*Things you could change END*/





#region /*Things you shouldn't change, warning, don't change any of these options or you might break the game!*/

/*Equipped Upgrades. All of these should be true so you automatically equip the upgrades so don't change the variables here, but you can unequipp the upgrades in the pause menu*/
global.equipped_upgrade_double_jump = true; /* if you have equipped the Double Jump Upgrade*/

#region /*View Border and Port Size*/
if (!os_browser)
{
	view_hborder = 1920;
	view_vborder = 1080;
}
#endregion /*View Border and Port Size END*/

global.convention_mode = false; /*When showing the game on a convention, turn this to true*/
global.custom_level_load_delay = 0; /*How many frames each custom level takes to load. Having this number be too low can crash the game on weaker devices, so have an option in the game where you can change this number*/

#region /*Show HUD Global Variables*/
global.hud_hide_time = 3;
global.hud_show_lives = true;
global.hud_show_deaths = true;
global.hud_show_basic_collectibles = false;
global.hud_show_big_collectibles = false;
global.hud_show_score = false;
#endregion /*Show HUD Global Variables END*/

/*Game Start Event*/

/*File Handeling*/

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

#region /*Unzip custom level files*/
if (file_exists(working_directory + "custom_levels/*.zip"))
{
	zip_unzip(working_directory + "custom_levels/*.zip", working_directory + "custom_levels/");
	file_delete(working_directory + "custom_levels/*.zip"); /*Delete the zip file after it's been unzip*/
}
#endregion /*Unzip custom level files END*/

view_hview_lerp = 0;
view_wview_lerp = 0;
window_set_cursor(cr_none);
global.all_loaded_custom_levels = ds_list_create(); /*The level editor will load every custom level folder*/
ds_list_add(global.all_loaded_custom_levels, "");
global.all_loaded_characters = ds_list_create();
global.select_level_index = 0; /*What level is selected in the custom level editor*/

max_players = 4; /*How many players you want to be able to play*/
var i = max_players - 1;

repeat(max_players)
{
	global.character_index[i] = 0;
	i -= 1;
}

global.thumbnail_sprite = ds_list_create();
global.grid_hsnap = 32; /*Horizontal grid snapping*/
global.grid_vsnap = 32; /*Vertical grid snapping*/
global.narrator = 0; /*Select Narrator*/
global.character_for_player_1 = "Sticky"; /*Player 1 Select Character 1*/
global.character_for_player_2 = "Catlyn"; /*Player 2 Select Character 2*/
global.character_for_player_3 = "Sticky"; /*Player 3 Select Character 3*/
global.character_for_player_4 = "Catlyn"; /*Player 4 Select Character 4 */
global.voicepack_for_player_1 = 0; /*Player 1 Select Voicepack*/
global.voicepack_for_player_2 = 0; /*Player 2 Select Voicepack*/
global.voicepack_for_player_3 = 0; /*Player 3 Select Voicepack*/
global.voicepack_for_player_4 = 0; /*Player 4 Select Voicepack*/
global.skin_for_player_1 = 0; /*Player 1 Select Skin, make default skin 1*/
global.skin_for_player_2 = 1; /*Player 2 Select Skin, make default skin 2*/
global.skin_for_player_3 = 2; /*Player 3 Select Skin, make default skin 3*/
global.skin_for_player_4 = 3; /*Player 4 Select Skin, make default skin 4 */
global.player1_color =c_aqua; /*Player 1 Color, default:aqua*/
global.player2_color =c_red; /*Player 1 Color, default:red*/
global.player3_color =c_lime; /*Player 1 Color, default:lime*/
global.player4_color =c_yellow; /*Player 1 Color, default:yellow*/
global.player1_can_play = false; /*Player 1 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player2_can_play = false; /*Player 2 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player3_can_play = false; /*Player 3 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.player4_can_play = false; /*Player 4 needs to join the game to be able to play, by default this is false. Don't run this code in create event of obj_title*/
global.color_for_player_1 = 0; /*Player 1 Select Color 1*/
global.color_for_player_2 = 0; /*Player 2 Select Color 2*/
global.color_for_player_3 = 0; /*Player 3 Select Color 3*/
global.color_for_player_4 = 0; /*Player 4 Select Color 4 */
global.hex_color_for_player_1 =c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_2 =c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_3 =c_white; /*Player 1 Hex Value Color*/
global.hex_color_for_player_4 =c_white; /*Player 1 Hex Value Color*/
global.level_editor_level = 0; /*What level is selected in the custom level editor*/
global.play_edited_level = false; /*Playtest edited level*/
global.actually_play_edited_level = false; /*Actually playing finished edited level*/
global.create_level_from_template = false; /* if you're currently creating a level from template or not*/
global.character_select_in_this_menu = "main_game"; /* in what menu character select is going to appear in*/
global.difficulty = 1; /*Difficulty levels: 0 = easy, 1 = normal (default), 2 = hard*/
global.automatically_pause_when_window_is_unfocused = true; /*Whenever you unfocus the window by clicking off the window, the game pauses by itself*/
global.show_timer = false; /*Show a countup timer or not*/
global.show_deaths_counter = false; /*Show a deaths counter or not*/
global.controls_used_for_menu_navigation = "keyboard"; /*keyboard, mouse, or controller*/
global.pause = false; /* if game is paused or not*/
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
global.selected_resourcepack = 0; /*0 = default*/
global.selected_title_background = 0; /*0 = default*/
global.zoom_level = 1; /*Zooming the view in and out, by default it's set to 1*/
global.zoom_world_map = 1; /*Zooming the view in and out, by default it's set to 1*/
global.reset_level_zoom_when_going_back_to_map = false;
global.reset_world_map_zoom_when_going_back_to_map = false;
//global.spot_x = 0;
//global.spot_y = 0;

switch(os_get_language())
{
	case "es": global.language_localization = localization.es_es;break;
	case "fr": global.language_localization = localization.fr_fr;break;
	case "it": global.language_localization = localization.it_it;break;
	default: global.language_localization = localization.en_us;break; /*Set the default language to American English*/
}

global.settings_sidebar_menu = "settings_back"; /*Settings sidebar*/
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
global.players_can_collide = false;
global.player_has_entered_goal = false;
global.pause_room = noone;
global.pause_player = 0;
global.key_used = "";
global.playergame = 0;
global.theme = "ground";
global.basic_collectibles = 0;
global.level_clear_rate = noone;
global.current_level_clear_rate = noone;
global.increase_number_of_levels_cleared = true; /*Some levels shouldn't increase the number of levels cleared, so switch this true or false for certain levels*/
global.big_collectible1 = false; /* if you have Big Collectible 1 or not*/
global.big_collectible2 = false; /* if you have Big Collectible 2 or not*/
global.big_collectible3 = false; /* if you have Big Collectible 3 or not*/
global.big_collectible4 = false; /* if you have Big Collectible 4 or not*/
global.big_collectible5 = false; /* if you have Big Collectible 5 or not*/
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
global.time_countdown = noone; /*Countdown timer before you get a Time Over, default should be "noone" so most levels don't have a countdown*/
global.time_countdown_bonus = 500; /*Bonus countdown timer that gives extra points if you finish a level quickly, default should be "500" so you get bonus points if you win a level less than 8 minutes*/
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
global.background_brightness_gameplay = 0; /*Background brightness in gameplay. full_black=- 1, normal = 0 (default), full_white = +1*/
global.background_brightness_menu= 0; /*Background brightness in menus. full_black=- 1, normal = 0 (default), full_white = +1*/

#region /*Music and Sound Volume*/
global.music_volume = 0.7; /*Make the volumes set to 0.7 by default, so the volume of the game is not too loud when one start the game for the first time*/
global.sfx_volume = 0.7;
global.ambient_volume = 0.7;
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
global.show_collision_mask= false;
global.pause_screenshot = noone;
global.restart_level = false;
global.quit_level = false;
global.quit_to_map = false;
global.quit_to_title = false;
global.trigger_demo_ending = 0;
global.full_level_map_screenshot = false;

global.player1_crouch_toggle = false; /* if crouch toggle for player 1 is true or false (false by default)*/
global.player2_crouch_toggle = false; /* if crouch toggle for player 2 is true or false (false by default)*/
global.player3_crouch_toggle = false; /* if crouch toggle for player 3 is true or false (false by default)*/
global.player4_crouch_toggle = false; /* if crouch toggle for player 4 is true or false (false by default)*/

global.player1_sprint_toggle = false; /* if sprint toggle for player 1 is true or false (false by default)*/
global.player2_sprint_toggle = false; /* if sprint toggle for player 2 is true or false (false by default)*/
global.player3_sprint_toggle = false; /* if sprint toggle for player 3 is true or false (false by default)*/
global.player4_sprint_toggle = false; /* if sprint toggle for player 4 is true or false (false by default)*/

global.player1_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player2_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player3_cancel_dive_by_pressing_jump_or_dive_button = false;
global.player4_cancel_dive_by_pressing_jump_or_dive_button = false;

global.player1_cancel_dive_by_pressing_opposite_direction = false;
global.player2_cancel_dive_by_pressing_opposite_direction = false;
global.player3_cancel_dive_by_pressing_opposite_direction = false;
global.player4_cancel_dive_by_pressing_opposite_direction = false;

#region /*Universal Keyboard Remapping*/
global.fullscreen_key =vk_f11;
#endregion /*Universal Keyboard Remapping*/

global.level_name = ""; /* in the level editor, the name of the currently selected level will be stored here*/

#region /*Player 1 Keyboard Remapping*/
global.player1_name = "";

#region /*Player 1 Key 1 defaults*/
global.player1_key_dive = ord("X");
global.player1_key_jump = ord("Z");
global.player1_key_crouch = vk_down;
global.player1_key_crouch_toggle = noone;
global.player1_key_sprint = vk_lcontrol;
global.player1_key_sprint_toggle = 20;
global.player1_key_left = vk_left;
global.player1_key_right = vk_right;
global.player1_key_down = vk_down;
global.player1_key_up = vk_up;
global.player1_key_tongue = noone;
#endregion /*Player 1 Key 1 defaults END*/

#region /*Player 1 Key 2 defaults*/
global.player1_key2_dive = noone;
global.player1_key2_jump = vk_space;
global.player1_key2_crouch = vk_shift;
global.player1_key2_crouch_toggle = noone;
global.player1_key2_sprint = ord("X");
global.player1_key2_sprint_toggle = noone;
global.player1_key2_left = ord("A");
global.player1_key2_right = ord("D");
global.player1_key2_down = ord("S");
global.player1_key2_up = ord("W");
global.player1_key2_tongue = noone;
#endregion /*Player 1 Key 2 defaults END*/

global.player1_up_key_is_jump_key = false;
global.player1_double_tap_to_run = true;
global.player1_wall_jump_setting = 1;
global.player1_drop_from_rope = 1;
global.player1_show_controls = 1;
#endregion /*Player 1 Keyboard Remapping END*/

#region /*Player 2 Keyboard Remapping (everything should be set to noone)*/
global.player2_name = "";

#region /*Player 2 Key 1 defaults*/
global.player2_key_dive = noone;
global.player2_key_jump = noone;
global.player2_key_crouch = noone;
global.player2_key_crouch_toggle = noone;
global.player2_key_sprint = noone;
global.player2_key_sprint_toggle = noone;
global.player2_key_left = noone;
global.player2_key_right = noone;
global.player2_key_down = noone;
global.player2_key_up = noone;
global.player2_key_tongue = noone;
#endregion /*Player 2 Key 1 defaults END*/

#region /*Player 2 Key 2 defaults*/
global.player2_key2_dive = noone;
global.player2_key2_jump = noone;
global.player2_key2_crouch = noone;
global.player2_key2_crouch_toggle = noone;
global.player2_key2_sprint = noone;
global.player2_key2_sprint_toggle = noone;
global.player2_key2_left = noone;
global.player2_key2_right = noone;
global.player2_key2_down = noone;
global.player2_key2_up = noone;
global.player2_key2_tongue = noone;
#endregion /*Player 2 Key 2 defaults END*/

global.player2_up_key_is_jump_key = false;
global.player2_double_tap_to_run = true;
global.player2_wall_jump_setting = 1;
global.player2_drop_from_rope = 1;
global.player2_show_controls = 1;
#endregion /*Player 2 Keyboard Remapping (everything should be set to noone) END*/

#region /*Player 3 Keyboard Remapping (everything should be set to noone)*/
global.player3_name = "";

#region /*Player 3 Key 1 defaults*/
global.player3_key_dive = noone;
global.player3_key_jump = noone;
global.player3_key_crouch = noone;
global.player3_key_crouch_toggle = noone;
global.player3_key_sprint = noone;
global.player3_key_sprint_toggle = noone;
global.player3_key_left = noone;
global.player3_key_right = noone;
global.player3_key_down = noone;
global.player3_key_up = noone;
global.player3_key_tongue = noone;
#endregion /*Player 3 Key 1 defaults END*/

#region /*Player 3 Key 2 defaults*/
global.player3_key2_dive = noone;
global.player3_key2_jump = noone;
global.player3_key2_crouch = noone;
global.player3_key2_crouch_toggle = noone;
global.player3_key2_sprint = noone;
global.player3_key2_sprint_toggle = noone;
global.player3_key2_left = noone;
global.player3_key2_right = noone;
global.player3_key2_down = noone;
global.player3_key2_up = noone;
global.player3_key2_tongue = noone;
#endregion /*Player 3 Key 2 defaults END*/

global.player3_up_key_is_jump_key = false;
global.player3_double_tap_to_run = true;
global.player3_wall_jump_setting = 1;
global.player3_drop_from_rope = 1;
global.player3_show_controls = 1;
#endregion /*Player 3 Keyboard Remapping (everything should be set to noone) END*/

#region /*Player 4 Keyboard Remapping (everything should be set to noone)*/
global.player4_name = "";

#region /*Player 4 Key 1 defaults*/
global.player4_key_dive = noone;
global.player4_key_jump = noone;
global.player4_key_crouch = noone;
global.player4_key_crouch_toggle = noone;
global.player4_key_sprint = noone;
global.player4_key_sprint_toggle = noone;
global.player4_key_left = noone;
global.player4_key_right = noone;
global.player4_key_down = noone;
global.player4_key_up = noone;
global.player4_key_tongue = noone;
#endregion /*Player 4 Key 1 defaults END*/

#region /*Player 4 Key 2 defaults*/
global.player4_key2_dive = noone;
global.player4_key2_jump = noone;
global.player4_key2_crouch = noone;
global.player4_key2_crouch_toggle = noone;
global.player4_key2_sprint = noone;
global.player4_key2_sprint_toggle = noone;
global.player4_key2_left = noone;
global.player4_key2_right = noone;
global.player4_key2_down = noone;
global.player4_key2_up = noone;
global.player4_key2_tongue = noone;
#endregion /*Player 4 Key 2 defaults END*/

global.player4_up_key_is_jump_key = false;
global.player4_double_tap_to_run = true;
global.player4_wall_jump_setting = 1;
global.player4_drop_from_rope = 1;
global.player4_show_controls = 1;
#endregion /*Player 4 Keyboard Remapping (everything should be set to noone) END*/

#region /*Mobile Controls Settings*/
global.mobile_joystick_x = 0;
global.mobile_joystick_y = 300;
global.mobile_key_jump_x = 1824;
global.mobile_key_jump_y = 984 - 16;
global.mobile_key_sprint_x = 1568;
global.mobile_key_sprint_y = 984 - 16;
#endregion /*Mobile Controls Settings END*/

#region /*Load Config*/
if (asset_get_type("scr_config_load") == asset_script)
{
	scr_config_load();
}
#endregion /*Load Config END*/

#region /*Resource Packs (put this code after the scr_config_load so the right sprites can load)*/
global.resourcepack_sprite_title_logo = noone;
global.resourcepack_sprite_title_logo_christmas = noone;
global.resourcepack_sprite_artwork_collection = spr_wall;
global.resourcepack_sprite_basic_collectible = spr_wall;
global.resourcepack_sprite_big_collectible = spr_wall;
global.resourcepack_sprite_bullet = spr_wall;
global.resourcepack_sprite_bullet_flattened = spr_wall;
global.resourcepack_sprite_blaster = spr_wall;
global.resourcepack_sprite_basic_enemy = spr_wall;
global.resourcepack_sprite_basic_enemy_angry = spr_wall;
global.resourcepack_sprite_basic_enemy_flattened = spr_wall;
global.resourcepack_sprite_enemy_bowlingball_walk = spr_wall;
global.resourcepack_sprite_enemy_bowlingball_stomped = spr_wall;
global.resourcepack_sprite_enemy_bowlingball_revive = spr_wall;
global.resourcepack_sprite_bowlingball = spr_wall;
global.resourcepack_sprite_bowlingball_shine = spr_wall;
global.resourcepack_sprite_big_stationary_enemy = spr_wall;
global.resourcepack_sprite_big_stationary_enemy_flattened = spr_wall;
global.resourcepack_sprite_hp_pickup = spr_wall;
global.resourcepack_sprite_invincibility_powerup = spr_wall;

scr_load_resource_pack_sprite();
#endregion /*Resource Packs END*/

company_splash = noone;
controller_splash = noone;

#region /* interpolation*/
if (global.interpolate = true)
{
	gpu_set_texfilter(true);
}
else
{
	global.interpolate = false;
	gpu_set_texfilter(false);
}
#endregion /* interpolation END*/

sprite_splash_easteregg_yoffset = +128;

if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
or(file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
{
	
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
	{
		ini_open("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Splash Controller*/
	file_name = "splash_controller";
	
	#region /*x origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_xorig"))
	{
		xorig_variable = ini_read_real("sprite origin points", file_name + "_xorig", 0);
	}
	else
	{
		xorig_variable = 0;
	}
	#endregion /*x origin point END*/
	
	#region /*y origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_yorig"))
	{
		yorig_variable = ini_read_real("sprite origin points", file_name + "_yorig", 0);
	}
	else
	{
		yorig_variable = 0;
	}
	#endregion /*y origin point END*/
	
	#region /*Sprite Add*/
	sprite_splash_controller = noone;
	index = 0
	repeat(50)
	{
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			sprite_splash_controller = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			sprite_splash_controller = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		index += 1
	}
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png"))
	{
		sprite_splash_controller = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png"))
	{
		sprite_splash_controller = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	#endregion /*Sprite Add END*/
	
	#endregion /*Splash Controller END*/
	
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
	{
		ini_open("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Splash Easteregg*/
	file_name = "splash_easteregg";
	
	#region /*x origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_xorig"))
	{
		xorig_variable = ini_read_real("sprite origin points", file_name + "_xorig", 0);
	}
	else
	{
		xorig_variable = 0;
	}
	#endregion /*x origin point END*/
	
	#region /*y origin point*/
	if (ini_key_exists("sprite origin points", file_name + "_yorig"))
	{
		yorig_variable = ini_read_real("sprite origin points", file_name + "_yorig", 0);
	}
	else
	{
		yorig_variable = 0;
	}
	#endregion /*y origin point END*/
	
	#region /*Sprite Add*/
	sprite_splash_easteregg = noone;
	index = 0
	repeat(50)
	{
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			sprite_splash_easteregg = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png"))
		{
			sprite_splash_easteregg = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + "_strip" + string(index) + ".png", index, false, false, xorig_variable, yorig_variable);
		}
		index += 1
	}
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png"))
	{
		sprite_splash_easteregg = sprite_add("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png"))
	{
		sprite_splash_easteregg = sprite_add(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sprites/" + file_name + ".png", 1, false, false, xorig_variable, yorig_variable);
	}
	#endregion /*Sprite Add END*/
	
	#endregion /*Splash Easteregg END*/
	
}

if (directory_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sound"))
or(directory_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sound"))
{
	
	#region /*Sound Add*/
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sound/splash_easteregg.ogg"))
	{
		audio_splash_easteregg = audio_create_stream("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/sound/splash_easteregg.ogg");
	}
	else
	if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sound/splash_easteregg.ogg"))
	{
		audio_splash_easteregg = audio_create_stream(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/sound/splash_easteregg.ogg");
	}
	else
	{
		sprite_splash_easteregg = noone;
	}
	#endregion /*Sound Add END*/
	
}

can_navigate = false;
file_load_timer = 0;
time = 0;
sprite_index = spr_company_logo;

scr_load_character_initializing();

#endregion /*Things you shouldn't change, warning, don't change any of these options or you might break the game! END*/