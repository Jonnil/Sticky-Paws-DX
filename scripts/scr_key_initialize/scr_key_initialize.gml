function scr_key_initialize(key, hold0_press1_release2 = 0, what_player = 1, this_player_key = action.jump)
{
	var key_mouse = noone;
	var key2_mouse = noone;
	var joy_1 = noone;
	var joy_2 = noone;
	var gp_other = noone;
	var key_other = noone;
	
	var button_value1 = global.player_[inp.key][what_player][1][this_player_key];
	var button_value2 = global.player_[inp.key][what_player][2][this_player_key];
	var gp_button_value1 = global.player_[inp.gp][what_player][1][this_player_key];
	var gp_button_value2 = global.player_[inp.gp][what_player][2][this_player_key];
	
	#region /* Mouse 1 */
	switch (button_value1) {
		case MOUSE_BUTTON_VALUE.MOUSEB_LEFT:
			if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_left);
			else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_left);
			else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_left);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_MIDDLE:
			if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_middle);
			else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_middle);
			else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_middle);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_RIGHT:
			if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_right);
			else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_right);
			else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_right);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE1:
			if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_side1);
			else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_side1);
			else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_side1);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE2:
			if (hold0_press1_release2 == 0) key_mouse = mouse_check_button(mb_side2);
			else if (hold0_press1_release2 == 1) key_mouse = mouse_check_button_pressed(mb_side2);
			else if (hold0_press1_release2 == 2) key_mouse = mouse_check_button_released(mb_side2);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_DOWN:
			key_mouse = mouse_wheel_down();
			break;
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_UP:
			key_mouse = mouse_wheel_up();
			break;
	}
	#endregion /* Mouse 1 END */
	
	#region /* Mouse 2 */
	switch (button_value2) {
		case MOUSE_BUTTON_VALUE.MOUSEB_LEFT:
			if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_left);
			else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_left);
			else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_left);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_MIDDLE:
			if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_middle);
			else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_middle);
			else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_middle);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_RIGHT:
			if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_right);
			else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_right);
			else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_right);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE1:
			if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_side1);
			else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_side1);
			else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_side1);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE2:
			if (hold0_press1_release2 == 0) key2_mouse = mouse_check_button(mb_side2);
			else if (hold0_press1_release2 == 1) key2_mouse = mouse_check_button_pressed(mb_side2);
			else if (hold0_press1_release2 == 2) key2_mouse = mouse_check_button_released(mb_side2);
			break;
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_DOWN:
			key2_mouse = mouse_wheel_down();
			break;
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_UP:
			key2_mouse = mouse_wheel_up();
			break;
		default:
			break;
	}
	#endregion /* Mouse 2 END */
	
	#region /* Joystick */
	if (gp_button_value1 != noone)
	{
		var axis_index = noone;
		var axis_direction = noone;
		switch (gp_button_value1) {
			case JOYSTICK_VALUE.JOYLEFT_LEFT: axis_index = gp_axislh; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYLEFT_RIGHT: axis_index = gp_axislh; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYLEFT_DOWN: axis_index = gp_axislv; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYLEFT_UP: axis_index = gp_axislv; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYRIGHT_LEFT: axis_index = gp_axisrh; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYRIGHT_RIGHT: axis_index = gp_axisrh; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYRIGHT_DOWN: axis_index = gp_axisrv; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYRIGHT_UP: axis_index = gp_axisrv; axis_direction = -1; break;
		}
		if (axis_index != noone)
		{
			if (axis_direction == -1)
			{
				joy_1 = gamepad_axis_value(global.player_slot[what_player], axis_index) < -0.3;
			}
			else
			{
				joy_1 = gamepad_axis_value(global.player_slot[what_player], axis_index) > +0.3;
			}
		}
	}
	if (gp_button_value2 != noone)
	{
		var axis_index = noone;
		var axis_direction = noone;
		switch (gp_button_value2) {
			case JOYSTICK_VALUE.JOYLEFT_LEFT: axis_index = gp_axislh; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYLEFT_RIGHT: axis_index = gp_axislh; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYLEFT_DOWN: axis_index = gp_axislv; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYLEFT_UP: axis_index = gp_axislv; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYRIGHT_LEFT: axis_index = gp_axisrh; axis_direction = -1; break;
			case JOYSTICK_VALUE.JOYRIGHT_RIGHT: axis_index = gp_axisrh; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYRIGHT_DOWN: axis_index = gp_axisrv; axis_direction = +1; break;
			case JOYSTICK_VALUE.JOYRIGHT_UP: axis_index = gp_axisrv; axis_direction = -1; break;
		}
		if (axis_index != noone)
		{
			if (axis_direction == -1)
			{
				joy_2 = gamepad_axis_value(global.player_slot[what_player], axis_index) < -0.3;
			}
			else
			{
				joy_2 = gamepad_axis_value(global.player_slot[what_player], axis_index) > +0.3;
			}
		}
	}
	#endregion /* Joystick END */
	
	if (hold0_press1_release2 == 0)
	{
		gp_other = (gp_button_value1 != noone && gamepad_button_check(global.player_slot[what_player], gp_button_value1)) || (gp_button_value2 != noone && gamepad_button_check(global.player_slot[what_player], gp_button_value2));
	}
	else
	if (hold0_press1_release2 == 1)
	{
		gp_other = (gp_button_value1 != noone && gamepad_button_check_pressed(global.player_slot[what_player], gp_button_value1)) || (gp_button_value2 != noone && gamepad_button_check_pressed(global.player_slot[what_player], gp_button_value2));
	}
	else
	if (hold0_press1_release2 == 2)
	{
		gp_other = (gp_button_value1 != noone && gamepad_button_check_released(global.player_slot[what_player], gp_button_value1)) || (gp_button_value2 != noone && gamepad_button_check_released(global.player_slot[what_player], gp_button_value2));
	}
	
	if (hold0_press1_release2 == 0)
	{
		var key_other = (button_value1 != noone && keyboard_check(button_value1)) || (button_value2 != noone && keyboard_check(button_value2));
	}
	else
	if (hold0_press1_release2 == 1)
	{
		var key_other = (button_value1 != noone && keyboard_check_pressed(button_value1)) || (button_value2 != noone && keyboard_check_pressed(button_value2));
	}
	else
	if (hold0_press1_release2 == 2)
	{
		var key_other = (button_value1 != noone && keyboard_check_released(button_value1)) || (button_value2 != noone && keyboard_check_released(button_value2));
	}
	
	var return_key = key_mouse || key2_mouse || joy_1 || joy_2 || key_other || gp_other;
	
	return return_key;
}