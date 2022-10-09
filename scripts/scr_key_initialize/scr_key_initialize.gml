/// @description scr_key_initialize(key, hold0_press1_release2, which_player, this_player_key, this_player_key2, key_mouse, key2_mouse, this_player_gamepad_button, this_player_gamepad_button2);
/// @param key
/// @param hold0_press1_release2
/// @param which_player
/// @param this_player_key
/// @param this_player_key2
/// @param key_mouse
/// @param key2_mouse
/// @param this_player_gamepad_button
/// @param this_player_gamepad_button2
function scr_key_initialize(key, hold0_press1_release2, which_player, this_player_key, this_player_key2, this_player_gamepad_button, this_player_gamepad_button2)
{
	
	#region /* Mouse */
	
	#region /* Mouse 1 */
	if (this_player_key = mouse_button_value.mb_left)
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
	if (this_player_key = mouse_button_value.mb_middle)
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
	if (this_player_key = mouse_button_value.mb_right)
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
	if (this_player_key = mouse_button_value.mb_side1)
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
	if (this_player_key = mouse_button_value.mb_side2)
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
	if (this_player_key = mouse_button_value.mwheel_down)
	{
		var key_mouse = mouse_wheel_down();
	}
	else
	if (this_player_key = mouse_button_value.mwheel_up)
	{
		var key_mouse = mouse_wheel_up();
	}
	else
	{
		var key_mouse = noone;
	}
	#endregion /* Mouse 1 END */
	
	#region /* Mouse 2 */
	if (this_player_key2 = mouse_button_value.mb_left)
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
	if (this_player_key2 = mouse_button_value.mb_middle)
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
	if (this_player_key2 = mouse_button_value.mb_right)
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
	if (this_player_key2 = mouse_button_value.mb_side1)
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
	if (this_player_key2 = mouse_button_value.mb_side2)
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
	if (this_player_key2 = mouse_button_value.mwheel_down)
	{
		var key2_mouse = mouse_wheel_down();
	}
	else
	if (this_player_key2 = mouse_button_value.mwheel_up)
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
	and (keyboard_check(this_player_key))
	
	or(hold0_press1_release2 == 1)
	and (keyboard_check_pressed(this_player_key))
	
	or(hold0_press1_release2 = 2)
	and (keyboard_check_released(this_player_key))
	
	or(hold0_press1_release2 == 0)
	and (keyboard_check(this_player_key2))
	
	or(hold0_press1_release2 == 1)
	and (keyboard_check_pressed(this_player_key2))
	
	or(hold0_press1_release2 = 2)
	and (keyboard_check_released(this_player_key2))
	
	or(hold0_press1_release2 == 0)
	and (gamepad_button_check(which_player - 1, this_player_gamepad_button))
	
	or(hold0_press1_release2 == 1)
	and (gamepad_button_check_pressed(which_player - 1, this_player_gamepad_button))
	
	or(hold0_press1_release2 = 2)
	and (gamepad_button_check_released(which_player - 1, this_player_gamepad_button))
	
	or(hold0_press1_release2 == 0)
	and (gamepad_button_check(which_player - 1, this_player_gamepad_button2))
	
	or(hold0_press1_release2 == 1)
	and (gamepad_button_check_pressed(which_player - 1, this_player_gamepad_button2))
	
	or(hold0_press1_release2 = 2)
	and (gamepad_button_check_released(which_player - 1, this_player_gamepad_button2));
	
	key = key_mouse or key2_mouse or key_other;
	
	return (key);
}