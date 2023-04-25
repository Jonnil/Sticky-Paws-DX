var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

black_background_alpha = lerp(black_background_alpha, 0.75, 0.01);
menu_cursor_index += 0.3;

draw_set_alpha(black_background_alpha);
draw_rectangle_colour(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

#region /* Draw Skip Text */
draw_set_halign(fa_right);
draw_set_valign(fa_top);

#region /* If gamepad is connected */
if (gamepad_is_connected(global.player1_slot))
and (global.player1_can_play == true)
and (global.controls_used_for_menu_navigation == "controller")
or(gamepad_is_connected(global.player2_slot))
and (global.player2_can_play == true)
and (global.controls_used_for_menu_navigation == "controller")
or(gamepad_is_connected(global.player3_slot))
and (global.player3_can_play == true)
and (global.controls_used_for_menu_navigation == "controller")
or(gamepad_is_connected(global.player4_slot))
and (global.player4_can_play == true)
and (global.controls_used_for_menu_navigation == "controller")
or (global.always_show_gamepad_buttons == true)
{
	scr_draw_text_outlined(get_window_width - 64, 0, l10n_text("Skip") + " : " + l10n_text("Hold"), global.default_text_size, c_black, c_white, 1);
	scr_draw_gamepad_buttons(gp_start, get_window_width - 32, 21, 0.5, c_white, 1);
}
#endregion /* If gamepad is connected END */

else

#region /* If playing on mobile */
if (os_type == os_ios)
or (os_type == os_android)
{
	scr_draw_text_outlined(get_window_width - 16, 0, l10n_text("Skip") + " : " + l10n_text("Press and Hold Screen"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* If playing on mobile END */

else

#region /* If playing on Keyboard */
if (global.controls_used_for_menu_navigation = "keyboard")
or (global.controls_used_for_menu_navigation = "mouse")
{
	draw_menu_button(get_window_width - 370, 0, l10n_text("Skip") + " : " + l10n_text("Hold"), "skip", "skip");
	draw_sprite_ext(spr_keyboard_keys, vk_escape, get_window_width - 32, 21, 0.5, 0.5, 0, c_white, 1);
}
#endregion /* If playing on Keyboard */

if (global.controls_used_for_menu_navigation == "mouse")
{
	menu = "";
}

if (skip > 0)
{
	scr_draw_circular_bar(get_window_width - 32, 21, skip, 64, c_red, 20, 1, 6); /* Draw a circular bar that fills when skipping */
}

#endregion /* Draw Skip Text END */

if (sprite_index == global.title_logo_index)
and (global.title_logo_index >= 0)
{
	draw_sprite_ext(sprite_index, image_index, display_get_gui_width() * 0.5, y, 402 / sprite_get_height(global.title_logo_index), 402 / sprite_get_height(global.title_logo_index), 0, c_white, image_alpha);
}
else
if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, get_window_width * 0.5, y, 1, 1, 0, c_white, image_alpha);
}

if (keyboard_check(vk_escape))
or (gamepad_button_check(global.player1_slot, gp_start))
or (gamepad_button_check(global.player2_slot, gp_start))
or (gamepad_button_check(global.player3_slot, gp_start))
or (gamepad_button_check(global.player4_slot, gp_start))
or (os_type == os_ios)
and (mouse_check_button(mb_left))
or (os_type == os_android)
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
if (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 370, 0, get_window_width, 41))
and (mouse_check_button(mb_left))
{
	menu_delay = 9999;
}

if (image_index >= image_number - 1)
and (sprite_index = spr_credits)
{
	end_credits = true;
}

if (image_index <= 1)
and (end_credits == true)
and (sprite_index = spr_credits)
{
	menu_delay = 9999;
	sprite_index = noone;
}

if (iris_xscale <= 0.01)
{
	if (room == room_title)
	{
		global.character_select_in_this_menu = "main_game";
		room_restart();
	}
	else
	if (room == room_leveleditor)
	and (global.character_select_in_this_menu == "level_editor")
	and (global.actually_play_edited_level == true)
	and (global.play_edited_level == true)
	{
		global.actually_play_edited_level = false;
		global.play_edited_level = false;
		room_goto(room_title);
	}
	else
	if (room == room_leveleditor)
	and (global.character_select_in_this_menu == "level_editor")
	and (global.actually_play_edited_level == false)
	and (global.play_edited_level == true)
	{
		global.play_edited_level = false;
		room_restart();
	}
	else
	{
		room_goto(room_world_map);
	}
}

if (keyboard_check(vk_space))
or (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][1][action.accept]))
or (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][1][action.accept]))
or (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][1][action.accept]))
or (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][1][action.accept]))
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

if (time >= room_speed* 1 - 10)
if (time <= room_speed* 1 + 10)
{
	yy = get_window_height * 0.5;
	alpha = 1;
}
if (time >= room_speed* 4 - 10)
if (time <= room_speed* 4 + 10)
{
	yy = 0;
	alpha = 0;
}
if (time >= room_speed* 5 - 10)
if (time <= room_speed* 5 + 10)
{
	y = get_window_height;
	yy = get_window_height;
	alpha = 0;
}
if (time >= room_speed* 5)
{
	if (end_credits == false)
	{
		time = 0;
	}
	image_index += 1;
	if (sprite_index == global.title_logo_index)
	{
		sprite_index = spr_credits;
		image_index = 0;
	}
}

#region /* Draw Iris Transitions */

#region /* Iris Zooming */
if (menu_delay > 10)
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

#endregion /* Iris Zooming END */

if (global.enable_transitions == true)
{
	if (iris_xscale < 15)
	{
		if (asset_get_type("spr_iris") == asset_sprite)
		{
			draw_sprite_ext(spr_iris, 0, get_window_width * 0.5, get_window_height * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
		}
		draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, get_window_width * 0.5 - iris_xscale * 128, get_window_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(get_window_width * 0.5 + iris_xscale * 128 - 1, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, get_window_height * 0.5 + iris_yscale * 128, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /* Draw Iris Transitions END */

if (instance_exists(obj_credits) > 1)
{
	instance_destroy(); /* If there is more than 1 credits, destroy itself */
}

scr_draw_cursor_mouse();