///scr_keyboardremapping()
function scr_keyboardremapping()
{
	if (!keyboard_check_pressed(vk_escape))
	and (keyboard_check_pressed(vk_anykey))
	{
		last_key = keyboard_lastkey;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_left))
	{
		last_key = mouse_button_value.mb_left;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_middle))
	{
		last_key = mouse_button_value.mb_middle;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_right))
	{
		last_key = mouse_button_value.mb_right;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_side1))
	{
		last_key = mouse_button_value.mb_side1;
		can_remap_key = true;
	}
	else
	if (mouse_check_button_pressed(mb_side2))
	{
		last_key = mouse_button_value.mb_side2;
		can_remap_key = true;
	}
	else
	if (mouse_wheel_down())
	{
		last_key = mouse_button_value.mwheel_down;
		can_remap_key = true;
	}
	else
	if (mouse_wheel_up())
	{
		last_key = mouse_button_value.mwheel_up;
		can_remap_key = true;
	}
	else
	if (keyboard_check_pressed(vk_escape))
	or (remapping_player = 0)
	and (gamepad_button_check(0, gp_start))
	or (remapping_player = 1)
	and (gamepad_button_check(1, gp_start))
	or (remapping_player = 2)
	and (gamepad_button_check(2, gp_start))
	or (remapping_player = 3)
	and (gamepad_button_check(3, gp_start))
	{
		last_key = noone;
		can_remap_key = true;
	}
	
	#region /*Remapping 1*/
	if (remapping_player = 0)
	and (can_remap_key = true)
	{
		if (menu_remap_key_number = 0)
		{
			if (menu == "remap_key_dive")
			{
				global.player1_key_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_dive", global.player1_key_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player1_key_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_jump", global.player1_key_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player1_key_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_crouch", global.player1_key_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player1_key_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_crouch_toggle", global.player1_key_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player1_key_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_sprint", global.player1_key_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player1_key_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_sprint_toggle", global.player1_key_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player1_key_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_left", global.player1_key_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player1_key_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_right", global.player1_key_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player1_key_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_down", global.player1_key_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player1_key_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_up", global.player1_key_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player1_key_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_tongue", global.player1_key_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player1_key_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_zoom_in", global.player1_key_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player1_key_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key_zoom_out", global.player1_key_zoom_out);
				ini_close();
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
				global.player1_key2_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_dive", global.player1_key2_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player1_key2_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_jump", global.player1_key2_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player1_key2_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_crouch", global.player1_key2_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player1_key2_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_crouch_toggle", global.player1_key2_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player1_key2_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_sprint", global.player1_key2_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player1_key2_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_sprint_toggle", global.player1_key2_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player1_key2_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_left", global.player1_key2_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player1_key2_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_right", global.player1_key2_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player1_key2_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_down", global.player1_key2_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player1_key2_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_up", global.player1_key2_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player1_key2_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_tongue", global.player1_key2_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player1_key2_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_zoom_in", global.player1_key2_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player1_key2_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player1_key2_zoom_out", global.player1_key2_zoom_out);
				ini_close();
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
			if (menu == "remap_key_dive")
			{
				global.player2_key_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_dive", global.player2_key_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player2_key_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_jump", global.player2_key_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player2_key_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_crouch", global.player2_key_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player2_key_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_crouch_toggle", global.player2_key_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player2_key_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_sprint", global.player2_key_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player2_key_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_sprint_toggle", global.player2_key_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player2_key_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_left", global.player2_key_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player2_key_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_right", global.player2_key_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player2_key_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_down", global.player2_key_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player2_key_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_up", global.player2_key_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player2_key_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_tongue", global.player2_key_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player2_key_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_zoom_in", global.player2_key_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player2_key_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key_zoom_out", global.player2_key_zoom_out);
				ini_close();
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
				global.player2_key2_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_dive", global.player2_key2_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player2_key2_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_jump", global.player2_key2_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player2_key2_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_crouch", global.player2_key2_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player2_key2_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_crouch_toggle", global.player2_key2_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player2_key2_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_sprint", global.player2_key2_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player2_key2_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_sprint_toggle", global.player2_key2_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player2_key2_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_left", global.player2_key2_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player2_key2_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_right", global.player2_key2_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player2_key2_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_down", global.player2_key2_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player2_key2_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_up", global.player2_key2_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player2_key2_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_tongue", global.player2_key2_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player2_key2_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_zoom_in", global.player2_key2_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player2_key2_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player2_key2_zoom_out", global.player2_key2_zoom_out);
				ini_close();
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
			if (menu == "remap_key_dive")
			{
				global.player3_key_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_dive", global.player3_key_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player3_key_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_jump", global.player3_key_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player3_key_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_crouch", global.player3_key_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player3_key_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_crouch_toggle", global.player3_key_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player3_key_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_sprint", global.player3_key_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player3_key_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_sprint_toggle", global.player3_key_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player3_key_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_left", global.player3_key_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player3_key_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_right", global.player3_key_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player3_key_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_down", global.player3_key_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player3_key_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_up", global.player3_key_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player3_key_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_tongue", global.player3_key_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player3_key_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_zoom_in", global.player3_key_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player3_key_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key_zoom_out", global.player3_key_zoom_out);
				ini_close();
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
				global.player3_key2_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_dive", global.player3_key2_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player3_key2_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_jump", global.player3_key2_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player3_key2_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_crouch", global.player3_key2_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player3_key2_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_crouch_toggle", global.player3_key2_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player3_key2_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_sprint", global.player3_key2_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player3_key2_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_sprint_toggle", global.player3_key2_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player3_key2_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_left", global.player3_key2_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player3_key2_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_right", global.player3_key2_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player3_key2_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_down", global.player3_key2_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player3_key2_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_up", global.player3_key2_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player3_key2_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_tongue", global.player3_key2_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player3_key2_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_zoom_in", global.player3_key2_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player3_key2_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player3_key2_zoom_out", global.player3_key2_zoom_out);
				ini_close();
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
			if (menu == "remap_key_dive")
			{
				global.player4_key_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_dive", global.player4_key_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player4_key_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_jump", global.player4_key_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player4_key_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_crouch", global.player4_key_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player4_key_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_crouch_toggle", global.player4_key_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player4_key_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_sprint", global.player4_key_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player4_key_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_sprint_toggle", global.player4_key_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player4_key_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_left", global.player4_key_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player4_key_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_right", global.player4_key_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player4_key_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_down", global.player4_key_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player4_key_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_up", global.player4_key_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player4_key_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_tongue", global.player4_key_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player4_key_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_zoom_in", global.player4_key_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player4_key_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key_zoom_out", global.player4_key_zoom_out);
				ini_close();
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
				global.player4_key2_dive = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_dive", global.player4_key2_dive);
				ini_close();
			}
			else
			if (menu == "remap_key_jump")
			{
				global.player4_key2_jump = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_jump", global.player4_key2_jump);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch")
			{
				global.player4_key2_crouch = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_crouch", global.player4_key2_crouch);
				ini_close();
			}
			else
			if (menu == "remap_key_crouch_toggle")
			{
				global.player4_key2_crouch_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_crouch_toggle", global.player4_key2_crouch_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint")
			{
				global.player4_key2_sprint = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_sprint", global.player4_key2_sprint);
				ini_close();
			}
			else
			if (menu == "remap_key_sprint_toggle")
			{
				global.player4_key2_sprint_toggle = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_sprint_toggle", global.player4_key2_sprint_toggle);
				ini_close();
			}
			else
			if (menu == "remap_key_left")
			{
				global.player4_key2_left = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_left", global.player4_key2_left);
				ini_close();
			}
			else
			if (menu == "remap_key_right")
			{
				global.player4_key2_right = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_right", global.player4_key2_right);
				ini_close();
			}
			else
			if (menu == "remap_key_down")
			{
				global.player4_key2_down = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_down", global.player4_key2_down);
				ini_close();
			}
			else
			if (menu == "remap_key_up")
			{
				global.player4_key2_up = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_up", global.player4_key2_up);
				ini_close();
			}
			else
			if (menu == "remap_key_tongue")
			{
				global.player4_key2_tongue = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_tongue", global.player4_key2_tongue);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_in")
			{
				global.player4_key2_zoom_in = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_zoom_in", global.player4_key2_zoom_in);
				ini_close();
			}
			else
			if (menu == "remap_key_zoom_out")
			{
				global.player4_key2_zoom_out = last_key;
				ini_open(working_directory + "config.ini");
				ini_write_real("config", "player4_key2_zoom_out", global.player4_key2_zoom_out);
				ini_close();
			}
			can_remap_key = false;
			input_key = false;
			menu_delay = 10;
		}
	}
	#endregion /*Remapping 4 END*/
	
}