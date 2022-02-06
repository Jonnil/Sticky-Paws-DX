function scr_virtual_keys()
{
	
	#region /*Virtual Key, iOS and Android*/
	if (os_type == os_ios)
	or(os_type == os_android)
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
				
				#region /*Virtual key add up*/
				if (global.player1_key_up > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 150 + 25, 300, 400, global.player1_key_up);
				}
				else
				if (global.player1_key2_up > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 150 + 25, 300, 400, global.player1_key2_up);
				}
				#endregion /*Virtual key add up END*/
				
				#region /*Virtual key add left*/
				if (global.player1_key_left > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 450 + 25, 125, 400, global.player1_key_left);
				}
				else
				if (global.player1_key2_left > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 450 + 25, 125, 400, global.player1_key2_left);
				}
				#endregion /*Virtual key add left END*/
				
				#region /*Virtual key add right*/
				if (global.player1_key_right > noone)
				{
					virtual_key_add(global.mobile_joystick_x + 200 - 25, global.mobile_joystick_y + 450 + 25, 400 + 25, 400, global.player1_key_right);
				}
				else
				if (global.player1_key2_right > noone)
				{
					virtual_key_add(global.mobile_joystick_x + 200 - 25, global.mobile_joystick_y + 450 + 25, 400 + 25, 400, global.player1_key2_right);
				}
				#endregion /*Virtual key add right END*/
				
				#region /*Virtual key add down*/
				if (global.player1_key_down > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 650 + 25, 300, 200, global.player1_key_down);
				}
				else
				if (global.player1_key2_down > noone)
				{
					virtual_key_add(global.mobile_joystick_x, global.mobile_joystick_y + 650 + 25, 300, 200, global.player1_key2_down);
				}
				#endregion /*Virtual key add down END*/
				
				#region /*Virtual key add jump*/
				if (global.player1_key_jump > noone)
				{
					virtual_key_add(global.mobile_key_jump_x - 128, global.mobile_key_jump_y - 128, 256, 256, global.player1_key_jump);
				}
				else
				if (global.player1_key2_jump > noone)
				{
					virtual_key_add(global.mobile_key_jump_x - 128, global.mobile_key_jump_y - 128, 256, 256, global.player1_key2_jump);
				}
				#endregion /*Virtual key add jump END*/
				
				#region /*Virtual key add sprint*/
				if (global.player1_key_sprint > noone)
				{
					virtual_key_add(global.mobile_key_sprint_x - 128, global.mobile_key_sprint_y - 128, 256, 256, global.player1_key_sprint);
				}
				else
				if (global.player1_key2_sprint > noone)
				{
					virtual_key_add(global.mobile_key_sprint_x - 128, global.mobile_key_sprint_y - 128, 256, 256, global.player1_key2_sprint);
				}
				#endregion /*Virtual key add sprint END*/
				
				#region /*Virtual key add jump + sprint between the jump and sprint buttons*/
				if (global.player1_key_jump > noone)
				{
					virtual_key_add(round(global.mobile_key_jump_x + global.mobile_key_sprint_x)/ 2 - 64, round(global.mobile_key_jump_y + global.mobile_key_sprint_y)/ 2 - 64, 128, 128, global.player1_key_jump);
				}
				else
				if (global.player1_key2_jump > noone)
				{
					virtual_key_add(round(global.mobile_key_jump_x + global.mobile_key_sprint_x)/ 2 - 64, round(global.mobile_key_jump_y + global.mobile_key_sprint_y)/ 2 - 64, 128, 128, global.player1_key2_jump);
				}
				if (global.player1_key_sprint > noone)
				{
					virtual_key_add(round(global.mobile_key_jump_x + global.mobile_key_sprint_x)/ 2 - 64, round(global.mobile_key_jump_y + global.mobile_key_sprint_y)/ 2 - 64, 128, 128, global.player1_key_sprint);
				}
				else
				if (global.player1_key2_sprint > noone)
				{
					virtual_key_add(round(global.mobile_key_jump_x + global.mobile_key_sprint_x)/ 2 - 64, round(global.mobile_key_jump_y + global.mobile_key_sprint_y)/ 2 - 64, 128, 128, global.player1_key2_sprint);
				}
				#endregion /*Virtual key add jump + sprint between the jump and sprint buttons END*/
				
				virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /*Virtual key add pause*/
				
				if (keyboard_check(global.player1_key_up))
				or(keyboard_check(global.player1_key2_up))
				{
					draw_sprite_ext(spr_virtual_key_up, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_up, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 1, 1, 0, c_white, 0.5);
				}
				if (keyboard_check(global.player1_key_left))
				or(keyboard_check(global.player1_key2_left))
				{
					draw_sprite_ext(spr_virtual_key_left, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_left, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 1, 1, 0, c_white, 0.5);
				}
				if (keyboard_check(global.player1_key_right))
				or(keyboard_check(global.player1_key2_right))
				{
					draw_sprite_ext(spr_virtual_key_right, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_right, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 1, 1, 0, c_white, 0.5);
				}
				if (keyboard_check(global.player1_key_down))
				or(keyboard_check(global.player1_key2_down))
				{
					draw_sprite_ext(spr_virtual_key_down, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_down, 0, global.mobile_joystick_x + 120 + 30, global.mobile_joystick_y + 450 + 250 - 100, 1, 1, 0, c_white, 0.5);
				}

				if (keyboard_check(global.player1_key_jump))
				or(keyboard_check(global.player1_key2_jump))
				{
					draw_sprite_ext(spr_virtual_key_jump, 0, global.mobile_key_jump_x, global.mobile_key_jump_y, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_jump, 0, global.mobile_key_jump_x, global.mobile_key_jump_y, 1, 1, 0, c_white, 0.5);
				}
				if (keyboard_check(global.player1_key_sprint))
				or(keyboard_check(global.player1_key2_sprint))
				{
					draw_sprite_ext(spr_virtual_key_sprint, 0, global.mobile_key_sprint_x, global.mobile_key_sprint_y, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_sprint, 0, global.mobile_key_sprint_x, global.mobile_key_sprint_y, 1, 1, 0, c_white, 0.5);
				}
			
				#region /*Pause virtual key*/
				if (keyboard_check(vk_escape))
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, 1100 - 64, 32, 0.9, 0.9, 0, c_gray, 0.5);
				}
				else
				{
					draw_sprite_ext(spr_virtual_key_pause, 0, 1100 - 64, 32, 1, 1, 0, c_white, 0.5);
				}
				#endregion /*Pause virtual key END*/
				
			}
		}
	}
	#endregion /*Virtual Key, iOS and Android END*/
	
}