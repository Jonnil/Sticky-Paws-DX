scr_set_arrays();

background_layer_x = 0;
background_layer_y = 0;

level_index = 0;
file_found="";
file_load_timer=0;
open_sub_menu=false;
select_custom_level_menu_open = false;
loading_spinning_angle = 0;

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

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory+"/Custom Characters"))
{
	directory_create(working_directory+"/Custom Characters");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create directory for saving custom levels*/
if (!directory_exists(working_directory+"/Custom Levels"))
{
	directory_create(working_directory+"/Custom Levels");
}
#endregion /*Create directory for saving custom levels END*/

#region /*Create directory for saving custom resourcepacks*/
if (!directory_exists(working_directory+"/Custom Resourcepacks"))
{
	directory_create(working_directory+"/Custom Resourcepacks");
}
#endregion /*Create directory for saving custom resourcepacks END*/

#endregion /*Create directories END*/

#region /*Custom Title Screen Background*/
if (file_exists(working_directory + "/title_screen_background.png"))
{
	title_screen_background = sprite_add(working_directory + "/title_screen_background.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/screen_background.png"))
{
	title_screen_background = sprite_add(working_directory + "/screen_background.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title_background.png"))
{
	title_screen_background = sprite_add(working_directory + "/title_background.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title_screen.png"))
{
	title_screen_background = sprite_add(working_directory + "/title_screen.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title.png"))
{
	title_screen_background = sprite_add(working_directory + "/title.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/screen.png"))
{
	title_screen_background = sprite_add(working_directory + "/screen.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/background.png"))
{
	title_screen_background = sprite_add(working_directory + "/background.png", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title_screen_background.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/title_screen_background.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/screen_background.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/screen_background.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title_background.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/title_background.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title_screen.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/title_screen.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/title.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/title.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/screen.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/screen.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
if (file_exists(working_directory + "/background.jpg"))
{
	title_screen_background = sprite_add(working_directory + "/background.jpg", 0, false, false, 0, 0);
	if (layer_background_get_sprite(layer_background_get_id(layer_get_id("Background"))) != title_screen_background)
	{
		layer_background_sprite(layer_background_get_id(layer_get_id("Background")), title_screen_background);
	}
}
else
{
	title_screen_background = noone;
}
#endregion /*Custom Title Screen Background*/

#region /*Custom colors for character*/
/*global.player1_hue_base=255;global.player1_saturation_base=0;global.player1_value_base=255;
global.player1_hue_skin=255;global.player1_saturation_skin=255;global.player1_value_skin=255;
global.player1_hue_left_sclera=255;global.player1_saturation_left_sclera=255;global.player1_value_left_sclera=255;
global.player1_hue_right_sclera=255;global.player1_saturation_right_sclera=255;global.player1_value_right_sclera=255;
global.player1_hue_left_eyecolor=255;global.player1_saturation_left_eyecolor=255;global.player1_value_left_eyecolor=255;
global.player1_hue_right_eyecolor=255;global.player1_saturation_right_eyecolor=255;global.player1_value_right_eyecolor=255;
global.player1_hue_nose=255;global.player1_saturation_nose=255;global.player1_value_nose=255;
global.player1_hue_cheek=255;global.player1_saturation_cheek=255;global.player1_value_cheek=255;
global.player1_hue_neck=255;global.player1_saturation_neck=255;global.player1_value_neck=255;
global.player1_hue_leg=255;global.player1_saturation_leg=255;global.player1_value_leg=255;
global.player1_hue_hand=255;global.player1_saturation_hand=255;global.player1_value_hand=255;

global.player2_hue_base=255;global.player2_saturation_base=0;global.player2_value_base=255;
global.player2_hue_skin=255;global.player2_saturation_skin=255;global.player2_value_skin=255;
global.player2_hue_left_sclera=255;global.player2_saturation_left_sclera=255;global.player2_value_left_sclera=255;
global.player2_hue_right_sclera=255;global.player2_saturation_right_sclera=255;global.player2_value_right_sclera=255;
global.player2_hue_left_eyecolor=255;global.player2_saturation_left_eyecolor=255;global.player2_value_left_eyecolor=255;
global.player2_hue_right_eyecolor=255;global.player2_saturation_right_eyecolor=255;global.player2_value_right_eyecolor=255;
global.player2_hue_nose=255;global.player2_saturation_nose=255;global.player2_value_nose=255;
global.player2_hue_cheek=255;global.player2_saturation_cheek=255;global.player2_value_cheek=255;
global.player2_hue_neck=255;global.player2_saturation_neck=255;global.player2_value_neck=255;
global.player2_hue_leg=255;global.player2_saturation_leg=255;global.player2_value_leg=255;
global.player2_hue_hand=255;global.player2_saturation_hand=255;global.player2_value_hand=255;

global.player3_hue_base=255;global.player3_saturation_base=0;global.player3_value_base=255;
global.player3_hue_skin=255;global.player3_saturation_skin=255;global.player3_value_skin=255;
global.player3_hue_left_sclera=255;global.player3_saturation_left_sclera=255;global.player3_value_left_sclera=255;
global.player3_hue_right_sclera=255;global.player3_saturation_right_sclera=255;global.player3_value_right_sclera=255;
global.player3_hue_left_eyecolor=255;global.player3_saturation_left_eyecolor=255;global.player3_value_left_eyecolor=255;
global.player3_hue_right_eyecolor=255;global.player3_saturation_right_eyecolor=255;global.player3_value_right_eyecolor=255;
global.player3_hue_nose=255;global.player3_saturation_nose=255;global.player3_value_nose=255;
global.player3_hue_cheek=255;global.player3_saturation_cheek=255;global.player3_value_cheek=255;
global.player3_hue_neck=255;global.player3_saturation_neck=255;global.player3_value_neck=255;
global.player3_hue_leg=255;global.player3_saturation_leg=255;global.player3_value_leg=255;
global.player3_hue_hand=255;global.player3_saturation_hand=255;global.player3_value_hand=255;

global.player4_hue_base=255;global.player4_saturation_base=0;global.player4_value_base=255;
global.player4_hue_skin=255;global.player4_saturation_skin=255;global.player4_value_skin=255;
global.player4_hue_left_sclera=255;global.player4_saturation_left_sclera=255;global.player4_value_left_sclera=255;
global.player4_hue_right_sclera=255;global.player4_saturation_right_sclera=255;global.player4_value_right_sclera=255;
global.player4_hue_left_eyecolor=255;global.player4_saturation_left_eyecolor=255;global.player4_value_left_eyecolor=255;
global.player4_hue_right_eyecolor=255;global.player4_saturation_right_eyecolor=255;global.player4_value_right_eyecolor=255;
global.player4_hue_nose=255;global.player4_saturation_nose=255;global.player4_value_nose=255;
global.player4_hue_cheek=255;global.player4_saturation_cheek=255;global.player4_value_cheek=255;
global.player4_hue_neck=255;global.player4_saturation_neck=255;global.player4_value_neck=255;
global.player4_hue_leg=255;global.player4_saturation_leg=255;global.player4_value_leg=255;
global.player4_hue_hand=255;global.player4_saturation_hand=255;global.player4_value_hand=255;
*/
#endregion /*Custom colors for character END*/

#region /*characterSelect Accept Selection*/
player1_accept_selection=-1;
player2_accept_selection=-1;
player3_accept_selection=-1;
player4_accept_selection=-1;
player_start_game=false;
#endregion /*CharacterSelect Accept Selection END*/

#region /*Color Select for CharacterSelect*/
player1_menu="select_character";
player2_menu="select_character";
player3_menu="select_character";
player4_menu="select_character";
#endregion /*Color Select for CharacterSelect END*/

#region /*What player can enter a name*/
can_input_player1_name=false;
can_input_player2_name=false;
can_input_player3_name=false;
can_input_player4_name=false;
#endregion /*What player can enter a name END*/

#region /*Hide certain HUD elements*/
global.hud_show_lives=true;
global.hud_show_coins=false;
global.hud_show_starcoins=false;
global.hud_show_score=false;
#endregion /*Hide certain HUD elements END*/

global.playergame=0;/*Make the game singleplayer at the start of the game*/
global.player_has_entered_goal=false;
global.actually_play_edited_level=false;
global.play_edited_level=false;
global.current_level=0;
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
global.file=0;
global.controls_layout=1;
global.trigger_ending=false;
global.spikes_emerge_time=0;
global.goal_active=false;
global.PauseScreen=noone;
global.quit_level=false;
global.always_show_level_editor_buttons=true; /*If level editor buttons should always show or not. Should be true by default*/

#region /*Player 1 Characterselect portrait x and y origin points*/
if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if(file_exists("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(global.character_for_player_1)+"/Data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
	}
						
	#region /*Characterselect portrait x and y origin points*/
	#region /*Characterselect portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Characterselect portrait y origin point END*/

	#region /*Characterselect portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Characterselect portrait x origin point END*/
	#endregion /*Characterselect portrait x and y origin points END*/
						
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
						
	#region /*Characterselect portrait x_scale and y_scale origin points*/
	#region /*Characterselect portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player1_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player1_select_portrait_yscale = 1;
	}
	#endregion /*Characterselect portrait y_scale origin point END*/

	#region /*Characterselect portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player1_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player1_select_portrait_xscale = 1;
	}
	#endregion /*Characterselect portrait x_scale origin point END*/
	#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
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

#region /*Player 1 official character select portrait sprite*/
if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png"))
{
	global.sprite_select_player_1 = sprite_add("Characters/Character "+string(global.character_for_player_1)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
#endregion /*Player 1 official character select portrait sprite END*/

else

#region /*Player 1 character select portrait sprite*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png"))
{
	global.sprite_select_player_1 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
else
{
	global.sprite_select_player_1 = noone;
}
#endregion /*Player 1 character select portrait sprite END*/

#region /*Player 2 Characterselect portrait x and y origin points*/
if(file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if(file_exists("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(global.character_for_player_2)+"/Data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
	}
	
	#region /*Characterselect portrait x and y origin points*/
	#region /*Characterselect portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Characterselect portrait y origin point END*/

	#region /*Characterselect portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Characterselect portrait x origin point END*/
	#endregion /*Characterselect portrait x and y origin points END*/
						
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
	
	#region /*Characterselect portrait x_scale and y_scale origin points*/
	#region /*Characterselect portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player2_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player2_select_portrait_yscale = 1;
	}
	#endregion /*Characterselect portrait y_scale origin point END*/

	#region /*Characterselect portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player2_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player2_select_portrait_xscale = 1;
	}
	#endregion /*Characterselect portrait x_scale origin point END*/
	#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
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

#region /*Player 2 official character select portrait sprite*/
if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png"))
{
	global.sprite_select_player_2 = sprite_add("Characters/Character "+string(global.character_for_player_2)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
#endregion /*Player 2 official character select portrait sprite END*/

else

#region /*Player 2 character select portrait sprite*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png"))
{
	global.sprite_select_player_2 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_2-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
else
{
	global.sprite_select_player_2 = noone;
}
#endregion /*Player 2 character select portrait sprite END*/

#region /*Player 3 Characterselect portrait x and y origin points*/
if(file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if(file_exists("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(global.character_for_player_3)+"/Data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
	}
	
	#region /*Characterselect portrait x and y origin points*/
	#region /*Characterselect portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Characterselect portrait y origin point END*/

	#region /*Characterselect portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Characterselect portrait x origin point END*/
	#endregion /*Characterselect portrait x and y origin points END*/
						
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
	
	#region /*Characterselect portrait x_scale and y_scale origin points*/
	#region /*Characterselect portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player3_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player3_select_portrait_yscale = 1;
	}
	#endregion /*Characterselect portrait y_scale origin point END*/

	#region /*Characterselect portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player3_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player3_select_portrait_xscale = 1;
	}
	#endregion /*Characterselect portrait x_scale origin point END*/
	#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
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

#region /*Player 3 official character select portrait sprite*/
if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png"))
{
	global.sprite_select_player_3 = sprite_add("Characters/Character "+string(global.character_for_player_3)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
#endregion /*Player 3 official character select portrait sprite END*/

else

#region /*Player 3 character select portrait sprite*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png"))
{
	global.sprite_select_player_3 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_3-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
else
{
	global.sprite_select_player_3 = noone;
}
#endregion /*Player 3 character select portrait sprite END*/

#region /*Player 4 Characterselect portrait x and y origin points*/
if(file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if(file_exists("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(global.character_for_player_4)+"/Data/sprite_origin_point.ini");
	}
	else
	{
		ini_open(working_directory + "Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
	}
	
	#region /*Characterselect portrait x and y origin points*/
	#region /*Characterselect portrait y origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_yorig"))
	{
		character_select_portrait_yorig = ini_read_real("sprite origin points", "character_select_portrait_yorig", 0);
	}
	else
	{
		character_select_portrait_yorig = 0;
	}
	#endregion /*Characterselect portrait y origin point END*/

	#region /*Characterselect portrait x origin point*/
	if (ini_key_exists("sprite origin points", "character_select_portrait_xorig"))
	{
		character_select_portrait_xorig = ini_read_real("sprite origin points", "character_select_portrait_xorig", 0);
	}
	else
	{
		character_select_portrait_xorig = 0;
	}
	#endregion /*Characterselect portrait x origin point END*/
	#endregion /*Characterselect portrait x and y origin points END*/
						
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
	
	#region /*Characterselect portrait x_scale and y_scale origin points*/
	#region /*Characterselect portrait y_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_yscale"))
	{
		player4_select_portrait_yscale = ini_read_real("sprite origin points", "player_select_portrait_yscale", 1);
	}
	else
	{
		player4_select_portrait_yscale = 1;
	}
	#endregion /*Characterselect portrait y_scale origin point END*/

	#region /*Characterselect portrait x_scale origin point*/
	if (ini_key_exists("sprite origin points", "player_select_portrait_xscale"))
	{
		player4_select_portrait_xscale = ini_read_real("sprite origin points", "player_select_portrait_xscale", 1);
	}
	else
	{
		player4_select_portrait_xscale = 1;
	}
	#endregion /*Characterselect portrait x_scale origin point END*/
	#endregion /*Characterselect portrait x_scale and y_scale origin points END*/
						
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

#region /*Player 4 official character select portrait sprite*/
if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png"))
{
	global.sprite_select_player_4 = sprite_add("Characters/Character "+string(global.character_for_player_4)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
#endregion /*Player 4 official character select portrait sprite END*/

else

#region /*Player 4 character select portrait sprite*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png"))
{
	global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/character_select_portrait.png", 0, false, false, character_select_portrait_xorig, character_select_portrait_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png"))
{
	global.sprite_select_player_4 = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_4-global.max_number_of_official_characters)+"/Sprites/stand.png", 0, false, false, sprite_stand_xorig, sprite_stand_yorig);
}
else
{
	global.sprite_select_player_4 = noone;
}
#endregion /*Player 4 character select portrait sprite END*/

scr_loadconfig(); /*Load Config*/

lives=5;
level_name="";

#region /*If title screen should start at the level editor menu or the main menu*/
if (global.level_editor_level>0)
and(global.character_select_in_this_menu="level_editor")
{
	ds_list_clear(global.all_loaded_custom_levels)
	ds_list_add(global.all_loaded_custom_levels, "Create_Level")
	ds_list_clear(global.thumbnail_sprite)
	ds_list_add(global.thumbnail_sprite, spr_menu_create_custom_level)
	first_level=file_find_first(working_directory+"/Custom Levels/*", fa_directory)
	if directory_exists(first_level)
	ds_list_add(global.all_loaded_custom_levels, first_level)
	can_navigate = true;
	menu_delay = 3;
	player1_accept_selection = false;
	player2_accept_selection = false;
	player3_accept_selection = false;
	player4_accept_selection = false;
	can_input_player1_name = false;
	can_input_player2_name = false;
	can_input_player3_name = false;
	can_input_player4_name = false;
	menu = "load_custom_level";
}
else
{
	menu="main_game";
}
#endregion /*If title screen should start at the level editor menu or the main menu END*/

/*Level code copied to clipboard*/copy_to_clipboard_message=0;paste_from_clipboard_message=0;
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
in_settings=false;
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
title_logo_index = noone;
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
if (asset_get_type("snd_menuvoice_companysplash")==asset_sound)
{
	audio_stop_sound(snd_menuvoice_companysplash);
}
if (asset_get_type("snd_menuvoice_controllersplash")==asset_sound)
{
	audio_stop_sound(snd_menuvoice_controllersplash);
}
if (asset_get_type("snd_rain")==asset_sound)
{
	audio_stop_sound(snd_rain);
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
if (asset_get_type("menuvoice_titlesplash")==asset_sound)
{
	audio_play_sound(menuvoice_titlesplash,0,0);
	audio_sound_gain(menuvoice_titlesplash,global.voices_volume,0);
}
#endregion /*Say the games title END*/

#region /*Play title screen music*/
if (asset_get_type("snd_music_titlescreen")==asset_sound)
{
	audio_play_sound(snd_music_titlescreen,0,true);
	audio_sound_gain(snd_music_titlescreen,global.music_volume,0);
}
#endregion /*Play title screen music End*/