function scr_virtual_keys()
{
	var mobile_key_jump_x = window_get_width() - 200;
	var mobile_key_jump_y = window_get_height() - 200;
	var mobile_key_crouch_x = window_get_width() - 200;
	var mobile_key_crouch_y = window_get_height() - 500;
	var mobile_key_sprint_x = window_get_width() - 500;
	var mobile_key_sprint_y = window_get_height() - 200;
	var mobile_key_pause_x = window_get_width() /2;
	var mobile_key_pause_y = + 100;
	var mobile_key_zoom_out_x = window_get_width() /2 + 200;
	var mobile_key_zoom_out_y = + 100;
	var mobile_key_zoom_in_x = window_get_width() /2 + 400;
	var mobile_key_zoom_in_y = + 100;
	var mobile_key_extra_deadzone = 50;
	
	#region /*Virtual Key, iOS and Android*/
	if (os_type = os_ios)
	or (os_type = os_android)
	or (global.show_virtual_controls = true)
	{
		if (iris_xscale > 0.25)
		and (iris_yscale > 0.25)
		and (asset_get_type("obj_title") == asset_object)
		and (!instance_exists(obj_title))
		{
			if (asset_get_type("obj_player") == asset_object)
			and (instance_exists(obj_player))
			and (obj_player.can_move = true)
			or(asset_get_type("obj_player_map") == asset_object)
			and (instance_exists(obj_player_map))
			and (obj_player_map.can_move = true)
			{
				if (!instance_exists(obj_virtual_joystick))
				{
					instance_create_depth(x, y, 0, obj_virtual_joystick);
				}
				
				if (instance_exists(obj_virtual_joystick))
				{
					draw_sprite_ext(spr_virtual_joystick_base, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
					if (instance_exists(obj_player))
					{
						if (obj_player.active_right = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
						}
						if (obj_player.active_up = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 90, c_white, 0.5);
						}
						if (obj_player.active_left = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 180, c_white, 0.5);
						}
						if (obj_player.active_down = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 270, c_white, 0.5);
						}
					}
					else
					if (instance_exists(obj_player_map))
					{
						if (obj_player_map.active_right = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
						}
						if (obj_player_map.active_up = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 90, c_white, 0.5);
						}
						if (obj_player_map.active_left = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 180, c_white, 0.5);
						}
						if (obj_player_map.active_down = true)
						{
							draw_sprite_ext(spr_virtual_joystick_direction, 0, obj_virtual_joystick.xx, obj_virtual_joystick.yy, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 270, c_white, 0.5);
						}
					}
					draw_sprite_ext(spr_virtual_joystick_stick, 0, obj_virtual_joystick.xx + obj_virtual_joystick.var_x_dir_gui, obj_virtual_joystick.yy + obj_virtual_joystick.var_y_dir_gui, obj_virtual_joystick.var_screen_size, obj_virtual_joystick.var_screen_size, 0, c_white, 0.5);
				}
				
				#region /*Virtual key add*/
				
				#region /*Virtual key add jump*/
				if (global.player1_key_jump > noone)
				{
					virtual_key_add(mobile_key_jump_x - 128 - mobile_key_extra_deadzone, mobile_key_jump_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key_jump);
				}
				else
				if (global.player1_key2_jump > noone)
				{
					virtual_key_add(mobile_key_jump_x - 128 - mobile_key_extra_deadzone, mobile_key_jump_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key2_jump);
				}
				#endregion /*Virtual key add jump END*/
				
				#region /*Virtual key add crouch*/
				if (global.player1_key_crouch > noone)
				{
					virtual_key_add(mobile_key_crouch_x - 128 - mobile_key_extra_deadzone, mobile_key_crouch_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key_crouch);
				}
				else
				if (global.player1_key2_crouch > noone)
				{
					virtual_key_add(mobile_key_crouch_x - 128 - mobile_key_extra_deadzone, mobile_key_crouch_x - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key2_crouch);
				}
				#endregion /*Virtual key add crouch END*/
				
				#region /*Virtual key add sprint*/
				if (global.player1_key_sprint > noone)
				{
					virtual_key_add(mobile_key_sprint_x - 128 - mobile_key_extra_deadzone, mobile_key_sprint_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key_sprint);
				}
				else
				if (global.player1_key2_sprint > noone)
				{
					virtual_key_add(mobile_key_sprint_x - 128 - mobile_key_extra_deadzone, mobile_key_sprint_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key2_sprint);
				}
				#endregion /*Virtual key add sprint END*/
				
				#region /*Virtual key add dive*/
				if (global.player1_key_dive > noone)
				{
					virtual_key_add(mobile_key_sprint_x - 128 - mobile_key_extra_deadzone, mobile_key_sprint_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key_dive);
				}
				else
				if (global.player1_key2_dive > noone)
				{
					virtual_key_add(mobile_key_sprint_x - 128 - mobile_key_extra_deadzone, mobile_key_sprint_y - 128 - mobile_key_extra_deadzone, 256 + (mobile_key_extra_deadzone * 2), 256 + (mobile_key_extra_deadzone * 2), global.player1_key2_dive);
				}
				#endregion /*Virtual key add dive END*/
				
				#endregion /*Virtual key add END*/
				
				if (keyboard_check(global.player1_key_jump))
				or(keyboard_check(global.player1_key2_jump))
				{
					draw_sprite_ext(spr_virtual_key_jump, 0, mobile_key_jump_x, mobile_key_jump_y, 0.95, 0.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_jump, 0, mobile_key_jump_x, mobile_key_jump_y, 1, 1, 0, c_white, 0.5);
				}
				if (instance_exists(obj_player))
				{
					if (obj_player.on_ground = true)
					or (obj_player.crouch = true)
					{
						if (keyboard_check(global.player1_key_crouch))
						or(keyboard_check(global.player1_key2_crouch))
						{
							draw_sprite_ext(spr_virtual_key_crouch, 0, mobile_key_crouch_x, mobile_key_crouch_y, 0.95, 0.95, 0, c_gray, 0.5);
						}
						else
						{
							draw_sprite_ext(spr_virtual_key_crouch, 0, mobile_key_crouch_x, mobile_key_crouch_y, 1, 1, 0, c_white, 0.5);
						}
					}
					else
					{
						if (keyboard_check(global.player1_key_crouch))
						or(keyboard_check(global.player1_key2_crouch))
						{
							draw_sprite_ext(spr_virtual_key_groundpound, 0, mobile_key_crouch_x, mobile_key_crouch_y, 0.95, 0.95, 0, c_gray, 0.5);
						}
						else
						{
							draw_sprite_ext(spr_virtual_key_groundpound, 0, mobile_key_crouch_x, mobile_key_crouch_y, 1, 1, 0, c_white, 0.5);
						}
					}
					if (keyboard_check(global.player1_key_sprint))
					or(keyboard_check(global.player1_key2_sprint))
					{
						draw_sprite_ext(spr_virtual_key_sprint, 0, mobile_key_sprint_x, mobile_key_sprint_y, 0.95, 0.95, 0, c_gray, 0.5);
					}
					else
					{
						draw_sprite_ext(spr_virtual_key_sprint, 0, mobile_key_sprint_x, mobile_key_sprint_y, 1, 1, 0, c_white, 0.5);
					}
				}
			
				#region /*Pause virtual key*/
				virtual_key_add(mobile_key_pause_x - 64, mobile_key_pause_y - 64, 128, 128, vk_escape); /*Virtual key add pause*/
				if (keyboard_check(vk_escape))
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, mobile_key_pause_x, mobile_key_pause_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, mobile_key_pause_x, mobile_key_pause_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /*Pause virtual key END*/
				
				#region /*Zoom out virtual key*/
				virtual_key_add(mobile_key_zoom_out_x - 64, mobile_key_zoom_out_y - 64, 128, 128, vk_subtract); /*Virtual key add zoom out*/
				if (keyboard_check(vk_subtract))
				{
					draw_sprite_ext(spr_virtual_key_zoom_out, 0, mobile_key_zoom_out_x, mobile_key_zoom_out_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_zoom_out, 0, mobile_key_zoom_out_x, mobile_key_zoom_out_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /*Zoom out virtual key END*/
				
				#region /*Zoom in virtual key*/
				virtual_key_add(mobile_key_zoom_in_x - 64, mobile_key_zoom_in_y - 64, 128, 128, vk_add); /*Virtual key add zoom in*/
				if (keyboard_check(vk_add))
				{
					draw_sprite_ext(spr_virtual_key_zoom_in, 0, mobile_key_zoom_in_x, mobile_key_zoom_in_y, 1.95, 1.95, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_zoom_in, 0, mobile_key_zoom_in_x, mobile_key_zoom_in_y, 2, 2, 0, c_white, 0.5);
				}
				#endregion /*Zoom out virtual key END*/
				
			}
		}
	}
	#endregion /*Virtual Key, iOS and Android END*/
	
}