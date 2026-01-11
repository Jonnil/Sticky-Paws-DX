function scr_key_initialize(key, hold = 0, what_player = 1, this_player_key = action.jump)
{
	/* Unified input check for keyboard, mouse, gamepad buttons, and joystick axes */
	var slot   = global.player_slot[what_player];
	var key1   = global.player_[inp.key][what_player][1][this_player_key];
	var key2   = global.player_[inp.key][what_player][2][this_player_key];
	var gp1    = global.player_[inp.gp][what_player][1][this_player_key];
	var gp2    = global.player_[inp.gp][what_player][2][this_player_key];

	var mouse = _mouse_input(key1, hold) || _mouse_input(key2, hold);
	var axis  = _joystick_axis(gp1, slot) || _joystick_axis(gp2, slot);
	var gpbtn = _gamepad_button(gp1, hold, slot) || _gamepad_button(gp2, hold, slot);
	var kb    = _keyboard_button(key1, hold) || _keyboard_button(key2, hold);

	return mouse || axis || gpbtn || kb;
}

/* --- Helpers --- */
function _mouse_input(btn, hold)
{
	if (btn == noone) return false;

	static _mouse_fns = [mouse_check_button, mouse_check_button_pressed, mouse_check_button_released];
	var idx = clamp(hold, 0, 2);

	switch (btn)
	{
		case MOUSE_BUTTON_VALUE.MOUSEB_LEFT:   return _mouse_fns[idx](mb_left);
		case MOUSE_BUTTON_VALUE.MOUSEB_MIDDLE: return _mouse_fns[idx](mb_middle);
		case MOUSE_BUTTON_VALUE.MOUSEB_RIGHT:  return _mouse_fns[idx](mb_right);
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE1:  return _mouse_fns[idx](mb_side1);
		case MOUSE_BUTTON_VALUE.MOUSEB_SIDE2:  return _mouse_fns[idx](mb_side2);
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_DOWN: return mouse_wheel_down();
		case MOUSE_BUTTON_VALUE.MOUSEWHEEL_UP:   return mouse_wheel_up();
		default: return false;
	}
}

function _joystick_axis(gp_btn, slot)
{
	var axis = noone, dir = 0;
	switch (gp_btn)
	{
		case JOYSTICK_VALUE.JOYLEFT_LEFT:   axis = gp_axislh; dir = -1; break;
		case JOYSTICK_VALUE.JOYLEFT_RIGHT:  axis = gp_axislh; dir =  1; break;
		case JOYSTICK_VALUE.JOYLEFT_UP:     axis = gp_axislv; dir = -1; break;
		case JOYSTICK_VALUE.JOYLEFT_DOWN:   axis = gp_axislv; dir =  1; break;
		case JOYSTICK_VALUE.JOYRIGHT_LEFT:  axis = gp_axisrh; dir = -1; break;
		case JOYSTICK_VALUE.JOYRIGHT_RIGHT: axis = gp_axisrh; dir =  1; break;
		case JOYSTICK_VALUE.JOYRIGHT_UP:    axis = gp_axisrv; dir = -1; break;
		case JOYSTICK_VALUE.JOYRIGHT_DOWN:  axis = gp_axisrv; dir =  1; break;
		default: return false;
	}
	var val = gamepad_axis_value(slot, axis);
	return (dir == -1) ? (val < -0.3) : (val > 0.3);
}

function _gamepad_button(gp_btn, hold, slot)
{
	if (gp_btn == noone) return false;
	static _gp_fns = [gamepad_button_check, gamepad_button_check_pressed, gamepad_button_check_released];
	return _gp_fns[clamp(hold, 0, 2)](slot, gp_btn);
}

function _keyboard_button(key_code, hold)
{
	if (key_code == noone) return false;
	static _kb_fns = [keyboard_check, keyboard_check_pressed, keyboard_check_released];
	return _kb_fns[clamp(hold, 0, 2)](key_code);
}
