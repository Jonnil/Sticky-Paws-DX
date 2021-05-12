//draw_text_outlined(mouse_x+64,mouse_y-64,"x:"+string(mouse_x)+" y:"+string(mouse_y),global.default_text_size,c_white,c_black,1);

scr_set_screen_size();

/*Draw Event*/
key_a=(gamepad_button_check_pressed(0,gp_face1))or(keyboard_check_pressed(ord("Z")))or(keyboard_check_pressed(vk_enter))or(keyboard_check_pressed(vk_space))or(keyboard_check_pressed(vk_escape));
if (key_a)or(window_has_focus())and(mouse_check_button_pressed(mb_left)){if (room_next(room)<>-1){room_goto_next();}}

draw_set_halign(fa_center); /*Initialize Font*/

/*Sprite*/ draw_sprite_ext(sprite_index,image_index,window_get_width()/2,window_get_height()/2,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if (image_index>image_number-2)
and(asset_get_type("spr_company_logo")==asset_sprite)
and(sprite_index=spr_company_logo)
{
	if (!gamepad_is_connected(0))
	and(!gamepad_is_connected(1))
	and(!gamepad_is_connected(2))
	and(!gamepad_is_connected(3))
	{
		if (asset_get_type("spr_splash_controller")==asset_sprite)
		{
			sprite_index=spr_splash_controller;
		}
		else
		{
			if (room_next(room)<>-1)
			{
				room_goto_next();
			}
		}
	}
	else
	if (room_next(room)<>-1)
	{
		room_goto_next();
	}
}

if (asset_get_type("spr_splash_controller")==asset_sprite)
and(sprite_index=spr_splash_controller)
{
	time+=1;
	if (time>100)
	{
		if (room_next(room)<>-1)
		{
			room_goto_next();
		}
	}
}

if (image_index=20)
and(asset_get_type("menuvoice_companysplash")==asset_sound)
{
	if (!audio_is_playing(menuvoice_companysplash))
	{
		audio_play_sound(menuvoice_companysplash,0,0);
		audio_sound_gain(menuvoice_companysplash,global.voices_volume,0);
	}
}

if (time=10)
and(asset_get_type("menuvoice_controllersplash")==asset_sound)
{
	if (!audio_is_playing(menuvoice_controllersplash))
	{
		audio_play_sound(menuvoice_controllersplash,0,0);
		audio_sound_gain(menuvoice_controllersplash,global.voices_volume,0);
	}
}

#region /*Fullscreen Toggle if camera object doesn't exist. Default: F11*/
if (asset_get_type("obj_camera")==asset_object)
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

#region /*Window is focused, hide cursor*/
if (window_has_focus())
and(mouse_x>camera_get_view_x(view_camera[view_current])+8)
and(mouse_x<camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-8)
and(mouse_y>camera_get_view_y(view_camera[view_current])+8)
and(mouse_y<camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-8)
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
	draw_rectangle_color(camera_get_view_x(view_camera[view_current]),camera_get_view_y(view_camera[view_current]),room_width,room_height,c_black,c_black,c_black,c_black,false);
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