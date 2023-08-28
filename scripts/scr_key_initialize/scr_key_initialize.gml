function scr_key_initialize(key, hold0_press1_release2, what_player = 1, this_player_key = action.jump)
{
	var key_mouse = noone;
	var key2_mouse = noone;
	var joy_1 = noone;
	var joy_2 = noone;
	var gp_other = noone;
	
	#region /* Mouse */
	if (mouse_check_button(mb_any))
	|| (mouse_check_button_released(mb_any))
	{
		
		#region /* Mouse 1 */
		var button_value = global.player_[inp.key][what_player][1][this_player_key];
		
		switch (button_value) {
			case mouse_button_value.mb_left:
				if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_left);
				else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_left);
				else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_left);
				break;
			case mouse_button_value.mb_middle:
				if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_middle);
				else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_middle);
				else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_middle);
				break;
			case mouse_button_value.mb_right:
				if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_right);
				else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_right);
				else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_right);
				break;
			case mouse_button_value.mb_side1:
				if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_side1);
				else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_side1);
				else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_side1);
				break;
			case mouse_button_value.mb_side2:
				if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_side2);
				else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_side2);
				else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_side2);
				break;
			case mouse_button_value.mwheel_down:
				key_mouse = mouse_wheel_down();
				break;
			case mouse_button_value.mwheel_up:
				key_mouse = mouse_wheel_up();
				break;
		}
		#endregion /* Mouse 1 END */
		
		#region /* Mouse 2 */
		button_value = global.player_[inp.key][what_player][2][this_player_key];
		
		switch (button_value) {
			case mouse_button_value.mb_left:
				if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_left);
				else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_left);
				else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_left);
				break;
			case mouse_button_value.mb_middle:
				if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_middle);
				else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_middle);
				else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_middle);
				break;
			case mouse_button_value.mb_right:
				if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_right);
				else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_right);
				else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_right);
				break;
			case mouse_button_value.mb_side1:
				if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_side1);
				else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_side1);
				else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_side1);
				break;
			case mouse_button_value.mb_side2:
				if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_side2);
				else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_side2);
				else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_side2);
				break;
			case mouse_button_value.mwheel_down:
				key2_mouse = mouse_wheel_down();
				break;
			case mouse_button_value.mwheel_up:
				key2_mouse = mouse_wheel_up();
				break;
			default:
				break;
		}
		#endregion /* Mouse 2 END */
		
	}
	#endregion /* Mouse END */
	
	if (gamepad_is_connected(global.player_slot[what_player]))
	{
		
		#region /* Joystick */
		button_value = global.player_[inp.gp][what_player][1][this_player_key];
		
		switch (button_value) {
			case joystick_value.joyleft_left: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axislh) < 0; break;
			case joystick_value.joyleft_right: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axislh) > 0; break;
			case joystick_value.joyleft_down: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axislv) > 0; break;
			case joystick_value.joyleft_up: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axislv) < 0; break;
			case joystick_value.joyright_left: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axisrh) < 0; break;
			case joystick_value.joyright_right: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axisrh) > 0; break;
			case joystick_value.joyright_down: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axisrv) > 0; break;
			case joystick_value.joyright_up: joy_1 = gamepad_axis_value(global.player_slot[what_player], gp_axisrv) < 0; break;
		}
		
		button_value = global.player_[inp.gp][what_player][2][this_player_key];
		switch (button_value) {
			case joystick_value.joyleft_left: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axislh) < 0; break;
			case joystick_value.joyleft_right: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axislh) > 0; break;
			case joystick_value.joyleft_down: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axislv) > 0; break;
			case joystick_value.joyleft_up: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axislv) < 0; break;
			case joystick_value.joyright_left: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axisrh) < 0; break;
			case joystick_value.joyright_right: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axisrh) > 0; break;
			case joystick_value.joyright_down: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axisrv) > 0; break;
			case joystick_value.joyright_up: joy_2 = gamepad_axis_value(global.player_slot[what_player], gp_axisrv) < 0; break;
		}
		#endregion /* Joystick END */
		
		if (hold0_press1_release2 == 0)
		{
			gp_other = gamepad_button_check(global.player_slot[what_player], global.player_[inp.gp][what_player][1][this_player_key]) || gamepad_button_check(global.player_slot[what_player], global.player_[inp.gp][what_player][2][this_player_key]);
		}
		else
		if (hold0_press1_release2 == 1)
		{
			gp_other = gamepad_button_check_pressed(global.player_slot[what_player], global.player_[inp.gp][what_player][1][this_player_key]) || gamepad_button_check_pressed(global.player_slot[what_player], global.player_[inp.gp][what_player][2][this_player_key]);
		}
		else
		if (hold0_press1_release2 == 2)
		{
			gp_other = gamepad_button_check_released(global.player_slot[what_player], global.player_[inp.gp][what_player][1][this_player_key]) || gamepad_button_check_released(global.player_slot[what_player], global.player_[inp.gp][what_player][2][this_player_key]);
		}
	}
	
	if (hold0_press1_release2 == 0)
	{
		var key_other = keyboard_check(global.player_[inp.key][what_player][1][this_player_key]) || keyboard_check(global.player_[inp.key][what_player][2][this_player_key]);
	}
	else
	if (hold0_press1_release2 == 1)
	{
		var key_other = keyboard_check_pressed(global.player_[inp.key][what_player][1][this_player_key]) || keyboard_check_pressed(global.player_[inp.key][what_player][2][this_player_key]);
	}
	else
	if (hold0_press1_release2 == 2)
	{
		var key_other = keyboard_check_released(global.player_[inp.key][what_player][1][this_player_key]) || keyboard_check_released(global.player_[inp.key][what_player][2][this_player_key]);
	}
	
	var return_key = key_mouse || key2_mouse || joy_1 || joy_2 || key_other || gp_other;
	
	return return_key;
}