///scr_remapping_gamepad()
function scr_remapping_gamepad()
{
	
	#region /* Check for player 1 button presses */
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_face1))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_face1))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_face1))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_face1))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("A")))
	{
		last_key = gp_face1;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_face2))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_face2))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_face2))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_face2))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("B")))
	{
		last_key = gp_face2;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_face3))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_face3))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_face3))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_face3))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("X")))
	{
		last_key = gp_face3;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_face4))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_face4))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_face4))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_face4))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("Y")))
	{
		last_key = gp_face4;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_shoulderl))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_shoulderl))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_shoulderl))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_shoulderl))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("L")))
	{
		last_key = gp_shoulderl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_shoulderlb))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_shoulderlb))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_shoulderlb))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_shoulderlb))
	and (!gamepad_button_check(3, gp_start))
	{
		last_key = gp_shoulderlb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_shoulderr))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_shoulderr))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_shoulderr))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_shoulderr))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(ord("R")))
	{
		last_key = gp_shoulderr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_shoulderrb))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_shoulderrb))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_shoulderrb))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_shoulderrb))
	and (!gamepad_button_check(3, gp_start))
	{
		last_key = gp_shoulderrb;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_stickl))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_stickl))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_stickl))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_stickl))
	and (!gamepad_button_check(3, gp_start))
	{
		last_key = gp_stickl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_stickr))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_stickr))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_stickr))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_stickr))
	and (!gamepad_button_check(3, gp_start))
	{
		last_key = gp_stickr;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_padu))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_padu))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_padu))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_padu))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(vk_up))
	{
		last_key = gp_padu;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_padd))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_padd))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_padd))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_padd))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(vk_down))
	{
		last_key = gp_padd;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_padl))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_padl))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_padl))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_padl))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(vk_left))
	{
		last_key = gp_padl;
		can_remap_key = true;
	}
	else
	if (remapping_player == 0)
	and (gamepad_button_check_pressed(0, gp_padr))
	and (!gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check_pressed(1, gp_padr))
	and (!gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check_pressed(2, gp_padr))
	and (!gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check_pressed(3, gp_padr))
	and (!gamepad_button_check(3, gp_start))
	or (keyboard_check_pressed(vk_right))
	{
		last_key = gp_padr;
		can_remap_key = true;
	}
	#endregion /* Check for player 1 button presses END */
	
	else
	
	if (keyboard_check_pressed(vk_escape))
	or (remapping_player == 0)
	and (gamepad_button_check(0, gp_start))
	or (remapping_player == 1)
	and (gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check(3, gp_start))
	{
		last_key = noone;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_right))
	{
		can_remap_key = true;
	}
	
	#region /* Remapping 1 */
	if (remapping_player == 0)
	and (can_remap_key == true)
	{
		if (menu_remap_key_number == 0)
		{
			if (menu == "remap_key_dive")
			{
				global.player1_gamepad_button_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player1_gamepad_button_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player1_gamepad_button_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player1_gamepad_button_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player1_gamepad_button_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player1_gamepad_button_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player1_gamepad_button_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player1_gamepad_button_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player1_gamepad_button_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player1_gamepad_button_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player1_gamepad_button_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player1_gamepad_button_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player1_gamepad_button_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu == "remap_key_dive")
			{
				global.player1_gamepad_button2_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player1_gamepad_button2_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player1_gamepad_button2_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player1_gamepad_button2_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player1_gamepad_button2_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player1_gamepad_button2_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player1_gamepad_button2_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player1_gamepad_button2_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player1_gamepad_button2_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player1_gamepad_button2_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player1_gamepad_button2_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player1_gamepad_button2_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player1_gamepad_button2_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /* Remapping 1 END */
	
	else
	
	#region /* Remapping 2 */
	if (remapping_player == 1)
	and (can_remap_key == true)
	{
		if (menu_remap_key_number == 0)
		{
			if (menu == "remap_key_dive")
			{
				global.player2_gamepad_button_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player2_gamepad_button_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player2_gamepad_button_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player2_gamepad_button_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player2_gamepad_button_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player2_gamepad_button_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player2_gamepad_button_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player2_gamepad_button_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player2_gamepad_button_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player2_gamepad_button_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player2_gamepad_button_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player2_gamepad_button_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player2_gamepad_button_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu == "remap_key_dive")
			{
				global.player2_gamepad_button2_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player2_gamepad_button2_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player2_gamepad_button2_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player2_gamepad_button2_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player2_gamepad_button2_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player2_gamepad_button2_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player2_gamepad_button2_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player2_gamepad_button2_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player2_gamepad_button2_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player2_gamepad_button2_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player2_gamepad_button2_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player2_gamepad_button2_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player2_gamepad_button2_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /* Remapping 2 END */
	
	else
	
	#region /* Remapping 3 */
	if (remapping_player == 2)
	and (can_remap_key == true)
	{
		if (menu_remap_key_number == 0)
		{
			if (menu == "remap_key_dive")
			{
				global.player3_gamepad_button_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player3_gamepad_button_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player3_gamepad_button_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player3_gamepad_button_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player3_gamepad_button_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player3_gamepad_button_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player3_gamepad_button_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player3_gamepad_button_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player3_gamepad_button_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player3_gamepad_button_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player3_gamepad_button_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player3_gamepad_button_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player3_gamepad_button_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu == "remap_key_dive")
			{
				global.player3_gamepad_button2_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player3_gamepad_button2_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player3_gamepad_button2_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player3_gamepad_button2_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player3_gamepad_button2_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player3_gamepad_button2_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player3_gamepad_button2_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player3_gamepad_button2_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player3_gamepad_button2_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player3_gamepad_button2_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player3_gamepad_button2_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player3_gamepad_button2_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player3_gamepad_button2_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /* Remapping 3 END */
	
	else
	
	#region /* Remapping 4 */
	if (remapping_player == 3)
	and (can_remap_key == true)
	{
		if (menu_remap_key_number == 0)
		{
			if (menu == "remap_key_dive")
			{
				global.player4_gamepad_button_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player4_gamepad_button_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player4_gamepad_button_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player4_gamepad_button_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player4_gamepad_button_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player4_gamepad_button_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player4_gamepad_button_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player4_gamepad_button_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player4_gamepad_button_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player4_gamepad_button_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player4_gamepad_button_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player4_gamepad_button_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player4_gamepad_button_zoom_out = last_key;
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
		else
		if (menu_remap_key_number = 2)
		{
			if (menu == "remap_key_dive")
			{
				global.player4_gamepad_button2_dive = last_key;
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player4_gamepad_button2_jump = last_key;
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player4_gamepad_button2_crouch = last_key;
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player4_gamepad_button2_crouch_toggle = last_key;
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player4_gamepad_button2_sprint = last_key;
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player4_gamepad_button2_sprint_toggle = last_key;
			}
			else
			if (menu == "remap_key_left")
			{
				global.player4_gamepad_button2_left = last_key;
			}
			else
			if (menu == "remap_key_right")
			{
				global.player4_gamepad_button2_right = last_key;
			}
			else
			if (menu == "remap_key_down")
			{
				global.player4_gamepad_button2_down = last_key;
			}
			else
			if (menu == "remap_key_up")
			{
				global.player4_gamepad_button2_up = last_key;
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player4_gamepad_button2_tongue = last_key;
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player4_gamepad_button2_zoom_in = last_key;
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player4_gamepad_button2_zoom_out = last_key;
			}
			menu_delay = 10;
			can_remap_key = false;
			input_key = false;
		}
	}
	#endregion /* Remapping 4 END */

}
