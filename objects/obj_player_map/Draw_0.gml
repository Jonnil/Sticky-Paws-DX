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
&& (global.pause == false)
{
	
	#region /* Can go up */
	if (!place_meeting(x, y - 1, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.up], x, y - 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[1])
		{
			if (global.player_[inp.key][1][1][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][1][2][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[2])
		{
			if (global.player_[inp.key][2][1][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][2][2][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[3])
		{
			if (global.player_[inp.key][3][1][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][3][2][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[4])
		{
			if (global.player_[inp.key][4][1][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][4][2][action.up] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.up], x, y - 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go up END */
	
	#region /* Can go down */
	if (!place_meeting(x, y + 1, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.down], x, y + 48, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[1])
		{
			if (global.player_[inp.key][1][1][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][1][2][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[2])
		{
			if (global.player_[inp.key][2][1][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][2][2][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[3])
		{
			if (global.player_[inp.key][3][1][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][3][2][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[4])
		{
			if (global.player_[inp.key][4][1][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][4][2][action.down] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.down], x, y + 48, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go down END */
	
	#region /* Can go left */
	if (!place_meeting(x - 1, y, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.left], x - 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[1])
		{
			if (global.player_[inp.key][1][1][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][1][2][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[2])
		{
			if (global.player_[inp.key][2][1][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][2][2][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[3])
		{
			if (global.player_[inp.key][3][1][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][3][2][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[4])
		{
			if (global.player_[inp.key][4][1][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][4][2][action.left] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.left], x - 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go left END */
	
	#region /* Can go right */
	if (!place_meeting(x + 1, y, obj_wall))
	{
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(global.player_[inp.gp][1][1][action.right], x + 48, y, 0.5, c_white, scr_sin_oscillate(0, 1, 1));
		}
		else
		if (global.player_can_play[1])
		{
			if (global.player_[inp.key][1][1][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][1][2][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][1][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[2])
		{
			if (global.player_[inp.key][2][1][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][2][2][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][2][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[3])
		{
			if (global.player_[inp.key][3][1][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][3][2][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][3][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
		else
		if (global.player_can_play[4])
		{
			if (global.player_[inp.key][4][1][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][1][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
			else
			if (global.player_[inp.key][4][2][action.right] > noone)
			{
				draw_sprite_ext(spr_keyboard_keys, global.player_[inp.key][4][2][action.right], x + 48, y, 0.5, 0.5, 0, c_white, scr_sin_oscillate(0, 1, 1));
			}
		}
	}
	#endregion /* Can go right END */
	
}
#endregion /* Show arrows where you can walk END*/

if (sprite_index > 0)
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale, draw_yscale * default_yscale, 0, image_blend, 1);
}

#region /* Show Level Info */
if (instance_exists(obj_level)) /* Must check if obj_level exists or not */
&& (distance_to_object(instance_nearest(x, y, obj_level)) < 4)
&& (move_delay > 10)
&& (instance_nearest(x, y, obj_level).level_number != 0)
&& (point_distance(xx, yy, x, y) < 30)
{
	if (instance_nearest(x, y, obj_level).clear_rate == "enter")
	|| (instance_nearest(x, y, obj_level).clear_rate == "clear")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		{
			total_defeats_y = -64;
			times_cleared_y = -96;
			best_score_y = -128;
			best_time_y = -160;
			show_big_collectibles_y = -192;
		}
		else
		{
			total_defeats_y = 0;
			times_cleared_y = -64;
			best_score_y = -96;
			best_time_y = -128;
			show_big_collectibles_y = -160;
		}
		
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		|| (instance_nearest(x, y, obj_level).number_of_clears > 0)
		|| (instance_nearest(x, y, obj_level).level_score > 0)
		|| (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		&& (instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		|| (instance_nearest(x, y, obj_level).big_collectible1)
		|| (instance_nearest(x, y, obj_level).big_collectible2)
		|| (instance_nearest(x, y, obj_level).big_collectible3)
		|| (instance_nearest(x, y, obj_level).big_collectible4)
		|| (instance_nearest(x, y, obj_level).big_collectible5)
		{
			draw_set_alpha(0.9);
			draw_rectangle_color(x - 140, y - abs(show_big_collectibles_y) - 16, x + 140, y - 52, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
		
		#region /* Total number of defeats */
		if (global.show_defeats_counter)
		&& (instance_nearest(x, y, obj_level).number_of_defeats > 0)
		{
			scr_draw_text_outlined(x, y + total_defeats_y, l10n_text("Total Defeats") + ": " + string(instance_nearest(x, y, obj_level).number_of_defeats), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Total number of defeats END */
		
		#region /* Number of times played */
		if (instance_nearest(x, y, obj_level).number_of_clears > 0)
		{
			scr_draw_text_outlined(x, y + times_cleared_y, l10n_text("Times Passed") + ": " + string(instance_nearest(x, y, obj_level).number_of_clears), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Number of times played END */
		
		#region /* Show High Score */
		if (instance_nearest(x, y, obj_level).level_score > 0)
		{
			scr_draw_text_outlined(x, y + best_score_y, l10n_text("Best Score") + ": " + string(instance_nearest(x, y, obj_level).level_score), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show High Score END */
		
		#region /* Show Fastest Time */
		if (instance_nearest(x, y, obj_level).timeattack_realmillisecond < 999999999)
		&& (instance_nearest(x, y, obj_level).timeattack_realmillisecond > 0)
		{
			scr_draw_text_outlined(x, y + best_time_y, l10n_text("Best Time") + ": " + string(instance_nearest(x, y, obj_level).timeattack_minute) + ":" +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_second, 2, 0), " ", "0")) + "." +
			string(string_replace_all(string_format(instance_nearest(x, y, obj_level).timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show Fastest Time END */
		
		#region /* Show Big Collectible */
		if (instance_nearest(x, y, obj_level).big_collectible1)
		|| (instance_nearest(x, y, obj_level).big_collectible2)
		|| (instance_nearest(x, y, obj_level).big_collectible3)
		|| (instance_nearest(x, y, obj_level).big_collectible4)
		|| (instance_nearest(x, y, obj_level).big_collectible5)
		{
			if (instance_nearest(x, y, obj_level).big_collectible1)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x - 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, x - 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible2)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x - 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, x - 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible3)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, x, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible4)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x + 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, x + 24, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			if (instance_nearest(x, y, obj_level).big_collectible5)
			&& (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, x + 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
			else
			if (global.resource_pack_sprite_big_collectible > 0)
			{
				draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, x + 48, y + show_big_collectibles_y, 0.3, 0.3, 0, c_white, 1);
			}
		}
		#endregion /* Show Big Collectible END */
		
	}
}
#endregion /* Show Level Info END */

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