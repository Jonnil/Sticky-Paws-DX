scr_set_screen_size();

/*Draw Event*/
if(gamepad_button_check_pressed(0, gp_face1))
or (keyboard_check_pressed(ord("Z")))
or (keyboard_check_pressed(vk_enter))
or (keyboard_check_pressed(vk_space))
or (keyboard_check_pressed(vk_escape))
or (window_has_focus())
and (mouse_check_button_pressed(mb_left))
{
	if (asset_get_type("room_title") == asset_room)
	{
		room_goto(room_title);
	}
	else
	if (room_next(room)<>-1)
	{
		room_goto_next();
	}
}

#region /*Initialize Font*/
draw_set_halign(fa_center);
draw_set_valign(fa_center);
#endregion /*Initialize Font*/

/*Sprite*/
draw_sprite_ext(sprite_index, image_index, window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, 1);

if (sprite_splash_easteregg > noone)
{
	draw_sprite_ext(sprite_splash_easteregg, image_index, + 128, window_get_height() + sprite_splash_easteregg_yoffset, 1, 1, 0, c_white, 1);
}

if (gamepad_button_check_pressed(0, gp_face4))
or (keyboard_check_pressed(ord("Y")))
and (sprite_splash_easteregg_yoffset = 128)
{
	sprite_splash_easteregg_yoffset = +127;
	audio_play_sound(audio_splash_easteregg, 0, false);
	audio_sound_gain(audio_splash_easteregg, global.voices_volume, 0);
	
}

if (sprite_splash_easteregg_yoffset <= 127)
{
	sprite_splash_easteregg_yoffset = lerp(sprite_splash_easteregg_yoffset, -128, 0.1);
}

if (image_index > image_number- 2)
and (sprite_index=spr_company_logo)
{
	if (!gamepad_is_connected(0))
	and (!gamepad_is_connected(1))
	and (!gamepad_is_connected(2))
	and (!gamepad_is_connected(3))
	{
		if (sprite_splash_controller > noone)
		{
			sprite_index = sprite_splash_controller;
		}
		else
		{
			if (asset_get_type("room_title") == asset_room)
			{
				room_goto(room_title);
			}
			else
			if (room_next(room)<>-1)
			{
				room_goto_next();
			}
		}
	}
	else
	if (asset_get_type("room_title") == asset_room)
	{
		room_goto(room_title);
	}
	else
	if (room_next(room)<>-1)
	{
		room_goto_next();
	}
}

if (sprite_splash_controller > noone)
and (sprite_index = sprite_splash_controller)
{
	time+=1;
	if (time >100)
	{
		if (asset_get_type("room_title") == asset_room)
		{
			room_goto(room_title);
		}
		else
		if (room_next(room)<>-1)
		{
			room_goto_next();
		}
	}
}

if (image_index=20)
and (asset_get_type("menuvoice_companysplash") == asset_sound)
{
	if (!audio_is_playing(menuvoice_companysplash))
	{
		audio_play_sound(menuvoice_companysplash, 0, 0);
		audio_sound_gain(menuvoice_companysplash, global.voices_volume, 0);
	}
}

if (time =10)
and (asset_get_type("menuvoice_controllersplash") == asset_sound)
{
	if (!audio_is_playing(menuvoice_controllersplash))
	{
		audio_play_sound(menuvoice_controllersplash, 0, 0);
		audio_sound_gain(menuvoice_controllersplash, global.voices_volume, 0);
	}
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera") == asset_object)
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
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera object doesn't exist. Default: F11 END*/

#region /*If Window is unfocused, make the screen darker*/
if (!window_has_focus())
{
	draw_set_alpha(0.5);
	draw_rectangle_color (camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current]),room_width,room_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}
#endregion /*If Window is unfocused, make the screen darker END*/

#region /*Draw mouse cursor for menu navigation*/
if (window_mouse_get_x() > 0)
and (window_mouse_get_y() > 0)
and (os_type!=os_ios)
and (os_type!=os_android)
{
	draw_sprite_ext(spr_cursor, 0,window_mouse_get_x(),window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/