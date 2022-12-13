draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_black, 1); /* Black behind the door */
draw_sprite_ext(sprite_index, image_index, x + door_x, y, door_xscale, 1, 0, c_white, 1); /* The door itself */

#region /* Show Player Up Key */
if (instance_exists(obj_player))
{
	if (instance_nearest(x, y, obj_player).player == 1)
	{
		player_gamepad_button_up = global.player1_gamepad_button_up;
		player_gamepad_button2_up = global.player1_gamepad_button2_up;
		player_key_up = global.player1_key_up;
		player_key2_up = global.player1_key2_up;
	}
	else
	if (instance_nearest(x, y, obj_player).player == 2)
	{
		player_gamepad_button_up = global.player2_gamepad_button_up;
		player_gamepad_button2_up = global.player2_gamepad_button2_up;
		player_key_up = global.player2_key_up;
		player_key2_up = global.player2_key2_up;
	}
	else
	if (instance_nearest(x, y, obj_player).player == 3)
	{
		player_gamepad_button_up = global.player3_gamepad_button_up;
		player_gamepad_button2_up = global.player3_gamepad_button2_up;
		player_key_up = global.player3_key_up;
		player_key2_up = global.player3_key2_up;
	}
	else
	if (instance_nearest(x, y, obj_player).player == 4)
	{
		player_gamepad_button_up = global.player4_gamepad_button_up;
		player_gamepad_button2_up = global.player4_gamepad_button2_up;
		player_key_up = global.player4_key_up;
		player_key2_up = global.player4_key2_up;
	}
}
if (door_xscale > 0)
{
	if (instance_exists(obj_player))
	and (gamepad_is_connected(instance_nearest(x, y, obj_player).player - 1))
	and (global.controls_used_for_menu_navigation == "controller")
	and (player_gamepad_button_up > noone)
	or (global.always_show_gamepad_buttons == true)
	{
		scr_draw_gamepad_buttons(player_gamepad_button_up, x + door_x, y, 0.4, c_white, 0.5, door_xscale, 1);
	}
	else
	if (instance_exists(obj_player))
	and (gamepad_is_connected(instance_nearest(x, y, obj_player).player - 1))
	and (global.controls_used_for_menu_navigation == "controller")
	and (player_gamepad_button2_up > noone)
	or (global.always_show_gamepad_buttons == true)
	{
		scr_draw_gamepad_buttons(player_gamepad_button2_up, x + door_x, y, 0.4, c_white, 0.5, door_xscale, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	and (player_key_up > noone)
	{
		draw_sprite_ext(spr_keyboard_keys, player_key_up, x + door_x, y, 0.4 * door_xscale, 0.4, 0, c_white, 0.5);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	and (player_key2_up > noone)
	{
		draw_sprite_ext(spr_keyboard_keys, player_key2_up, x + door_x, y, 0.4 * door_xscale, 0.4, 0, c_white, 0.5);
	}
}
#endregion /* Show Player Down Key END */