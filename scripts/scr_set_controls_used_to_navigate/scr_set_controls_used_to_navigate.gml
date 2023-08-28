function scr_set_controls_used_to_navigate()
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Set what controls are used to navigate the game */
	
	if (variable_instance_exists(self, "mouse_x_position"))
	&& (variable_instance_exists(self, "mouse_y_position"))
	{
		var mouse_moving = point_distance(mouse_x_position, mouse_y_position, mouse_get_x, mouse_get_y); /* Get distance from fake mouse to real mouse */
		mouse_x_position = mouse_get_x; /* Update x position of fake mouse only after setting var mouse moving */
		mouse_y_position = mouse_get_y; /* Update y position of fake mouse only after setting var mouse moving */
	}
	else
	{
		var mouse_moving = false;
	}
	
	if (keyboard_check(vk_anykey)) /* If pressing keyboard keys, then set "keyboard" as the navigation method */
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			global.controls_used_for_menu_navigation = "keyboard";
		}
		else
		{
			global.controls_used_for_menu_navigation = "keyboard";
		}
	}
	
	else
	
	if (mouse_check_button(mb_any)) /* If pressing mouse buttons or moving mouse, then set "mouse" as the navigation method */
	|| (mouse_wheel_down())
	|| (mouse_wheel_up())
	|| (mouse_moving)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			global.controls_used_for_menu_navigation = "mouse";
		}
		else
		{
			global.controls_used_for_menu_navigation = "mouse";
		}
	}
	
	else
	
	if (gamepad_button_check(global.player_slot[1], gp_face1)) /* If pressing gamepad buttons, then set "gamepad" as the navigation method */
	|| (gamepad_button_check(global.player_slot[1], gp_face2))
	|| (gamepad_button_check(global.player_slot[1], gp_face3))
	|| (gamepad_button_check(global.player_slot[1], gp_face4))
	|| (gamepad_button_check(global.player_slot[1], gp_padd))
	|| (gamepad_button_check(global.player_slot[1], gp_padl))
	|| (gamepad_button_check(global.player_slot[1], gp_padr))
	|| (gamepad_button_check(global.player_slot[1], gp_padu))
	|| (gamepad_button_check(global.player_slot[1], gp_select))
	|| (gamepad_button_check(global.player_slot[1], gp_shoulderl))
	|| (gamepad_button_check(global.player_slot[1], gp_shoulderlb))
	|| (gamepad_button_check(global.player_slot[1], gp_shoulderr))
	|| (gamepad_button_check(global.player_slot[1], gp_shoulderrb))
	|| (gamepad_button_check(global.player_slot[1], gp_start))
	|| (gamepad_button_check(global.player_slot[1], gp_stickl))
	|| (gamepad_button_check(global.player_slot[1], gp_stickr))
	|| (gamepad_axis_value(global.player_slot[1], gp_axislh) <> 0)
	|| (gamepad_axis_value(global.player_slot[1], gp_axislv) <> 0)
	|| (gamepad_axis_value(global.player_slot[1], gp_axisrh) <> 0)
	|| (gamepad_axis_value(global.player_slot[1], gp_axisrv) <> 0)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_keyboard_and_mouse_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation != "controller")
			{
				global.controls_used_for_menu_navigation = "controller";
				obj_camera.show_controller_input_change_prompt = 100;
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "controller";
		}
	}
	
	#endregion /* Set what controls are used to navigate the game END */
	
}