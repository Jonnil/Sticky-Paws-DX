var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* When changing file, you should restart the room so the right save data can load */
if (current_file != global.file)
or (!file_exists(working_directory + "/save_files/file" + string(current_file) + ".ini"))
{
	current_file = global.file;
	room_persistent = false;
	room_restart();
}
#endregion /* When changing file, you should restart the room so the right save data can load END */

#region /* Quit Game */
if (global.quit_level == true)
{
	
	#region /* Save Player Position */
	if (speed == 0)
	{
		ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_close();
	}
	#endregion /* Save Player Position END */
	
	global.quit_level = false;
	room_persistent = false; /* Whenever you quit the game, you need to turn off room persistent */
	if (asset_get_type("room_title") == asset_room)
	{
		room_goto(room_title);
	}
	else
	{
		game_restart();
	}
}
#endregion /* Quit Game END */

#region /* Make sure level music and sound effects stops playing, and play the map screen music */
if (asset_get_type("snd_slip") == asset_sound)
{
	audio_stop_sound(snd_skidding);
}
if (asset_get_type("snd_slip_ice") == asset_sound)
{
	audio_stop_sound(snd_skidding_ice);
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
scr_audio_play(music_map, volume_source.music); /* Play the map screen music */
#endregion /* Make sure level music stops playing, and play the map screen music END */

#region /* Keep the game at 60 FPS */
room_speed = global.max_fps;

#region /* Deactivate instances outside view */
instance_activate_all();
//instance_deactivate_region(
//camera_get_view_x(view_camera[view_current]) - 64,
//camera_get_view_y(view_camera[view_current]) - 64,
//camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 64,
//camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 64,
//false, true);
if (asset_get_type("obj_camera_map") == asset_object)
{
	instance_activate_object(obj_camera_map);
}
if (asset_get_type("obj_level") == asset_object)
{
	instance_activate_object(obj_level);
}
#endregion /* Deactivate instances outside view END */

#region /* Make sure camera map is always present on the map screen. Only run this code after doing the deactivate instances code */
if (asset_get_type("obj_camera_map") == asset_object)
and (!instance_exists(obj_camera_map))
{
	instance_create_depth(x, y, 0, obj_camera_map);
}
#endregion /* Make sure camera map is always present on the map screen. Only run this code after doing the deactivate instances code END */

#endregion /* Keep the game at 60 FPS END */

#region /* Keyboard Controls */
if (global.player1_can_play == true)
{
	/* Player 1 Key Left Hold */ key_left = (keyboard_check(global.player1_key_left)) and (!keyboard_check(global.player1_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(global.player1_slot, gp_padl)) and (!gamepad_button_check(global.player1_slot, gp_padr)) or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0) or (active_left == true);
	/* Player 1 Key Right Hold */ key_right = (keyboard_check(global.player1_key_right)) and (!keyboard_check(global.player1_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(global.player1_slot, gp_padr)) and (!gamepad_button_check(global.player1_slot, gp_padl)) or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0) or (active_right == true);
	/* Player 1 Key Down Hold */ key_down = (keyboard_check(global.player1_key_down)) and (!keyboard_check(global.player1_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(global.player1_slot, gp_padd)) and (!gamepad_button_check(global.player1_slot, gp_padu)) or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0) or (active_down == true);
	/* Player 1 Key Up Hold */ key_up = (keyboard_check(global.player1_key_up)) and (!keyboard_check(global.player1_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(global.player1_slot, gp_padu)) and (!gamepad_button_check(global.player1_slot, gp_padd)) or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0) or (active_up == true);
	/* Player 1 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept)) or (keyboard_check_pressed(global.player1_key_accept)) or (keyboard_check_pressed(global.player1_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 1 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back)) or (keyboard_check_pressed(global.player1_key_back)) or (keyboard_check_pressed(global.player1_key2_back)) or (keyboard_check_pressed(vk_escape));
}
else
if (global.player2_can_play == true)
{
	/* Player 2 Key Left Hold */ key_left = (keyboard_check(global.player2_key_left)) and (!keyboard_check(global.player2_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(global.player2_slot, gp_padl)) and (!gamepad_button_check(global.player2_slot, gp_padr)) or (gamepad_axis_value(global.player2_slot, gp_axislh) < 0) or (active_left == true);
	/* Player 2 Key Right Hold */ key_right = (keyboard_check(global.player2_key_right)) and (!keyboard_check(global.player2_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(global.player2_slot, gp_padr)) and (!gamepad_button_check(global.player2_slot, gp_padl)) or (gamepad_axis_value(global.player2_slot, gp_axislh) > 0) or (active_right == true);
	/* Player 2 Key Down Hold */ key_down = (keyboard_check(global.player2_key_down)) and (!keyboard_check(global.player2_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(global.player2_slot, gp_padd)) and (!gamepad_button_check(global.player2_slot, gp_padu)) or (gamepad_axis_value(global.player2_slot, gp_axislv) > 0) or (active_down == true);
	/* Player 2 Key Up Hold */ key_up = (keyboard_check(global.player2_key_up)) and (!keyboard_check(global.player2_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(global.player2_slot, gp_padu)) and (!gamepad_button_check(global.player2_slot, gp_padd)) or (gamepad_axis_value(global.player2_slot, gp_axislv) < 0) or (active_up == true);
	/* Player 2 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept)) or (keyboard_check_pressed(global.player2_key_accept)) or (keyboard_check_pressed(global.player2_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 2 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back)) or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back)) or (keyboard_check_pressed(global.player2_key_back)) or (keyboard_check_pressed(global.player2_key2_back)) or (keyboard_check_pressed(vk_escape));
}
else
if (global.player3_can_play == true)
{
	/* Player 3 Key Left Hold */ key_left = (keyboard_check(global.player3_key_left)) and (!keyboard_check(global.player3_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(global.player3_slot, gp_padl)) and (!gamepad_button_check(global.player3_slot, gp_padr)) or (gamepad_axis_value(global.player3_slot, gp_axislh) < 0) or (active_left == true);
	/* Player 3 Key Right Hold */ key_right = (keyboard_check(global.player3_key_right)) and (!keyboard_check(global.player3_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(global.player3_slot, gp_padr)) and (!gamepad_button_check(global.player3_slot, gp_padl)) or (gamepad_axis_value(global.player3_slot, gp_axislh) > 0) or (active_right == true);
	/* Player 3 Key Down Hold */ key_down = (keyboard_check(global.player3_key_down)) and (!keyboard_check(global.player3_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(global.player3_slot, gp_padd)) and (!gamepad_button_check(global.player3_slot, gp_padu)) or (gamepad_axis_value(global.player3_slot, gp_axislv) > 0) or (active_down == true);
	/* Player 3 Key Up Hold */ key_up = (keyboard_check(global.player3_key_up)) and (!keyboard_check(global.player3_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(global.player3_slot, gp_padu)) and (!gamepad_button_check(global.player3_slot, gp_padd)) or (gamepad_axis_value(global.player3_slot, gp_axislv) < 0) or (active_up == true);
	/* Player 3 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept)) or (keyboard_check_pressed(global.player3_key_accept)) or (keyboard_check_pressed(global.player3_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 3 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back)) or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back)) or (keyboard_check_pressed(global.player3_key_back)) or (keyboard_check_pressed(global.player3_key2_back)) or (keyboard_check_pressed(vk_escape));
}
else
if (global.player4_can_play == true)
{
	/* Player 4 Key Left Hold */ key_left = (keyboard_check(global.player4_key_left)) and (!keyboard_check(global.player4_key_right)) or (keyboard_check(vk_left)) and (!keyboard_check(vk_right)) or (keyboard_check(ord("A"))) and (!keyboard_check(ord("D"))) or (gamepad_button_check(global.player4_slot, gp_padl)) and (!gamepad_button_check(global.player4_slot, gp_padr)) or (gamepad_axis_value(global.player4_slot, gp_axislh) < 0) or (active_left == true);
	/* Player 4 Key Right Hold */ key_right = (keyboard_check(global.player4_key_right)) and (!keyboard_check(global.player4_key_left)) or (keyboard_check(vk_right)) and (!keyboard_check(vk_left)) or (keyboard_check(ord("D"))) and (!keyboard_check(ord("A"))) or (gamepad_button_check(global.player4_slot, gp_padr)) and (!gamepad_button_check(global.player4_slot, gp_padl)) or (gamepad_axis_value(global.player4_slot, gp_axislh) > 0) or (active_right == true);
	/* Player 4 Key Down Hold */ key_down = (keyboard_check(global.player4_key_down)) and (!keyboard_check(global.player4_key_up)) or (keyboard_check(vk_down)) and (!keyboard_check(vk_up)) or (keyboard_check(ord("S"))) and (!keyboard_check(ord("W"))) or (gamepad_button_check(global.player4_slot, gp_padd)) and (!gamepad_button_check(global.player4_slot, gp_padu)) or (gamepad_axis_value(global.player4_slot, gp_axislv) > 0) or (active_down == true);
	/* Player 4 Key Up Hold */ key_up = (keyboard_check(global.player4_key_up)) and (!keyboard_check(global.player4_key_down)) or (keyboard_check(vk_up)) and (!keyboard_check(vk_down)) or (keyboard_check(ord("W"))) and (!keyboard_check(ord("S"))) or (gamepad_button_check(global.player4_slot, gp_padu)) and (!gamepad_button_check(global.player4_slot, gp_padd)) or (gamepad_axis_value(global.player4_slot, gp_axislv) < 0) or (active_up == true);
	/* Player 4 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept)) or (keyboard_check_pressed(global.player4_key_accept)) or (keyboard_check_pressed(global.player4_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 4 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back)) or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back)) or (keyboard_check_pressed(global.player4_key_back)) or (keyboard_check_pressed(global.player4_key2_back)) or (keyboard_check_pressed(vk_escape));
}

#endregion /* Keyboard Controls END */

#region /* Lerp the player position and scale to make the player move smoothly */
xx = lerp(xx, x, 0.2);
yy = lerp(yy, y, 0.2);
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
#endregion /* Lerp the player position and scale to make the player move smoothly END */

#region /* Pause */
if (keyboard_check_pressed(vk_escape))
or (gamepad_button_check_pressed(global.player1_slot, gp_select))
or (gamepad_button_check_pressed(global.player1_slot, gp_start))
or (!window_has_focus())
and (global.automatically_pause_when_window_is_unfocused == true)
{
	global.pause_player = 0;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	if (asset_get_type("room_pause") == asset_room)
	{
		room_goto(room_pause);
	}
}
else
if (gamepad_button_check_pressed(global.player2_slot, gp_select))
or (gamepad_button_check_pressed(global.player2_slot, gp_start))
{
	global.pause_player = 1;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	if (asset_get_type("room_pause") == asset_room)
	{
		room_goto(room_pause);
	}
}
else
if (gamepad_button_check_pressed(global.player3_slot, gp_select))
or (gamepad_button_check_pressed(global.player3_slot, gp_start))
{
	global.pause_player = 2;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	if (asset_get_type("room_pause") == asset_room)
	{
		room_goto(room_pause);
	}
}
else
if (gamepad_button_check_pressed(global.player4_slot, gp_select))
or (gamepad_button_check_pressed(global.player4_slot, gp_start))
{
	global.pause_player = 3;
	global.pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
	room_persistent = true;
	global.pause_room = room;
	audio_pause_all();
	if (asset_get_type("room_pause") == asset_room)
	{
		room_goto(room_pause);
	}
}
#endregion /* Pause END */

#region /* Movement */
if (can_move == true)
and (show_demo_over_message == false)
and (global.pause == false)
and (global.quit_level == false)
{
	if (allow_free_movement == true)
	{
		
		#region /* Free Movement */
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
					and (!audio_is_playing(snd_bump))
					{
						draw_xscale = 1.5;
						draw_yscale = 0.5;
						yy -= 32;
						scr_audio_play(snd_bump, volume_source.sound);
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
					and (!audio_is_playing(snd_bump))
					{
						draw_xscale = 0.5;
						draw_yscale = 1.5;
						xx -= 32;
						scr_audio_play(snd_bump, volume_source.sound);
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
					and (!audio_is_playing(snd_bump))
					{
						draw_xscale = 0.5;
						draw_yscale = 1.5;
						xx += 32;
						scr_audio_play(snd_bump, volume_source.sound);
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
					and (!audio_is_playing(snd_bump))
					{
						draw_xscale = 1.5;
						draw_yscale = 0.5;
						yy += 32;
						scr_audio_play(snd_bump, volume_source.sound);
					}
				}
			}
		}
		#endregion /* Free Movement END */
		
	}
	else
	{
		
		#region /* Movement on paths */
		if (key_up)
		and (move_delay > 10)
		and (speed == 0)
		{
			if (y > camera_get_view_y(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x, y - 32, obj_wall))
				{
					vspeed -= move_speed;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy -= 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			}
		}
		if (key_left)
		and (move_delay > 10)
		and (speed == 0)
		{
			if (x > camera_get_view_x(view_camera[view_current]) + 64)
			{
				if (!position_meeting(x - 32, y, obj_wall))
				{
					hspeed -= move_speed;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx -= 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			}
		}
		if (key_right)
		and (move_delay > 10)
		and (speed == 0)
		{
			if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x + 32, y, obj_wall))
				{
					hspeed += move_speed;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					draw_xscale = 0.5;
					draw_yscale = 1.5;
					xx += 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			}
		}
		if (key_down)
		and (move_delay > 10)
		and (speed == 0)
		{
			if (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 64)
			{
				if (!position_meeting(x, y + 32, obj_wall))
				{
					vspeed += move_speed;
					move_delay = 0;
					transfer_data = false;
				}
				else
				if (asset_get_type("snd_bump") == asset_sound)
				and (!audio_is_playing(snd_bump))
				{
					draw_xscale = 1.5;
					draw_yscale = 0.5;
					yy += 32;
					scr_audio_play(snd_bump, volume_source.sound);
				}
			}
		}
		#endregion /* Movement on paths END */

		#region /* Show controls for where you can go */
		if (move_delay > 10)
		and (speed == 0)
		{
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x + 4, y, obj_wall))
			and (speed == 0)
			{
				
				#region /* Key Right */
				if (gamepad_is_connected(global.player1_slot))
				and (global.controls_used_for_menu_navigation == "controller")
				or (global.always_show_gamepad_buttons == true)
				{
					scr_draw_gamepad_buttons(gp_padr, x + 64, y, 0.5, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play == true)
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
					if (global.player2_can_play == true)
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
					if (global.player3_can_play == true)
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
					if (global.player4_can_play == true)
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
				#endregion /* Key Right END */
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x - 4, y, obj_wall))
			and (speed == 0)
			{
				
				#region /* Key Left */
				if (gamepad_is_connected(global.player1_slot))
				and (global.controls_used_for_menu_navigation == "controller")
				or (global.always_show_gamepad_buttons == true)
				{
					scr_draw_gamepad_buttons(gp_padl, x - 64, y, 0.5, c_white, 1);
				}
				else
				
				{
					if (global.player1_can_play == true)
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
					if (global.player2_can_play == true)
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
					if (global.player3_can_play == true)
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
					if (global.player4_can_play == true)
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
				#endregion /* Key Left END */
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y + 4, obj_wall))
			and (speed == 0)
			{
				
				#region /* Key Down */
				if (gamepad_is_connected(global.player1_slot))
				and (global.controls_used_for_menu_navigation == "controller")
				or (global.always_show_gamepad_buttons == true)
				{
					scr_draw_gamepad_buttons(gp_padd, x, y + 64, 0.5, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_down, x, y + 64, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key Down END */
				
			}
			if (asset_get_type("obj_wall") == asset_object)
			and (!place_meeting(x, y - 4, obj_wall))
			and (speed == 0)
			{
				
				#region /* Key Up */
				if (gamepad_is_connected(global.player1_slot))
				and (global.controls_used_for_menu_navigation == "controller")
				or (global.always_show_gamepad_buttons == true)
				{
					scr_draw_gamepad_buttons(gp_padu, x, y - 64, 0.5, c_white, 1);
				}
				else
				if (asset_get_type("spr_keyboard_keys") == asset_sprite)
				{
					if (global.player1_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player1_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player2_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player2_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player3_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player3_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
					else
					if (global.player4_can_play == true)
					{
						draw_sprite_ext(spr_keyboard_keys, global.player4_key_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
					}
				}
				#endregion /* Key Up END */
				
			}
		}
		#endregion /* Show controls for where you can go END */
		
	}
}
#endregion /* Movement END */

#region /* Stop player when touching level */
if (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
and (place_meeting(x, y, obj_level))
and (stop_at_level == false)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	stop_at_level = true;
	x = instance_nearest(x, y, obj_level).x;
	y = instance_nearest(x, y, obj_level).y;
	global.current_level_clear_rate = instance_nearest(x, y, obj_level).clear_rate; /* Set the level clear rate to global current clear rate variable for use inside levels, like if a into animation should play or not. Put this code as the last step before closing bracket */
}
if (instance_exists(obj_level))
and (!place_meeting(x, y, obj_level))
{
	stop_at_level = false;
}
#endregion /* Stop player when touching level END */

#region /* Delay countup */
if (can_move == false)
and (delay < 100)
{
	delay += 1;
}
if (move_delay < 50)
{
	move_delay += 1;
}
if (can_enter_level < 30)
{
	can_enter_level += 1;
}
#endregion /* Delay countup END */

#region /* Set selected level index to the level closest to you */
if (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
{
	global.select_level_index = instance_nearest(x, y, obj_level).level;
}
#endregion /* Set selected level index to the level closest to you END */

#region /* After pressing enter level, the iris should shrink and then start the level */
if (can_move == false)
and (entering_level == true)
and (delay >= 60)
and (iris_yscale <= 0.001)
and (asset_get_type("obj_level") == asset_object)
and (global.quit_level == false)
{
	room_persistent = false; /* Whenever you enter a level, you need to turn off room persistent */
	/* Otherwise when trying to win or quit a level, you'll get back to a world map that saved when you were entering a level, making you loop to enter a level over and over again */
	
	/* Don't set entering_level to false, or can_move to true here */
	/* Create Event will take care of that when you enter the world map again */
	/* Doing this code here will make the iris zoom out a bit before properly entering the level */
	audio_stop_sound(music_map); /* Stop any world map music when playing a level */
	audio_stop_all(); /* Stop all sound from playing so nothing is playing at the loading screen first */
	if (!audio_is_playing(global.loading_music)) /* Then after stopping all sound, play the loading music */
	{
		audio_play_sound(global.loading_music, 0, true, global.volume_melody * global.volume_main);
	}
	global.trigger_demo_ending = 0;
	global.pause = false;
	global.quit_level = false;
	
	scr_update_all_backgrounds();
	
	if (asset_get_type("room_leveleditor") == asset_room)
	{
		global.actually_play_edited_level = true;
		global.play_edited_level = true;
		room_goto(room_leveleditor);
	}
}
#endregion /* After pressing enter level, the iris should shrink and then start the level END */

#region /* Set what sprite player should use */
if (entering_level == true)
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
	else
	if (sprite_walk > noone)
	{
		sprite_index = sprite_walk;
	}
}
else
{
	if (sprite_map > noone)
	{
		sprite_index = sprite_map;
	}
	else
	if (sprite_walk > noone)
	and (point_distance(xx, yy, x, y) > 2)
	{
		sprite_index = sprite_walk;
	}
	else
	if (sprite_stand > noone)
	{
		sprite_index = sprite_stand;
	}
	else
	if (sprite_walk > noone)
	{
		sprite_index = sprite_walk;
	}
}
#endregion /* Set what sprite player should use END */

#region /* Set a bunch of global variables to default when you're not on a selected level */
if (asset_get_type("obj_level") == asset_object)
and (distance_to_object(instance_nearest(xx, yy, obj_level)) > 32)
if (iris_xscale >= 1)
{
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
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
#endregion /* Set a bunch of global variables to default when you're not on a selected level END */

#region /* If player object is present, delete the player object */
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy()
	}
}
#endregion /* If player object is present, delete the player object END */

#region /* Give the player lives if they get a game over */
if (lives <= 0)
{
	if (global.playergame <= 0)
	{
		lives = 5;
	}
	else
	if (global.playergame == 1)
	{
		lives = 10;
	}
	else
	if (global.playergame == 2)
	{
		lives = 15;
	}
	else
	if (global.playergame >= 3)
	{
		lives = 20;
	}
}
#endregion /* Give the player lives if they get a game over END */

#region /* Zoom In and Out */

#region /* Zoom In */
if (entering_level == true)
{
	if (iris_zoom == 1)
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
#endregion /* Zoom In END */

else

#region /* Zoom Out */
if (iris_zoom == 0)
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
#endregion /* Zoom Out END */

#endregion /* Zoom In and Out END */

#region /* Enter Level */
if (file_exists(working_directory + "/save_files/file" + string(global.file) + ".ini"))
and (can_enter_level_automatically == true)
and (brand_new_file == true)
and (can_move == true)
and (show_demo_over_message == false)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */

or (key_a_pressed)
and (global.demo == false)
and (can_move == true)
and (show_demo_over_message == false)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)

or (key_a_pressed)
and (global.demo == true)
and (instance_nearest(x, y, obj_level).level <= global.demo_max_levels)
and (can_move == true)
and (show_demo_over_message == false)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level)) /* Must check if obj_level exists or not */
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)
{
	if (instance_nearest(x, y, obj_level).clear_rate == "enter")
	or (instance_nearest(x, y, obj_level).clear_rate == "clear")
	{
		if (brand_new_file == true)
		{
			audio_sound_gain(music_map, 0, 0);
			audio_stop_all(); /* Stop all sound from playing whenever a brand new file is loaded, so nothing is playing at the loading screen first */
			if (!audio_is_playing(global.loading_music)) /* Then after stopping all sound, play the loading music */
			{
				audio_play_sound(global.loading_music, 0, true, global.volume_melody * global.volume_main);
			}
		}
		
		#region /* Save Player Position */
		x = instance_nearest(x, y, obj_level).x;
		y = instance_nearest(x, y, obj_level).y;
		ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
		ini_write_real("Player", "player_x", x);
		ini_write_real("Player", "player_y", y);
		ini_write_real("Player", "brand_new_file", false);
		ini_close();
		#endregion /* Save Player Position END */
		
		can_move = false;
		entering_level = true;
		delay = 0;
		score = 0;
		global.spikes_emerge_time = 0;
		global.checkpoint_x = instance_nearest(x, y, obj_level).checkpoint_x;
		global.checkpoint_y = instance_nearest(x, y, obj_level).checkpoint_y;
		with(instance_nearest(x, y, obj_level))
		{
			if (checkpoint_x > 0)
			or(checkpoint_y > 0)
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
else
if (global.demo == true)
and (instance_nearest(x, y, obj_level).level > global.demo_max_levels)
and (key_a_pressed)
and (can_move == true)
and (show_demo_over_message == false)
and (menu_delay == 0)
and (can_enter_level >= 30)
and (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and (speed == 0)
and (show_demo_over_message == false)
{
	menu_delay = 3;
	menu = "purchase_now";
	show_demo_over_message = true;
}
#endregion /* Enter Level END */

#region /* Clear Level in debug */
if (key_b_pressed)
{
	if (global.debug_screen == true)
	{
		if (can_move == true)
		and (can_enter_level >= 30)
		and (asset_get_type("obj_level") == asset_object)
		and (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
		and (speed == 0)
		and (instance_nearest(x, y, obj_level).clear_rate = "enter")
		and (global.pause == false)
		{
			with (instance_nearest(x, y, obj_level))
			{
				clear_rate = "clear";
				alarm_set(1, 1)
			}
			
			#region /* Save Player Position */
			x = instance_nearest(x, y, obj_level).x;
			y = instance_nearest(x, y, obj_level).y;
			ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
			ini_write_real("Player", "player_x", x);
			ini_write_real("Player", "player_y", y);
			ini_write_real("Player", "brand_new_file", false);
			ini_close();
			#endregion /* Save Player Position END */
			
			if (global.character_select_in_this_menu == "main_game")
			{
				var uppercase_level_name;
				uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
				uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
				var level_name = string(uppercase_level_name);
				
				ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
				ini_write_string(level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
				ini_close();
			}
		}
	}
}
#endregion /* Clear Level in debug END */

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (menu == "purchase_now")
{
	if (key_a_pressed)
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 64, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 64 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		url_open(string(global.link_to_steam_page));
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_down)
	and (menu_delay == 0)
	{
		menu = "continue_playing";
		menu_delay = 3;
	}
}
else
if (menu == "continue_playing")
{
	if (key_a_pressed)
	and (menu_delay == 0)
	or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 106, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 106 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay == 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_up)
	and (menu_delay == 0)
	{
		menu = "purchase_now";
		menu_delay = 3;
	}
}

if (global.goal_active == true)
{
	global.goal_active = false;
}

#region /* Path Turning */

/* 
right down = 0
up right = 1
up left = 2
left down = 3
 */

#region /* Touch Map Turn Right Down */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn == 0) /* Right Down = 0 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = + move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y + move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = + move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x + move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Right Down END */

else

#region /* Touch Map Turn Up Right */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn == 1) /* Up Right = 1 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = - move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = + move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x + move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Up Right END */

else

#region /* Touch Map Turn Up Left */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 2) /* Up Left = 2 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = - move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y - move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = - move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x - move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Up Left END */

else

#region /* Touch Map Turn Left Down */
if (asset_get_type("obj_map_path_turn") == asset_object)
and (place_meeting(x, y, obj_map_path_turn))
and (instance_nearest(x, y, obj_map_path_turn).turn = 3) /* Left Down = 3 */
{
	if (abs(hspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = 0;
		vspeed = + move_speed;
		x = instance_nearest(x, y, obj_map_path_turn).x;
		y = instance_nearest(x, y, obj_map_path_turn).y + move_speed;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
	else
	if (abs(vspeed) > 0)
	and (instance_nearest(x, y, obj_map_path_turn).delay == 0)
	{
		hspeed = - move_speed;
		vspeed = 0;
		x = instance_nearest(x, y, obj_map_path_turn).x - move_speed;
		y = instance_nearest(x, y, obj_map_path_turn).y;
		with(instance_nearest(x, y, obj_map_path_turn))
		{
			delay = 10;
		}
	}
}
#endregion /* Touch Map Turn Left Down END */

#endregion /* Path Turning END */
