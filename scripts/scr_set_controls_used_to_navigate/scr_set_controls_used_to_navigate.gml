function scr_set_controls_used_to_navigate()
{
	
	#region /*Set what controls are used to navigate the game*/
	var mouse_x_position = window_mouse_get_x(); /*Update x position of fake mouse*/
	var mouse_y_position = window_mouse_get_y(); /*Update y position of fake mouse*/
	var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y()); /*Get distance from fake mouse to real mouse*/
	
	if (keyboard_check(vk_anykey)) /*If pressing keyboard keys, then set "keyboard" as the navigation method*/
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			else
			{
				global.controls_used_for_menu_navigation = "keyboard";
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "keyboard";
		}
	}
	else
	if (mouse_check_button(mb_any)) /*If pressing mouse buttons or moving mouse, then set "mouse" as the navigation method*/
	or (mouse_wheel_down())
	or (mouse_wheel_up())
	or (mouse_moving)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.show_controller_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation == "controller")
			{
				obj_camera.show_keyboard_and_mouse_input_change_prompt = 100;
			}
			else
			{
				global.controls_used_for_menu_navigation = "mouse";
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "mouse";
		}
	}
	else
	if (gamepad_button_check(0, gp_face1)) /*If pressing gamepad buttons, then set "gamepad" as the navigation method*/
	or (gamepad_button_check(0, gp_face2))
	or (gamepad_button_check(0, gp_face3))
	or (gamepad_button_check(0, gp_face4))
	or (gamepad_button_check(0, gp_padd))
	or (gamepad_button_check(0, gp_padl))
	or (gamepad_button_check(0, gp_padr))
	or (gamepad_button_check(0, gp_padu))
	or (gamepad_button_check(0, gp_select))
	or (gamepad_button_check(0, gp_shoulderl))
	or (gamepad_button_check(0, gp_shoulderlb))
	or (gamepad_button_check(0, gp_shoulderr))
	or (gamepad_button_check(0, gp_shoulderrb))
	or (gamepad_button_check(0, gp_start))
	or (gamepad_button_check(0, gp_stickl))
	or (gamepad_button_check(0, gp_stickr))
	or (gamepad_axis_value(0, gp_axislh) <> 0)
	or (gamepad_axis_value(0, gp_axislv) <> 0)
	or (gamepad_axis_value(0, gp_axisrh) <> 0)
	or (gamepad_axis_value(0, gp_axisrv) <> 0)
	{
		if (instance_exists(obj_camera))
		{
			show_keyboard_and_mouse_input_change_prompt = 0;
			if (global.controls_used_for_menu_navigation != "controller")
			{
				global.controls_used_for_menu_navigation = "controller";
				show_controller_input_change_prompt = 100;
			}
		}
		else
		{
			global.controls_used_for_menu_navigation = "controller";
		}
	}
	#endregion /*Set what controls are used to navigate the game END*/
	
}