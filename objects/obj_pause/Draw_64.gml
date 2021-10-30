//instance_deactivate_all(true);
instance_activate_object(obj_pause);

if (global.background_brightness_menu>-0.1)
{
	c_menu_outline=c_white;
	c_menu_fill=c_black;
}
else
{
	c_menu_outline=c_black;
	c_menu_fill=c_white;
}

//draw_text_outlined(300, 300, "menu = "+string(menu), global.default_text_size, c_white, c_black, 1);

#region /*Set what controls are used to navigate the menus*/

#region /*Get distance from fake mouse to real mouse*/
var mouse_moving = point_distance(mx, my, window_mouse_get_x(), window_mouse_get_y());
#endregion /*Get distance from fake mouse to real mouse END*/

#region /*update positions of fake mouse*/
mx = window_mouse_get_x();
my = window_mouse_get_y();
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

with (all)
{
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	image_speed = 0;
	speed = 0;
	x = xprevious;
	y = yprevious;
}

#region /*Menu cursor image speed*/
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /*Menu cursor image speed END*/

if (menu_delay > 0)
{
	menu_delay -= 1;
}
image_speed = 0;

///Narrator Voice variable handeling

///No Narrator
if (global.narrator >= 0)
{
	menuvoice_titlesplash = noone;
	menuvoice_1player = noone;
	menuvoice_2player = noone;
	menuvoice_3player = noone;
	menuvoice_4player = noone;
	menuvoice_leveleditor = noone;
	menuvoice_leveleditor_denied = noone;
	menuvoice_options = noone;
}

room_speed = global.max_fps;

#region /*Keyboard Controls*/
gamepad_set_axis_deadzone(0, 0.50);
gamepad_set_axis_deadzone(1, 0.50);
gamepad_set_axis_deadzone(2, 0.50);
gamepad_set_axis_deadzone(3, 0.50);

#region /*Player 1*/
if (global.pause_player = 0)
{
	gamepad_set_axis_deadzone(0, 0.50);
	key_up = (keyboard_check_pressed(vk_up)) and(!keyboard_check_pressed(vk_down)) or(keyboard_check_pressed(ord("W"))) and(!keyboard_check_pressed(ord("S"))) or(gamepad_button_check_pressed(0, gp_padu)) and(!gamepad_button_check_pressed(0, gp_padd)) or(gamepad_axis_value(0, gp_axislv) < 0);
	key_left = (keyboard_check_pressed(vk_left)) and(!keyboard_check_pressed(vk_right)) or(keyboard_check_pressed(ord("A"))) and(!keyboard_check_pressed(ord("D"))) or(gamepad_button_check_pressed(0, gp_padl)) and(!gamepad_button_check_pressed(0, gp_padr)) or(gamepad_axis_value(0, gp_axislh) < 0);
	key_right = (keyboard_check_pressed(vk_right)) and(!keyboard_check_pressed(vk_left)) or(keyboard_check_pressed(ord("D"))) and(!keyboard_check_pressed(ord("A"))) or(gamepad_button_check_pressed(0, gp_padr)) and(!gamepad_button_check_pressed(0, gp_padl)) or(gamepad_axis_value(0, gp_axislh) > 0);
	key_down = (keyboard_check_pressed(vk_down)) and(!keyboard_check_pressed(vk_up)) or(keyboard_check_pressed(ord("S"))) and(!keyboard_check_pressed(ord("W"))) or(gamepad_button_check_pressed(0, gp_padd)) and(!gamepad_button_check_pressed(0, gp_padu)) or(gamepad_axis_value(0, gp_axislv) > 0);
	key_a_pressed = (gamepad_button_check_pressed(0, gp_face1)) or(keyboard_check_pressed(ord("Z"))) or(keyboard_check_pressed(vk_enter)) or(keyboard_check_pressed(vk_space));
	key_b_pressed = (gamepad_button_check_pressed(0, gp_face2)) or(keyboard_check_pressed(ord("X"))) or(keyboard_check_pressed(vk_escape)) or(keyboard_check_pressed(vk_backspace));
}
#endregion /*Player 1 END*/

#region /*Player 2*/
if (global.pause_player = 1)
{
	key_up = (keyboard_check_pressed(global.player2_key_up)) and(!keyboard_check_pressed(global.player2_key_down)) or(gamepad_button_check_pressed(1, gp_padu)) and(!gamepad_button_check_pressed(1, gp_padd)) or(gamepad_axis_value(1, gp_axislv) < 0)
	key_left = (keyboard_check_pressed(global.player2_key_left)) and(!keyboard_check_pressed(global.player2_key_right)) or(gamepad_button_check_pressed(1, gp_padl)) and(!gamepad_button_check_pressed(1, gp_padr)) or(gamepad_axis_value(1, gp_axislh) < 0)
	key_right = (keyboard_check_pressed(global.player2_key_right)) and(!keyboard_check_pressed(global.player2_key_left)) or(gamepad_button_check_pressed(1, gp_padr)) and(!gamepad_button_check_pressed(1, gp_padl)) or(gamepad_axis_value(1, gp_axislh) > 0)
	key_down = (keyboard_check_pressed(global.player2_key_down)) and(!keyboard_check_pressed(global.player2_key_up)) or(gamepad_button_check_pressed(1, gp_padd)) and(!gamepad_button_check_pressed(1, gp_padu)) or(gamepad_axis_value(1, gp_axislv) > 0)
	key_a_pressed = (gamepad_button_check_pressed(1, gp_face1)) or(keyboard_check_pressed(global.player2_key_jump))
	key_b_pressed = (gamepad_button_check_pressed(1, gp_face2)) or(keyboard_check_pressed(global.player2_key_sprint))
}
#endregion /*Player 2 END*/

#region /*Player 3*/
if (global.pause_player = 2)
{
	key_up = (keyboard_check_pressed(global.player3_key_up)) and(!keyboard_check_pressed(global.player3_key_down)) or(gamepad_button_check_pressed(2, gp_padu)) and(!gamepad_button_check_pressed(2, gp_padd)) or(gamepad_axis_value(2, gp_axislv) < 0)
	key_left = (keyboard_check_pressed(global.player3_key_left)) and(!keyboard_check_pressed(global.player3_key_right)) or(gamepad_button_check_pressed(2, gp_padl)) and(!gamepad_button_check_pressed(2, gp_padr)) or(gamepad_axis_value(2, gp_axislh) < 0)
	key_right = (keyboard_check_pressed(global.player3_key_right)) and(!keyboard_check_pressed(global.player3_key_left)) or(gamepad_button_check_pressed(2, gp_padr)) and(!gamepad_button_check_pressed(2, gp_padl)) or(gamepad_axis_value(2, gp_axislh) > 0)
	key_down = (keyboard_check_pressed(global.player3_key_down)) and(!keyboard_check_pressed(global.player3_key_up)) or(gamepad_button_check_pressed(2, gp_padd)) and(!gamepad_button_check_pressed(2, gp_padu)) or(gamepad_axis_value(2, gp_axislv) > 0)
	key_a_pressed = (gamepad_button_check_pressed(2, gp_face1)) or(keyboard_check_pressed(global.player3_key_jump))
	key_b_pressed = (gamepad_button_check_pressed(2, gp_face2)) or(keyboard_check_pressed(global.player3_key_sprint))
}
#endregion /*Player 3 END*/

#region /*Player 4*/
if (global.pause_player = 3)
{
	key_up = (keyboard_check_pressed(global.player4_key_up)) and(!keyboard_check_pressed(global.player4_key_down)) or(gamepad_button_check_pressed(3, gp_padu)) and(!gamepad_button_check_pressed(3, gp_padd)) or(gamepad_axis_value(3, gp_axislv) < 0)
	key_left = (keyboard_check_pressed(global.player4_key_left)) and(!keyboard_check_pressed(global.player4_key_right)) or(gamepad_button_check_pressed(3, gp_padl)) and(!gamepad_button_check_pressed(3, gp_padr)) or(gamepad_axis_value(3, gp_axislh) < 0)
	key_right = (keyboard_check_pressed(global.player4_key_right)) and(!keyboard_check_pressed(global.player4_key_left)) or(gamepad_button_check_pressed(3, gp_padr)) and(!gamepad_button_check_pressed(3, gp_padl)) or(gamepad_axis_value(3, gp_axislh) > 0)
	key_down = (keyboard_check_pressed(global.player4_key_down)) and(!keyboard_check_pressed(global.player4_key_up)) or(gamepad_button_check_pressed(3, gp_padd)) and(!gamepad_button_check_pressed(3, gp_padu)) or(gamepad_axis_value(3, gp_axislv) > 0)
	key_a_pressed = (gamepad_button_check_pressed(3, gp_face1)) or(keyboard_check_pressed(global.player4_key_jump))
	key_b_pressed = (gamepad_button_check_pressed(3, gp_face2)) or(keyboard_check_pressed(global.player4_key_sprint))
}
#endregion /*Player 4 END*/

#endregion /*Keyboard Controls End*/

scr_quit_to_desktop_menu("quit_to_desktop");

#region /*Which player is controling the pause menu?*/
draw_set_halign(fa_center);
draw_set_valign(fa_center);

#region /*Set a default font*/
if (asset_get_type("font_default") == asset_font)
{
	draw_set_font(font_default);
}
#endregion /*Set a default font End*/

if (in_settings = false)
and(menu != "remap_key_up")
and(menu != "remap_key_down")
and(menu != "remap_key_left")
and(menu != "remap_key_right")
and(menu != "remap_key_sprint")
and(menu != "remap_key_jump")
and(menu != "remap_reset")
and(menu != "remap_save")
{
	if (global.playergame >= 1)
	and(global.pause_player = 0)
	{
		draw_text_outlined(window_get_width() / 2, 100, "PLAYER 1 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_aqua, 1);
	}
	else
	if (global.pause_player = 1)
	{
		draw_text_outlined(window_get_width() / 2, 100, "PLAYER 2 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	if (global.pause_player = 2)
	{
		draw_text_outlined(window_get_width() / 2, 100, "PLAYER 3 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_lime, 1);
	}
	else
	if (global.pause_player = 3)
	{
		draw_text_outlined(window_get_width() / 2, 100, "PLAYER 4 IS CONTROLING THE MENU", global.default_text_size * 2, c_black, c_yellow, 1);
	}
}
#endregion /*Which player is controling the pause menu? END*/

#region /*Games Logo in top left corner*/
if (global.resourcepack_sprite_title_logo > noone)
{
	draw_sprite_ext(global.resourcepack_sprite_title_logo, 0, 160, 100, 0.3, 0.3, 0, c_white, 1);
}
#endregion /*Games Logo in top left corner END*/

#region /*Pause Text blink effect*/
if (pause_text_lerp <= 0)
{
	pause_text_alpha = lerp(pause_text_alpha, 1, 0.1);
	if (pause_text_alpha >= 1)
	{
		pause_text_lerp = 1;
	}
}
else
if (pause_text_lerp >= 1)
{
	pause_text_alpha = lerp(pause_text_alpha, 0, 0.2);
	if (pause_text_alpha <= 0)
	{
		pause_text_lerp = 0;
	}
}
#endregion /*Pause Text blink effect END*/

#region /*Pause Text*/
draw_set_halign(fa_center);
draw_set_valign(fa_center);

#region /*Set a default font*/
if (asset_get_type("font_default") == asset_font)
{
	draw_set_font(font_default);
}
#endregion /*Set a default font End*/

if (in_settings = false)
and (menu != "quit_game_no")
and (menu != "quit_game_yes")
{
	if (asset_get_type("spr_pause_text") == asset_sprite)
	{
		draw_sprite_ext(spr_pause_text, image_index, window_get_width() / 2, 200, 1, 1, 0, c_white, pause_text_alpha);
	}
	else
	{
		draw_text_transformed_color(window_get_width() / 2, 200, "PAUSE", global.default_text_size * 2, global.default_text_size * 2, 0, c_white, c_white, c_white, c_white, pause_text_alpha);
	}
}
#endregion /*Pause Text End*/



/*PAUSE LEVEL SELECT / LEVEL EDITOR MENU*/
if (asset_get_type("room_world_map") == asset_room)
and(room = room_world_map)
or(asset_get_type("room_leveleditor") == asset_room)
and(room = room_leveleditor)
or(asset_get_type("room_world_map") == asset_room)
and(global.pause_room = room_world_map)
or(asset_get_type("room_leveleditor") == asset_room)
and(global.pause_room = room_leveleditor)
{
	if (menu = "continue")
	or(menu = "options")
	or(menu = "restart")
	or(menu = "quit")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Continue","continue","continue");
		
		if(asset_get_type("room_leveleditor") == asset_room)
		and(room = room_leveleditor)
		or(asset_get_type("room_leveleditor") == asset_room)
		and(global.pause_room = room_leveleditor)
		{
			if (global.convention_mode = false)
			{
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Settings","options","options");
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Restart","restart","restart");
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42+42,"Quit","quit","quit_to_map");
			}
			else
			{
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Restart","restart","restart");
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Quit","quit","quit_to_map");
			}
		}
		else
		{
			if (global.convention_mode = false)
			{
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Settings","options","options");
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Quit","quit","quit");
			}
			else
			{
				draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Quit","quit","quit");
			}
		}
	}
	else
	if (menu = "reset_from_checkpoint")
	or(menu = "reset_from_start")
	or(menu = "restart_nevermind")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Reset from Checkpoint","reset_from_checkpoint","reset_from_checkpoint");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Reset from Start","reset_from_start","reset_from_start");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Nevermind","restart_nevermind","restart_nevermind");
	}
	else
	if(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "main_game")
	and (menu = "quit_to_map")
	or(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "main_game")
	and(menu = "quit_to_title")
	or(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "main_game")
	and(menu = "quit_to_desktop")
	or(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "main_game")
	and(menu = "quit_nevermind")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Quit to Map","quit_to_map","quit_to_map");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Quit to Title","quit_to_title","quit_to_title");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Quit to Desktop","quit_to_desktop","quit_to_desktop");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42+42,"Nevermind","quit_nevermind","quit_nevermind");
	}
	else
	if(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "level_editor")
	and(menu = "quit_to_title")
	or(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "level_editor")
	and(menu = "quit_to_desktop")
	or(global.pause_room = room_leveleditor)
	and(global.character_select_in_this_menu = "level_editor")
	and(menu = "quit_nevermind")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Quit to Title","quit_to_title","quit_to_title");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Quit to Desktop","quit_to_desktop","quit_to_desktop");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Nevermind","quit_nevermind","quit_nevermind");
	}
	else
	if(global.pause_room = room_world_map)
	and(menu = "quit_to_title")
	or(global.pause_room = room_world_map)
	and(menu = "quit_to_desktop")
	or(global.pause_room = room_world_map)
	and(menu = "quit_nevermind")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Quit to Title","quit_to_title","quit_to_title");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Quit to Desktop","quit_to_desktop","quit_to_desktop");
		draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Nevermind","quit_nevermind","quit_nevermind");
	}
	
	#region /*Continue*/
	if (menu = "continue")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Return to game*/
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			audio_sound_gain(global.ambiance,global.ambient_volume,0);
			audio_sound_gain(global.ambiance_underwater,0,0);
			global.pause=false;
			instance_activate_region(camera_get_view_x(view_camera[view_current]) - 32, camera_get_view_y(view_camera[view_current]) - 32, window_get_width() + 32, window_get_height() + 32, true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /*Return to game END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "options";
		}
	}
	#endregion /*Continue END*/
	
	else
	
	#region /*Options*/
	if (menu = "options")
	{
		
		#region /*Select Options*/
		if (key_a_pressed)
		and(menu_delay = 0)
		and(global.convention_mode = false)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		and(global.convention_mode = false)
		{
			menu_delay = 3;
			if (!audio_is_playing(menuvoice_options))
			{
				audio_play_sound(menuvoice_options, 0, 0);
				audio_sound_gain(menuvoice_options, global.voices_volume, 0);
			}
			menu = noone;
			can_navigate_settings_sidebar = true;
			in_settings = true;
		}
		#endregion /*Select Options END*/

		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "continue";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			if (global.pause_room = room_leveleditor)
			{
				menu_delay = 3;
				menu = "restart";
			}
			else
			{
				menu_delay = 3;
				menu = "quit";
			}
		}
	}
	#endregion /*Options END*/
	
	else
	
	#region /*Restart*/
	if (menu = "restart")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			if (global.x_checkpoint = 0)
			and(global.y_checkpoint = 0)
			{
				
				#region /*Restart Level*/
				
				#region /*Reset timer back to zero*/
				global.timeattack_realmillisecond = 0;
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute = 0;
				#endregion /*Reset timer back to zero END*/
				
				global.restart_level = true;
				audio_stop_all();
				global.theme = noone;
				global.pause=false;
				instance_activate_region(
				camera_get_view_x(view_camera[view_current]) - 32,
				camera_get_view_y(view_camera[view_current]) - 32,
				window_get_width() + 32,
				window_get_height() + 32,
				true);
				if (instance_exists(obj_player))
				{
					with(obj_player)
					{
						hspeed = pause_hspeed;
						vspeed = pause_vspeed;
					}
				}
				if (asset_get_type("room_pause") == asset_room)
				{
					room = global.pause_room;
				}
				else
				{
					instance_destroy();
				}
				#endregion /*Restart Level END*/
				
			}
			else
			{
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
	}
	#endregion /*Restart END*/
	
	else
	
	#region /*Reset from Checkpoint*/
	if (menu = "reset_from_checkpoint")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Restart Level*/
			
			global.restart_level = true;
			audio_stop_all();
			global.theme = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			window_get_width() + 32,
			window_get_height() + 32,
			true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /*Restart Level END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "restart_nevermind";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_start";
		}
	}
	#endregion /*Restart to Checkpoint END*/
	
	else
	
	#region /*Reset from Start*/
	if (menu = "reset_from_start")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Restart Level*/
			
			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/
			
			if (global.character_select_in_this_menu = "main_game")
			{
				ini_open("file"+string(global.file)+".ini");
				ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "x_checkpoint", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), "y_checkpoint", 0);
				ini_close();
			}
			else
			if (global.character_select_in_this_menu = "level_editor")
			{
				ini_open(working_directory+"/custom_level_save.ini");
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", 0);
				ini_close();
			}
			
			global.x_checkpoint = 0;
			global.y_checkpoint = 0;
			
			global.restart_level = true;
			audio_stop_all();
			global.theme = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			window_get_width() + 32,
			window_get_height() + 32,
			true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /*Restart Level END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_checkpoint";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "restart_nevermind";
		}
	}
	#endregion /*Reset from Start END*/
	
	else
	
	#region /*Restart Nevermind*/
	if (menu = "restart_nevermind")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			menu_delay = 3;
			menu = "restart";
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_start";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "reset_from_checkpoint";
		}
	}
	#endregion /*Restart Nevermind END*/
	
	else
	
	#region /*Quit*/
	if (menu = "quit")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_world_map)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and(global.character_select_in_this_menu = "main_game")
			{
				menu_delay = 3;
				menu = "quit_to_map";
			}
			else
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			if (global.pause_room = room_leveleditor)
			{
				menu_delay = 3;
				menu = "restart";
			}
			else
			{
				menu_delay = 3;
				menu = "options";
			}
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "continue";
		}
	}
	#endregion /*Quit END*/
	
	else
	
	#region /*Quit to Map*/
	if (menu = "quit_to_map")
	and(global.pause_room = room_leveleditor)
	{
		if (global.character_select_in_this_menu = "level_editor")
		{
			menu = "quit_to_title";
		}
		if (key_a_pressed)
		and(menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Return to Map*/
			
			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/
			
			global.quit_level = true;
			global.quit_to_map = true;
			audio_stop_all();
			global.theme = noone;
			global.pause=false;
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			#endregion /*Return to Map END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_nevermind";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_title";
		}
	}
	#endregion /*Quit to Map END*/
	
	else
	
	#region /*Quit to Title*/
	if (menu = "quit_to_title")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_world_map)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and (global.character_select_in_this_menu = "level_editor")
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Return to Title*/
			
			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/
			
			global.quit_level = true;
			global.quit_to_title = true;
			audio_stop_all();
			global.theme = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			window_get_width() + 32,
			window_get_height() + 32,
			true);
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room;
			}
			else
			{
				instance_destroy();
			}
			#endregion /*Return to Title END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and(global.character_select_in_this_menu = "main_game")
			{
				menu = "quit_to_map";
			}
			else
			{
				menu = "quit_nevermind";
			}
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_desktop";
		}
	}
	#endregion /*Quit to Title END*/
	
	else
	
	#region /*Quit to Desktop*/
	if (menu = "quit_to_desktop")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_world_map)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and (global.character_select_in_this_menu = "level_editor")
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			menu_delay = 3;
			menu = "quit_game_no";
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_title";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_nevermind";
		}
	}
	#endregion /*Quit to Desktop END*/
	
	else
	
	#region /*Quit Nevermind*/
	if (menu = "quit_nevermind")
	{
		if (key_a_pressed)
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_world_map)
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		or(global.pause_room = room_leveleditor)
		and (global.character_select_in_this_menu = "level_editor")
		and(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			menu_delay = 3;
			menu = "quit";
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			menu = "quit_to_desktop";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		and(menu_joystick_delay <= 0)
		{
			menu_delay = 3;
			if (global.pause_room = room_leveleditor)
			and(global.character_select_in_this_menu = "main_game")
			{
				menu = "quit_to_map";
			}
			else
			{
				menu = "quit_to_title";
			}
			
		}
	}
	#endregion /*Quit Nevermind END*/
	
	#region /*Return to game by pressing the back key*/
	if (key_b_pressed)
	and(menu_delay = 0)
	{
		if (menu = "continue")
		or(menu = "options")
		or(menu = "restart")
		or(menu = "quit")
		{
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			audio_sound_gain(global.ambiance,global.ambient_volume,0);
			audio_sound_gain(global.ambiance_underwater,0,0);
			global.pause=false;
			if (instance_exists(obj_player))
			{
				with(obj_player)
				{
					hspeed = pause_hspeed;
					vspeed = pause_vspeed;
				}
			}
			if (asset_get_type("room_pause") == asset_room)
			{
				room = global.pause_room; /*Return to game END*/
			}
		}
		else
	
		#region /*Return to first menu*/
		if (menu = "reset_from_checkpoint")
		or(menu = "reset_from_start")
		or(menu = "restart_nevermind")
		{
			menu_delay = 3;
			menu = "restart";
		}
		else
		if (menu = "quit_to_map")
		or(menu = "quit_to_title")
		or(menu = "quit_to_desktop")
		or(menu = "quit_nevermind")
		{
			menu_delay = 3;
			menu = "quit";
		}
		#endregion /*Return to first menu END*/
		
	}
	#endregion /*Return to game by pressing the back key END*/
	
}
/*PAUSE LEVEL EDITOR MENU*/

#region /*Return to game*/
if (keyboard_check_pressed(vk_escape))
or(gamepad_button_check_pressed(0, gp_start))
or(gamepad_button_check_pressed(1, gp_start))
or(gamepad_button_check_pressed(2, gp_start))
or(gamepad_button_check_pressed(3, gp_start))
or(gamepad_button_check_pressed(0, gp_select))
or(gamepad_button_check_pressed(1, gp_select))
or(gamepad_button_check_pressed(2, gp_select))
or(gamepad_button_check_pressed(3, gp_select))
{
	if (can_remap_key = false)
	and(input_key = false)
	and(menu_delay = 0)
	{
		audio_resume_all();
		audio_sound_gain(global.music,global.music_volume,0);
		audio_sound_gain(global.music_underwater,0,0);
		audio_sound_gain(global.ambiance,global.ambient_volume,0);
		audio_sound_gain(global.ambiance_underwater,0,0);
		global.pause=false;
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				hspeed = pause_hspeed;
				vspeed = pause_vspeed;
			}
		}
		if (asset_get_type("room_pause") == asset_room)
		{
			room = global.pause_room;
		}
		else
		{
			instance_destroy();
		}
	}
}
#endregion /*Return to game END*/

scr_options_menu(); /*Options*/

#region /*Menu navigation with joystick*/
if (gamepad_axis_value(0,gp_axislv)<0)
or(gamepad_axis_value(0,gp_axislv)>0)
or(gamepad_axis_value(0,gp_axislh)<0)
or(gamepad_axis_value(0,gp_axislh)>0)
or(gamepad_axis_value(1,gp_axislv)<0)
or(gamepad_axis_value(1,gp_axislv)>0)
or(gamepad_axis_value(1,gp_axislh)<0)
or(gamepad_axis_value(1,gp_axislh)>0)
or(gamepad_axis_value(2,gp_axislv)<0)
or(gamepad_axis_value(2,gp_axislv)>0)
or(gamepad_axis_value(2,gp_axislh)<0)
or(gamepad_axis_value(2,gp_axislh)>0)
or(gamepad_axis_value(3,gp_axislv)<0)
or(gamepad_axis_value(3,gp_axislv)>0)
or(gamepad_axis_value(3,gp_axislh)<0)
or(gamepad_axis_value(3,gp_axislh)>0)
{
	if (menu_joystick_delay = 0)
	{
		menu_joystick_delay = 15;
	}
}
if (gamepad_axis_value(0,gp_axislv)= 0)
and(gamepad_axis_value(0,gp_axislh)= 0)
and(gamepad_axis_value(1,gp_axislv)= 0)
and(gamepad_axis_value(1,gp_axislh)= 0)
and(gamepad_axis_value(2,gp_axislv)= 0)
and(gamepad_axis_value(2,gp_axislh)= 0)
and(gamepad_axis_value(3,gp_axislv)= 0)
and(gamepad_axis_value(3,gp_axislh)= 0)
{
	menu_joystick_delay= 0;
}
if (menu_joystick_delay>0)
{
	menu_joystick_delay-=1;
}
#endregion /*Menu navigation with joystick END*/

#region /*If Window is unfocused, make the screen darker*/
if (!window_has_focus())
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, window_get_width()*2, window_get_height()*2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /*If Window is unfocused, make the screen darker END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation="mouse")
and(os_type!=os_ios)
and(os_type!=os_android)
{
	draw_sprite_ext(spr_cursor,0,window_mouse_get_x(),window_mouse_get_y(),1,1,0,c_white,1);
}
#endregion /*Draw mouse cursor for menu navigation END*/