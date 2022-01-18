scr_set_screen_size();

if (current_file != global.file)
or (!file_exists("file" + string(current_file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false;
	room_restart();
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera")==asset_object)
and (!instance_exists(obj_camera))
and (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config","fullscreen_mode",window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

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
	global.controls_used_for_menu_navigation = "keyboard";
}
else
if (mouse_check_button(mb_any))
or (mouse_wheel_down())
or (mouse_wheel_up())
or (mouse_moving)
{
	global.controls_used_for_menu_navigation = "mouse";
}
else
if (gamepad_button_check(0,gp_face1))
or (gamepad_button_check(0,gp_face2))
or (gamepad_button_check(0,gp_face3))
or (gamepad_button_check(0,gp_face4))
or (gamepad_button_check(0,gp_padd))
or (gamepad_button_check(0,gp_padl))
or (gamepad_button_check(0,gp_padr))
or (gamepad_button_check(0,gp_padu))
or (gamepad_button_check(0,gp_select))
or (gamepad_button_check(0,gp_shoulderl))
or (gamepad_button_check(0,gp_shoulderlb))
or (gamepad_button_check(0,gp_shoulderr))
or (gamepad_button_check(0,gp_shoulderrb))
or (gamepad_button_check(0,gp_start))
or (gamepad_button_check(0,gp_stickl))
or (gamepad_button_check(0,gp_stickr))
or (gamepad_axis_value(0,gp_axislh)<>0)
or (gamepad_axis_value(0,gp_axislv)<>0)
or (gamepad_axis_value(0,gp_axisrh)<>0)
or (gamepad_axis_value(0,gp_axisrv)<>0)
{
	global.controls_used_for_menu_navigation = "controller";
}
#endregion /*Set what controls are used to navigate the menus END*/

#region /*Quit Game*/
if (global.quit_level = true)
{
	global.level_clear_rate = "enter";
	
	#region /*Save Player Position*/
	if (speed = 0)
	{
		ini_open("file" + string(global.file) + ".ini");
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

#region /*Make sure level music and sound effects stops playing*/
if (asset_get_type("snd_slip") == asset_sound)
{
	audio_stop_sound(snd_skidding);
}
if (asset_get_type("snd_slip_ice") == asset_sound)
{
	audio_stop_sound(snd_skidding_ice);
}
if (asset_get_type("snd_music_titlescreen") == asset_sound)
{
	audio_stop_sound(snd_music_titlescreen);
}
if (asset_get_type("snd_music_boss") == asset_sound)
{
	audio_stop_sound(snd_music_boss);
}
audio_stop_sound(global.music);
audio_stop_sound(global.music_underwater);
audio_stop_sound(global.ambience);
audio_stop_sound(global.ambience_underwater);
global.music = noone;
global.music_underwater = noone;
global.ambience = noone;
global.ambience_underwater = noone;
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
global.hud_show_deaths = true;
global.hud_show_basic_collectibles = false;
global.hud_show_big_collectibles = false;
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
gamepad_set_axis_deadzone(1, 0.50);
gamepad_set_axis_deadzone(2, 0.50);
gamepad_set_axis_deadzone(3, 0.50);

if (global.player1_can_play = true)
{
	/*Player 1 Key Left Hold*/ key_left = (keyboard_check(global.player1_key_left)) and (!keyboard_check(global.player1_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(0, gp_padl)) and (!gamepad_button_check(0, gp_padr)) or (gamepad_axis_value(0, gp_axislh) < 0);
	/*Player 1 Key Right Hold*/ key_right = (keyboard_check(global.player1_key_right)) and (!keyboard_check(global.player1_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(0, gp_padr)) and (!gamepad_button_check(0, gp_padl)) or (gamepad_axis_value(0, gp_axislh) > 0);
	/*Player 1 Key Down Hold*/ key_down = (keyboard_check(global.player1_key_down)) and (!keyboard_check(global.player1_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(0, gp_padd)) and (!gamepad_button_check(0, gp_padu)) or (gamepad_axis_value(0, gp_axislv) > 0);
	/*Player 1 Key Up Hold*/ key_up = (keyboard_check(global.player1_key_up)) and (!keyboard_check(global.player1_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(0, gp_padu)) and (!gamepad_button_check(0, gp_padd)) or (gamepad_axis_value(0, gp_axislv) < 0);
	/*Player 1 Key Accept Pressed*/ key_a_pressed = (gamepad_button_check_pressed(0, gp_face1)) or (keyboard_check_pressed(global.player1_key_jump)) or (keyboard_check_pressed(global.player1_key2_jump)) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(ord("Z")));
	/*Player 1 Key Back Pressed*/ key_b_pressed = (gamepad_button_check_pressed(0, gp_face2)) or (keyboard_check_pressed(global.player1_key_dive)) or (keyboard_check_pressed(global.player1_key2_dive)) or (keyboard_check_pressed(global.player1_key_sprint)) or (keyboard_check_pressed(global.player1_key2_sprint)) or (keyboard_check_pressed(vk_backspace)) or (keyboard_check_pressed(vk_escape)) or (keyboard_check_pressed(ord("X")));
}
else
if (global.player2_can_play = true)
{
	/*Player 2 Key Left Hold*/ key_left = (keyboard_check(global.player2_key_left)) and (!keyboard_check(global.player2_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(1, gp_padl)) and (!gamepad_button_check(1, gp_padr)) or (gamepad_axis_value(1, gp_axislh) < 0);
	/*Player 2 Key Right Hold*/ key_right = (keyboard_check(global.player2_key_right)) and (!keyboard_check(global.player2_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(1, gp_padr)) and (!gamepad_button_check(1, gp_padl)) or (gamepad_axis_value(1, gp_axislh) > 0);
	/*Player 2 Key Down Hold*/ key_down = (keyboard_check(global.player2_key_down)) and (!keyboard_check(global.player2_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(1, gp_padd)) and (!gamepad_button_check(1, gp_padu)) or (gamepad_axis_value(1, gp_axislv) > 0);
	/*Player 2 Key Up Hold*/ key_up = (keyboard_check(global.player2_key_up)) and (!keyboard_check(global.player2_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(1, gp_padu)) and (!gamepad_button_check(1, gp_padd)) or (gamepad_axis_value(1, gp_axislv) < 0);
	/*Player 2 Key Accept Pressed*/ key_a_pressed = (gamepad_button_check_pressed(1, gp_face1)) or (keyboard_check_pressed(global.player2_key_jump)) or (keyboard_check_pressed(global.player2_key2_jump)) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(ord("Z")));
	/*Player 2 Key Back Pressed*/ key_b_pressed = (gamepad_button_check_pressed(1, gp_face2)) or (keyboard_check_pressed(global.player2_key_dive)) or (keyboard_check_pressed(global.player2_key2_dive)) or (keyboard_check_pressed(global.player2_key_sprint)) or (keyboard_check_pressed(global.player2_key2_sprint)) or (keyboard_check_pressed(vk_backspace)) or (keyboard_check_pressed(vk_escape)) or (keyboard_check_pressed(ord("X")));
}
else
if (global.player3_can_play = true)
{
	/*Player 3 Key Left Hold*/ key_left = (keyboard_check(global.player3_key_left)) and (!keyboard_check(global.player3_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(2, gp_padl)) and (!gamepad_button_check(2, gp_padr)) or (gamepad_axis_value(2, gp_axislh) < 0);
	/*Player 3 Key Right Hold*/ key_right = (keyboard_check(global.player3_key_right)) and (!keyboard_check(global.player3_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(2, gp_padr)) and (!gamepad_button_check(2, gp_padl)) or (gamepad_axis_value(2, gp_axislh) > 0);
	/*Player 3 Key Down Hold*/ key_down = (keyboard_check(global.player3_key_down)) and (!keyboard_check(global.player3_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(2, gp_padd)) and (!gamepad_button_check(2, gp_padu)) or (gamepad_axis_value(2, gp_axislv) > 0);
	/*Player 3 Key Up Hold*/ key_up = (keyboard_check(global.player3_key_up)) and (!keyboard_check(global.player3_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(2, gp_padu)) and (!gamepad_button_check(2, gp_padd)) or (gamepad_axis_value(2, gp_axislv) < 0);
	/*Player 3 Key Accept Pressed*/ key_a_pressed = (gamepad_button_check_pressed(2, gp_face1)) or (keyboard_check_pressed(global.player3_key_jump)) or (keyboard_check_pressed(global.player3_key2_jump)) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(ord("Z")));
	/*Player 3 Key Back Pressed*/ key_b_pressed = (gamepad_button_check_pressed(2, gp_face2)) or (keyboard_check_pressed(global.player3_key_dive)) or (keyboard_check_pressed(global.player3_key2_dive)) or (keyboard_check_pressed(global.player3_key_sprint)) or (keyboard_check_pressed(global.player3_key2_sprint)) or (keyboard_check_pressed(vk_backspace)) or (keyboard_check_pressed(vk_escape)) or (keyboard_check_pressed(ord("X")));
}
else
if (global.player4_can_play = true)
{
	/*Player 4 Key Left Hold*/ key_left = (keyboard_check(global.player4_key_left)) and (!keyboard_check(global.player4_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(3, gp_padl)) and (!gamepad_button_check(3, gp_padr)) or (gamepad_axis_value(3, gp_axislh) < 0);
	/*Player 4 Key Right Hold*/ key_right = (keyboard_check(global.player4_key_right)) and (!keyboard_check(global.player4_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(3, gp_padr)) and (!gamepad_button_check(3, gp_padl)) or (gamepad_axis_value(3, gp_axislh) > 0);
	/*Player 4 Key Down Hold*/ key_down = (keyboard_check(global.player4_key_down)) and (!keyboard_check(global.player4_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(3, gp_padd)) and (!gamepad_button_check(3, gp_padu)) or (gamepad_axis_value(3, gp_axislv) > 0);
	/*Player 4 Key Up Hold*/ key_up = (keyboard_check(global.player4_key_up)) and (!keyboard_check(global.player4_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(3, gp_padu)) and (!gamepad_button_check(3, gp_padd)) or (gamepad_axis_value(3, gp_axislv) < 0);
	/*Player 4 Key Accept Pressed*/ key_a_pressed = (gamepad_button_check_pressed(3, gp_face1)) or (keyboard_check_pressed(global.player4_key_jump)) or (keyboard_check_pressed(global.player4_key2_jump)) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(vk_enter)) or (keyboard_check_pressed(ord("Z")));
	/*Player 4 Key Back Pressed*/ key_b_pressed = (gamepad_button_check_pressed(3, gp_face2)) or (keyboard_check_pressed(global.player4_key_dive)) or (keyboard_check_pressed(global.player4_key2_dive)) or (keyboard_check_pressed(global.player4_key_sprint)) or (keyboard_check_pressed(global.player4_key2_sprint)) or (keyboard_check_pressed(vk_backspace)) or (keyboard_check_pressed(vk_escape)) or (keyboard_check_pressed(ord("X")));
}

#endregion /*Keyboard Controls END*/

xx = lerp(xx, x, 0.1);
yy = lerp(yy, y, 0.1);
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
if (sprite_index >= 0)
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale*default_xscale, draw_yscale*default_yscale, 0, image_blend, 1);
}

#region /*Pause*/
if (keyboard_check_pressed(vk_escape))
or (gamepad_button_check_pressed(0, gp_start))
or (!window_has_focus())
and (global.automatically_pause_when_window_is_unfocused = true)
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
and (asset_get_type("room_pause")==asset_room)
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
and (asset_get_type("room_pause")==asset_room)
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
and (asset_get_type("room_pause")==asset_room)
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
and (global.pause=false)
and (global.quit_level = false)
{
	if (allow_free_movement = true)
	{
		
		#region /*Free Movement*/
		if (key_up)
		and (point_distance(xx, yy, x, y) < 4)
		and (move_delay > 10)
		{
			if (y > camera_get_view_y(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x, y - 32, obj_wall))
				and (!position_meeting(x, y - 64, obj_wall))
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
		and (point_distance(xx, yy, x, y) < 4)
		and (move_delay > 10)
		{
			if (x > camera_get_view_x(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x - 32, y, obj_wall))
				and (!position_meeting(x - 64, y, obj_wall))
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
		and (point_distance(xx, yy, x, y) < 4)
		and (move_delay > 10)
		{
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x + 32, y, obj_wall))
				and (!position_meeting(x + 64, y, obj_wall))
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
		and (point_distance(xx, yy, x, y) < 4)
		and (move_delay > 10)
		{
			if (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x, y + 32, obj_wall))
				and (!position_meeting(x, y + 64, obj_wall))
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
		and (move_delay > 10)
		and (speed = 0)
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
				and (!audio_is_playing(snd_bump))
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
		and (move_delay > 10)
		and (speed = 0)
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
				and (!audio_is_playing(snd_bump))
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
		and (move_delay > 10)
		and (speed = 0)
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
				and (!audio_is_playing(snd_bump))
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
		and (move_delay > 10)
		and (speed = 0)
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
				and (!audio_is_playing(snd_bump))
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
		and (speed = 0)
		{
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x + 4, y, obj_wall))
			and (speed = 0)
			{
				
				#region /*Key Right*/
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 6, x + 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play = true)
					{
						if (global.player1_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key2_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player2_can_play = true)
					{
						if (global.player2_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player3_can_play = true)
					{
						if (global.player3_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player4_can_play = true)
					{
						if (global.player4_key_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_right > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_right, x + 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /*Key Right END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x - 4, y, obj_wall))
			and (speed = 0)
			{
				
				#region /*Key Left*/
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 4, x - 64, y, 0.5, 0.5, 0, c_white, 1);
				}
				else
				
				{
					if (global.player1_can_play = true)
					{
						if (global.player1_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player1_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player1_key2_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player2_can_play = true)
					{
						if (global.player2_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player2_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player2_key2_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player3_can_play = true)
					{
						if (global.player3_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player3_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player3_key2_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
					else
					if (global.player4_can_play = true)
					{
						if (global.player4_key_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
						else
						if (global.player4_key2_left > noone)
						{
							draw_sprite_ext(spr_keyboard_keys, global.player4_key2_left, x - 64, y, 0.5, 0.5, 0, c_white, 1);
						}
					}
				}
				#endregion /*Key Left END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y + 4, obj_wall))
			and (speed = 0)
			{
				
				#region /*Key Down*/
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 7, x, y + 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /*Key Down END*/
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y - 4, obj_wall))
			and (speed = 0)
			{
				
				#region /*Key Up*/
				if (gamepad_is_connected(0))
				and (asset_get_type("spr_xbox_buttons") == asset_sprite)
				and (global.controls_used_for_menu_navigation = "controller")
				{
					draw_sprite_ext(spr_xbox_buttons, 5, x, y - 64, 0.5, 0.5, 0, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_can_play = true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /*Key Up END*/
				
			}
		}
		#endregion /*Show controls for where you can go END*/
		
	}
}

#region /*Stop player when touching level*/
if (instance_exists(obj_level))
and (place_meeting(x,y,obj_level))
and (stop_at_level = false)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	stop_at_level = true;
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	global.current_level_clear_rate = instance_nearest(x,y,obj_level).clear_rate; /*Set the level clear rate to global current clear rate variable for use inside levels, like if a into animation should play or not. Put this code as the last step before closing bracket*/
}
if (instance_exists(obj_level))
and (!place_meeting(x,y,obj_level))
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
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn=0) /*Right Down = 0*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn=1) /*Up Right = 1*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn=2) /*Up Left = 2*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn=3) /*Left Down = 3*/
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
	and (instance_nearest(x, y, obj_map_path_turn).delay = 0)
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
if (file_exists("file" + string(global.file) + ".ini"))
and (brand_new_file = true)
and (can_move = true)
or (key_a_pressed)
and (can_move = true)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed = 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate = "enter")
	or (instance_nearest(x, y, obj_level).clear_rate = "clear")
	{
			
		#region /*Save Player Position*/
		x = instance_nearest(x, y, obj_level).x;
		y = instance_nearest(x, y, obj_level).y;
		ini_open("file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_write_real("Player", "brand_new_file", false)
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
			or (y_checkpoint > 0)
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
		global.increase_number_of_levels_cleared = instance_nearest(x, y, obj_level).increase_number_of_levels_cleared;
	}
}
#endregion /*Enter Level END*/

global.select_level_index = instance_nearest(x, y, obj_level).level;

#region /*After pressing "Enter Level", the iris should shrink and then start the level*/
if (can_move = false)
and (entering_level = true)
and (delay >= 60)
and (iris_yscale <= 0.001)
and (asset_get_type("obj_level") == asset_object)
and (global.quit_level = false)
{
	audio_stop_all();
	global.trigger_demo_ending = 0;
	entering_level = false;
	can_move = true;
	global.pause=false;
	global.quit_level = false;
	
	scr_update_all_backgrounds();
	
	if (asset_get_type("room_leveleditor") == asset_room)
	{
		global.actually_play_edited_level = true;
		global.play_edited_level = false;
		room_goto(room_leveleditor);
	}
}
#endregion /*After pressing "Enter Level", the iris should shrink and then start the level END*/

if (entering_level = true)
{
	if (sprite_map_enter_level > noone)
	{
		sprite_index = sprite_map_enter_level;
	}
	else
	if (sprite_map > noone)
	{
		sprite_index = sprite_map;
	}
	else
	if (sprite_stand > noone)
	{
		sprite_index = sprite_stand;
	}
}
else
{
	if (sprite_map > noone)
	{
		sprite_index = sprite_map;
	}
	else
	if (sprite_stand > noone)
	{
		sprite_index = sprite_stand;
	}
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
and (distance_to_object(instance_nearest(xx, yy, obj_level)) > 32)
{
	global.level_clear_rate = noone;
	global.x_checkpoint = 0;
	global.y_checkpoint = 0;
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
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (move_delay > 10)
and (instance_nearest(x, y, obj_level).level_number > 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate = "enter")
	or (instance_nearest(x, y, obj_level).clear_rate = "clear")
	{
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		if (global.show_deaths_counter = true)
		and (instance_nearest(x, y, obj_level).number_of_deaths > 0)
		{
			total_deaths_y = -64;
			times_cleared_y = -96;
			best_score_y = -128;
			best_time_y = -160;
			show_big_collectibles_y = -192;
		}
		else
		{
			total_deaths_y = 0;
			times_cleared_y = -64;
			best_score_y = -96;
			best_time_y = -128;
			show_big_collectibles_y = -160;
		}
		
		#region /*Total number of deaths*/
		if (global.show_deaths_counter = true)
		and (instance_nearest(x, y, obj_level).number_of_deaths > 0)
		{
			draw_text_outlined(x, y + total_deaths_y, "Total Deaths: " + string(instance_nearest(x, y, obj_level).number_of_deaths), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Total number of deaths END*/
		
		#region /*Number of times played*/
		if (instance_nearest(x, y, obj_level).number_of_clears > 0)
		{
			draw_text_outlined(x, y + times_cleared_y, "Times Cleared: " + string(instance_nearest(x, y, obj_level).number_of_clears), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Number of times played END*/
		
		#region /*Show High Score*/
		if (instance_nearest(x, y, obj_level).level_score > 0)
		{
			draw_text_outlined(x, y + best_score_y, "Best Score: " + string(instance_nearest(x, y, obj_level).level_score), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Show High Score END*/
		
		#region /*Show Fastest Time*/
		if (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		and (instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		{
			draw_text_outlined(x, y + best_time_y, "Best Time: " + string(instance_nearest(x, y, obj_level).timeattack_minute) + ":" +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_second, 2, 0), " ", "0")) + "." +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /*Show Fastest Time END*/
		
		#region /*Show Big Collectible*/
		if (instance_nearest(x, y, obj_level).big_collectible1 = true)
		or (instance_nearest(x, y, obj_level).big_collectible2 = true)
		or (instance_nearest(x, y, obj_level).big_collectible3 = true)
		or (instance_nearest(x, y, obj_level).big_collectible4 = true)
		or (instance_nearest(x, y, obj_level).big_collectible5 = true)
		{
			if (instance_nearest(x, y, obj_level).big_collectible1 = true)
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x - 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x - 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible2 = true)
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x - 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x - 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible3 = true)
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x, y + show_big_collectibles_y, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible4 = true)
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x + 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x + 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_gray, 0.5);
			}
			if (instance_nearest(x, y, obj_level).big_collectible5 = true)
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x + 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(global.resourcepack_sprite_big_collectible, 0, x + 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_gray, 0.5);
			}
		}
		#endregion /*Show Big Collectible END*/
		
	}
}
#endregion /*Show Level Info END*/

#region /*If player object is present, destroy the player object*/
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy()
	}
}
#endregion /*If player object is present, destroy the player object END*/

if (global.trigger_ending = true)
and (asset_get_type("room_ending_cutscene") == asset_room)
{
	room_goto(room_ending_cutscene);
}

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

#region /*Zoom In and Out*/

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

#endregion /*Zoom In and Out END*/

#region /*Draw Iris Transitions*/
if (global.enable_transitions = true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
		}
		draw_rectangle_color (0, 0, room_width, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color (0, 0, xx - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color (xx + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color (0, yy + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /*Draw Iris Transitions END*/