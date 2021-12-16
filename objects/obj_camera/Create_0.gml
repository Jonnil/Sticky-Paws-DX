depth = -9000;

sprite_index = global.resourcepack_sprite_basic_collectible;
image_speed = 0.25;

global.pause_room = noone;

show_controller_input_change_prompt = 0;
show_keyboard_and_mouse_input_change_prompt = 0;
show_controller_input_change_prompt_y = 0;
show_keyboard_and_mouse_input_change_prompt_y = 0;

delay = 0;

mouse_x_position = window_mouse_get_x(); /*Mouse x initializing*/
mouse_y_position = window_mouse_get_y(); /*Mouse y initializing*/

#region /*Lives Icon*/
if (file_exists(working_directory + "/custom_characters/" + string(global.character_for_player_1)+"/data/character_config.ini"))
{
	ini_open(working_directory + "/custom_characters/" + string(global.character_for_player_1)+"/data/character_config.ini");
	
	#region /*Sprite lives icon x and y origin points*/
	#region /*Sprite lives icon x origin point*/
	if (ini_key_exists("sprite origin points", "lives_icon_xorig"))
	{
		lives_icon_xorig = ini_read_real("sprite origin points", "lives_icon_xorig", 0);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("sprite origin points", "lives_icon_xorig", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("sprite origin points", "lives_icon_yorig", 0);
		}
		lives_icon_yorig = 0;
	}
	#endregion /*Sprite lives icon y origin point END*/
	#endregion /*Sprite lives icon x and y origin points END*/
	
	ini_close();
}

if (file_exists(working_directory + "/custom_characters/" + string(global.character_for_player_1)+"/sprites/lives_icon.png"))
{
	sprite_lives_icon = sprite_add(working_directory + "/custom_characters/" + string(global.character_for_player_1)+"/sprites/lives_icon.png", 0, false, false, lives_icon_xorig, lives_icon_yorig);
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

save_level_as_png = false;
allow_spawn_decorations = false;
can_spawn_player = false;
can_spawn_player1 = true;
can_spawn_player2 = true;
can_spawn_player3 = true;
can_spawn_player4 = true;
show_player1_controls_y = 0;

#region /*Smooth the camera out even more*/
view_wview_lerp = 0;
view_hview_lerp = 0;
#endregion /*Smooth the camera out even more END*/

#region /*Hud Variables*/
global.hud_show_lives = true;
global.hud_show_deaths = true;
hud_show_lives = -32;
hud_show_lives_timer = global.hud_hide_time*60;
hud_show_deaths = -32;
hud_show_deaths_timer = global.hud_hide_time*60;
hud_show_basic_collectibles = -32;
hud_show_basic_collectibles_timer = 0;
hud_show_big_collectibles = -32;
hud_show_big_collectibles_timer = 0;
hud_show_score = -32;
hud_show_score_timer = 0;
hud_show_time = -32;
hud_show_time_timer = 0;
#endregion /*Hud Variables END*/

player_has_spawned=false;

#region /*Checkpoint*/
if (global.actually_play_edited_level = true)
and (global.play_edited_level = true)
{
	if (global.x_checkpoint > 0)
	or (global.y_checkpoint > 0)
	{
		camera_set_view_pos(view_camera[view_current],global.x_checkpoint,global.y_checkpoint)
		if (asset_get_type("obj_player")==asset_object)
		and(instance_exists(obj_player))
		{
			obj_player.x = global.x_checkpoint;
			obj_player.y = global.y_checkpoint;
		}
		x = global.x_checkpoint;
		y = global.y_checkpoint;
		xx = global.x_checkpoint;
		yy = global.y_checkpoint;
	}
}
#endregion /*Checkpoint End*/

#region /*Initialize Intro Animation*/
if (global.character_select_in_this_menu = "main_game")
and(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini"))
or(global.character_select_in_this_menu = "level_editor")
and(file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini"))
{
	if (global.character_select_in_this_menu = "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini");
	}
	
	#region /*Intro Animation*/
	if (ini_key_exists("info", "intro_animation"))
	{
		intro_animation = ini_read_string("info", "intro_animation", "");
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_string("info", "intro_animation", "");
		}
		intro_animation = "";
	}
	#endregion /*Intro Animation END*/
	
	#region /*Intro Animation Play Only Once*/
	if (ini_key_exists("info", "intro_animation_play_only_once"))
	{
		intro_animation_play_only_once = ini_read_string("info", "intro_animation_play_only_once", false);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_string("info", "intro_animation_play_only_once", false);
		}
		intro_animation_play_only_once = false;
	}
	#endregion /*Intro Animation Play Only Once END*/
	
	#region /*After goal go to this level*/
	if (ini_key_exists("info", "after_goal_go_to_this_level"))
	{
		after_goal_go_to_this_level = ini_read_string("info", "after_goal_go_to_this_level", noone);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_string("info", "after_goal_go_to_this_level", noone);
		}
		after_goal_go_to_this_level = noone;
	}
	#endregion /*After goal go to this level END*/
	
	ini_close();
}
else
{
	intro_animation = "";
	intro_animation_play_only_once = false;
}
#endregion /*Initialize Intro Animation END*/

#region /*Spawn Players*/
player1 = noone;
player2 = noone;
player3 = noone;
player4 = noone;
if (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	if (global.player1_can_play = true)
	{
		if (global.x_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		or (global.y_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		{
			player1 = instance_create_depth(global.x_checkpoint, global.y_checkpoint, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_1_start))
		{
			player1 = instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_player);
		}
		else
		{
			player1 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player1)
		{
			custom_character = global.character_for_player_1;
			selected_voice_pack = global.voicepack_for_player_1;
			selected_skin = global.skin_for_player_1;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 1;
		}
	}
	if (global.player2_can_play = true)
	{
		if (global.x_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		or (global.y_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		{
			player2 = instance_create_depth(global.x_checkpoint, global.y_checkpoint, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_2_start))
		{
			player2 = instance_create_depth(obj_level_player_2_start.x, obj_level_player_2_start.y, 0, obj_player);
		}
		else
		{
			player2 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player2)
		{
			custom_character = global.character_for_player_2;
			selected_voice_pack = global.voicepack_for_player_2;
			selected_skin = global.skin_for_player_2;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 2;
		}
	}
	if (global.player3_can_play = true)
	{
		if (global.x_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		or (global.y_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		{
			player3 = instance_create_depth(global.x_checkpoint, global.y_checkpoint, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_3_start))
		{
			player3 = instance_create_depth(obj_level_player_3_start.x, obj_level_player_3_start.y, 0, obj_player);
		}
		else
		{
			player3 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player3)
		{
			custom_character = global.character_for_player_3;
			selected_voice_pack = global.voicepack_for_player_3;
			selected_skin = global.skin_for_player_3;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 3;
		}
	}
	if (global.player4_can_play = true)
	{
		if (global.x_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		or (global.y_checkpoint > 0)
		and (global.actually_play_edited_level = true)
		{
			player4 = instance_create_depth(global.x_checkpoint, global.y_checkpoint, 0, obj_player);
		}
		else
		if (global.actually_play_edited_level = true)
		and (instance_exists(obj_level_player_4_start))
		{
			player4 = instance_create_depth(obj_level_player_4_start.x, obj_level_player_4_start.y, 0, obj_player);
		}
		else
		{
			player4 = instance_create_depth(x, y, 0, obj_player);
		}
		with(player4)
		{
			custom_character = global.character_for_player_4;
			selected_voice_pack = global.voicepack_for_player_4;
			selected_skin = global.skin_for_player_4;
			intro_animation = instance_nearest(x, y, obj_camera).intro_animation;
			player = 4;
		}
	}
	if (asset_get_type("room_leveleditor") == asset_room)
	and (room = room_leveleditor)
	and (global.actually_play_edited_level = true)
	{
		player_has_spawned = true;
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

xx = x;
yy = y;
letterbox_top_y = 0;
letterbox_bottom_y = room_height;
show_letterbox = 0;
iris_xscale = 0;
iris_yscale = 0;
allow_iris = true;
iris_zoom = 0;
timer_blinking_alpha = 0;

/*Initialize the view in the create event, if you do that in any other event the HTML5 version will result in a black screen*/
#region /*Initialize View*/

/*View Size*/
view_wview=1024+400-32;
view_hview=768-32;
/*View Size End*/

#region /*View Size*/
if (os_type==os_ios)or(os_type==os_android){
if (view_wport>1920){view_wport=1920;}if (view_wview>1920-64){view_wview=1920-64;}if (view_hport>1080){view_hport=1080;}if (view_hview>1080-64){view_hview=1080-64;}
if (view_wport<640-320){view_wport=640;}if (view_wview<640){view_wview=640;}if (view_hport<480){view_hport=480;}if (view_hview<480){view_hview=480;}
}else{
if (view_wport>1920){view_wport=1920;}if (view_wview>1920){view_wview=1920;}if (view_hport>1080){view_hport=1080;}if (view_hview>1080){view_hview=1080;}
if (view_wport<640){view_wport=640;}if (view_wview<640){view_wview=640;}if (view_hport<480){view_hport=480;}if (view_hview<480){view_hview=480;}}
#endregion /*View Size END*/

#endregion /*Initialize View END*/

#region /*Custom Music*/
if (asset_get_type("room_title") == asset_room)
and(room != room_title)
{
	
	#region /*Update Music*/
	/*OGG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music.ogg"))
	and(global.character_select_in_this_menu = "main_game")
	{
		global.music = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music.ogg"))
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.music = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music.ogg");
	}
	else
	{
		global.music = noone;
	}
	#endregion /*Update Music END*/
	
	#region /*Update Music Underwater*/
	/*OGG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg"))
	and(global.character_select_in_this_menu = "main_game")
	{
		global.music_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg"))
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.music_underwater = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/music/music_underwater.ogg");
	}
	else
	{
		global.music_underwater = noone;
	}
	#endregion /*Update Music Underwater END*/
	
	#region /*Update Ambience*/
	/*OGG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/ambience/ambience.ogg"))
	and(global.character_select_in_this_menu = "main_game")
	{
		global.ambience = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/ambience/ambience.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/ambience/ambience.ogg"))
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.ambience = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/ambience/ambience.ogg");
	}
	else
	{
		global.ambience = noone;
	}
	#endregion /*Update Ambience END*/
	
	#region /*Update Ambience Underwater*/
	/*OGG small letter File*/
	if (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/ambience/ambience_underwater.ogg"))
	and(global.character_select_in_this_menu = "main_game")
	{
		global.ambience_underwater = audio_create_stream("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/sounds/ambience/ambience_underwater.ogg");
	}
	else
	/*OGG small letter File*/
	if (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/ambience/ambience_underwater.ogg"))
	and(global.character_select_in_this_menu = "level_editor")
	{
		global.ambience_underwater = audio_create_stream(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/sounds/ambience/ambience_underwater.ogg");
	}
	else
	{
		global.ambience_underwater = noone;
	}
	#endregion /*Update Ambience Underwater END*/
	
}
else
{
	global.music = noone;
	global.music_underwater = noone;
	global.ambience = noone;
	global.ambience_underwater = noone;
}
#endregion /*Custom Music END*/

#region /*Initialize Background*/
if (global.character_select_in_this_menu = "main_game")
and(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini"))
or(global.character_select_in_this_menu = "level_editor")
and(file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini"))
{
	if (global.character_select_in_this_menu = "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini");
	}
	
	#region /*Custom Background 4 x and y parallax points*/
	#region /*Custom Background 4 y parallax point*/
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_parallax"))
	{
		custom_background_4_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		}
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
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
		}
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

#region /*Initialize Level Info*/
if (global.character_select_in_this_menu = "main_game")
and(file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini"))
or(global.character_select_in_this_menu = "level_editor")
and(file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini"))
{
	if (global.character_select_in_this_menu = "main_game")
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index))+"/data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu = "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini");
	}
	
	#region /*Default View Width*/
	if (ini_key_exists("info", "default_view_width"))
	{
		global.default_view_width = ini_read_real("info", "default_view_width", 1920);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("info", "default_view_width", 1920);
		}
		global.default_view_width = 1920;
	}
	#endregion /*Default View Width END*/
	
	#region /*Default View Height*/
	if (ini_key_exists("info", "default_view_height"))
	{
		global.default_view_height = ini_read_real("info", "default_view_height", 1080);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("info", "default_view_height", 1080);
		}
		global.default_view_height = 1080;
	}
	#endregion /*Default View Height END*/
	
	#region /*Initialize Weather*/
	
	#region /*Rain*/
	if (ini_key_exists("info", "rain"))
	{
		rain = ini_read_real("info", "rain", false);
	}
	else
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_write_real("info", "rain", false);
		}
		rain = false;
	}
	#endregion /*Rain END*/
	
	#endregion /*Initialize Weather END*/
	
	ini_close();
}
else
{
	rain = false;
}
#endregion /*Initialize Level Info END*/

big_collectible_count=1;
shake=false;
scrolling_left=0;

#region /*Assist Item*/
if (asset_get_type("obj_assist_item")==asset_object)
and (asset_get_type("obj_player")==asset_object)
and (global.assist_enable = true)
{
	if (global.assist_item_appear<10)
	{
		if (global.lives_until_assist>=global.assist_item_appear)
		or(global.assist_item_appear<=0)
		{
			if (!instance_exists(obj_assist_item))
			and(instance_exists(obj_player))
			{
				with(instance_nearest(x, y, obj_player))
				{
					instance_create_depth(x-32, y-128, 0, obj_assist_item);
				}
			}
		}
	}
}
#endregion /*Assist Item End*/

#region /*Start Timer*/
time_second=0;
if (instance_exists(obj_player))
and (asset_get_type("obj_player_map")==asset_object)
and (!instance_exists(obj_player_map))
{
	if (global.trigger_ending=false)
	{
		if (global.actually_play_edited_level = true)
		and (global.play_edited_level = true)
		and (global.x_checkpoint>0)
		or (global.actually_play_edited_level = true)
		and (global.play_edited_level = true)
		and (global.y_checkpoint>0)
		{
			global.timeattack_realmillisecond = global.checkpoint_realmillisecond;
			global.timeattack_millisecond = global.checkpoint_millisecond;
			global.timeattack_second = global.checkpoint_second;
			global.timeattack_minute = global.checkpoint_minute;
		}
		else
		{
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
		}
	}
}
#endregion /*Start Timer END*/

#region /*Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default*/
if (global.number_of_audio_channels = 0)
{
	audio_channel_num(32);
}
else
if (global.number_of_audio_channels = 1)
{
	audio_channel_num(64);
}
else
if (global.number_of_audio_channels = 2)
{
	audio_channel_num(96);
}
else
if (global.number_of_audio_channels = 3)
{
	audio_channel_num(128);
}
else
if (global.number_of_audio_channels = 4)
{
	audio_channel_num(160);
}
else
if (global.number_of_audio_channels = 5)
{
	audio_channel_num(192);
}
else
if (global.number_of_audio_channels = 6)
{
	audio_channel_num(224);
}
else
if (global.number_of_audio_channels = 7)
{
	audio_channel_num(256);
}
#endregion /*Limit the number of sound channels, should be on 128 for best performance as default, but let the player change this in Audio Settings. From 32 to 256, 128 is default END*/