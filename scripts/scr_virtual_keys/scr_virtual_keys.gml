function scr_virtual_keys()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	
	var enable_joystick = false;
	
	var mobile_key_up_x = 228;
	var mobile_key_up_y = get_window_height -356;
	
	var mobile_key_down_x = 228;
	var mobile_key_down_y = get_window_height - 100;
	
	var mobile_key_left_x = 100;
	var mobile_key_left_y = get_window_height -228;
	
	var mobile_key_right_x = 356;
	var mobile_key_right_y = get_window_height -228;
	
	var mobile_key_jump_x = get_window_width - 200;
	var mobile_key_jump_y = get_window_height - 200;
	var mobile_key_crouch_x = get_window_width - 200;
	var mobile_key_crouch_y = get_window_height - 500;
	var mobile_key_sprint_x = get_window_width - 500;
	var mobile_key_sprint_y = get_window_height - 200;
	var mobile_key_pause_x = get_window_width * 0.5;
	var mobile_key_pause_y = + 100;
	var mobile_key_zoom_out_x = get_window_width * 0.5 + 200;
	var mobile_key_zoom_out_y = + 100;
	var mobile_key_zoom_in_x = get_window_width * 0.5 + 400;
	var mobile_key_zoom_in_y = + 100;
	var mobile_key_extra_deadzone = 50;
	
	#region /* Virtual Key, iOS and Android */
	if (global.show_virtual_controls)
	{
		if (instance_exists(obj_player_map))
		and (obj_player_map.iris_xscale > 0.25)
		and (obj_player_map.iris_yscale > 0.25)
		and (!instance_exists(obj_title))
		
		or (variable_instance_exists(self, "iris_xscale"))
		and (variable_instance_exists(self, "iris_yscale"))
		and (iris_xscale > 0.25)
		and (iris_yscale > 0.25)
		and (!instance_exists(obj_title))
		{
			if (instance_exists(obj_player))
			and (obj_player.can_move)
			or (instance_exists(obj_player_map))
			and (obj_player_map.can_move)
			{
				
				#region /* Joystick */
				if (enable_joystick)
				and (!instance_exists(obj_virtual_joystick))
				{
					instance_create_depth(x, y, 0, obj_virtual_joystick);
				}
				
				if (instance_exists(obj_virtual_joystick))
				{
					draw_sprite_ext(spr_virtual_joystick_base, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
					if (instance_exists(obj_player))
					{
						if (obj_player.active_right)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
						}
						if (obj_player.active_up)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 90, c_white, 0.5);
						}
						if (obj_player.active_left)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 180, c_white, 0.5);
						}
						if (obj_player.active_down)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 270, c_white, 0.5);
						}
					}
					else
					if (instance_exists(obj_player_map))
					{
						if (obj_player_map.active_right)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
						}
						if (obj_player_map.active_up)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 90, c_white, 0.5);
						}
						if (obj_player_map.active_left)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 180, c_white, 0.5);
						}
						if (obj_player_map.active_down)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 270, c_white, 0.5);
						}
					}
					draw_sprite_ext(spr_virtual_joystick_stick, 0, obj_virtual_joystick.xx + obj_virtual_joystick.var_x_dir_gui, obj_virtual_joystick.yy + obj_virtual_joystick.var_y_dir_gui, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
				}
				#endregion /* Joystick END */
				
				#region /* Virtual D-pad */
				if (enable_joystick == false)
				{
					scr_initialize_virtual_button(global.player_[inp.key][1][1][action.up], global.player_[inp.key][1][2][action.up], mobile_key_up_x, mobile_key_up_y, spr_virtual_key_direction, mobile_key_extra_deadzone, 90);
					scr_initialize_virtual_button(global.player_[inp.key][1][1][action.down], global.player_[inp.key][1][2][action.down], mobile_key_down_x, mobile_key_down_y, spr_virtual_key_direction, mobile_key_extra_deadzone, 270);
					scr_initialize_virtual_button(global.player_[inp.key][1][1][action.left], global.player_[inp.key][1][2][action.left], mobile_key_left_x, mobile_key_left_y, spr_virtual_key_direction, mobile_key_extra_deadzone, 180);
					scr_initialize_virtual_button(global.player_[inp.key][1][1][action.right], global.player_[inp.key][1][2][action.right], mobile_key_right_x, mobile_key_right_y, spr_virtual_key_direction, mobile_key_extra_deadzone, 0);
				}
				#endregion /* Virtual D-pad END */
				
				#region /* Virtual key add */
				scr_initialize_virtual_button(global.player_[inp.key][1][1][action.jump], global.player_[inp.key][1][2][action.jump], mobile_key_jump_x, mobile_key_jump_y, spr_virtual_key_jump, mobile_key_extra_deadzone);
				scr_initialize_virtual_button(global.player_[inp.key][1][1][action.crouch], global.player_[inp.key][1][2][action.crouch], mobile_key_crouch_x, mobile_key_crouch_y, spr_virtual_key_crouch, mobile_key_extra_deadzone);
				scr_initialize_virtual_button(global.player_[inp.key][1][1][action.sprint], global.player_[inp.key][1][2][action.sprint], mobile_key_sprint_x, mobile_key_sprint_y, noone, mobile_key_extra_deadzone);
				scr_initialize_virtual_button(global.player_[inp.key][1][1][action.dive], global.player_[inp.key][1][2][action.dive], mobile_key_sprint_x, mobile_key_sprint_y, spr_virtual_key_sprint, mobile_key_extra_deadzone);
				#endregion /* Virtual key add END */
				
				#region /* Pause virtual key */
				virtual_key_add(mobile_key_pause_x - 64, mobile_key_pause_y - 64, 128, 128, vk_escape); /* Virtual key add pause */
				if (keyboard_check(vk_escape))
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, mobile_key_pause_x, mobile_key_pause_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, mobile_key_pause_x, mobile_key_pause_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /* Pause virtual key END */
				
				#region /* Zoom out virtual key */
				virtual_key_add(mobile_key_zoom_out_x - 64, mobile_key_zoom_out_y - 64, 128, 128, vk_subtract); /* Virtual key add zoom out */
				if (keyboard_check(vk_subtract))
				{
					draw_sprite_ext(spr_virtual_key_zoom_out, 0, mobile_key_zoom_out_x, mobile_key_zoom_out_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_zoom_out, 0, mobile_key_zoom_out_x, mobile_key_zoom_out_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /* Zoom out virtual key END */
				
				#region /* Zoom in virtual key */
				virtual_key_add(mobile_key_zoom_in_x - 64, mobile_key_zoom_in_y - 64, 128, 128, vk_add); /* Virtual key add zoom in */
				if (keyboard_check(vk_add))
				{
					draw_sprite_ext(spr_virtual_key_zoom_in, 0, mobile_key_zoom_in_x, mobile_key_zoom_in_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_zoom_in, 0, mobile_key_zoom_in_x, mobile_key_zoom_in_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /* Zoom out virtual key END */
				
			}
		}
	}
	#endregion /* Virtual Key, iOS and Android END */
	
}