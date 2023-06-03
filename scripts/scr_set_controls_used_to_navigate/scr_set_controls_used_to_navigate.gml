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
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
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
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
		}
	}
	
	else
	
	if (gamepad_button_check(global.player1_slot, gp_face1)) /* If pressing gamepad buttons, then set "gamepad" as the navigation method */
	|| (gamepad_button_check(global.player1_slot, gp_face2))
	|| (gamepad_button_check(global.player1_slot, gp_face3))
	|| (gamepad_button_check(global.player1_slot, gp_face4))
	|| (gamepad_button_check(global.player1_slot, gp_padd))
	|| (gamepad_button_check(global.player1_slot, gp_padl))
	|| (gamepad_button_check(global.player1_slot, gp_padr))
	|| (gamepad_button_check(global.player1_slot, gp_padu))
	|| (gamepad_button_check(global.player1_slot, gp_select))
	|| (gamepad_button_check(global.player1_slot, gp_shoulderl))
	|| (gamepad_button_check(global.player1_slot, gp_shoulderlb))
	|| (gamepad_button_check(global.player1_slot, gp_shoulderr))
	|| (gamepad_button_check(global.player1_slot, gp_shoulderrb))
	|| (gamepad_button_check(global.player1_slot, gp_start))
	|| (gamepad_button_check(global.player1_slot, gp_stickl))
	|| (gamepad_button_check(global.player1_slot, gp_stickr))
	|| (gamepad_axis_value(global.player1_slot, gp_axislh) <> 0)
	|| (gamepad_axis_value(global.player1_slot, gp_axislv) <> 0)
	|| (gamepad_axis_value(global.player1_slot, gp_axisrh) <> 0)
	|| (gamepad_axis_value(global.player1_slot, gp_axisrv) <> 0)
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
		if (instance_exists(obj_camera))
		{
			obj_camera.reset_game_if_no_interactivity = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
		}
		if (instance_exists(obj_camera_map))
		{
			obj_camera_map.reset_game_if_no_interactivity = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
			obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
		}
	}
	
	#endregion /* Set what controls are used to navigate the game END */
	
	if (instance_exists(obj_camera))
	|| (instance_exists(obj_camera_map))
	{
		if (gamepad_button_check(global.player2_slot, gp_face1))
		|| (gamepad_button_check(global.player2_slot, gp_face2))
		|| (gamepad_button_check(global.player2_slot, gp_face3))
		|| (gamepad_button_check(global.player2_slot, gp_face4))
		|| (gamepad_button_check(global.player2_slot, gp_padd))
		|| (gamepad_button_check(global.player2_slot, gp_padl))
		|| (gamepad_button_check(global.player2_slot, gp_padr))
		|| (gamepad_button_check(global.player2_slot, gp_padu))
		|| (gamepad_button_check(global.player2_slot, gp_select))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player2_slot, gp_start))
		|| (gamepad_button_check(global.player2_slot, gp_stickl))
		|| (gamepad_button_check(global.player2_slot, gp_stickr))
		|| (gamepad_axis_value(global.player2_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axisrv) <> 0)
	
		|| (gamepad_button_check(global.player3_slot, gp_face1))
		|| (gamepad_button_check(global.player3_slot, gp_face2))
		|| (gamepad_button_check(global.player3_slot, gp_face3))
		|| (gamepad_button_check(global.player3_slot, gp_face4))
		|| (gamepad_button_check(global.player3_slot, gp_padd))
		|| (gamepad_button_check(global.player3_slot, gp_padl))
		|| (gamepad_button_check(global.player3_slot, gp_padr))
		|| (gamepad_button_check(global.player3_slot, gp_padu))
		|| (gamepad_button_check(global.player3_slot, gp_select))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player3_slot, gp_start))
		|| (gamepad_button_check(global.player3_slot, gp_stickl))
		|| (gamepad_button_check(global.player3_slot, gp_stickr))
		|| (gamepad_axis_value(global.player3_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axisrv) <> 0)
	
		|| (gamepad_button_check(global.player4_slot, gp_face1))
		|| (gamepad_button_check(global.player4_slot, gp_face2))
		|| (gamepad_button_check(global.player4_slot, gp_face3))
		|| (gamepad_button_check(global.player4_slot, gp_face4))
		|| (gamepad_button_check(global.player4_slot, gp_padd))
		|| (gamepad_button_check(global.player4_slot, gp_padl))
		|| (gamepad_button_check(global.player4_slot, gp_padr))
		|| (gamepad_button_check(global.player4_slot, gp_padu))
		|| (gamepad_button_check(global.player4_slot, gp_select))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player4_slot, gp_start))
		|| (gamepad_button_check(global.player4_slot, gp_stickl))
		|| (gamepad_button_check(global.player4_slot, gp_stickr))
		|| (gamepad_axis_value(global.player4_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axisrv) <> 0)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.reset_game_if_no_interactivity = 0;
				obj_camera.reset_game_if_no_interactivity_second_countdown_timer = 0;
				obj_camera.reset_game_if_no_interactivity_second_countdown = 60;
			}
			if (instance_exists(obj_camera_map))
			{
				obj_camera_map.reset_game_if_no_interactivity = 0;
				obj_camera_map.reset_game_if_no_interactivity_second_countdown_timer = 0;
				obj_camera_map.reset_game_if_no_interactivity_second_countdown = 60;
			}
		}
	}
	
	if (instance_exists(obj_title))
	{
		if (keyboard_check(vk_anykey))
		|| (mouse_check_button(mb_any))
		|| (mouse_wheel_down())
		|| (mouse_wheel_up())
		|| (instance_exists(obj_camera))
		&& (mouse_moving)
		&& (global.play_attract_demo == false)
		
		|| (gamepad_button_check(global.player1_slot, gp_face1))
		|| (gamepad_button_check(global.player1_slot, gp_face2))
		|| (gamepad_button_check(global.player1_slot, gp_face3))
		|| (gamepad_button_check(global.player1_slot, gp_face4))
		|| (gamepad_button_check(global.player1_slot, gp_padd))
		|| (gamepad_button_check(global.player1_slot, gp_padl))
		|| (gamepad_button_check(global.player1_slot, gp_padr))
		|| (gamepad_button_check(global.player1_slot, gp_padu))
		|| (gamepad_button_check(global.player1_slot, gp_select))
		|| (gamepad_button_check(global.player1_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player1_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player1_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player1_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player1_slot, gp_start))
		|| (gamepad_button_check(global.player1_slot, gp_stickl))
		|| (gamepad_button_check(global.player1_slot, gp_stickr))
		|| (gamepad_axis_value(global.player1_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player1_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player1_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player1_slot, gp_axisrv) <> 0)
		
		|| (gamepad_button_check(global.player2_slot, gp_face1))
		|| (gamepad_button_check(global.player2_slot, gp_face2))
		|| (gamepad_button_check(global.player2_slot, gp_face3))
		|| (gamepad_button_check(global.player2_slot, gp_face4))
		|| (gamepad_button_check(global.player2_slot, gp_padd))
		|| (gamepad_button_check(global.player2_slot, gp_padl))
		|| (gamepad_button_check(global.player2_slot, gp_padr))
		|| (gamepad_button_check(global.player2_slot, gp_padu))
		|| (gamepad_button_check(global.player2_slot, gp_select))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player2_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player2_slot, gp_start))
		|| (gamepad_button_check(global.player2_slot, gp_stickl))
		|| (gamepad_button_check(global.player2_slot, gp_stickr))
		|| (gamepad_axis_value(global.player2_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player2_slot, gp_axisrv) <> 0)
		
		|| (gamepad_button_check(global.player3_slot, gp_face1))
		|| (gamepad_button_check(global.player3_slot, gp_face2))
		|| (gamepad_button_check(global.player3_slot, gp_face3))
		|| (gamepad_button_check(global.player3_slot, gp_face4))
		|| (gamepad_button_check(global.player3_slot, gp_padd))
		|| (gamepad_button_check(global.player3_slot, gp_padl))
		|| (gamepad_button_check(global.player3_slot, gp_padr))
		|| (gamepad_button_check(global.player3_slot, gp_padu))
		|| (gamepad_button_check(global.player3_slot, gp_select))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player3_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player3_slot, gp_start))
		|| (gamepad_button_check(global.player3_slot, gp_stickl))
		|| (gamepad_button_check(global.player3_slot, gp_stickr))
		|| (gamepad_axis_value(global.player3_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player3_slot, gp_axisrv) <> 0)
		
		|| (gamepad_button_check(global.player4_slot, gp_face1))
		|| (gamepad_button_check(global.player4_slot, gp_face2))
		|| (gamepad_button_check(global.player4_slot, gp_face3))
		|| (gamepad_button_check(global.player4_slot, gp_face4))
		|| (gamepad_button_check(global.player4_slot, gp_padd))
		|| (gamepad_button_check(global.player4_slot, gp_padl))
		|| (gamepad_button_check(global.player4_slot, gp_padr))
		|| (gamepad_button_check(global.player4_slot, gp_padu))
		|| (gamepad_button_check(global.player4_slot, gp_select))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderl))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderlb))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderr))
		|| (gamepad_button_check(global.player4_slot, gp_shoulderrb))
		|| (gamepad_button_check(global.player4_slot, gp_start))
		|| (gamepad_button_check(global.player4_slot, gp_stickl))
		|| (gamepad_button_check(global.player4_slot, gp_stickr))
		|| (gamepad_axis_value(global.player4_slot, gp_axislh) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axislv) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axisrh) <> 0)
		|| (gamepad_axis_value(global.player4_slot, gp_axisrv) <> 0)
		{
			audio_stop_sound(obj_title.trailer_sound);
			video_pause();
			obj_title.play_attract_demo_time = 0;
			global.play_attract_demo = false;
		}
	}
}