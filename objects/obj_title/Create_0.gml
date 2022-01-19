scr_set_arrays();

player = 1;
selected_skin = 0;

background_layer_x = 0;
background_layer_y = 0;

level_index = 0;
file_found = "";
file_load_timer = 0;
level_find_pos = 0;
first_level = string(file_find_first(working_directory+"/custom_levels/*", fa_directory));
open_sub_menu = false;
select_custom_level_menu_open = false;
loading_spinning_angle = 0;
custom_level_select_blinking = 0;
custom_level_select_blinking_old = 0;
scroll = 0;
scroll_to = 0;
lerp_on = false;
level_editor_template_select = false;

/*Narrator Voice variable handeling*/
narrator_name=noone;
global.narrator_max_characters=1;

/*No Narrator*/
if (global.narrator=0)
{
	menuvoice_titlesplash=noone;
	menuvoice_1player=noone;
	menuvoice_2player=noone;
	menuvoice_3player=noone;
	menuvoice_4player=noone;
	menuvoice_leveleditor=noone;
	menuvoice_leveleditor_denied=noone;
	menuvoice_options=noone;
}

/*Character1 as narrator*/
if (global.narrator=1)
{
	menuvoice_titlesplash=noone;
	menuvoice_1player=noone;
	menuvoice_2player=noone;
	menuvoice_3player=noone;
	menuvoice_4player=noone;
	menuvoice_leveleditor=noone;
	menuvoice_leveleditor_denied=noone;
	menuvoice_options=noone;
}

#region /*Create directories*/

#region /*Create directory for saving custom characters*/
if (!directory_exists(working_directory+"/custom_characters"))
{
	directory_create(working_directory+"/custom_characters");
}
#endregion /*Create directory for saving custom characters END*/

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory+"/custom_levels"))
{
	directory_create(working_directory+"/custom_levels");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create directory for saving custom resourcepacks*/
if (!directory_exists(working_directory+"/custom_resourcepacks"))
{
	directory_create(working_directory+"/custom_resourcepacks");
}
#endregion /*Create directory for saving custom resourcepacks END*/

#region /*Create directory for saving custom title backgrounds*/
if (!directory_exists(working_directory+"/custom_title_backgrounds"))
{
	directory_create(working_directory+"/custom_title_backgrounds");
}
#endregion /*Create directory for saving custom title backgrounds END*/

#endregion /*Create directories END*/

#region /*Custom Title Screen Background*/
if (file_exists("title_backgrounds/title_background" + string(global.selected_title_background) + ".png"))
{
	title_screen_background = sprite_add("title_backgrounds/title_background" + string(global.selected_title_background) + ".png", 1, false, false, 0, 0);
}
else
if (file_exists(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png"))
{
	title_screen_background = sprite_add(working_directory + "/custom_title_backgrounds/title_background" + string(global.selected_title_background-global.max_number_of_official_title_backgrounds) + ".png", 1, false, false, 0, 0);
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
player1_accept_selection=-1;
player2_accept_selection=-1;
player3_accept_selection=-1;
player4_accept_selection=-1;
player_start_game=false;
#endregion /*Character select Accept Selection END*/

#region /*Color Select for CharacterSelect*/
player1_menu = "select_character";
player2_menu = "select_character";
player3_menu = "select_character";
player4_menu = "select_character";
#endregion /*Color Select for CharacterSelect END*/

#region /*What player can enter a name*/
can_input_player1_name=false;
can_input_player2_name=false;
can_input_player3_name=false;
can_input_player4_name=false;
can_input_level_name = false;
#endregion /*What player can enter a name END*/

#region /*Hide certain HUD elements*/
global.hud_show_lives=true;
global.hud_show_deaths=false;
global.hud_show_basic_collectibles=false;
global.hud_show_big_collectibles=false;
global.hud_show_score=false;
#endregion /*Hide certain HUD elements END*/

global.playergame=0;/*Make the game singleplayer at the start of the game*/
global.player_has_entered_goal=false;
global.actually_play_edited_level = false;
global.play_edited_level = false;
global.theme="ground";
global.coins=0;
global.level_clear_rate=noone;
global.big_collectible1=false;
global.big_collectible2=false;
global.big_collectible3=false;
global.big_collectible4=false;
global.big_collectible5=false;
global.lives_until_assist=0;
global.x_checkpoint=false;
global.y_checkpoint=false;
global.timeattack_millisecond=0;
global.timeattack_second=0;
global.timeattack_minute=0;
global.timeattack_realmillisecond=0;
global.timeattack_realmillisecond_real=0;
/*Checkpoint Timer*/
global.checkpoint_millisecond=0;
global.checkpoint_second=0;
global.checkpoint_minute=0;
global.checkpoint_realmillisecond=0; /*Checkpoint Timer End*/
global.win=false;
global.enemy_counter=0;
global.file = 1;
global.controls_layout=1;
global.trigger_ending=false;
global.spikes_emerge_time=0;
global.goal_active=false;
global.PauseScreen=noone;
global.quit_level = false;
global.always_show_level_editor_buttons=true; /*If level editor buttons should always show or not. Should be true by default*/

#region /*Player 1 Characterselect portrait x and y origin points*/
if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
{
	if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/sprite_origin_point.ini");
	}
						
	#region /*Character select portrait x and y origin points*/
	#region /*Character select portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Character select portrait y origin point END*/

	#region /*Character select portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Character select portrait x origin point END*/
	#endregion /*Character select portrait x and y origin points END*/
						
	#region /*Sprite stand x and y origin points*/
	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
	{
		sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
	}
	else
	{
		sprite_stand_yorig = 0;
	}
	#endregion /*Sprite stand y origin point END*/

	#region /*Sprite stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
	{
		sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
	}
	else
	{
		sprite_stand_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/
	#endregion /*Sprite stand x and y origin points END*/
						
	#region /*Character select portrait x_scale and y_scale origin points*/
	#region /*Character select portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player1_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait y_scale origin point END*/

	#region /*Character select portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player1_select_portrait_xscale = 1;
	}
	#endregion /*Character select portrait x_scale origin point END*/
	#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
	ini_close();
}
else
{
	character_select_portrait_xorig = 0;
	character_select_portrait_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
	player1_select_portrait_xscale = 1;
	player1_select_portrait_yscale = 1;
}
#endregion /*Player 1 Characterselect portrait x and y origin points END*/

#region /*Player 2 Characterselect portrait x and y origin points*/
if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
{
	if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Character select portrait x and y origin points*/
	#region /*Character select portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Character select portrait y origin point END*/

	#region /*Character select portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Character select portrait x origin point END*/
	#endregion /*Character select portrait x and y origin points END*/
						
	#region /*Sprite stand x and y origin points*/
	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
	{
		sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
	}
	else
	{
		sprite_stand_yorig = 0;
	}
	#endregion /*Sprite stand y origin point END*/

	#region /*Sprite stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
	{
		sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
	}
	else
	{
		sprite_stand_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/
	#endregion /*Sprite stand x and y origin points END*/
	
	#region /*Character select portrait x_scale and y_scale origin points*/
	#region /*Character select portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player2_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player2_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait y_scale origin point END*/

	#region /*Character select portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player2_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player2_select_portrait_xscale = 1;
	}
	#endregion /*Character select portrait x_scale origin point END*/
	#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
	ini_close();
}
else
{
	character_select_portrait_xorig = 0;
	character_select_portrait_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
	player2_select_portrait_xscale = 1;
	player2_select_portrait_yscale = 1;
}
#endregion /*Player 2 Characterselect portrait x and y origin points END*/

#region /*Player 3 Characterselect portrait x and y origin points*/
if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
{
	if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Character select portrait x and y origin points*/
	#region /*Character select portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Character select portrait y origin point END*/

	#region /*Character select portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Character select portrait x origin point END*/
	#endregion /*Character select portrait x and y origin points END*/
						
	#region /*Sprite stand x and y origin points*/
	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
	{
		sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
	}
	else
	{
		sprite_stand_yorig = 0;
	}
	#endregion /*Sprite stand y origin point END*/

	#region /*Sprite stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
	{
		sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
	}
	else
	{
		sprite_stand_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/
	#endregion /*Sprite stand x and y origin points END*/
	
	#region /*Character select portrait x_scale and y_scale origin points*/
	#region /*Character select portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player3_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player3_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait y_scale origin point END*/

	#region /*Character select portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player3_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player3_select_portrait_xscale = 1;
	}
	#endregion /*Character select portrait x_scale origin point END*/
	#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
	ini_close();
}
else
{
	character_select_portrait_xorig = 0;
	character_select_portrait_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
	player3_select_portrait_xscale = 1;
	player3_select_portrait_yscale = 1;
}
#endregion /*Player 3 Characterselect portrait x and y origin points END*/

#region /*Player 4 Characterselect portrait x and y origin points*/
if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
{
	if(file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini"))
	{
		ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/data/sprite_origin_point.ini");
	}
	
	#region /*Character select portrait x and y origin points*/
	#region /*Character select portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Character select portrait y origin point END*/

	#region /*Character select portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Character select portrait x origin point END*/
	#endregion /*Character select portrait x and y origin points END*/
						
	#region /*Sprite stand x and y origin points*/
	#region /*Sprite stand y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_yorig"))
	{
		sprite_stand_yorig = ini_read_real("sprite origin points", "sprite_stand_yorig", 0);
	}
	else
	{
		sprite_stand_yorig = 0;
	}
	#endregion /*Sprite stand y origin point END*/

	#region /*Sprite stand x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_stand_xorig"))
	{
		sprite_stand_xorig = ini_read_real("sprite origin points", "sprite_stand_xorig", 0);
	}
	else
	{
		sprite_stand_xorig = 0;
	}
	#endregion /*Sprite stand x origin point END*/
	#endregion /*Sprite stand x and y origin points END*/
	
	#region /*Character select portrait x_scale and y_scale origin points*/
	#region /*Character select portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player4_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player4_select_portrait_yscale = 1;
	}
	#endregion /*Character select portrait y_scale origin point END*/

	#region /*Character select portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player4_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player4_select_portrait_xscale = 1;
	}
	#endregion /*Character select portrait x_scale origin point END*/
	#endregion /*Character select portrait x_scale and y_scale origin points END*/
						
	ini_close();
}
else
{
	character_select_portrait_xorig = 0;
	character_select_portrait_yorig = 0;
	sprite_stand_xorig = 0;
	sprite_stand_yorig = 0;
	player4_select_portrait_xscale = 1;
	player4_select_portrait_yscale = 1;
}
#endregion /*Player 4 Characterselect portrait x and y origin points END*/

scr_config_load(); /*Load Config*/

lives = 5; /*Starting lives*/
level_name="";

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

lastkey=noone;

#region /*Remapping options variables*/
remapping_player = 0;
/*remapping_player 0 = player 1.
remapping_player 1 = player 2.
remapping_player 2 = player 3.
remapping_player 3 = player 4*/
input_key = false;
can_remap_key = false;
#endregion /*Remapping options variables END*/

open_dropdown = false;
menu_delay = 3;
menu_joystick_delay=3;
menu_joystick1_delay=3;
menu_joystick2_delay=3;
menu_joystick3_delay=3;
menu_joystick4_delay=3;
black_screen_at_start_delay = 0;
player1_display_x=0;xx1=0;
player2_display_x=0;xx2=0;
player3_display_x=0;xx3=0;
player4_display_x=0;xx4=0;
remap_y_pos=0;
version_y_pos=0;
menu_cursor_index=0;
in_settings = false;
old_selected_resource_pack = global.selected_resourcepack;
can_navigate_settings_sidebar=true;
navigate_slider=false;
menu_remap_key_number=0;
name_enter_blink=0;
can_navigate=true;
menu_y_offset=0;/*This is the y offset that will have lerping to make the menu scrolling smooth*/
menu_y_offset_real=0;/*This is the real y offset for the menu, used for menu scrolling*/
menu_cursor_y_position=0;
background_brightness_menu_lerp = 0;
title_y = -800;
title_alpha = 0;
title_logo_index = spr_wall;
show_title_logo = true;

darken_settings_alpha = 0;
darken_settings_sidebar_alpha = 0;
accessibility_settings_y = 40;
game_text_y = 40*2;
game_settings_y = 40*3;
multiplayer_settings_y = 40*4;
controls_text_y = 40*5;
keyboard_and_mouse_settings_y = 40*6;
controller_settings_y = 40*7;
touch_settings_y = 40*8;
general_text_y = 40*9;
profile_settings_y = 40*10;
video_settings_y = 40*11;
audio_settings_y = 40*12;
global_resources_settings_y = 40*13;
storage_settings_y = 40*14;
language_settings_y = 40*15;
broadcast_settings_y = 40*16;
how_to_play_y = 40*17;
left_sidebar_x = -400;
iris_xscale = 0;
iris_yscale = 0;
iris_zoom = 0;
#region /*Customize look of Options Menu*/
c_menu_outline=c_white;
c_menu_fill=c_black;
#endregion /*Customize look of Options Menu END*/

#region /*Stop certain sounds from playing on the title screen*/
audio_stop_all();
if (asset_get_type("snd_menuvoice_companysplash") == asset_sound)
{
	audio_stop_sound(snd_menuvoice_companysplash);
}
if (asset_get_type("snd_menuvoice_controllersplash") == asset_sound)
{
	audio_stop_sound(snd_menuvoice_controllersplash);
}
if (asset_get_type("snd_slip") == asset_sound)
{
	audio_stop_sound(snd_skidding);
}
if (asset_get_type("snd_slip_ice") == asset_sound)
{
	audio_stop_sound(snd_skidding_ice);
}
#endregion /*Stop certain sounds from playing on the title screen END*/

#region /*Say the games title*/
if (asset_get_type("menuvoice_titlesplash") == asset_sound)
{
	audio_play_sound(menuvoice_titlesplash,0,0);
	audio_sound_gain(menuvoice_titlesplash,global.voices_volume,0);
}
#endregion /*Say the games title END*/

#region /*Update Music*/
if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/music/title_screen.ogg"))
{
	title_music = audio_create_stream("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/music/title_screen.ogg");
}
else
if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/music/title_screen.ogg"))
{
	title_music = audio_create_stream(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/music/title_screen.ogg");
}
else
{
	title_music = noone;
}
#endregion /*Update Music END*/

#region /*Play title screen music*/
if (title_music > noone)
{
	audio_play_sound(title_music, 0, true);
	audio_sound_gain(title_music, global.music_volume, 0);
}
#endregion /*Play title screen music End*/