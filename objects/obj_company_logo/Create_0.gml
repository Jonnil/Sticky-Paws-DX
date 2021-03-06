/*Create Event*/

#region /*Things you could change*/

/*Readme textfile for how to use the level editor*/leveleditor_readme=noone;

/*Change how menus look and function*/
global.can_select_number_of_players=true;/*If this is true, there will be a number of players select screen before you start the game*/
global.character_select_screen=true;/*If this is true, there will be a character select screen before you start the game*/
global.character_clothes_customization=false;/*If this is true, you can costumize the character's clothes in the menu*/
global.character_color_select=false;/*If this is true, you can choose the character's color in the menu*/
global.select_number_of_players_before_selecting_characters=false;/*If you should select how many players are going to play before you select what character to play as*/

global.max_fps=60;/*Targeted fps that you want the game to run in, you never want the default to be under 60 fps, default: 60*/
global.default_text_size=0.2//0.1125;

global.demo=false;/*When making a demo version of the game, turn this to true, otherwise turn this to false for the full version*/
global.demo_max_levels=3;/*Set how many levels the demo version have unlocked*/

/*Upgrades. Choose what abilities the player character have when they start the game*/
global.has_upgrade_double_jump=false;/*If you have the Double Jump Upgrade*/

global.deactivate_objects_outsiede_view=true;/*This global variable is for debug purposes, and should always be set to true when playing the game normally*/

global.number_of_chain_kills_for_1up=8;/*How many chain reaction kills you need to get 1-ups. Default is 8*/

#endregion /*Things you could change END*/





#region /*Things you shouldn't change, warning, don't change any of these options or you might break the game!*/

/*Equipped Upgrades. All of these should be true so you automatically equip the upgrades so don't change the variables here, but you can unequipp the upgrades in the pause menu*/
global.equipped_upgrade_double_jump=true;/*If you have equipped the Double Jump Upgrade*/

audio_channel_num(16);/*Limit the number of sound channels, should be on 16 for best performance as default, but let the player change this in Audio Settings. From 0 to 200, 16 is default*/

#region /*View Border and Port Size*/
if (!os_browser)
{
	view_hborder=1920;
	view_vborder=1080;
}
#endregion /*View Border and Port Size END*/

global.convention_mode=false;/*When showing the game on a convention, turn this to true*/

#region /*Show HUD Global Variables*/
global.hud_show_timer=180;
global.hud_show_lives=true;
global.hud_show_basic_collectibles=false;
global.hud_show_big_collectibles=false;
global.hud_show_score=false;
#endregion /*Show HUD Global Variables END*/

/*Game Start Event*/

/*File Handeling*/

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory+"\Custom Levels"))
{
	directory_create(working_directory+"\Custom Levels");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create a readme file in custom levels folder explaining how to use the level editor*/
if (leveleditor_readme>noone)
{
	leveleditor_readme_file=file_text_open_write(working_directory+"\Custom Levels\readme.txt");
	/*Write readme textfile*/
	file_text_write_string(leveleditor_readme_file,leveleditor_readme);
	file_text_close(leveleditor_readme_file);
}
#endregion /*Create a readme file in custom levels folder explaining how to use the level editor END*/

#region /*Create directory for saving custom characters*/
if (!directory_exists("Custom Characters"))
{
	directory_create("Custom Characters");
}
#endregion /*Create directory for saving custom characters END*/

#region /*Unzip custom level files*/
if (file_exists(working_directory+"Custom Levels/level_data.zip"))
{
	zip_unzip(working_directory+"Custom Levels/level_data.zip",working_directory+"Custom Levels/");
	file_delete(working_directory+"Custom Levels/level_data.zip");/*Delete the zip file after it's been unzip*/
}
#endregion /*Unzip custom level files END*/

global.grid_hsnap=32;/*Horizontal grid snapping*/
global.grid_vsnap=32;/*Vertical grid snapping*/
global.narrator=1;/*Select Narrator*/
global.character_for_player_1=0;/*Player 1 Select Character 1*/
global.character_for_player_2=0;/*Player 2 Select Character 2*/
global.character_for_player_3=0;/*Player 3 Select Character 3*/
global.character_for_player_4=0;/*Player 4 Select Character 4*/
global.player1_color=c_aqua;/*Player 1 Name Color, default:aqua*/
global.player2_color=c_red;/*Player 1 Name Color, default:red*/
global.player3_color=c_lime;/*Player 1 Name Color, default:lime*/
global.player4_color=c_yellow;/*Player 1 Name Color, default:yellow*/
global.color_for_player_1=0;/*Player 1 Select Color 1*/
global.color_for_player_2=0;/*Player 2 Select Color 2*/
global.color_for_player_3=0;/*Player 3 Select Color 3*/
global.color_for_player_4=0;/*Player 4 Select Color 4*/
global.hex_color_for_player_1=c_white;/*Player 1 Hex Value Color*/
global.hex_color_for_player_2=c_white;/*Player 1 Hex Value Color*/
global.hex_color_for_player_3=c_white;/*Player 1 Hex Value Color*/
global.hex_color_for_player_4=c_white;/*Player 1 Hex Value Color*/
global.level_editor_level=0;/*What level is selected in the custom level editor*/
global.play_edited_level=false;/*Playtest edited level*/
global.actually_play_edited_level=false;/*Actually playing finished edited level*/
global.character_select_in_this_menu="game";/*In what menu character select is going to appear in*/
global.show_language_shortcut=false; /*If a shortcut for the language options should appear in the main menu to the left of the settings menu*/
global.show_accessibility_shortcut=false; /*If a shortcut for the accessibility options should appear in the main menu to the right of the settings menu*/
global.show_profile_shortcut=false; /*If a shortcut for the profile options should appear in the main menu to the right of the settings menu*/
global.difficulty=2;/*Difficulty levels: 0 = peaceful, 1 = easy, 2 = normal (default), 3 = hard*/
global.controls_used_for_menu_navigation="mouse";/*mouse, keyboard, or controller*/
global.pause=false;/*If game is paused or not*/
global.custom_background1=noone;
global.custom_background2=noone;
global.custom_background3=noone;
global.custom_background4=noone;
global.custom_foreground1=noone;
global.custom_foreground2=noone;
//global.spot_x=0;
//global.spot_y=0;

switch(os_get_language())
{
	case "es": global.language_localization=localization.es_es;break;
	case "fr": global.language_localization=localization.fr_fr;break;
	case "it": global.language_localization=localization.it_it;break;
	default: global.language_localization=localization.en_us;break;/*Set the default language to American English*/
}

global.settings_sidebar_menu="game_settings";/*Settings sidebar*/
global.show_tutorial_signs=true;
global.enable_transitions=true;
global.enable_background_layer1=true;
global.enable_background_layer2=true;
global.enable_background_layer3=true;
global.enable_background_layer4=true;
global.enable_foreground_layer1=true;
global.enable_foreground_layer2=true;
global.players_can_collide=false;
global.player_has_entered_goal=false;
global.pause_player=0;
global.key_used="";
global.current_level=0;
global.playergame=0;
global.theme="ground";
global.weather=noone;
global.basic_collectibles=0;
global.level_clear_rate=noone;
global.big_collectible1=false;/*If you have Big Collectible 1 or not*/
global.big_collectible2=false;/*If you have Big Collectible 2 or not*/
global.big_collectible3=false;/*If you have Big Collectible 3 or not*/
global.big_collectible4=false;/*If you have Big Collectible 4 or not*/
global.big_collectible5=false;/*If you have Big Collectible 5 or not*/
global.lives_until_assist=0;
#region /*Assist Settings*/
global.assist_item_appear=10;
global.assist_default_hp=2;
global.assist_guiding_arrows=1;
#endregion /*Assist Settings END*/
global.x_checkpoint=false;global.y_checkpoint=false;
global.time_countdown=500;
global.timeattack_millisecond=0;
global.timeattack_second=0;
global.timeattack_minute=0;
global.timeattack_realmillisecond=0;
global.timeattack_realmillisecond_real=0;
#region /*Checkpoint Timer*/
global.checkpoint_millisecond=0;
global.checkpoint_second=0;
global.checkpoint_minute=0;
global.checkpoint_realmillisecond=0;
#endregion /*Checkpoint Timer End*/
global.win=false;
global.enemy_counter=0;
global.file=0;
global.controls_layout=1;
global.background_brightness=0;/*full_black=-1, normal=0 (default), full_white=+1*/
#region /*Music and Sound Volume*/
global.music_volume=1;
global.sfx_volume=1;
global.voices_volume=1;
global.verbosity_slider=1;
#endregion /*Music and Sound Volume END*/
global.music=noone;
global.music_underwater=noone;
global.trigger_ending=false;
global.spikes_emerge_time=0;
global.goal_active=false;
global.interpolate=true
global.show_fps=false;
global.PauseScreen=noone;
global.QuitLevel=false;
global.QuitGame=false;
global.trigger_demo_ending=0;
global.enable_enemies=true;/*Option to enable or disable all enemies in the game, the player can change this themselves in gameplay settings. Default:true*/

#region /*Universal Keyboard Remapping*/
global.fullscreen_key=vk_f11;
#endregion /*Universal Keyboard Remapping*/

#region /*Player 1 Keyboard Remapping*/
global.player1_name="";
global.player1_key_dive=ord("X");global.player1_key2_dive=noone;
global.player1_key_jump=vk_space;global.player1_key2_jump=noone;
global.player1_key_crouch=vk_shift;global.player1_key2_crouch=noone;
global.player1_key_crouch_toggle=noone;global.player1_key2_crouch_toggle=noone;
global.player1_key_sprint=vk_lcontrol;global.player1_key2_sprint=noone;
global.player1_key_sprint_toggle=noone;global.player1_key2_sprint_toggle=noone;
global.player1_key_left=ord("A");global.player1_key2_left=noone;
global.player1_key_right=ord("D");global.player1_key2_right=noone;
global.player1_key_down=ord("S");global.player1_key2_down=noone;
global.player1_key_up=ord("W");global.player1_key2_up=noone;
global.player1_key_attack=noone;global.player1_key2_attack=noone;
global.player1_up_key_is_jump_key=false;
global.player1_double_tap_to_run=true;
global.player1_wall_jump_setting=2;
global.player1_drop_from_rope=1;
global.player1_show_controls=true;
#endregion /*Player 1 Keyboard Remapping END*/

#region /*Player 2 Keyboard Remapping*/
global.player2_name="";
global.player2_key_dive=noone;global.player2_key2_dive=noone;
global.player2_key_jump=noone;global.player2_key2_jump=noone;
global.player2_key_crouch=noone;global.player2_key2_crouch=noone;
global.player2_key_crouch_toggle=noone;global.player2_key2_crouch_toggle=noone;
global.player2_key_sprint=noone;global.player2_key2_sprint=noone;
global.player2_key_sprint_toggle=noone;global.player2_key2_sprint_toggle=noone;
global.player2_key_left=noone;global.player2_key2_left=noone;
global.player2_key_right=noone;global.player2_key2_right=noone;
global.player2_key_down=noone;global.player2_key2_down=noone;
global.player2_key_up=noone;global.player2_key2_up=noone;
global.player2_key_attack=noone;global.player2_key2_attack=noone;
global.player2_up_key_is_jump_key=false;
global.player2_double_tap_to_run=true;
global.player2_wall_jump_setting=2;
global.player2_drop_from_rope=1;
global.player2_show_controls=true;
#endregion /*Player 2 Keyboard Remapping END*/

#region /*Player 3 Keyboard Remapping*/
global.player3_name="";
global.player3_key_dive=noone;global.player3_key2_dive=noone;
global.player3_key_jump=noone;global.player3_key2_jump=noone;
global.player3_key_crouch=noone;global.player3_key2_crouch=noone;
global.player3_key_crouch_toggle=noone;global.player3_key2_crouch_toggle=noone;
global.player3_key_sprint=noone;global.player3_key2_sprint=noone;
global.player3_key_sprint_toggle=noone;global.player3_key2_sprint_toggle=noone;
global.player3_key_left=noone;global.player3_key2_left=noone;
global.player3_key_right=noone;global.player3_key2_right=noone;
global.player3_key_down=noone;global.player3_key2_down=noone;
global.player3_key_up=noone;global.player3_key2_up=noone;
global.player3_key_attack=noone;global.player3_key2_attack=noone;
global.player3_up_key_is_jump_key=false;
global.player3_double_tap_to_run=true;
global.player3_wall_jump_setting=2;
global.player3_drop_from_rope=1;
global.player3_show_controls=true;
#endregion /*Player 3 Keyboard Remapping END*/

#region /*Player 4 Keyboard Remapping*/
global.player4_name="";
global.player4_key_dive=noone;global.player4_key2_dive=noone;
global.player4_key_jump=noone;global.player4_key2_jump=noone;
global.player4_key_crouch=noone;global.player4_key2_crouch=noone;
global.player4_key_crouch_toggle=noone;global.player4_key2_crouch_toggle=noone;
global.player4_key_sprint=noone;global.player4_key2_sprint=noone;
global.player4_key_sprint_toggle=noone;global.player4_key2_sprint_toggle=noone;
global.player4_key_left=noone;global.player4_key2_left=noone;
global.player4_key_right=noone;global.player4_key2_right=noone;
global.player4_key_down=noone;global.player4_key2_down=noone;
global.player4_key_up=noone;global.player4_key2_up=noone;
global.player4_key_attack=noone;global.player4_key2_attack=noone;
global.player4_up_key_is_jump_key=false;
global.player4_double_tap_to_run=true;
global.player4_wall_jump_setting=2;
global.player4_drop_from_rope=1;
global.player4_show_controls=true;
#endregion /*Player 4 Keyboard Remapping END*/

#region /*Mobile Controls Settings*/
global.mobile_joystick_x=0;
global.mobile_joystick_y=0;
global.mobile_key_a_x=0;
global.mobile_key_a_y=0;
global.mobile_key_b_x=0;
global.mobile_key_b_y=0;
#endregion /*Mobile Controls Settings END*/

#region /*Load Config*/
if (asset_get_type("scr_loadconfig")==asset_script)
{
	scr_loadconfig();
}
#endregion /*Load Config END*/

#region /*Narrator Voice variable handeling*/

#region /*No Narrator*/
if (global.narrator=false)
{
	menuvoice_companysplash=noone;
	menuvoice_controllersplash=noone;
}
#endregion /*No Narrator END*/

#region /*Character 1 as Narrator*/
if (global.narrator=1)
{
	menuvoice_companysplash=noone;
	menuvoice_controllersplash=noone;
}
#endregion /*Character 1 as Narrator END*/

#endregion /*Narrator Voice variable handeling END*/

#region /*Interpolation*/
if (global.interpolate=true)
{
	gpu_set_texfilter(true);
}
else
{
	global.interpolate=false;
	gpu_set_texfilter(false);
}
#endregion /*Interpolation END*/

time=0;

#endregion /*Things you shouldn't change, warning, don't change any of these options or you might break the game! END*/