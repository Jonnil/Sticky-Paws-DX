//instance_deactivate_all(true);
instance_activate_object(obj_pause);

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

#region /*Save Config*/
scr_saveconfig();
#endregion /*Save Config END*/

room_speed = global.max_fps;

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera")==asset_sprite)
and(!instance_exists(obj_camera))
and(keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("Config.ini");
	ini_write_real("Config","fullscreen_mode",window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

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
	key_a = (gamepad_button_check_pressed(0, gp_face1)) or(keyboard_check_pressed(ord("Z"))) or(keyboard_check_pressed(vk_enter)) or(keyboard_check_pressed(vk_space));
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
	key_a = (gamepad_button_check_pressed(1, gp_face1)) or(keyboard_check_pressed(global.player2_key_jump))
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
	key_a = (gamepad_button_check_pressed(2, gp_face1)) or(keyboard_check_pressed(global.player3_key_jump))
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
	key_a = (gamepad_button_check_pressed(3, gp_face1)) or(keyboard_check_pressed(global.player4_key_jump))
	key_b_pressed = (gamepad_button_check_pressed(3, gp_face2)) or(keyboard_check_pressed(global.player4_key_sprint))
}
#endregion /*Player 4 END*/

#endregion /*Keyboard Controls End*/

#region /*Darker Background*/
draw_set_alpha(0.5);
draw_rectangle_colour(0, 0, window_get_width(), window_get_height(), c_red, c_blue, c_blue, c_red, false);
draw_rectangle_colour(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
#endregion /*Darker Background End*/

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
if asset_get_type("spr_title") == asset_sprite
{
	draw_sprite_ext(spr_title, 0, 100, 70, 0.3, 0.3, 0, c_white, 1);
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
and(menu != "remap_key_jump")
and(menu != "remap_key_crouch")
and(menu != "remap_key_crouch_toggle")
and(menu != "remap_key_sprint")
and(menu != "remap_key_sprint_toggle")
and(menu != "remap_key_left")
and(menu != "remap_key_right")
and(menu != "remap_key_down")
and(menu != "remap_key_up")
and(menu != "remap_key_attack")
and(menu != "remap_reset")
and(menu != "remap_save")
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
if (asset_get_type("room_level_select") == asset_room)
and(room = room_level_select)
or(asset_get_type("room_leveleditor") == asset_room)
and(room = room_leveleditor)
{
	
	/*Continue*/
	if (menu = "continue")
	or(menu = "options")
	or(menu = "quit")
	{
		draw_menu_button(window_get_width()/2-185,window_get_height()/2,"Continue","continue","continue");
		if (global.convention_mode = false)
		{
			draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Options","options","options");
			draw_menu_button(window_get_width()/2-185,window_get_height()/2+42+42,"Quit","quit","quit");
		}
		else
		{
			draw_menu_button(window_get_width()/2-185,window_get_height()/2+42,"Quit","quit","quit");
		}
	}
	
	if (menu = "continue")
	{
		if (key_a)
		and(menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2,window_get_width()/2+185,window_get_height()/2+41))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Return to game*/
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
			#endregion /*Return to game END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "quit";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "options";
		}
	}

	#region /*Options*/
	else
	if (menu = "options")
	{
		
		#region /*Select Options*/
		if (key_a)
		and(menu_delay = 0)
		and(global.convention_mode = false)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42,window_get_width()/2+185,window_get_height()/2+41+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		and(global.convention_mode = false)
		{
			menu_delay = 10;
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
		{
			menu_delay = 1;
			menu = "continue";
		}
		else
		if (key_down)
			and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "quit";
		}
	}
	#endregion /*Options END*/


	#region /*Save and Quit*/
	if (menu = "quit")
	{
		if (key_a)
		and(menu_delay = 0)
		or(point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),window_get_width()/2-185,window_get_height()/2+2+42+42,window_get_width()/2+185,window_get_height()/2+41+42+42))
		and(mouse_check_button_pressed(mb_left))
		and(menu_delay = 0)
		{
			
			#region /*Return to game*/

			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/

			global.QuitLevel = true;
			audio_stop_all();
			global.theme = noone;
			global.weather = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
			
			#endregion /*Return to game END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "options";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "continue";
		}
	}
	#endregion /*Save and Quit END*/
	
	#region /*Return to game*/
	if (menu = "continue")
	or(menu = "options")
	or(menu = "select_level")
	or(menu = "quit")
	{
		if (key_b_pressed)
		and(menu_delay = 0)
		{
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
		}
	}
	#endregion /*Return to game END*/

}
/*PAUSE LEVEL EDITOR MENU*/

/*PAUSE INSIDE LEVEL MENU*/
else
if (menu = "continue")
or(menu = "options")
or(menu = "select_level")
or(menu = "quit")
{
	/*Continue*/
	if (menu = "continue")
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "> CONTINUE <", global.default_text_size * 2.3, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 64, "OPTIONS", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 128, "SELECT LEVEL", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 192, "SAVE AND QUIT", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		if (key_a)
		and(menu_delay = 0)
		{
			
			#region /*Return to game*/
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
			#endregion /*Return to game END*/
			
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "quit";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "options";
		}
	}

	/*Options*/
	if (menu = "options")
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "CONTINUE", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 64, "> OPTIONS <", global.default_text_size * 2.3, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 128, "SELECT LEVEL", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 192, "SAVE AND QUIT", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);

		#region /*Select Options*/
		if (key_a)
		and(menu_delay = 0)
		and(global.convention_mode = false)
		{
			menu_delay = 10;
			if (!audio_is_playing(menuvoice_options))
			{
				audio_play_sound(menuvoice_options, 0, 0);
				audio_sound_gain(menuvoice_options, global.voices_volume, 0);
			}
			menu = "difficulty_settings";
		}
		#endregion /*Select Options END*/

		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "continue";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "select_level";
		}
	}
	/*Options END*/

	/*Select Level*/
	if (menu = "select_level")
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "CONTINUE", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 64, "OPTIONS", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 128, "> SELECT LEVEL <", global.default_text_size * 2.3, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 192, "SAVE AND QUIT", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		if (key_a)
		and(menu_delay = 0)
		{
			/*Return to game*/
			
			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/
			
			global.QuitLevel = true;
			audio_stop_all();
			global.theme = noone;
			global.weather = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "options";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "quit";
		}
	}

	/*Save and Quit*/
	if (menu = "quit")
	{
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, "CONTINUE", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 64, "OPTIONS", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 128, "SELECT LEVEL", global.default_text_size * 2, c_menu_outline, c_menu_fill, 1);
		draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + 192, "> SAVE AND QUIT <", global.default_text_size * 2.3, c_menu_outline, c_menu_fill, 1);
		if (key_a)
		and(menu_delay = 0)
		{
			/*Return to game*/
			
			#region /*Reset timer back to zero*/
			global.timeattack_realmillisecond = 0;
			global.timeattack_millisecond = 0;
			global.timeattack_second = 0;
			global.timeattack_minute = 0;
			#endregion /*Reset timer back to zero END*/
			
			global.QuitLevel = true;
			global.QuitGame = true;
			audio_stop_all();
			global.theme = noone;
			global.weather = noone;
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
		}
		if (key_up)
		and(!key_down)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "select_level";
		}
		else
		if (key_down)
		and(!key_up)
		and(menu_delay <= 0)
		{
			menu_delay = 1;
			menu = "continue";
		}
	}

	#region /*Return to game*/
	if (menu = "continue")
	or(menu = "options")
	or(menu = "select_level")
	or(menu = "quit")
	{
		if (key_b_pressed)
		and(menu_delay = 0)
		{
			audio_resume_all();
			audio_sound_gain(global.music,global.music_volume,0);
			audio_sound_gain(global.music_underwater,0,0);
			global.pause=false;
			instance_activate_region(
			camera_get_view_x(view_camera[view_current]) - 32,
			camera_get_view_y(view_camera[view_current]) - 32,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
			camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
			true);
			instance_destroy();
		}
	}
	#endregion /*Return to game END*/
	
	#region /*Draw lock if convention mode is on*/
	if (global.convention_mode = true)
	{
		if (menu = "continue")
		or(menu = "options")
		or(menu = "select_level")
		or(menu = "quit")
		{
			draw_sprite(spr_lock, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - 25);
		}
	}
	#endregion /*Draw lock if convention mode is on END*/
	
} /*PAUSE INSIDE LEVEL MENU END*/

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
		global.pause=false;
		instance_activate_region(
		camera_get_view_x(view_camera[view_current]) - 32,
		camera_get_view_y(view_camera[view_current]) - 32,
		camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32,
		camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 32,
		true);
		instance_destroy();
	}
}
#endregion /*Return to game END*/

scr_options_menu(); /*Options*/

#region /*Window is focused, hide cursor*/
if (window_has_focus())
and(window_mouse_get_x() > camera_get_view_x(view_camera[view_current]) + 8)
and(window_mouse_get_x() < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 8)
and(window_mouse_get_y() > camera_get_view_y(view_camera[view_current]) + 8)
and(window_mouse_get_y() < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 8)
{
	window_set_cursor(cr_none);
}
else
{
	if (!window_get_fullscreen())
	{
		window_set_cursor(cr_default);
	}
}
#endregion /*Window is focused, hide cursor END*/

#region /*If Window is unfocused, make the screen darker*/
if (!window_has_focus())
{
	draw_set_alpha(0.5);
	draw_rectangle_color(
	0,
	0,
	window_get_width(),
	window_get_height(),
	c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /*If Window is unfocused, make the screen darker END*/

#region /*Draw mouse cursor for menu navigation*/
if (window_has_focus())
and(global.controls_used_for_menu_navigation="mouse")
and(os_type!=os_ios)
and(os_type!=os_android)
{
	draw_sprite_ext(spr_cursor,0,window_mouse_get_x(),window_mouse_get_y(),1,1,0,c_white,1);
}
#endregion /*Draw mouse cursor for menu navigation END*/