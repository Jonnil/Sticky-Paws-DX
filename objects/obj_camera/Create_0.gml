depth = -2000;

global.pause_room = noone;

#region /*Mouse x and mouse y initializing*/
mouse_x_position = mouse_x;
mouse_y_position = mouse_y;
#endregion /*Mouse x and mouse y initializing END*/

#region /*Lives Icon*/
if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini"))
{
	ini_open(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1)+"/Data/character_config.ini");
	
	#region /*Sprite lives icon x and y origin points*/
	#region /*Sprite lives icon x origin point*/
	if (ini_key_exists("sprite origin points", "lives_icon_xorig"))
	{
		lives_icon_xorig = ini_read_real("sprite origin points", "lives_icon_xorig", 0);
	}
	else
	{
		ini_write_real("sprite origin points", "lives_icon_xorig", 0);
		lives_icon_xorig = 0;
	}
	#endregion /*Sprite lives icon x origin point END*/

	#region /*Sprite lives icon y origin point*/
	if (ini_key_exists("sprite origin points", "lives_icon_yorig"))
	{
		lives_icon_yorig = ini_read_real("sprite origin points", "lives_icon_yorig", 0);
	}
	else
	{
		ini_write_real("sprite origin points", "lives_icon_yorig", 0);
		lives_icon_yorig = 0;
	}
	#endregion /*Sprite lives icon y origin point END*/
	#endregion /*Sprite lives icon x and y origin points END*/
	
	ini_close();
}

if (file_exists(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1)+"/Sprites/lives_icon.png"))
{
	sprite_lives_icon = sprite_add(working_directory + "/Custom Characters/Character "+string(global.character_for_player_1)+"/Sprites/lives_icon.png", 0, false, false, lives_icon_xorig, lives_icon_yorig);
}
else
if (asset_get_type("spr_1up") == asset_sprite)
{
	sprite_lives_icon = spr_1up;
}
else
if (asset_get_type("spr_lives_icon") == asset_sprite)
{
	sprite_lives_icon = spr_lives_icon;
}
else
{
	sprite_lives_icon = noone;
}
#endregion /*Lives Icon END*/

#region /*Create Foreground and Background Brightness Layer*/
if (asset_get_type("obj_background_brightness_gameplay")==asset_object)
and(!instance_exists(obj_background_brightness_gameplay))
{
	instance_create_depth(0,0,0,obj_background_brightness_gameplay);
}
if (asset_get_type("obj_foreground1")==asset_object)
and(!instance_exists(obj_foreground1))
{
	instance_create_depth(0,0,0,obj_foreground1);
}
if (asset_get_type("obj_foreground2")==asset_object)
and(!instance_exists(obj_foreground2))
{
	instance_create_depth(0,0,0,obj_foreground2);
}
#endregion /*Create Foreground and Background Brightness Layer END*/

save_level_as_png=false;
allow_spawn_decorations=false;
can_spawn_player=false;

/*Default Views:   set_view_wview = 1024+400-32   set_view_hview = 768-32   */
set_view_wview=1392;set_view_hview=736;

#region /*Smooth the camera out even more*/
view_wview_lerp = set_view_wview;
view_hview_lerp = set_view_hview;
#endregion /*Smooth the camera out even more END*/

#region /*Hud Variables*/
hud_show_lives=-32;
hud_show_lives_timer=-32;
hud_show_basic_collectibles=-32;
hud_show_basic_collectibles_timer=-32;
hud_show_big_collectibles=-32;
hud_show_big_collectibles_timer=-32;
hud_show_score=-32;
hud_show_score_timer=0;
hud_show_time=-32;
hud_show_time_timer=0;
#endregion /*Hud Variables END*/

player_has_spawned=false;

#region /*Checkpoint*/
if (global.x_checkpoint>0)
and(global.y_checkpoint>0)
{
	camera_set_view_pos(view_camera[view_current],global.x_checkpoint,global.y_checkpoint)
	if (asset_get_type("obj_player")==asset_object)
	and(instance_exists(obj_player))
	{
		obj_player.x=global.x_checkpoint;
		obj_player.y=global.y_checkpoint;
	}
	x=global.x_checkpoint;
	y=global.y_checkpoint;
	xx=global.x_checkpoint;
	yy=global.y_checkpoint;
}
#endregion /*Checkpoint End*/

#region /*Spawn Players*/
player1=noone;
player2=noone;
player3=noone;
player4=noone;
if (asset_get_type("obj_player_map")==asset_object)
and(!instance_exists(obj_player_map))
and(asset_get_type("obj_title")==asset_object)
and(!instance_exists(obj_title))
{
	if (global.playergame>=0)
	{
		player1=instance_create_depth(x,y,0,obj_player)
		with(player1)
		{
			custom_character = global.character_for_player_1;
			player=1;
		}
	}
	if (global.playergame>=1)
	{
		player2=instance_create_depth(x-32,y,0,obj_player)
		with(player2)
		{
			custom_character = global.character_for_player_2;
			player=2;
		}
	}
	if (global.playergame>=2)
	{
		player3=instance_create_depth(x-64,y,0,obj_player)
		with(player3)
		{
			custom_character = global.character_for_player_3;
			player=3;
		}
	}
	if (global.playergame>=3)
	{
		player4=instance_create_depth(x-96,y,0,obj_player)
		with(player4)
		{
			custom_character = global.character_for_player_4;
			player=4;
		}
	}
	if (asset_get_type("room_leveleditor")==asset_room)
	and(room=room_leveleditor)
	and(global.actually_play_edited_level=true)
	{
		player_has_spawned=true;
	}
}
else
if (asset_get_type("obj_player_map")==asset_object)
and(!instance_exists(obj_player_map))
and(asset_get_type("obj_title")==asset_object)
and(!instance_exists(obj_title))
{
	if (global.playergame>=0)
	{
		player1=instance_create_depth(x,y,0,obj_player)
		with(player1)
		{
			custom_character = global.character_for_player_1;
			player=1;
		}
	}
	if (global.playergame>=1)
	{
		player2=instance_create_depth(x-32,y,0,obj_player)
		with(player2)
		{
			custom_character = global.character_for_player_2;
			player=2;
		}
	}
	if (global.playergame>=2)
	{
		player3=instance_create_depth(x-64,y,0,obj_player)
		with(player3)
		{
			custom_character = global.character_for_player_3;
			player=3;
		}
	}
	if (global.playergame>=3)
	{
		player4=instance_create_depth(x-96,y,0,obj_player)
		with(player4)
		{
			custom_character = global.character_for_player_4;
			player=4;
		}
	}
	if (asset_get_type("room_leveleditor")==asset_room)
	and(room=room_leveleditor)
	and(global.actually_play_edited_level=true)
	{
		player_has_spawned=true;
	}
}
#endregion /*Spawn Players End*/

/*HUD Show Controls keys that have been pressed*/
player1_show_controls_timer=0;
player2_show_controls_timer=0;
player3_show_controls_timer=0;
player4_show_controls_timer=0;

player1_show_controls_alpha=0;
player2_show_controls_alpha=0;
player3_show_controls_alpha=0;
player4_show_controls_alpha=0;

show_sprint_toggle_for_player1=0;
show_sprint_toggle_for_player2=0;
show_sprint_toggle_for_player3=0;
show_sprint_toggle_for_player4=0;

/*Player 1*/player1_has_pressed_key_up=false;
player1_has_pressed_key_left=false;
player1_has_pressed_key_right=false;
player1_has_pressed_key_down=false;
player1_has_pressed_key_jump=false;
player1_has_pressed_key_dash=false;/*Player 1 END*/
/*Player 2*/player2_has_pressed_key_up=false;
player2_has_pressed_key_left=false;
player2_has_pressed_key_right=false;
player2_has_pressed_key_down=false;
player2_has_pressed_key_jump=false;
player2_has_pressed_key_dash=false;/*Player 2 END*/
/*Player 3*/player3_has_pressed_key_up=false;
player3_has_pressed_key_left=false;
player3_has_pressed_key_right=false;
player3_has_pressed_key_down=false;
player3_has_pressed_key_jump=false;
player3_has_pressed_key_dash=false;/*Player 3 END*/
/*Player 4*/player4_has_pressed_key_up=false;
player4_has_pressed_key_left=false;
player4_has_pressed_key_right=false;
player4_has_pressed_key_down=false;
player4_has_pressed_key_jump=false;
player4_has_pressed_key_dash=false;/*Player 4 END*/
/*HUD Show Controls keys that have been pressed END*/

xx=x;
yy=y;
letterbox_top_y=view_yview;
letterbox_bottom_y=room_height;
show_letterbox=60;
iris_xscale=0;
iris_yscale=0;
allow_iris=true;
iris_zoom=0;
timer_blinking_alpha = 0;

/*Initialize the view in the create event, if you do that in any other event the HTML5 version will result in a black screen*/
#region /*Initialize View*/
/*View Size*/view_wview=1024+400-32;view_hview=768-32;/*View Size End*/

#region /*View Size*/
if (os_type==os_ios)or(os_type==os_android){
if (view_wport>1920){view_wport=1920;}if (view_wview>1920-64){view_wview=1920-64;}if (view_hport>1080){view_hport=1080;}if (view_hview>1080-64){view_hview=1080-64;}
if (view_wport<640-320){view_wport=640;}if (view_wview<640){view_wview=640;}if (view_hport<480){view_hport=480;}if (view_hview<480){view_hview=480;}
}else{
if (view_wport>1920){view_wport=1920;}if (view_wview>1920){view_wview=1920;}if (view_hport>1080){view_hport=1080;}if (view_hview>1080){view_hview=1080;}
if (view_wport<640){view_wport=640;}if (view_wview<640){view_wview=640;}if (view_hport<480){view_hport=480;}if (view_hview<480){view_hview=480;}}
#endregion /*View Size END*/

#endregion /*Initialize View END*/

#region /*Initialize Background*/
if (global.character_select_in_this_menu="game")
and(file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/level_information.ini"))
or(global.character_select_in_this_menu="level_editor")
and(file_exists(working_directory + "/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini"))
{
	if (global.character_select_in_this_menu="game")
	{
		ini_open("Levels/Level" +string(global.level_editor_level)+"/Data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu="level_editor")
	{
		ini_open(working_directory + "/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini");
	}
	
	#region /*Custom Background 4 x and y parallax points*/
	#region /*Custom Background 4 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_parallax"))
	{
		custom_background_4_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		custom_background_4_y_parallax = 9;
	}
	#endregion /*Custom Background 4 y parallax point END*/
	
	#region /*Custom Background 4 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_parallax"))
	{
		custom_background_4_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		custom_background_4_x_parallax = 9;
	}
	#endregion /*Custom Background 4 x parallax point END*/
	#endregion /*Custom Background 4 x and y parallax points END*/
	
	#region /*Custom Background 3 x and y parallax points*/
	#region /*Custom Background 3 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_parallax"))
	{
		custom_background_3_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		custom_background_3_y_parallax = 7;
	}
	#endregion /*Custom Background 3 y parallax point END*/
	
	#region /*Custom Background 3 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_parallax"))
	{
		custom_background_3_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		custom_background_3_x_parallax = 7;
	}
	#endregion /*Custom Background 3 x parallax point END*/
	#endregion /*Custom Background 3 x and y parallax points END*/
	
	#region /*Custom Background 2 x and y parallax points*/
	#region /*Custom Background 2 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_parallax"))
	{
		custom_background_2_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		custom_background_2_y_parallax = 5;
	}
	#endregion /*Custom Background 2 y parallax point END*/
	
	#region /*Custom Background 2 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_parallax"))
	{
		custom_background_2_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		custom_background_2_x_parallax = 5;
	}
	#endregion /*Custom Background 2 x parallax point END*/
	#endregion /*Custom Background 2 x and y parallax points END*/
	
	#region /*Custom Background 1 x and y parallax points*/
	#region /*Custom Background 1 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_parallax"))
	{
		custom_background_1_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		custom_background_1_y_parallax = 3;
	}
	#endregion /*Custom Background 1 y parallax point END*/
	
	#region /*Custom Background 1 x parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_parallax"))
	{
		custom_background_1_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
		custom_background_1_x_parallax = 3;
	}
	#endregion /*Custom Background 1 x parallax point END*/
	#endregion /*Custom Background 1 x and y parallax points END*/
	
	#region /*Custom Background 4 x and y offset points*/
	#region /*Custom Background 4 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_offset"))
	{
		custom_background_4_y_offset = ini_read_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		custom_background_4_y_offset = 0;
	}
	#endregion /*Custom Background 4 y offset point END*/
	
	#region /*Custom Background 4 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_offset"))
	{
		custom_background_4_x_offset = ini_read_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		custom_background_4_x_offset = 0;
	}
	#endregion /*Custom Background 4 x offset point END*/
	#endregion /*Custom Background 4 x and y offset points END*/
	
	#region /*Custom Background 3 x and y offset points*/
	#region /*Custom Background 3 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_offset"))
	{
		custom_background_3_y_offset = ini_read_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		custom_background_3_y_offset = 0;
	}
	#endregion /*Custom Background 3 y offset point END*/
	
	#region /*Custom Background 3 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_offset"))
	{
		custom_background_3_x_offset = ini_read_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		custom_background_3_x_offset = 0;
	}
	#endregion /*Custom Background 3 x offset point END*/
	#endregion /*Custom Background 3 x and y offset points END*/
	
	#region /*Custom Background 2 x and y offset points*/
	#region /*Custom Background 2 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_offset"))
	{
		custom_background_2_y_offset = ini_read_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		custom_background_2_y_offset = 0;
	}
	#endregion /*Custom Background 2 y offset point END*/
	
	#region /*Custom Background 2 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_offset"))
	{
		custom_background_2_x_offset = ini_read_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		custom_background_2_x_offset = 0;
	}
	#endregion /*Custom Background 2 x offset point END*/
	#endregion /*Custom Background 2 x and y offset points END*/
	
	#region /*Custom Background 1 x and y offset points*/
	#region /*Custom Background 1 y offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_offset"))
	{
		custom_background_1_y_offset = ini_read_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		custom_background_1_y_offset = 0;
	}
	#endregion /*Custom Background 1 y offset point END*/
	
	#region /*Custom Background 1 x offset point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_offset"))
	{
		custom_background_1_x_offset = ini_read_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
	}
	else
	{
		ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
		custom_background_1_x_offset = 0;
	}
	#endregion /*Custom Background 1 x offset point END*/
	#endregion /*Custom Background 1 x and y offset points END*/
	
	ini_close();
}
else
{
	custom_background_1_x_offset = 0;
	custom_background_1_y_offset = 0;
	custom_background_2_x_offset = 0;
	custom_background_2_y_offset = 0;
	custom_background_3_x_offset = 0;
	custom_background_3_y_offset = 0;
	custom_background_4_x_offset = 0;
	custom_background_4_y_offset = 0;
	custom_background_1_x_parallax = 3;
	custom_background_1_y_parallax = 3;
	custom_background_2_x_parallax = 5;
	custom_background_2_y_parallax = 5;
	custom_background_3_x_parallax = 7;
	custom_background_3_y_parallax = 7;
	custom_background_4_x_parallax = 9;
	custom_background_4_y_parallax = 9;
}
#endregion /*Initialize Background END*/

big_collectible_count=1;
shake=false;
scrolling_left=0;

#region /*Assist Item*/
if (asset_get_type("obj_assist_item")==asset_object)
and(asset_get_type("obj_player")==asset_object)
{
	if (global.assist_item_appear<10)
	{
		if (global.lives_until_assist>=global.assist_item_appear)
		or(global.assist_item_appear<=0)
		{
			if (instance_number(obj_assist_item)<1)
			and(instance_exists(obj_player))
			{
				with(instance_nearest(x,y,obj_player))
				{
					instance_create_depth(x-32,y-128,0,obj_assist_item);
				}
			}
		}
	}
}
#endregion /*Assist Item End*/

/*Start Timer*/
time_second=0;
if (instance_number(obj_player)>0)and(asset_get_type("obj_player_map")==asset_object)and(instance_number(obj_player_map)<1){if (global.trigger_ending=false){
if (global.x_checkpoint>0)or(global.y_checkpoint>0){global.timeattack_realmillisecond=global.checkpoint_realmillisecond;global.timeattack_millisecond=global.checkpoint_millisecond;global.timeattack_second=global.checkpoint_second;global.timeattack_minute=global.checkpoint_minute;}
else{global.timeattack_realmillisecond=0;global.timeattack_millisecond=0;global.timeattack_second=0;global.timeattack_minute=0;}}}
//if (global.x_checkpoint>0{view_xview=global.x_checkpoint;}
//if (global.y_checkpoint>0{view_yview=global.y_checkpoint;}

//}

/*Virtual Controls*/
//display_set_gui_size(view_wview,view_hview);
//global.virtual_key_up=virtual_key_add(0,450,300,100,vk_up);
//global.virtual_key_left=virtual_key_add(0,450,100,300,vk_left);
//global.virtual_key_right=virtual_key_add(200,450,100,300,vk_right);
//global.virtual_key_down=virtual_key_add(0,650,300,100,vk_down);
//global.virtual_key_a=virtual_key_add(1200,450,200,300,vk_space);
//global.virtual_key_b=virtual_key_add(1100,450,200,300,vk_shift);
//virtual_key_show(global.virtual_key_up);
//virtual_key_show(global.virtual_key_left);
//virtual_key_show(global.virtual_key_right);
//virtual_key_show(global.virtual_key_down);
//virtual_key_show(global.virtual_key_a);
//virtual_key_show(global.virtual_key_b);