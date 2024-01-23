#region /* Heart above head */
if (have_heart_balloon)
{
	xx_heart = lerp(xx_heart, x, 0.05);
	yy_heart = lerp(yy_heart, y - 64, 0.05);
	draw_line_width_color(xx, yy, xx_heart, yy_heart, 6, c_black, c_black);
	draw_line_width_color(xx, yy, xx_heart, yy_heart, 3, c_white, c_white);
	draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, point_direction(xx_heart, yy_heart, xx, yy) + 90, c_white, 1);
}
#endregion /* Heart above head END */

#region /* Show arrows where you can walk */
if (can_move)
&& (can_enter_level >= 30)
&& (point_distance(xx, yy, x, y) < 30)
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (speed == 0)
&& (instance_nearest(x, y, obj_level).clear_rate != "closed")
&& (!global.pause)
{
	
	#region /* Can go up */
	if (!place_meeting(x, y - 1, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[player]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.up], x, y - 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[player])
		{
			if (global.player_[inp.key][player][1][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][player][2][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go up END */
	
	#region /* Can go down */
	if (!place_meeting(x, y + 1, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[player]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.down], x, y + 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[player])
		{
			if (global.player_[inp.key][player][1][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][player][2][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go down END */
	
	#region /* Can go left */
	if (!place_meeting(x - 1, y, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[player]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.left], x - 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[player])
		{
			if (global.player_[inp.key][player][1][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][player][2][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go left END */
	
	#region /* Can go right */
	if (!place_meeting(x + 1, y, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[player]))
		&& (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][player][1][action.right], x + 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[player])
		{
			if (global.player_[inp.key][player][1][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][player][2][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][player][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go right END */
	
}
#endregion /* Show arrows where you can walk END*/

if (sprite_exists(sprite_index))
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale, draw_yscale * default_yscale, 0, image_blend, 1);
}

#region /* Draw Iris Transitions */
if (global.enable_transitions)
{
	if (iris_xscale < 15)
	{
		draw_set_alpha(1);
		draw_sprite_ext(spr_iris, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
		draw_rectangle_color(-32, -32, room_width, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(-32, -32, xx - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(xx + iris_xscale * 128 - 1, -32, room_width, room_height, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(-32, yy + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /* Draw Iris Transitions END */

scr_draw_text_outlined(x, y - 128, "delay: " + string(delay));