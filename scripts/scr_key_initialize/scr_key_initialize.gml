/// @description scr_key_initialize(key, hold0_press1_release2, which_player, this_player_key);
/// @param key
/// @param hold0_press1_release2
/// @param which_player
/// @param this_player_key
/// @param key_mouse
/// @param key2_mouse
function scr_key_initialize(key, hold0_press1_release2, which_player, this_player_key = action.jump)
{
	
	#region /* Set correct controller ports */
	if (which_player == 1)
	{
		var player_gamepad_slot = global.player1_slot;
	}
	else
	if (which_player == 2)
	{
		var player_gamepad_slot = global.player2_slot;
	}
	else
	if (which_player == 3)
	{
		var player_gamepad_slot = global.player3_slot;
	}
	else
	if (which_player == 4)
	{
		var player_gamepad_slot = global.player4_slot;
	}
	#endregion /* Set correct controller ports END */
	
	#region /* Mouse */
	
	#region /* Mouse 1 */
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mb_left)
	{
		if (hold0_press1_release2 == 0)
		{
			var key_mouse = mouse_check_button(mb_left);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key_mouse = mouse_check_button_pressed(mb_left);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key_mouse = mouse_check_button_released(mb_left);
		}
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mb_middle)
	{
		if (hold0_press1_release2 == 0)
		{
			var key_mouse = mouse_check_button(mb_middle);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key_mouse = mouse_check_button_pressed(mb_middle);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key_mouse = mouse_check_button_released(mb_middle);
		}
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mb_right)
	{
		if (hold0_press1_release2 == 0)
		{
			var key_mouse = mouse_check_button(mb_right);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key_mouse = mouse_check_button_pressed(mb_right);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key_mouse = mouse_check_button_released(mb_right);
		}
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mb_side1)
	{
		if (hold0_press1_release2 == 0)
		{
			var key_mouse = mouse_check_button(mb_side1);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key_mouse = mouse_check_button_pressed(mb_side1);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key_mouse = mouse_check_button_released(mb_side1);
		}
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mb_side2)
	{
		if (hold0_press1_release2 == 0)
		{
			var key_mouse = mouse_check_button(mb_side2);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key_mouse = mouse_check_button_pressed(mb_side2);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key_mouse = mouse_check_button_released(mb_side2);
		}
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mwheel_down)
	{
		var key_mouse = mouse_wheel_down();
	}
	else
	if (global.player_[inp.key][which_player][1][this_player_key] = mouse_button_value.mwheel_up)
	{
		var key_mouse = mouse_wheel_up();
	}
	else
	{
		var key_mouse = noone;
	}
	#endregion /* Mouse 1 END */
	
	#region /* Mouse 2 */
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mb_left)
	{
		if (hold0_press1_release2 == 0)
		{
			var key2_mouse = mouse_check_button(mb_left);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key2_mouse = mouse_check_button_pressed(mb_left);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key2_mouse = mouse_check_button_released(mb_left);
		}
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mb_middle)
	{
		if (hold0_press1_release2 == 0)
		{
			var key2_mouse = mouse_check_button(mb_middle);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key2_mouse = mouse_check_button_pressed(mb_middle);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key2_mouse = mouse_check_button_released(mb_middle);
		}
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mb_right)
	{
		if (hold0_press1_release2 == 0)
		{
			var key2_mouse = mouse_check_button(mb_right);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key2_mouse = mouse_check_button_pressed(mb_right);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key2_mouse = mouse_check_button_released(mb_right);
		}
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mb_side1)
	{
		if (hold0_press1_release2 == 0)
		{
			var key2_mouse = mouse_check_button(mb_side1);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key2_mouse = mouse_check_button_pressed(mb_side1);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key2_mouse = mouse_check_button_released(mb_side1);
		}
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mb_side2)
	{
		if (hold0_press1_release2 == 0)
		{
			var key2_mouse = mouse_check_button(mb_side2);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			var key2_mouse = mouse_check_button_pressed(mb_side2);
		}
		else
		if (hold0_press1_release2 = 2)
		{
			var key2_mouse = mouse_check_button_released(mb_side2);
		}
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mwheel_down)
	{
		var key2_mouse = mouse_wheel_down();
	}
	else
	if (global.player_[inp.key][which_player][2][this_player_key] = mouse_button_value.mwheel_up)
	{
		var key2_mouse = mouse_wheel_up();
	}
	else
	{
		var key2_mouse = noone;
	}
	#endregion /* Mouse 2 END */
	
	#endregion /* Mouse END */
	
	var key_other =
	(hold0_press1_release2 == 0)
	and (keyboard_check(global.player_[inp.key][which_player][1][this_player_key] /* global.player_[keyboard/gamepad][player][key1/key2][action] */))
	
	or (hold0_press1_release2 == 1)
	and (keyboard_check_pressed(global.player_[inp.key][which_player][1][this_player_key]))
	
	or (hold0_press1_release2 = 2)
	and (keyboard_check_released(global.player_[inp.key][which_player][1][this_player_key]))
	
	or (hold0_press1_release2 == 0)
	and (keyboard_check(global.player_[inp.key][which_player][2][this_player_key]))
	
	or (hold0_press1_release2 == 1)
	and (keyboard_check_pressed(global.player_[inp.key][which_player][2][this_player_key]))
	
	or (hold0_press1_release2 = 2)
	and (keyboard_check_released(global.player_[inp.key][which_player][2][this_player_key]))
	
	or (hold0_press1_release2 == 0)
	and (gamepad_button_check(player_gamepad_slot, global.player_[inp.gp][which_player][1][this_player_key]))
	
	or (hold0_press1_release2 == 1)
	and (gamepad_button_check_pressed(player_gamepad_slot, global.player_[inp.gp][which_player][1][this_player_key]))
	
	or (hold0_press1_release2 = 2)
	and (gamepad_button_check_released(player_gamepad_slot, global.player_[inp.gp][which_player][1][this_player_key]))
	
	or (hold0_press1_release2 == 0)
	and (gamepad_button_check(player_gamepad_slot, global.player_[inp.gp][which_player][2][this_player_key]))
	
	or (hold0_press1_release2 == 1)
	and (gamepad_button_check_pressed(player_gamepad_slot, global.player_[inp.gp][which_player][2][this_player_key]))
	
	or (hold0_press1_release2 = 2)
	and (gamepad_button_check_released(player_gamepad_slot, global.player_[inp.gp][which_player][2][this_player_key]));
	
	key = key_mouse or key2_mouse or key_other;
	
	return (key);
}