/// @function scr_gamepad_any_input(slot)
/// @param slot		gamepad index to check
/// @return true if any button or axis on that slot is pressed/moved
function scr_gamepad_any_input(slot)
{
	if (!gamepad_is_connected(slot))
	{
		return false;
	}
	
	if (
		/* Face Buttons */
		gamepad_button_check(slot, gp_face1) ||
		gamepad_button_check(slot, gp_face2) ||
		gamepad_button_check(slot, gp_face3) ||
		gamepad_button_check(slot, gp_face4) ||
		
		/* Bumpers & Triggers */
		gamepad_button_check(slot, gp_shoulderl) ||
		gamepad_button_check(slot, gp_shoulderr) ||
		gamepad_button_check(slot, gp_shoulderlb) ||
		gamepad_button_check(slot, gp_shoulderrb) ||
		
		/* Sticks Pressed */
		gamepad_button_check(slot, gp_stickl) ||
		gamepad_button_check(slot, gp_stickr) ||
		
		/* D‐pad & Start/Select */
		gamepad_button_check(slot, gp_padu) ||
		gamepad_button_check(slot, gp_padd) ||
		gamepad_button_check(slot, gp_padl) ||
		gamepad_button_check(slot, gp_padr) ||
		gamepad_button_check(slot, gp_start) ||
		gamepad_button_check(slot, gp_select) ||
		
		/* Analog sticks moved beyond deadzone */
		abs(gamepad_axis_value(slot, gp_axislh)) > 0.3 ||
		abs(gamepad_axis_value(slot, gp_axislv)) > 0.3 ||
		abs(gamepad_axis_value(slot, gp_axisrh)) > 0.3 ||
		abs(gamepad_axis_value(slot, gp_axisrv)) > 0.3
	)
	{
		return true;
	}
	
	return false;
}

function scr_set_controls_used_to_navigate()
{
	
	#region /* Set what controls are used to navigate the game */
	if (global.controls_used_for_navigation != "keyboard")
	{
		/* If pressing keyboard keys, then set "keyboard" as the navigation method */
		if (keyboard_check(vk_anykey))
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
		var mouse_get_x = device_mouse_x_to_gui(0);
		var mouse_get_y = device_mouse_y_to_gui(0);
		var mouse_moving = point_distance(mouse_x_position, mouse_y_position, mouse_get_x, mouse_get_y); /* Get distance from fake mouse to real mouse */
		mouse_x_position = mouse_get_x; /* Update x position of fake mouse only after setting var mouse moving */
		mouse_y_position = mouse_get_y; /* Update y position of fake mouse only after setting var mouse moving */
		
		/* If pressing mouse buttons or moving mouse, then set "mouse" as the navigation method */
		if (mouse_check_button(mb_any)
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
			break;
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