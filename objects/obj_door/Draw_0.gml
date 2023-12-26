if (sprite_index == spr_warp_box)
|| (sprite_index == spr_warp_box_one_use)
{
	draw_self();
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_black, 1); /* Black behind the door */
	draw_sprite_ext(sprite_index, image_index, x + door_x, y, door_xscale, 1, 0, image_blend, 1); /* The door itself */
}

#region /* Show Player Up Key */
if (need_to_press_up_to_enter)
{
	if (instance_exists(obj_player))
	{
		if (instance_nearest(x, y, obj_player).player == 1)
		{
			player_gamepad_button_up = global.player_[inp.gp][1][1][action.up];
			player_gamepad_button2_up = global.player_[inp.gp][1][2][action.up];
			player_key_up = global.player_[inp.key][1][1][action.up];
			player_key2_up = global.player_[inp.key][1][2][action.up];
		}
		else
		if (instance_nearest(x, y, obj_player).player == 2)
		{
			player_gamepad_button_up = global.player_[inp.gp][2][1][action.up];
			player_gamepad_button2_up = global.player_[inp.gp][2][2][action.up];
			player_key_up = global.player_[inp.key][2][1][action.up];
			player_key2_up = global.player_[inp.key][2][2][action.up];
		}
		else
		if (instance_nearest(x, y, obj_player).player == 3)
		{
			player_gamepad_button_up = global.player_[inp.gp][3][1][action.up];
			player_gamepad_button2_up = global.player_[inp.gp][3][2][action.up];
			player_key_up = global.player_[inp.key][3][1][action.up];
			player_key2_up = global.player_[inp.key][3][2][action.up];
		}
		else
		if (instance_nearest(x, y, obj_player).player == 4)
		{
			player_gamepad_button_up = global.player_[inp.gp][4][1][action.up];
			player_gamepad_button2_up = global.player_[inp.gp][4][2][action.up];
			player_key_up = global.player_[inp.key][4][1][action.up];
			player_key2_up = global.player_[inp.key][4][2][action.up];
		}
	}
	if (door_xscale > 0)
	{
		if (instance_exists(obj_player))
		&& (gamepad_is_connected(instance_nearest(x, y, obj_player).player - 1))
		&& (global.controls_used_for_navigation == "gamepad")
		&& (player_gamepad_button_up > noone)
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(player_gamepad_button_up, x + door_x, y, 0.4, c_white, 0.5, door_xscale, 1);
		}
		else
		if (instance_exists(obj_player))
		&& (gamepad_is_connected(instance_nearest(x, y, obj_player).player - 1))
		&& (global.controls_used_for_navigation == "gamepad")
		&& (player_gamepad_button2_up > noone)
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(player_gamepad_button2_up, x + door_x, y, 0.4, c_white, 0.5, door_xscale, 1);
		}
		else
		if (player_key_up > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, player_key_up, x + door_x, y, 0.4 * door_xscale, 0.4, 0, c_white, 0.5);
		}
		else
		if (player_key2_up > noone)
		{
			draw_sprite_ext(spr_keyboard_keys, player_key2_up, x + door_x, y, 0.4 * door_xscale, 0.4, 0, c_white, 0.5);
		}
	}
}
#endregion /* Show Player Down Key END */