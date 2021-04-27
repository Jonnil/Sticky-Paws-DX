scr_set_screen_size();

#region /*Set what controls are used to navigate the menus*/

#region /*Get distance from fake mouse to real mouse*/
var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y());
#endregion /*Get distance from fake mouse to real mouse END*/

#region /*update positions of fake mouse*/
mouse_x_position = window_mouse_get_x();
mouse_y_position = window_mouse_get_y();
#endregion /*update positions of fake mouse*/

if (keyboard_check(vk_anykey))
{
	global.controls_used_for_menu_navigation="keyboard";
}
else
if (mouse_check_button(mb_any))
or(mouse_wheel_down())
or(mouse_wheel_up())
or(mouse_moving)
{
	global.controls_used_for_menu_navigation="mouse";
}
else
if (gamepad_button_check(0,gp_face1))
or(gamepad_button_check(0,gp_face2))
or(gamepad_button_check(0,gp_face3))
or(gamepad_button_check(0,gp_face4))
or(gamepad_button_check(0,gp_padd))
or(gamepad_button_check(0,gp_padl))
or(gamepad_button_check(0,gp_padr))
or(gamepad_button_check(0,gp_padu))
or(gamepad_button_check(0,gp_select))
or(gamepad_button_check(0,gp_shoulderl))
or(gamepad_button_check(0,gp_shoulderlb))
or(gamepad_button_check(0,gp_shoulderr))
or(gamepad_button_check(0,gp_shoulderrb))
or(gamepad_button_check(0,gp_start))
or(gamepad_button_check(0,gp_stickl))
or(gamepad_button_check(0,gp_stickr))
or(gamepad_axis_value(0,gp_axislh)<>0)
or(gamepad_axis_value(0,gp_axislv)<>0)
or(gamepad_axis_value(0,gp_axisrh)<>0)
or(gamepad_axis_value(0,gp_axisrv)<>0)
{
	global.controls_used_for_menu_navigation="controller";
}
#endregion /*Set what controls are used to navigate the menus END*/

#region /*Initialize Custom Character*/
if (initialize_custom_character_timer < 2)
{
	initialize_custom_character_timer += 1;
}

if (initialize_custom_character_timer = 1)
{
/*The order of the variables needs to be in reverse alphabetical order, so it shows up in alphabetical order in the config.ini file. This also means that x should be after y*/

#region /*Create directories for the custom character*/

#region /*Create directory for saving character data*/
if (!directory_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Data"))
{
	directory_create(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Data");
}
#endregion /*Create directory for saving characters data END*/

#region /*Create directory for saving character sounds*/
if (!directory_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds"))
{
	directory_create(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sounds");
}
#endregion /*Create directory for saving character sounds END*/

#region /*Create directory for saving character sprites*/
if (!directory_exists(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sprites"))
{
	directory_create(working_directory + "/Custom Characters/Character "+string(custom_character)+"/Sprites");
}
#endregion /*Create directory for saving character sprites END*/

#endregion /*Create directories for the custom character END*/

#region /*Play as Custom Character*/

#region /*Sprite origin point variables*/

if (file_exists("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini"))
or(file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini"))
	{
		ini_open("Characters/Character "+string(custom_character)+"/Data/sprite_origin_point.ini");
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini"))
	{
		ini_open(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Data/sprite_origin_point.ini");
	}
	
	#region /*Sprite map x and y origin points*/
	#region /*Sprite map x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_xorig"))
	{
		sprite_map_xorig = ini_read_real("sprite origin points", "sprite_map_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_xorig", 0);
		sprite_map_xorig = 0;
	}
	#endregion /*Sprite map x origin point END*/

	#region /*Sprite map y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_yorig"))
	{
		sprite_map_yorig = ini_read_real("sprite origin points", "sprite_map_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_yorig", 0);
		sprite_map_yorig = 0;
	}
	#endregion /*Sprite map y origin point END*/
	#endregion /*Sprite map x and y origin points END*/
	
	#region /*Sprite map enter level x and y origin points*/
	#region /*Sprite map enter level x origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_enter_level_xorig"))
	{
		sprite_map_enter_level_xorig = ini_read_real("sprite origin points", "sprite_map_enter_level_xorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_enter_level_xorig", 0);
		sprite_map_enter_level_xorig = 0;
	}
	#endregion /*Sprite map enter level x origin point END*/

	#region /*Sprite map enter level y origin point*/
	if (ini_key_exists("sprite origin points", "sprite_map_enter_level_yorig"))
	{
		sprite_map_enter_level_yorig = ini_read_real("sprite origin points", "sprite_map_enter_level_yorig", 0);
	}
	else
	{
		//ini_write_real("sprite origin points", "sprite_map_enter_level_yorig", 0);
		sprite_map_enter_level_yorig = 0;
	}
	#endregion /*Sprite map enter level y origin point END*/
	#endregion /*Sprite map enter level x and y origin points END*/
	
	ini_close();
}

#region /*If there is no config.ini file, then make every xorig and yorig variable zero*/
else
{
	sprite_map_xorig = 0;
	sprite_map_yorig = 0;
	sprite_map_enter_level_xorig = 0;
	sprite_map_enter_level_yorig = 0;
}
#endregion /*If there is no config.ini file, then make every xorig and yorig variable zero END*/

#endregion /*Sprite origin point variables END*/

#region /*Sprite variables*/

#region /*Map sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/map_strip"+string(index)+".png"))
	{
		sprite_map = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/map_strip"+string(index)+".png", index, false, false, sprite_map_xorig, sprite_map_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_strip"+string(index)+".png"))
	{
		sprite_map = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_strip"+string(index)+".png", index, false, false, sprite_map_xorig, sprite_map_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/map.png"))
{
	sprite_map = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/map.png", 1, false, false, sprite_map_xorig, sprite_map_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map.png"))
{
	sprite_map = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map.png", 1, false, false, sprite_map_xorig, sprite_map_yorig);
}
#endregion /*Map sprite END*/

#region /*Map enter level sprite*/
index=0
repeat(50)
{
	if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/map_enter_level_strip"+string(index)+".png"))
	{
		sprite_map_enter_level = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/map_enter_level_strip"+string(index)+".png", index, false, false, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
	}
	else
	if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_enter_level_strip"+string(index)+".png"))
	{
		sprite_map_enter_level = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_enter_level_strip"+string(index)+".png", index, false, false, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
	}
	index+=1
}
if (file_exists("Characters/Character "+string(custom_character)+"/Sprites/map_enter_level.png"))
{
	sprite_map_enter_level = sprite_add("Characters/Character "+string(custom_character)+"/Sprites/map_enter_level.png", 1, false, false, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
}
else
if (file_exists(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_enter_level.png"))
{
	sprite_map_enter_level = sprite_add(working_directory + "/Custom Characters/Character "+string(custom_character-global.max_number_of_official_characters)+"/Sprites/map_enter_level.png", 1, false, false, sprite_map_enter_level_xorig, sprite_map_enter_level_yorig);
}
#endregion /*Map enter level sprite END*/

#endregion /*Sprite variables END*/

#endregion /*Play as Custom Character END*/

sprite_index = sprite_map;
}
#endregion /*Initialize Custom Character END*/

#region /*Quit Game*/
if (global.quit_level = true)
{
	global.level_clear_rate = "enter";
	
	#region /*Save Player Position*/
	if (speed = 0)
	{
		ini_open("File" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_close();
	}
	#endregion /*Save Player Position END*/
	
	scr_savelevel();
	global.quit_level = false;
	room_persistent = false;
	if (asset_get_type("room_title") == asset_room)
	{
		room_goto(room_title);
	}
	else
	{
		game_restart();
	}
}
#endregion /*Quit Game END*/

image_blend = global.hex_color_for_player_1; /*Color Skin*/

#region /*Make sure level music and sound effects stops playing*/
if (asset_get_type("snd_slip") == asset_sound)
{
	if (audio_is_playing(snd_slip))
	{
		audio_stop_sound(snd_slip);
	}
}
if (asset_get_type("snd_slip_ice") == asset_sound)
{
	if (audio_is_playing(snd_slip_ice))
	{
		audio_stop_sound(snd_slip_ice);
	}
}
if (asset_get_type("snd_music_titlescreen") == asset_sound)
{
	if (audio_is_playing(snd_music_titlescreen))
	{
		audio_stop_sound(snd_music_titlescreen);
	}
}
if (asset_get_type("snd_music_boss") == asset_sound)
{
	if (audio_is_playing(snd_music_boss))
	{
		audio_stop_sound(snd_music_boss);
	}
}
if (asset_get_type("snd_ambience_nature_day") == asset_sound)
{
	if audio_is_playing(snd_ambience_nature_day)
	{
		audio_stop_sound(snd_ambience_nature_day);
	}
}
if (audio_is_playing(global.music))
{
	audio_stop_sound(global.music);
}
if (audio_is_playing(global.music_underwater))
{
	audio_stop_sound(global.music_underwater);
}
global.music = noone;
global.music_underwater = noone;
#endregion /*Make sure level music stops playing End*/

#region /*Keep the game at 60 FPS*/
room_speed = global.max_fps;

#region /*Deactivate instances outside view*/
instance_activate_all();
instance_deactivate_region(
camera_get_view_x(view_camera[view_current]) - 64,
camera_get_view_y(view_camera[view_current]) - 64,
camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 64,
camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 64,
false, true);
if (asset_get_type("obj_level") == asset_object)
{
	instance_activate_object(obj_level);
}
#endregion /*Deactivate instances outside view END*/

#endregion /*Keep the game at 60 FPS END*/

#region /*Hide all HUD elements*/
global.hud_show_lives = true;
global.hud_show_coins = false;
global.hud_show_starcoins = false;
global.hud_show_score = false;
#endregion /*Hide all HUD elements END*/

if (global.goal_active = true)
{
	global.goal_active = false;
}

if (asset_get_type("snd_music_map") == asset_sound)
{
	if (!audio_is_playing(snd_music_map))
	{
		audio_play_sound(snd_music_map, 0, true);
	}
	audio_sound_gain(snd_music_map, global.music_volume, 0);
}

#region /*Keyboard Controls*/
gamepad_set_axis_deadzone(0, 0.50);

#region /*Player 1 Key Left Hold*/
key_left =
(keyboard_check(global.player1_key_left))
and(!keyboard_check(global.player1_key_right))
or(keyboard_check(vk_left))
and(!keyboard_check(vk_right))
or(keyboard_check(ord("A")))
and(!keyboard_check(ord("D")))
or(gamepad_button_check(0, gp_padl))
and(!gamepad_button_check(0, gp_padr))
or(gamepad_axis_value(0, gp_axislh) < 0);
#endregion /*Player 1 Key Left Hold END*/

#region /*Player 1 Key Right Hold*/
key_right =
(keyboard_check(global.player1_key_right))
and(!keyboard_check(global.player1_key_left))
or(keyboard_check(vk_right))
and(!keyboard_check(vk_left))
or(keyboard_check(ord("D")))
and(!keyboard_check(ord("A")))
or(gamepad_button_check(0, gp_padr))
and(!gamepad_button_check(0, gp_padl))
or(gamepad_axis_value(0, gp_axislh) > 0);
#endregion /*Player 1 Key Right Hold END*/

#region /*Player 1 Key Down Hold*/
key_down =
(keyboard_check(global.player1_key_down))
and(!keyboard_check(global.player1_key_up))
or(keyboard_check(vk_down))
and(!keyboard_check(vk_up))
or(keyboard_check(ord("S")))
and(!keyboard_check(ord("W")))
or(gamepad_button_check(0, gp_padd))
and(!gamepad_button_check(0, gp_padu))
or(gamepad_axis_value(0, gp_axislv) > 0);
#endregion /*Player 1 Key Down Hold END*/

#region /*Player 1 Key Up Hold*/
key_up =
(keyboard_check(global.player1_key_up))
and(!keyboard_check(global.player1_key_down))
or(keyboard_check(vk_up))
and(!keyboard_check(vk_down))
or(keyboard_check(ord("W")))
and(!keyboard_check(ord("S")))
or(gamepad_button_check(0, gp_padu))
and(!gamepad_button_check(0, gp_padd))
or(gamepad_axis_value(0, gp_axislv) < 0);
#endregion /*Player 1 Key Up Hold END*/

#region /*Player 1 Key Accept Pressed*/
key_a_pressed =
(gamepad_button_check_pressed(0, gp_face1))
or(gamepad_button_check_pressed(0, gp_face2))
or(keyboard_check_pressed(global.player1_key_jump))
or(keyboard_check_pressed(global.player1_key2_jump))
or(keyboard_check_pressed(vk_space))
or(keyboard_check_pressed(vk_enter))
or(keyboard_check_pressed(ord("Z")));
#endregion /*Player 1 Key Accept Pressed END*/

#region /*Player 1 Key Back Pressed*/
key_b_pressed =
(gamepad_button_check_pressed(0, gp_face3))
or(gamepad_button_check_pressed(0, gp_face4))
or(keyboard_check_pressed(global.player1_key_sprint))
or(keyboard_check_pressed(global.player1_key2_sprint))
or(keyboard_check_pressed(vk_backspace))
or(keyboard_check_pressed(vk_escape))
or(keyboard_check_pressed(ord("X")));
#endregion /*Player 1 Key Back Pressed*/

#endregion /*Keyboard Controls END*/

depth = -100;
xx = lerp(xx, x, 0.1);
yy = lerp(yy, y, 0.1);
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
if (sprite_index > noone)
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale, draw_yscale, 0, image_blend, 1);
}

#region /*Pause*/
if (keyboard_check_pressed(vk_escape))
or(gamepad_button_check_pressed(0, gp_start))
or(!window_has_focus())
{
	if (asset_get_type("room_pause")==asset_room)
	{
		global.pause_player = 0;
		global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
		room_persistent = true;
		global.pause_room = room;
		audio_pause_all();
		room_goto(room_pause);
	}
}
else
if (gamepad_button_check_pressed(1, gp_start))
and(asset_get_type("room_pause")==asset_room)
{
	global.pause_player = 1;
	global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	room_goto(room_pause);
}
else
if (gamepad_button_check_pressed(2, gp_start))
and(asset_get_type("room_pause")==asset_room)
{
	global.pause_player = 2;
	global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	room_goto(room_pause);
}
else
if (gamepad_button_check_pressed(3, gp_start))
and(asset_get_type("room_pause")==asset_room)
{
	global.pause_player = 3;
	global.pause_screenshot = sprite_create_from_surface(application_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	room_goto(room_pause);
}
#endregion /*Pause END*/

if (can_move = true)
and(global.pause=false)
and (global.quit_level = false)
{
	if (allow_free_movement = true)
	{
		
		#region /*Free Movement*/
		if (key_up)
		and(point_distance(xx, yy, x, y) < 4)
		and(move_delay > 10)
		{
			if (y > camera_get_view_y(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x, y - 32, obj_wall))
				and(!position_meeting(x, y - 64, obj_wall))
				{
					y -= 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (asset_get_type("snd_bump") == asset_sound)
					{
						if (!audio_is_playing(snd_bump))
						{
							draw_xscale = 1.5;
							draw_yscale = 0.5;
							yy -= 32;
							audio_play_sound(snd_bump, 0, 0);
							audio_sound_gain(snd_bump, global.sfx_volume, 0);
						}
					}
				}
			}
		}
		if (key_left)
		and(point_distance(xx, yy, x, y) < 4)
		and(move_delay > 10)
		{
			if (x > camera_get_view_x(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x - 32, y, obj_wall))
				and(!position_meeting(x - 64, y, obj_wall))
				{
					x -= 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (asset_get_type("snd_bump") == asset_sound)
					{
						if (!audio_is_playing(snd_bump))
						{
							draw_xscale = 0.5;
							draw_yscale = 1.5;
							xx -= 32;
							audio_play_sound(snd_bump, 0, 0);
							audio_sound_gain(snd_bump, global.sfx_volume, 0);
						}
					}
				}
			}
		}
		if (key_right)
		and(point_distance(xx, yy, x, y) < 4)
		and(move_delay > 10)
		{
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x + 32, y, obj_wall))
				and(!position_meeting(x + 64, y, obj_wall))
				{
					x += 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (asset_get_type("snd_bump") == asset_sound)
					{
						if (!audio_is_playing(snd_bump))
						{
							draw_xscale = 0.5;
							draw_yscale = 1.5;
							xx += 32;
							audio_play_sound(snd_bump, 0, 0);
							audio_sound_gain(snd_bump, global.sfx_volume, 0);
						}
					}
				}
			}
		}
		if (key_down)
		and(point_distance(xx, yy, x, y) < 4)
		and(move_delay > 10)
		{
			if (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x, y + 32, obj_wall))
				and(!position_meeting(x, y + 64, obj_wall))
				{
					y += 64;
					move_delay = 0;
					transfer_data = false;
				}
				else
				{
					if (asset_get_type("snd_bump") == asset_sound)
					{
						if (!audio_is_playing(snd_bump))
						{
							draw_xscale = 1.5;
							draw_yscale = 0.5;
							yy += 32;
							audio_play_sound(snd_bump, 0, 0);
							audio_sound_gain(snd_bump, global.sfx_volume, 0);
						}
					}
				}
			}
		}
		#endregion /*Free Movement END*/
		
	}
	else
	{
		
		#region /*Movement on paths*/
		if (key_up)
		and(move_delay > 10)
		and(speed = 0)
		{
			if (y > camera_get_view_y(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x, y - 32, obj_wall))
				{
					vspeed -= 8;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and(!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sfx_volume, 0);
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy -= 32;
				}
			}
		}
		if (key_left)
		and(move_delay > 10)
		and(speed = 0)
		{
			if (x > camera_get_view_x(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x - 32, y, obj_wall))
				{
					hspeed -= 8;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and(!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sfx_volume, 0);
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx -= 32;
				}
			}
		}
		if (key_right)
		and(move_delay > 10)
		and(speed = 0)
		{
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x + 32, y, obj_wall))
				{
					hspeed += 8;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and(!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sfx_volume, 0);
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx += 32;
				}
			}
		}
		if (key_down)
		and(move_delay > 10)
		and(speed = 0)
		{
			if (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x, y + 32, obj_wall))
				{
					vspeed += 8;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and(!audio_is_playing(snd_bump))
				{
					audio_play_sound(snd_bump, 0, 0);
					audio_sound_gain(snd_bump, global.sfx_volume, 0);
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy += 32;
				}
			}
		}
		#endregion /*Movement on paths END*/

		#region /*Show controls for where you can go*/
		if (move_delay > 10)
		and(speed = 0)
		{
			if (asset_get_type("obj_wall") == asset_object)
			and(!place_meeting(x + 4, y, obj_wall))
			and(speed = 0)
			{
				
				#region /*Key Right*/
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 6, x + 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /*Key Right END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and(!place_meeting(x - 4, y, obj_wall))
			and(speed = 0)
			{
				
				#region /*Key Left*/
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 4, x - 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				else
				
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /*Key Left END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and(!place_meeting(x, y + 4, obj_wall))
			and(speed = 0)
			{
				
				#region /*Key Down*/
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 7, x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /*Key Down END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and(!place_meeting(x, y - 4, obj_wall))
			and(speed = 0)
			{
				
				#region /*Key Up*/
				if (gamepad_is_connected(0))
				and(asset_get_type("spr_xbox_buttons") == asset_sprite)
				{
					draw_sprite_ext(spr_xbox_buttons, 5, x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				#endregion /*Key Up END*/
				
			}
		}
		#endregion /*Show controls for where you can go END*/
		
	}
}

#region /*Stop player when touching level*/
if (instance_exists(obj_level))
and(place_meeting(x,y,obj_level))
and(stop_at_level = false)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	stop_at_level = true;
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
}
if (instance_exists(obj_level))
and(!place_meeting(x,y,obj_level))
{
	stop_at_level = false;
}
#endregion /*Stop player when touching level END*/

#region /*Path Turning*/

/*
right down = 0
up right = 1
up left = 2
left down = 3
*/

#region /*Touch Map Turn Right Down*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and(place_meeting(x, y, obj_map_path_turn))
and(instance_nearest(x, y, obj_map_path_turn).turn=0) /*Right Down = 0*/
{
	if (abs(hspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = +8;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = +8;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /*Touch Map Turn Right Down END*/

else

#region /*Touch Map Turn Up Right*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and(place_meeting(x, y, obj_map_path_turn))
and(instance_nearest(x, y, obj_map_path_turn).turn=1) /*Up Right = 1*/
{
	if (abs(hspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = -8;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = +8;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Up Right END*/

else

#region /*Touch Map Turn Up Left*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and(place_meeting(x, y, obj_map_path_turn))
and(instance_nearest(x, y, obj_map_path_turn).turn=2) /*Up Left = 2*/
{
	if (abs(hspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = -8;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = -8;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Up Left END*/

else

#region /*Touch Map Turn Left Down*/
if (asset_get_type("obj_map_path_turn") == asset_object)
and(place_meeting(x, y, obj_map_path_turn))
and(instance_nearest(x, y, obj_map_path_turn).turn=3) /*Left Down = 3*/
{
	if (abs(hspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = 0;
		vspeed = +8;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
	else
	if (abs(vspeed) > 0)
	and(instance_nearest(x, y, obj_map_path_turn).delay = 0)
	{
		hspeed = -8;
		vspeed = 0;
		if (instance_nearest(x, y, obj_map_path_turn).delay = 0)
		{
			x = instance_nearest(x, y, obj_map_path_turn).x;
			y = instance_nearest(x, y, obj_map_path_turn).y;
			with(instance_nearest(x, y, obj_map_path_turn))
			{
				delay = 10;
			}
		}
	}
}
#endregion /*Touch Map Turn Left Down END*/

#endregion /*Path Turning END*/

if (can_move = false)
if (delay < 100)
{
	delay += 1;
}

#region /*Enter Level*/
if (key_a_pressed)
and(can_move = true)
and(can_enter_level >= 30)
and(asset_get_type("obj_level") == asset_object)
and(distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and(speed = 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate = "enter")
	or(instance_nearest(x, y, obj_level).clear_rate = "clear")
	{
		global.current_level = instance_nearest(x, y, obj_level).level;
			
		#region /*Save Player Position*/
		x = instance_nearest(x, y, obj_level).x;
		y = instance_nearest(x, y, obj_level).y;
		ini_open("File" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_close();
		#endregion /*Save Player Position END*/
			
		can_move = false;
		entering_level = true;
		delay = 0;
		score = 0;
		global.spikes_emerge_time = 0;
		global.timeattack_transfer = true;
		global.x_checkpoint = instance_nearest(x, y, obj_level).x_checkpoint;
		global.y_checkpoint = instance_nearest(x, y, obj_level).y_checkpoint;
		with(instance_nearest(x, y, obj_level))
		{
			if (x_checkpoint > 0)
			or(y_checkpoint > 0)
			{
				global.checkpoint_realmillisecond = checkpoint_realmillisecond;
				global.checkpoint_millisecond = checkpoint_millisecond;
				global.checkpoint_second = checkpoint_second;
				global.checkpoint_minute = checkpoint_minute;
			}
		}
		global.big_collectible1 = instance_nearest(x, y, obj_level).big_collectible1;
		global.big_collectible2 = instance_nearest(x, y, obj_level).big_collectible2;
		global.big_collectible3 = instance_nearest(x, y, obj_level).big_collectible3;
		global.big_collectible4 = instance_nearest(x, y, obj_level).big_collectible4;
		global.big_collectible5 = instance_nearest(x, y, obj_level).big_collectible5;
		global.lives_until_assist = instance_nearest(x, y, obj_level).lives_until_assist;
	}
}
#endregion /*Enter Level END*/

#region /*After pressing "Enter Level", the iris should shrink and then start the level*/
if (can_move = false)
and(entering_level = true)
and(delay >= 60)
and(iris_yscale <= 0.001)
and(asset_get_type("obj_level") == asset_object)
and(global.quit_level = false)
{
	audio_stop_all();
	global.trigger_demo_ending = 0;
	global.level_editor_level = instance_nearest(x, y, obj_level).level;
	entering_level = false;
	can_move = true;
	global.pause=false;
	global.quit_level = false;
	
	#region /*Update All Backgrounds*/
			
	sprite_delete(global.custom_background1);
	sprite_delete(global.custom_background2);
	sprite_delete(global.custom_background3);
	sprite_delete(global.custom_background4);
	sprite_delete(global.custom_foreground1);
	sprite_delete(global.custom_foreground2);
			
	if (global.character_select_in_this_menu="game")
	{
			
	#region /*Update Background1*/
	/*BMP small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.bmp")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.bmp")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.png")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.png")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.gif")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.gif")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.jpg")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.jpg")){global.custom_background1=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background1=noone;
	}
	#endregion /*Update Background1 END*/
			
	#region /*Update Background2*/
	/*BMP small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.bmp")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.bmp")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.png")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.png")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.gif")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.gif")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.jpg")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.jpg")){global.custom_background2=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background2=noone;
	}
	#endregion /*Update Background2 END*/
			
	#region /*Update Background3*/
	/*BMP small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.bmp")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.bmp")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.png")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.png")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.gif")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.gif")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.jpg")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.jpg")){global.custom_background3=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background3=noone;
	}
	#endregion /*Update Background3 END*/
			
	#region /*Update Background4*/
	/*BMP small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.bmp")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.bmp")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.png")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.png")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.gif")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.gif")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.jpg")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.jpg")){global.custom_background4=sprite_add("Levels/Level" +string(global.level_editor_level)+"/Backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background4=noone;
	}
	#endregion /*Update Background4 END*/
			
	#region /*Update Foreground1*/
			
	#region /*BMP small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if (file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground1 = noone;
	}
			
	#endregion /*Update Foreround1 END*/
			
	#region /*Update Foreground2*/
			
	#region /*BMP small letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if file_exists("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add("Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground2 = noone;
	}
			
	#endregion /*Update Foreround2 END*/
			
	}
			
	else
	if (global.character_select_in_this_menu="level_editor")
	{
			
	#region /*Update Background1*/
	/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background1=noone;
	}
	#endregion /*Update Background1 END*/
			
	#region /*Update Background2*/
	/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background2=noone;
	}
	#endregion /*Update Background2 END*/
			
	#region /*Update Background3*/
	/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background3=noone;
	}
	#endregion /*Update Background3 END*/
			
	#region /*Update Background4*/
	/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
	/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
	{
		global.custom_background4=noone;
	}
	#endregion /*Update Background4 END*/
			
	#region /*Update Foreground1*/
			
	#region /*BMP small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg"))
	{
		global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground1 = noone;
	}
			
	#endregion /*Update Foreround1 END*/
			
	#region /*Update Foreground2*/
			
	#region /*BMP small letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP small letter File END*/
			
	#region /*BMP big letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*BMP big letter File END*/
			
	#region /*PNG small letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG small letter File END*/
			
	#region /*PNG big letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*PNG big letter File END*/
			
	#region /*GIF small letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF small letter File END*/
			
	#region /*GIF big letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*GIF big letter File END*/
			
	#region /*JPG small letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG small letter File END*/
			
	#region /*JPG big letter File*/
	if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg")
	{
		global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
	}
	else
	#endregion /*JPG big letter File END*/
			
	{
		global.custom_foreground2 = noone;
	}
			
	#endregion /*Update Foreround2 END*/
			
	}
			
	#endregion /*Update All Backgrounds END*/
	
	#region /*Custom Level Tileset File*/
	sprite_delete(global.custom_tileset);
		
	if (global.character_select_in_this_menu="game")
	and(file_exists("Levels/Level" +string(global.level_editor_level)+"/Tilesets/ground_tileset.png"))
	{
		global.custom_tileset = sprite_add("Levels/Level" +string(global.level_editor_level)+"/Tilesets/ground_tileset.png",0,false,false,0,0);
	}
	else
	if (global.character_select_in_this_menu="level_editor")
	and(file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png"))
	{
		global.custom_tileset = sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png",0,false,false,0,0);
	}
	else
	{
		global.custom_tileset = noone;
	}
	#endregion /*Custom Level Tileset File END*/
	
	if (asset_get_type("room_leveleditor") == asset_room)
	{
		global.actually_play_edited_level=true;
		global.play_edited_level=false;
		room_goto(room_leveleditor);
	}
}
#endregion /*After pressing "Enter Level", the iris should shrink and then start the level END*/

if (entering_level = true)
{
	sprite_index = sprite_map_enter_level;
}
else
{
	sprite_index = sprite_map;
}

if (move_delay < 50)
{
	move_delay += 1;
}
if (can_enter_level < 30)
{
	can_enter_level += 1;
}

if (asset_get_type("obj_level") == asset_object)
and(distance_to_object(instance_nearest(xx, yy, obj_level)) > 32)
{
	global.level_clear_rate = noone;
	global.x_checkpoint = false;
	global.y_checkpoint = false;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;
	global.timeattack_realmillisecond = 999999999;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	global.lives_until_assist = 0;
	can_move = true;
	delay = 0;
	transfer_data = false;
}

mask_index = spr_wall;

#region /*Show Level Info*/

/*Show high scores*/
if (asset_get_type("obj_level") == asset_object)
and(distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and(move_delay > 10)
{
	if (instance_nearest(x, y, obj_level).clear_rate = "enter")
	or (instance_nearest(x, y, obj_level).clear_rate = "clear")
	{

		draw_set_halign(fa_center);
		draw_set_valign(fa_center);

		#region /*Show High Score*/
		if (instance_nearest(x, y, obj_level).level_score > 0)
		{
			draw_text_outlined(x, y - 64, "Best Score: " + string(instance_nearest(x, y, obj_level).level_score), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Show High Score END*/

		#region /*Show Fastest Time*/
		if (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		and(instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		{
			draw_text_outlined(x, y - 96, "Best Time: " + string(instance_nearest(x, y, obj_level).timeattack_minute) + ":" + string(instance_nearest(x, y, obj_level).timeattack_second) + "." + string(instance_nearest(x, y, obj_level).timeattack_millisecond), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Show Fastest Time END*/

		#region /*Show Star Coin*/
		if (asset_get_type("spr_big_collectible") == asset_sprite)
		{
			if (instance_nearest(x, y, obj_level).big_collectible1 = true)
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) - 48 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) - 48 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible2 = true)
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) - 24 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) - 24 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible3 = true)
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible4 = true)
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 24 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 24 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible5 = true)
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 48 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_big_collectible, 0, camera_get_view_x(view_camera[view_current]) + 48 + 74, camera_get_view_y(view_camera[view_current]) + 64, 0.3, 0.3, 0, c_gray, 0.5);
			}
		}
		#endregion /*Show Star Coin END*/

		#region /*Show if Checkpoint is activated*/
		if (instance_nearest(x, y, obj_level).x_checkpoint > 0)
		and(asset_get_type("spr_checkpoint") == asset_sprite)
		or(instance_nearest(x, y, obj_level).y_checkpoint > 0)
		and(asset_get_type("spr_checkpoint") == asset_sprite)
		{
			draw_sprite_ext(spr_checkpoint, 1, x + 152, y - 64, 0.3, 0.3, 0, c_white, 1);
		}
		#endregion /*Show if Checkpoint is activated END*/
		
	}
}
#endregion /*Show Level Info END*/

#region /*Show View Gallery Key*/
if (can_move = true)
and(asset_get_type("obj_artwork_collection") == asset_object)
and(distance_to_object(instance_nearest(x, y, obj_artwork_collection)) < 4)
and(speed = 0)
and(instance_nearest(x, y, obj_artwork_collection).can_navigate = false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed_colour(camera_get_view_x(view_camera[view_current]) + 80 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28, "View Gallery:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(camera_get_view_x(view_camera[view_current]) + 80 + 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28, "View Gallery:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(camera_get_view_x(view_camera[view_current]) + 80, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28 - 2, "View Gallery:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(camera_get_view_x(view_camera[view_current]) + 80, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28 + 2, "View Gallery:", global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(camera_get_view_x(view_camera[view_current]) + 80, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28, "View Gallery:", global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
	if (gamepad_is_connected(0))
	and(asset_get_type("spr_xbox_buttons") == asset_sprite)
	{
		draw_sprite_ext(spr_xbox_buttons, 0, camera_get_view_x(view_camera[view_current]) + 170, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28, 0.5, 0.5, 0, c_white, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, camera_get_view_x(view_camera[view_current]) + 170, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 28, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /*Show View Gallery Key END*/

#region /*If player object is present, destroy the player object*/
if (asset_get_type("obj_player") == asset_object)
and(instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy()
	}
}
#endregion /*If player object is present, destroy the player object END*/

if (global.trigger_ending = true)
and(asset_get_type("room_ending_cutscene") == asset_room)
{
	room_goto(room_ending_cutscene);
}

#region /*Starting Levels*/
if (asset_get_type("obj_level") == asset_object)
{
	with(obj_level)
	{
		if (clear_rate = "closed")
		and(level = 1)
		{
			clear_rate = "enter";
		}
	}
}
#endregion /*Starting Levels END*/

#region /*Give the player lives if they get a game over*/
if (lives <= 0)
{
	if (global.playergame <= 0)
	{
		lives = 5;
	}
	else
	if (global.playergame = 1)
	{
		lives = 10;
	}
	else
	if (global.playergame = 2)
	{
		lives = 15;
	}
	else
	if (global.playergame >= 3)
	{
		lives = 20;
	}
}
#endregion /*Give the player lives if they get a game over END*/

#region /*Zoom In*/
if (entering_level = true)
{
	if (iris_zoom = 1)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.15);
		iris_yscale = lerp(iris_yscale, 1, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.15);
		iris_yscale = lerp(iris_yscale, 0, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
}
#endregion /*Zoom In End*/

else

#region /*Zoom Out*/
if (iris_zoom = 0)
{
	iris_xscale = lerp(iris_xscale, 1, 0.15);
	iris_yscale = lerp(iris_yscale, 1, 0.15);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
else
{
	iris_xscale = lerp(iris_xscale, 32, 0.015);
	iris_yscale = lerp(iris_yscale, 32, 0.015);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
#endregion /*Zoom Out End*/

#region /*Draw Iris Transitions*/
if (global.enable_transitions = true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
		}
		draw_rectangle_colour(0, 0, room_width, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_colour(0, 0, xx - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_colour(xx + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_colour(0, yy + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /*Draw Iris Transitions END*/