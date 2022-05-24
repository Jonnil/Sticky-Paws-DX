///scr_keyboardremapping()
function scr_keyboardremapping()
{
	if (!keyboard_check_pressed(vk_escape))
	and (keyboard_check_pressed(vk_anykey))
	{
		lastkey = keyboard_lastkey;
		can_remap_key = true;
	}
	else
	if (keyboard_check_pressed(vk_escape))
	{
		lastkey = noone;
		can_remap_key = true;
	}
	
	#region /*Remapping 1*/
	if (remapping_player = 0)
	and (can_remap_key = true)
	{
		if (menu_remap_key_number = 0)
		{
			if (menu = "remap_key_dive")
			{
				global.player1_key_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player1_key_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player1_key_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player1_key_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player1_key_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player1_key_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player1_key_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player1_key_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player1_key_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player1_key_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player1_key_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player1_key_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player1_key_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu = "remap_key_dive")
			{
				global.player1_key2_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player1_key2_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player1_key2_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player1_key2_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player1_key2_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player1_key2_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player1_key2_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player1_key2_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player1_key2_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player1_key2_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player1_key2_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player1_key2_zoom_in = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /*Remapping 1 END*/
	
	else
	
	#region /*Remapping 2*/
	if (remapping_player = 1)
	and (can_remap_key = true)
	{
		if (menu_remap_key_number = 0)
		{
			if (menu = "remap_key_dive")
			{
				global.player2_key_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player2_key_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player2_key_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player2_key_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player2_key_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player2_key_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player2_key_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player2_key_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player2_key_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player2_key_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player2_key_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player2_key_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player2_key_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu = "remap_key_dive")
			{
				global.player2_key2_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player2_key2_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player2_key2_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player2_key2_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player2_key2_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player2_key2_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player2_key2_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player2_key2_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player2_key2_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player2_key2_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player2_key2_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player2_key2_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player2_key2_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /*Remapping 2 END*/
	
	else
	
	#region /*Remapping 3*/
	if (remapping_player = 2)
	and (can_remap_key = true)
	{
		if (menu_remap_key_number = 0)
		{
			if (menu = "remap_key_dive")
			{
				global.player3_key_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player3_key_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player3_key_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player3_key_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player3_key_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player3_key_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player3_key_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player3_key_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player3_key_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player3_key_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player3_key_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player3_key_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player3_key_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu = "remap_key_dive")
			{
				global.player3_key2_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player3_key2_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player3_key2_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player3_key2_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player3_key2_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player3_key2_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player3_key2_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player3_key2_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player3_key2_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player3_key2_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player3_key2_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player3_key2_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player3_key2_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /*Remapping 3 END*/
	
	else
	
	#region /*Remapping 4 */
	if (remapping_player = 3)
	and (can_remap_key = true)
	{
		if (menu_remap_key_number = 0)
		{
			if (menu = "remap_key_dive")
			{
				global.player4_key_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player4_key_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player4_key_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player4_key_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player4_key_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player4_key_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player4_key_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player4_key_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player4_key_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player4_key_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player4_key_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player4_key_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player4_key_zoom_out = lastkey;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu = "remap_key_dive")
			{
				global.player4_key2_dive = lastkey;
			}
			else
			if (menu = "remap_key_jump")
			{
				global.player4_key2_jump = lastkey;
			}
			else
			if (menu = "remap_key_crouch")
			{
				global.player4_key2_crouch = lastkey;
			}
			else
			if (menu = "remap_key_crouch_toggle")
			{
				global.player4_key2_crouch_toggle = lastkey;
			}
			else
			if (menu = "remap_key_sprint")
			{
				global.player4_key2_sprint = lastkey;
			}
			else
			if (menu = "remap_key_sprint_toggle")
			{
				global.player4_key2_sprint_toggle = lastkey;
			}
			else
			if (menu = "remap_key_left")
			{
				global.player4_key2_left = lastkey;
			}
			else
			if (menu = "remap_key_right")
			{
				global.player4_key2_right = lastkey;
			}
			else
			if (menu = "remap_key_down")
			{
				global.player4_key2_down = lastkey;
			}
			else
			if (menu = "remap_key_up")
			{
				global.player4_key2_up = lastkey;
			}
			else
			if (menu = "remap_key_tongue")
			{
				global.player4_key2_tongue = lastkey;
			}
			else
			if (menu = "remap_key_zoom_in")
			{
				global.player4_key2_zoom_in = lastkey;
			}
			else
			if (menu = "remap_key_zoom_out")
			{
				global.player4_key2_zoom_out = lastkey;
			}
			menu_delay = 10;
			can_remap_key = false;
			input_key = false;
		}
	}
	#endregion /*Remapping 4 END*/

}