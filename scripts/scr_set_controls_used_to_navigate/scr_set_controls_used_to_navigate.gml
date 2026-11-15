/// @function scr_gamepad_any_input(slot)
/// @param slot        gamepad index to check
/// @return true for a new button press or deliberate stick movement
function scr_gamepad_any_input(slot)
{
	static axis_samples = {};
	var slot_key = string(slot);
	if (!gamepad_is_connected(slot))
	{
		if (variable_struct_exists(axis_samples, slot_key)) variable_struct_remove(axis_samples, slot_key);
		return false;
	}
	var axes = [gamepad_axis_value(slot, gp_axislh), gamepad_axis_value(slot, gp_axislv),
		gamepad_axis_value(slot, gp_axisrh), gamepad_axis_value(slot, gp_axisrv)];
	var previous_axes = variable_struct_exists(axis_samples, slot_key) ? variable_struct_get(axis_samples, slot_key) : [0, 0, 0, 0];
	var stick_moved = false;
	for (var axis = 0; axis < 4; axis++)
	{
		if (abs(axes[axis]) > 0.3 && (abs(previous_axes[axis]) <= 0.3 || abs(axes[axis] - previous_axes[axis]) > 0.15)) stick_moved = true;
	}
	variable_struct_set(axis_samples, slot_key, axes);

	if (
		/* Face Buttons */
		gamepad_button_check_pressed(slot, gp_face1) ||
		gamepad_button_check_pressed(slot, gp_face2) ||
		gamepad_button_check_pressed(slot, gp_face3) ||
		gamepad_button_check_pressed(slot, gp_face4) ||

		/* Bumpers & Triggers */
		gamepad_button_check_pressed(slot, gp_shoulderl) ||
		gamepad_button_check_pressed(slot, gp_shoulderr) ||
		gamepad_button_check_pressed(slot, gp_shoulderlb) ||
		gamepad_button_check_pressed(slot, gp_shoulderrb) ||

		/* Sticks Pressed */
		gamepad_button_check_pressed(slot, gp_stickl) ||
		gamepad_button_check_pressed(slot, gp_stickr) ||

		/* D‐pad & Start/Select */
		gamepad_button_check_pressed(slot, gp_padu) ||
		gamepad_button_check_pressed(slot, gp_padd) ||
		gamepad_button_check_pressed(slot, gp_padl) ||
		gamepad_button_check_pressed(slot, gp_padr) ||
		gamepad_button_check_pressed(slot, gp_start) ||
		gamepad_button_check_pressed(slot, gp_select) ||

		/* Analog sticks moved beyond deadzone */
		stick_moved
	)
	{
		return true;
	}

	return false;
}

function scr_set_controls_used_to_navigate()
{
	/* Sample the real mouse every step, including while it is the active device. */
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var mouse_moving = point_distance(mouse_x_position, mouse_y_position, mouse_get_x, mouse_get_y) >= 2;
	mouse_x_position = mouse_get_x;
	mouse_y_position = mouse_get_y;
	if (!variable_global_exists("navigation_gamepad_player")) global.navigation_gamepad_player = 1;

	#region /* Set what controls are used to navigate the game */
	if (global.controls_used_for_navigation != "keyboard")
	{
		/* If pressing keyboard keys, then set "keyboard" as the navigation method */
		if (keyboard_check_pressed(vk_anykey))
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.show_controller_input_change_prompt = 0;

				if (global.controls_used_for_navigation == "gamepad")
				{
					obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
				}

				global.controls_used_for_navigation = "keyboard";
			}
			else
			{
				global.controls_used_for_navigation = "keyboard";
			}
		}
	}

	if (global.controls_used_for_navigation != "mouse")
	{
		/* If pressing mouse buttons or moving mouse, then set "mouse" as the navigation method */
		if (mouse_check_button_pressed(mb_any)
		|| mouse_wheel_down()
		|| mouse_wheel_up()
		|| mouse_moving)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.show_controller_input_change_prompt = 0;

				if (global.controls_used_for_navigation == "gamepad")
				{
					obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
				}

				global.controls_used_for_navigation = "mouse";
			}
			else
			{
				global.controls_used_for_navigation = "mouse";
			}
		}
	}

	/* Gamepad navigation: loop through each slot, ask our helper if any input is active */
	var switch_to_gp = false;

	for (var i = 1; i <= 4; i += 1)
	{
		if (scr_gamepad_any_input(global.player_slot[i]))
		{
			switch_to_gp = true;
			global.navigation_gamepad_player = i;
		}
	}

	if (switch_to_gp
	&& global.controls_used_for_navigation != "gamepad")
	{
		if (instance_exists(obj_camera))
		{
			/* Clear the old prompt if we just left Keyboard and Mouse */
			if (instance_exists(obj_player)
			&& instance_number(obj_player) == 1)
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 0;
			}

			global.controls_used_for_navigation = "gamepad";

			/* Show controller prompt for player 1 */
			if (instance_exists(obj_player)
			&& instance_number(obj_player) == 1)
			{
				obj_camera.show_controller_input_change_prompt = 100;
			}
		}
		else
		{
			global.controls_used_for_navigation = "gamepad";
		}
	}
	#endregion /* Set what controls are used to navigate the game END */

}
