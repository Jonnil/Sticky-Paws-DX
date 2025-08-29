function scr_key_initialize(key, hold = 0, what_player = 1, this_player_key = action.jump)
{
	/* Retrieve player slot and input configuration */
	var player_slot = global.player_slot[what_player];
	var key1      = global.player_[inp.key][what_player][1][this_player_key];
	var key2      = global.player_[inp.key][what_player][2][this_player_key];
	var gp_key1   = global.player_[inp.gp][what_player][1][this_player_key];
	var gp_key2   = global.player_[inp.gp][what_player][2][this_player_key];

	/* Process mouse inputs (for both primary and secondary keys) */
	var mouse1 = (key1 != noone) ? processMouseInput(key1, hold) : false;
	var mouse2 = (key2 != noone) ? processMouseInput(key2, hold) : false;

	/* Process joystick inputs */
	var joy1 = (gp_key1 != noone) ? processJoystick(gp_key1, player_slot) : false;
	var joy2 = (gp_key2 != noone) ? processJoystick(gp_key2, player_slot) : false;

	/* Process gamepad button inputs */
	var gp_other = checkGamepad(gp_key1, hold, player_slot) || checkGamepad(gp_key2, hold, player_slot);

	/* Process keyboard inputs */
	var key_other = checkKeyboard(key1, hold) || checkKeyboard(key2, hold);

	return mouse1 || mouse2 || joy1 || joy2 || key_other || gp_other;
}

/* Helper: Check mouse button based on state (hold/pressed/released) */
function checkMouse(btn, hold)
{
	if (hold == 0) return mouse_check_button(btn);
	else if (hold == 1) return mouse_check_button_pressed(btn);
	else if (hold == 2) return mouse_check_button_released(btn);
	return false;
}

/* Helper: Process a mouse input configuration value */
function processMouseInput(button_value, hold)
{
	switch (button_value)
	{
		case MOUSE_BUTTON_VALUE.MOUSEB_LEFT:        return checkMouse(mb_left, hold);
		case MOUSE_BUTTON_VALUE.MOUSEB_MIDDLE:        return checkMouse(mb_middle, hold);
		case MOUSE_BUTTON_VALUE.MOUSEB_RIGHT:        return checkMouse(mb_right, hold);
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE1:        return checkMouse(mb_side1, hold);
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE2:        return checkMouse(mb_side2, hold);
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_DOWN:    return mouse_wheel_down();
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_UP:        return mouse_wheel_up();
		default: return false;
	}
}

/* Helper: Process a gamepad joystick axis value */
function processJoystick(gpButton, player_slot)
{
	var axis_index = noone;
	var axis_direction = 0;
	switch (gpButton)
	{
		case JOYSTICK_VALUE.JOYLEFT_LEFT:   axis_index = gp_axislh; axis_direction = -1; break;
		case JOYSTICK_VALUE.JOYLEFT_RIGHT:  axis_index = gp_axislh; axis_direction =  1; break;
		case JOYSTICK_VALUE.JOYLEFT_DOWN:   axis_index = gp_axislv; axis_direction =  1; break;
		case JOYSTICK_VALUE.JOYLEFT_UP:     axis_index = gp_axislv; axis_direction = -1; break;
		case JOYSTICK_VALUE.JOYRIGHT_LEFT:  axis_index = gp_axisrh; axis_direction = -1; break;
		case JOYSTICK_VALUE.JOYRIGHT_RIGHT: axis_index = gp_axisrh; axis_direction =  1; break;
		case JOYSTICK_VALUE.JOYRIGHT_DOWN:  axis_index = gp_axisrv; axis_direction =  1; break;
		case JOYSTICK_VALUE.JOYRIGHT_UP:    axis_index = gp_axisrv; axis_direction = -1; break;
	}
	if (axis_index != noone)
	{
		var axis_val = gamepad_axis_value(player_slot, axis_index);
		return (axis_direction == -1 ? axis_val < -0.3 : axis_val > 0.3);
	}
	return false;
}

/* Helper: Check gamepad button based on state */
function checkGamepad(gpButton, hold, player_slot)
{
	if (gpButton == noone) return false;
	if (hold == 0) return gamepad_button_check(player_slot, gpButton);
	else if (hold == 1) return gamepad_button_check_pressed(player_slot, gpButton);
	else if (hold == 2) return gamepad_button_check_released(player_slot, gpButton);
	return false;
}

/* Helper: Check keyboard button based on state */
function checkKeyboard(keyCode, hold)
{
	if (keyCode == noone) return false;
	if (hold == 0) return keyboard_check(keyCode);
	else if (hold == 1) return keyboard_check_pressed(keyCode);
	else if (hold == 2) return keyboard_check_released(keyCode);
	return false;
}
