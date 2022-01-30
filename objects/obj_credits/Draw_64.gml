black_background_alpha = lerp(black_background_alpha, 0.75, 0.01);

draw_set_alpha(black_background_alpha);
draw_rectangle_colour(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

#region /*Draw Skip Text*/
if (skip > 0)
{
	draw_rectangle_colour(0, + 64 - skip, window_get_width(), + 64, c_red, c_red, c_red, c_red, false);
}
draw_set_halign(fa_right);
draw_set_valign(fa_top);

#region /*If gamepad is connected*/
if (gamepad_is_connected(0))
and (global.player1_can_play = true)
and (global.controls_used_for_menu_navigation = "controller")
or(gamepad_is_connected(1))
and (global.player2_can_play = true)
and (global.controls_used_for_menu_navigation = "controller")
or(gamepad_is_connected(2))
and (global.player3_can_play = true)
and (global.controls_used_for_menu_navigation = "controller")
or(gamepad_is_connected(3))
and (global.player4_can_play = true)
and (global.controls_used_for_menu_navigation = "controller")
{
	draw_text_outlined(window_get_width() - 16, + 16, "Skip: Hold Start", global.default_text_size, c_black, c_white, 1);
}
#endregion /*If gamepad is connected END*/

else

#region /*If playing on mobile*/
if (os_type == os_ios)
or(os_type == os_android)
{
	draw_text_outlined(window_get_width() - 16, + 16, "Skip: Press and Hold Screen", global.default_text_size, c_black, c_white, 1);
}
#endregion /*If playing on mobile END*/

else

#region /*If playing on Keyboard*/
if (global.controls_used_for_menu_navigation = "keyboard")
or(global.controls_used_for_menu_navigation = "mouse")
{
	draw_menu_button(window_get_width() - 370, 21, "Skip: Hold", "skip", "skip")
	draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width() - 32, 21, 0.75, 0.75, 0, c_white, 1);
}
#endregion /*If playing on Keyboard*/

#endregion /*Draw Skip Text END*/

if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, window_get_width()/ 2, y, 1, 1, 0, c_white, image_alpha);
}

if (keyboard_check(vk_escape))
or(gamepad_button_check(0, gp_start))
or(gamepad_button_check(1, gp_start))
or(gamepad_button_check(2, gp_start))
or(gamepad_button_check(3, gp_start))
or(os_type == os_ios)
and (mouse_check_button(mb_left))
or(os_type == os_android)
and (mouse_check_button(mb_left))
{
	skip += 1;
	if (skip > 64)
	{
		menu_delay = 9999;
	}
}
else
{
	if (skip > 0)
	{
		skip -= 1;
	}
}

if (image_index >= image_number - 1)
and (sprite_index = spr_credits)
{
	end_credits = true;
}

if (image_index <= 1)
and (end_credits = true)
and (sprite_index = spr_credits)
{
	menu_delay = 9999;
	sprite_index = noone;
}

if (iris_xscale <= 0.01)
{
	if (room = room_title)
	{
		global.character_select_in_this_menu = "main_game";
		room_restart();
	}
	else
	{
		room_goto(room_world_map);
	}
}

if (keyboard_check(vk_space))
or(gamepad_button_check(0, gp_face1))
or(gamepad_button_check(1, gp_face1))
or(gamepad_button_check(2, gp_face1))
or(gamepad_button_check(3, gp_face1))
{
	time += 10;
	y = lerp(y, yy, 0.75);
	image_alpha = lerp(image_alpha, alpha, 0.75);
}
else
{
	time += 1;
	y = lerp(y, yy, 0.1);
	image_alpha = lerp(image_alpha, alpha, 0.1);
}

if (time >= room_speed* 1- 10)
if (time <= room_speed* 1+ 10)
{
	yy = window_get_height()/ 2;
	alpha = 1;
}
if (time >= room_speed*4 - 10)
if (time <= room_speed*4+ 10)
{
	yy = 0;
	alpha = 0;
}
if (time >= room_speed*5- 10)
if (time <= room_speed*5+ 10)
{
	y = window_get_height();
	yy = window_get_height();
	alpha = 0;
}
if (time >= room_speed*5)
{
	if (end_credits = false)
	{
		time = 0;
	}
	image_index += 1;
	if (sprite_index = global.resourcepack_sprite_title_logo_christmas)
	or(sprite_index = global.resourcepack_sprite_title_logo)
	{
		sprite_index = spr_credits;
		image_index = 0;
	}
}

#region /*Draw Iris Transitions*/

#region /*Iris Zooming*/
if (menu_delay > 10)
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
#endregion /*Zoom Out END*/

#endregion /*Iris Zooming END*/

if (global.enable_transitions = true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, window_get_width()/ 2, window_get_height()/ 2, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, window_get_width()*2, window_get_height()/ 2 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, window_get_width()/ 2 - iris_xscale * 128, window_get_height()*2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(window_get_width()/ 2 + iris_xscale * 128 - 1, 0, window_get_width()*2, window_get_height()*2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, window_get_height()/ 2 + iris_yscale * 128, window_get_width()*2, window_get_height()*2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /*Draw Iris Transitions END*/

if (instance_number(obj_credits) > 1)
{
	instance_destroy(); /*If there is more than 1 credits, destroy itself*/
}

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (os_type != os_ios)
and (os_type != os_android)
and (global.pause = false)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/