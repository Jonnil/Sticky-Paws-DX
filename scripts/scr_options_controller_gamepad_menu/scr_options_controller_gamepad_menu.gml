function scr_options_controller_gamepad_menu()
{
	
	#region /*Controller Gamepad*/
	if (global.settings_sidebar_menu = "controller_settings")
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /*Remap Gamepad and Mouse*/
		
		#region /*Show what key is used*/
		{
			image_speed = 0;
			key1_x = 800;
			or_text_x = 900;
			key2_x = 1000;
		
			#region /*Show the keys for every player*/
		
			#region /*Remapping Player 1 Key Variables*/
			if (remapping_player = 0)
			{
				var remapping_player_gamepad_button_dive = global.player1_gamepad_button_dive;
				var remapping_player_gamepad_button_jump = global.player1_gamepad_button_jump;
				var remapping_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
				var remapping_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
				var remapping_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
				var remapping_player_gamepad_button_sprint_toggle = global.player1_gamepad_button_sprint_toggle;
				var remapping_player_gamepad_button_left = global.player1_gamepad_button_left;
				var remapping_player_gamepad_button_right = global.player1_gamepad_button_right;
				var remapping_player_gamepad_button_down = global.player1_gamepad_button_down;
				var remapping_player_gamepad_button_up = global.player1_gamepad_button_up;
				var remapping_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
				var remapping_player_gamepad_button_zoom_in = global.player1_gamepad_button_zoom_in;
				var remapping_player_gamepad_button_zoom_out = global.player1_gamepad_button_zoom_out;
				
				var remapping_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
				var remapping_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
				var remapping_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
				var remapping_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
				var remapping_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
				var remapping_player_gamepad_button2_sprint_toggle = global.player1_gamepad_button2_sprint_toggle;
				var remapping_player_gamepad_button2_left = global.player1_gamepad_button2_left;
				var remapping_player_gamepad_button2_right = global.player1_gamepad_button2_right;
				var remapping_player_gamepad_button2_down = global.player1_gamepad_button2_down;
				var remapping_player_gamepad_button2_up = global.player1_gamepad_button2_up;
				var remapping_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
				var remapping_player_gamepad_button2_zoom_in = global.player1_gamepad_button2_zoom_in;
				var remapping_player_gamepad_button2_zoom_out = global.player1_gamepad_button2_zoom_out;
				
				#region /*Other player's keys*/
				var remapping_other1_player_gamepad_button_dive = global.player2_gamepad_button_dive;
				var remapping_other1_player_gamepad_button_jump = global.player2_gamepad_button_jump;
				var remapping_other1_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
				var remapping_other1_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
				var remapping_other1_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
				var remapping_other1_player_gamepad_button_sprint_toggle = global.player2_gamepad_button_sprint_toggle;
				var remapping_other1_player_gamepad_button_left = global.player2_gamepad_button_left;
				var remapping_other1_player_gamepad_button_right = global.player2_gamepad_button_right;
				var remapping_other1_player_gamepad_button_down = global.player2_gamepad_button_down;
				var remapping_other1_player_gamepad_button_up = global.player2_gamepad_button_up;
				var remapping_other1_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
				var remapping_other1_player_gamepad_button_zoom_in = global.player2_gamepad_button_zoom_in;
				var remapping_other1_player_gamepad_button_zoom_out = global.player2_gamepad_button_zoom_out;
				
				var remapping_other1_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
				var remapping_other1_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
				var remapping_other1_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
				var remapping_other1_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
				var remapping_other1_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
				var remapping_other1_player_gamepad_button2_sprint_toggle = global.player2_gamepad_button2_sprint_toggle;
				var remapping_other1_player_gamepad_button2_left = global.player2_gamepad_button2_left;
				var remapping_other1_player_gamepad_button2_right = global.player2_gamepad_button2_right;
				var remapping_other1_player_gamepad_button2_down = global.player2_gamepad_button2_down;
				var remapping_other1_player_gamepad_button2_up = global.player2_gamepad_button2_up;
				var remapping_other1_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
				var remapping_other1_player_gamepad_button2_zoom_in = global.player2_gamepad_button2_zoom_in;
				var remapping_other1_player_gamepad_button2_zoom_out = global.player2_gamepad_button2_zoom_out;
				
				var remapping_other2_player_gamepad_button_dive = global.player3_gamepad_button_dive;
				var remapping_other2_player_gamepad_button_jump = global.player3_gamepad_button_jump;
				var remapping_other2_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
				var remapping_other2_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
				var remapping_other2_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
				var remapping_other2_player_gamepad_button_sprint_toggle = global.player3_gamepad_button_sprint_toggle;
				var remapping_other2_player_gamepad_button_left = global.player3_gamepad_button_left;
				var remapping_other2_player_gamepad_button_right = global.player3_gamepad_button_right;
				var remapping_other2_player_gamepad_button_down = global.player3_gamepad_button_down;
				var remapping_other2_player_gamepad_button_up = global.player3_gamepad_button_up;
				var remapping_other2_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
				var remapping_other2_player_gamepad_button_zoom_in = global.player3_gamepad_button_zoom_in;
				var remapping_other2_player_gamepad_button_zoom_out = global.player3_gamepad_button_zoom_out;
				
				var remapping_other2_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
				var remapping_other2_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
				var remapping_other2_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
				var remapping_other2_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
				var remapping_other2_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
				var remapping_other2_player_gamepad_button2_sprint_toggle = global.player3_gamepad_button2_sprint_toggle;
				var remapping_other2_player_gamepad_button2_left = global.player3_gamepad_button2_left;
				var remapping_other2_player_gamepad_button2_right = global.player3_gamepad_button2_right;
				var remapping_other2_player_gamepad_button2_down = global.player3_gamepad_button2_down;
				var remapping_other2_player_gamepad_button2_up = global.player3_gamepad_button2_up;
				var remapping_other2_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
				var remapping_other2_player_gamepad_button2_zoom_in = global.player3_gamepad_button2_zoom_in;
				var remapping_other2_player_gamepad_button2_zoom_out = global.player3_gamepad_button2_zoom_out;
				
				var remapping_other3_player_gamepad_button_dive = global.player4_gamepad_button_dive;
				var remapping_other3_player_gamepad_button_jump = global.player4_gamepad_button_jump;
				var remapping_other3_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
				var remapping_other3_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
				var remapping_other3_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
				var remapping_other3_player_gamepad_button_sprint_toggle = global.player4_gamepad_button_sprint_toggle;
				var remapping_other3_player_gamepad_button_left = global.player4_gamepad_button_left;
				var remapping_other3_player_gamepad_button_right = global.player4_gamepad_button_right;
				var remapping_other3_player_gamepad_button_down = global.player4_gamepad_button_down;
				var remapping_other3_player_gamepad_button_up = global.player4_gamepad_button_up;
				var remapping_other3_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
				var remapping_other3_player_gamepad_button_zoom_in = global.player4_gamepad_button_zoom_in;
				var remapping_other3_player_gamepad_button_zoom_out = global.player4_gamepad_button_zoom_out;
				
				var remapping_other3_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
				var remapping_other3_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
				var remapping_other3_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
				var remapping_other3_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
				var remapping_other3_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
				var remapping_other3_player_gamepad_button2_sprint_toggle = global.player4_gamepad_button2_sprint_toggle;
				var remapping_other3_player_gamepad_button2_left = global.player4_gamepad_button2_left;
				var remapping_other3_player_gamepad_button2_right = global.player4_gamepad_button2_right;
				var remapping_other3_player_gamepad_button2_down = global.player4_gamepad_button2_down;
				var remapping_other3_player_gamepad_button2_up = global.player4_gamepad_button2_up;
				var remapping_other3_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
				var remapping_other3_player_gamepad_button2_zoom_in = global.player4_gamepad_button2_zoom_in;
				var remapping_other3_player_gamepad_button2_zoom_out = global.player4_gamepad_button2_zoom_out;
				#endregion /*Other player's keys END*/
				
			}
			#endregion /*Remapping Player 1 Key Variables END*/
			
			#region /*Remapping Player 2 Key Variables*/
			if (remapping_player = 1)
			{
				var remapping_player_gamepad_button_dive = global.player2_gamepad_button_dive;
				var remapping_player_gamepad_button_jump = global.player2_gamepad_button_jump;
				var remapping_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
				var remapping_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
				var remapping_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
				var remapping_player_gamepad_button_sprint_toggle = global.player2_gamepad_button_sprint_toggle;
				var remapping_player_gamepad_button_left = global.player2_gamepad_button_left;
				var remapping_player_gamepad_button_right = global.player2_gamepad_button_right;
				var remapping_player_gamepad_button_down = global.player2_gamepad_button_down;
				var remapping_player_gamepad_button_up = global.player2_gamepad_button_up;
				var remapping_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
				var remapping_player_gamepad_button_zoom_in = global.player2_gamepad_button_zoom_in;
				var remapping_player_gamepad_button_zoom_out = global.player2_gamepad_button_zoom_out;
				
				var remapping_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
				var remapping_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
				var remapping_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
				var remapping_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
				var remapping_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
				var remapping_player_gamepad_button2_sprint_toggle = global.player2_gamepad_button2_sprint_toggle;
				var remapping_player_gamepad_button2_left = global.player2_gamepad_button2_left;
				var remapping_player_gamepad_button2_right = global.player2_gamepad_button2_right;
				var remapping_player_gamepad_button2_down = global.player2_gamepad_button2_down;
				var remapping_player_gamepad_button2_up = global.player2_gamepad_button2_up;
				var remapping_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
				var remapping_player_gamepad_button2_zoom_in = global.player2_gamepad_button2_zoom_in;
				var remapping_player_gamepad_button2_zoom_out = global.player2_gamepad_button2_zoom_out;
				
				#region /*Other player's keys*/
				var remapping_other1_player_gamepad_button_dive = global.player1_gamepad_button_dive;
				var remapping_other1_player_gamepad_button_jump = global.player1_gamepad_button_jump;
				var remapping_other1_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
				var remapping_other1_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
				var remapping_other1_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
				var remapping_other1_player_gamepad_button_sprint_toggle = global.player1_gamepad_button_sprint_toggle;
				var remapping_other1_player_gamepad_button_left = global.player1_gamepad_button_left;
				var remapping_other1_player_gamepad_button_right = global.player1_gamepad_button_right;
				var remapping_other1_player_gamepad_button_down = global.player1_gamepad_button_down;
				var remapping_other1_player_gamepad_button_up = global.player1_gamepad_button_up;
				var remapping_other1_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
				var remapping_other1_player_gamepad_button_zoom_in = global.player1_gamepad_button_zoom_in;
				var remapping_other1_player_gamepad_button_zoom_out = global.player1_gamepad_button_zoom_out;
				
				var remapping_other1_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
				var remapping_other1_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
				var remapping_other1_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
				var remapping_other1_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
				var remapping_other1_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
				var remapping_other1_player_gamepad_button2_sprint_toggle = global.player1_gamepad_button2_sprint_toggle;
				var remapping_other1_player_gamepad_button2_left = global.player1_gamepad_button2_left;
				var remapping_other1_player_gamepad_button2_right = global.player1_gamepad_button2_right;
				var remapping_other1_player_gamepad_button2_down = global.player1_gamepad_button2_down;
				var remapping_other1_player_gamepad_button2_up = global.player1_gamepad_button2_up;
				var remapping_other1_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
				var remapping_other1_player_gamepad_button2_zoom_in = global.player1_gamepad_button2_zoom_in;
				var remapping_other1_player_gamepad_button2_zoom_out = global.player1_gamepad_button2_zoom_out;
				
				var remapping_other2_player_gamepad_button_dive = global.player3_gamepad_button_dive;
				var remapping_other2_player_gamepad_button_jump = global.player3_gamepad_button_jump;
				var remapping_other2_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
				var remapping_other2_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
				var remapping_other2_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
				var remapping_other2_player_gamepad_button_sprint_toggle = global.player3_gamepad_button_sprint_toggle;
				var remapping_other2_player_gamepad_button_left = global.player3_gamepad_button_left;
				var remapping_other2_player_gamepad_button_right = global.player3_gamepad_button_right;
				var remapping_other2_player_gamepad_button_down = global.player3_gamepad_button_down;
				var remapping_other2_player_gamepad_button_up = global.player3_gamepad_button_up;
				var remapping_other2_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
				var remapping_other2_player_gamepad_button_zoom_in = global.player3_gamepad_button_zoom_in;
				var remapping_other2_player_gamepad_button_zoom_out = global.player3_gamepad_button_zoom_out;
				
				var remapping_other2_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
				var remapping_other2_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
				var remapping_other2_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
				var remapping_other2_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
				var remapping_other2_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
				var remapping_other2_player_gamepad_button2_sprint_toggle = global.player3_gamepad_button2_sprint_toggle;
				var remapping_other2_player_gamepad_button2_left = global.player3_gamepad_button2_left;
				var remapping_other2_player_gamepad_button2_right = global.player3_gamepad_button2_right;
				var remapping_other2_player_gamepad_button2_down = global.player3_gamepad_button2_down;
				var remapping_other2_player_gamepad_button2_up = global.player3_gamepad_button2_up;
				var remapping_other2_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
				var remapping_other2_player_gamepad_button2_zoom_in = global.player3_gamepad_button2_zoom_in;
				var remapping_other2_player_gamepad_button2_zoom_out = global.player3_gamepad_button2_zoom_out;
				
				var remapping_other3_player_gamepad_button_dive = global.player4_gamepad_button_dive;
				var remapping_other3_player_gamepad_button_jump = global.player4_gamepad_button_jump;
				var remapping_other3_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
				var remapping_other3_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
				var remapping_other3_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
				var remapping_other3_player_gamepad_button_sprint_toggle = global.player4_gamepad_button_sprint_toggle;
				var remapping_other3_player_gamepad_button_left = global.player4_gamepad_button_left;
				var remapping_other3_player_gamepad_button_right = global.player4_gamepad_button_right;
				var remapping_other3_player_gamepad_button_down = global.player4_gamepad_button_down;
				var remapping_other3_player_gamepad_button_up = global.player4_gamepad_button_up;
				var remapping_other3_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
				var remapping_other3_player_gamepad_button_zoom_in = global.player4_gamepad_button_zoom_in;
				var remapping_other3_player_gamepad_button_zoom_out = global.player4_gamepad_button_zoom_out;
				
				var remapping_other3_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
				var remapping_other3_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
				var remapping_other3_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
				var remapping_other3_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
				var remapping_other3_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
				var remapping_other3_player_gamepad_button2_sprint_toggle = global.player4_gamepad_button2_sprint_toggle;
				var remapping_other3_player_gamepad_button2_left = global.player4_gamepad_button2_left;
				var remapping_other3_player_gamepad_button2_right = global.player4_gamepad_button2_right;
				var remapping_other3_player_gamepad_button2_down = global.player4_gamepad_button2_down;
				var remapping_other3_player_gamepad_button2_up = global.player4_gamepad_button2_up;
				var remapping_other3_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
				var remapping_other3_player_gamepad_button2_zoom_in = global.player4_gamepad_button2_zoom_in;
				var remapping_other3_player_gamepad_button2_zoom_out = global.player4_gamepad_button2_zoom_out;
				#endregion /*Other player's keys END*/
			}
			#endregion /*Remapping Player 2 Key Variables END*/
			
			#region /*Remapping Player 3 Key Variables*/
			if (remapping_player = 2)
			{
				var remapping_player_gamepad_button_dive = global.player3_gamepad_button_dive;
				var remapping_player_gamepad_button_jump = global.player3_gamepad_button_jump;
				var remapping_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
				var remapping_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
				var remapping_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
				var remapping_player_gamepad_button_sprint_toggle = global.player3_gamepad_button_sprint_toggle;
				var remapping_player_gamepad_button_left = global.player3_gamepad_button_left;
				var remapping_player_gamepad_button_right = global.player3_gamepad_button_right;
				var remapping_player_gamepad_button_down = global.player3_gamepad_button_down;
				var remapping_player_gamepad_button_up = global.player3_gamepad_button_up;
				var remapping_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
				var remapping_player_gamepad_button_zoom_in = global.player3_gamepad_button_zoom_in;
				var remapping_player_gamepad_button_zoom_out = global.player3_gamepad_button_zoom_out;
				
				var remapping_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
				var remapping_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
				var remapping_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
				var remapping_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
				var remapping_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
				var remapping_player_gamepad_button2_sprint_toggle = global.player3_gamepad_button2_sprint_toggle;
				var remapping_player_gamepad_button2_left = global.player3_gamepad_button2_left;
				var remapping_player_gamepad_button2_right = global.player3_gamepad_button2_right;
				var remapping_player_gamepad_button2_down = global.player3_gamepad_button2_down;
				var remapping_player_gamepad_button2_up = global.player3_gamepad_button2_up;
				var remapping_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
				var remapping_player_gamepad_button2_zoom_in = global.player3_gamepad_button2_zoom_in;
				var remapping_player_gamepad_button2_zoom_out = global.player3_gamepad_button2_zoom_out;
				
				#region /*Other player's keys*/
				var remapping_other1_player_gamepad_button_dive = global.player2_gamepad_button_dive;
				var remapping_other1_player_gamepad_button_jump = global.player2_gamepad_button_jump;
				var remapping_other1_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
				var remapping_other1_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
				var remapping_other1_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
				var remapping_other1_player_gamepad_button_sprint_toggle = global.player2_gamepad_button_sprint_toggle;
				var remapping_other1_player_gamepad_button_left = global.player2_gamepad_button_left;
				var remapping_other1_player_gamepad_button_right = global.player2_gamepad_button_right;
				var remapping_other1_player_gamepad_button_down = global.player2_gamepad_button_down;
				var remapping_other1_player_gamepad_button_up = global.player2_gamepad_button_up;
				var remapping_other1_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
				var remapping_other1_player_gamepad_button_zoom_in = global.player2_gamepad_button_zoom_in;
				var remapping_other1_player_gamepad_button_zoom_out = global.player2_gamepad_button_zoom_out;
				
				var remapping_other1_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
				var remapping_other1_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
				var remapping_other1_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
				var remapping_other1_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
				var remapping_other1_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
				var remapping_other1_player_gamepad_button2_sprint_toggle = global.player2_gamepad_button2_sprint_toggle;
				var remapping_other1_player_gamepad_button2_left = global.player2_gamepad_button2_left;
				var remapping_other1_player_gamepad_button2_right = global.player2_gamepad_button2_right;
				var remapping_other1_player_gamepad_button2_down = global.player2_gamepad_button2_down;
				var remapping_other1_player_gamepad_button2_up = global.player2_gamepad_button2_up;
				var remapping_other1_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
				var remapping_other1_player_gamepad_button2_zoom_in = global.player2_gamepad_button2_zoom_in;
				var remapping_other1_player_gamepad_button2_zoom_out = global.player2_gamepad_button2_zoom_out;
				
				var remapping_other2_player_gamepad_button_dive = global.player1_gamepad_button_dive;
				var remapping_other2_player_gamepad_button_jump = global.player1_gamepad_button_jump;
				var remapping_other2_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
				var remapping_other2_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
				var remapping_other2_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
				var remapping_other2_player_gamepad_button_sprint_toggle = global.player1_gamepad_button_sprint_toggle;
				var remapping_other2_player_gamepad_button_left = global.player1_gamepad_button_left;
				var remapping_other2_player_gamepad_button_right = global.player1_gamepad_button_right;
				var remapping_other2_player_gamepad_button_down = global.player1_gamepad_button_down;
				var remapping_other2_player_gamepad_button_up = global.player1_gamepad_button_up;
				var remapping_other2_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
				var remapping_other2_player_gamepad_button_zoom_in = global.player1_gamepad_button_zoom_in;
				var remapping_other2_player_gamepad_button_zoom_out = global.player1_gamepad_button_zoom_out;
				
				var remapping_other2_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
				var remapping_other2_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
				var remapping_other2_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
				var remapping_other2_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
				var remapping_other2_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
				var remapping_other2_player_gamepad_button2_sprint_toggle = global.player1_gamepad_button2_sprint_toggle;
				var remapping_other2_player_gamepad_button2_left = global.player1_gamepad_button2_left;
				var remapping_other2_player_gamepad_button2_right = global.player1_gamepad_button2_right;
				var remapping_other2_player_gamepad_button2_down = global.player1_gamepad_button2_down;
				var remapping_other2_player_gamepad_button2_up = global.player1_gamepad_button2_up;
				var remapping_other2_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
				var remapping_other2_player_gamepad_button2_zoom_in = global.player1_gamepad_button2_zoom_in;
				var remapping_other2_player_gamepad_button2_zoom_out = global.player1_gamepad_button2_zoom_out;
				
				var remapping_other3_player_gamepad_button_dive = global.player4_gamepad_button_dive;
				var remapping_other3_player_gamepad_button_jump = global.player4_gamepad_button_jump;
				var remapping_other3_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
				var remapping_other3_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
				var remapping_other3_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
				var remapping_other3_player_gamepad_button_sprint_toggle = global.player4_gamepad_button_sprint_toggle;
				var remapping_other3_player_gamepad_button_left = global.player4_gamepad_button_left;
				var remapping_other3_player_gamepad_button_right = global.player4_gamepad_button_right;
				var remapping_other3_player_gamepad_button_down = global.player4_gamepad_button_down;
				var remapping_other3_player_gamepad_button_up = global.player4_gamepad_button_up;
				var remapping_other3_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
				var remapping_other3_player_gamepad_button_zoom_in = global.player4_gamepad_button_zoom_in;
				var remapping_other3_player_gamepad_button_zoom_out = global.player4_gamepad_button_zoom_out;
				
				var remapping_other3_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
				var remapping_other3_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
				var remapping_other3_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
				var remapping_other3_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
				var remapping_other3_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
				var remapping_other3_player_gamepad_button2_sprint_toggle = global.player4_gamepad_button2_sprint_toggle;
				var remapping_other3_player_gamepad_button2_left = global.player4_gamepad_button2_left;
				var remapping_other3_player_gamepad_button2_right = global.player4_gamepad_button2_right;
				var remapping_other3_player_gamepad_button2_down = global.player4_gamepad_button2_down;
				var remapping_other3_player_gamepad_button2_up = global.player4_gamepad_button2_up;
				var remapping_other3_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
				var remapping_other3_player_gamepad_button2_zoom_in = global.player4_gamepad_button2_zoom_in;
				var remapping_other3_player_gamepad_button2_zoom_out = global.player4_gamepad_button2_zoom_out;
				#endregion /*Other player's keys END*/
				
			}
			#endregion /*Remapping Player 3 Key Variables*/
			
			#region /*Remapping Player 4 Key Variables*/
			if (remapping_player = 3)
			{
				var remapping_player_gamepad_button_dive = global.player4_gamepad_button_dive;
				var remapping_player_gamepad_button_jump = global.player4_gamepad_button_jump;
				var remapping_player_gamepad_button_crouch = global.player4_gamepad_button_crouch;
				var remapping_player_gamepad_button_crouch_toggle = global.player4_gamepad_button_crouch_toggle;
				var remapping_player_gamepad_button_sprint = global.player4_gamepad_button_sprint;
				var remapping_player_gamepad_button_sprint_toggle = global.player4_gamepad_button_sprint_toggle;
				var remapping_player_gamepad_button_left = global.player4_gamepad_button_left;
				var remapping_player_gamepad_button_right = global.player4_gamepad_button_right;
				var remapping_player_gamepad_button_down = global.player4_gamepad_button_down;
				var remapping_player_gamepad_button_up = global.player4_gamepad_button_up;
				var remapping_player_gamepad_button_tongue = global.player4_gamepad_button_tongue;
				var remapping_player_gamepad_button_zoom_in = global.player4_gamepad_button_zoom_in;
				var remapping_player_gamepad_button_zoom_out = global.player4_gamepad_button_zoom_out;
				
				var remapping_player_gamepad_button2_dive = global.player4_gamepad_button2_dive;
				var remapping_player_gamepad_button2_jump = global.player4_gamepad_button2_jump;
				var remapping_player_gamepad_button2_crouch = global.player4_gamepad_button2_crouch;
				var remapping_player_gamepad_button2_crouch_toggle = global.player4_gamepad_button2_crouch_toggle;
				var remapping_player_gamepad_button2_sprint = global.player4_gamepad_button2_sprint;
				var remapping_player_gamepad_button2_sprint_toggle = global.player4_gamepad_button2_sprint_toggle;
				var remapping_player_gamepad_button2_left = global.player4_gamepad_button2_left;
				var remapping_player_gamepad_button2_right = global.player4_gamepad_button2_right;
				var remapping_player_gamepad_button2_down = global.player4_gamepad_button2_down;
				var remapping_player_gamepad_button2_up = global.player4_gamepad_button2_up;
				var remapping_player_gamepad_button2_tongue = global.player4_gamepad_button2_tongue;
				var remapping_player_gamepad_button2_zoom_in = global.player4_gamepad_button2_zoom_in;
				var remapping_player_gamepad_button2_zoom_out = global.player4_gamepad_button2_zoom_out;
				
				#region /*Other player's keys*/
				var remapping_other1_player_gamepad_button_dive = global.player2_gamepad_button_dive;
				var remapping_other1_player_gamepad_button_jump = global.player2_gamepad_button_jump;
				var remapping_other1_player_gamepad_button_crouch = global.player2_gamepad_button_crouch;
				var remapping_other1_player_gamepad_button_crouch_toggle = global.player2_gamepad_button_crouch_toggle;
				var remapping_other1_player_gamepad_button_sprint = global.player2_gamepad_button_sprint;
				var remapping_other1_player_gamepad_button_sprint_toggle = global.player2_gamepad_button_sprint_toggle;
				var remapping_other1_player_gamepad_button_left = global.player2_gamepad_button_left;
				var remapping_other1_player_gamepad_button_right = global.player2_gamepad_button_right;
				var remapping_other1_player_gamepad_button_down = global.player2_gamepad_button_down;
				var remapping_other1_player_gamepad_button_up = global.player2_gamepad_button_up;
				var remapping_other1_player_gamepad_button_tongue = global.player2_gamepad_button_tongue;
				var remapping_other1_player_gamepad_button_zoom_in = global.player2_gamepad_button_zoom_in;
				var remapping_other1_player_gamepad_button_zoom_out = global.player2_gamepad_button_zoom_out;
				
				var remapping_other1_player_gamepad_button2_dive = global.player2_gamepad_button2_dive;
				var remapping_other1_player_gamepad_button2_jump = global.player2_gamepad_button2_jump;
				var remapping_other1_player_gamepad_button2_crouch = global.player2_gamepad_button2_crouch;
				var remapping_other1_player_gamepad_button2_crouch_toggle = global.player2_gamepad_button2_crouch_toggle;
				var remapping_other1_player_gamepad_button2_sprint = global.player2_gamepad_button2_sprint;
				var remapping_other1_player_gamepad_button2_sprint_toggle = global.player2_gamepad_button2_sprint_toggle;
				var remapping_other1_player_gamepad_button2_left = global.player2_gamepad_button2_left;
				var remapping_other1_player_gamepad_button2_right = global.player2_gamepad_button2_right;
				var remapping_other1_player_gamepad_button2_down = global.player2_gamepad_button2_down;
				var remapping_other1_player_gamepad_button2_up = global.player2_gamepad_button2_up;
				var remapping_other1_player_gamepad_button2_tongue = global.player2_gamepad_button2_tongue;
				var remapping_other1_player_gamepad_button2_zoom_in = global.player2_gamepad_button2_zoom_in;
				var remapping_other1_player_gamepad_button2_zoom_out = global.player2_gamepad_button2_zoom_out;
				
				var remapping_other2_player_gamepad_button_dive = global.player3_gamepad_button_dive;
				var remapping_other2_player_gamepad_button_jump = global.player3_gamepad_button_jump;
				var remapping_other2_player_gamepad_button_crouch = global.player3_gamepad_button_crouch;
				var remapping_other2_player_gamepad_button_crouch_toggle = global.player3_gamepad_button_crouch_toggle;
				var remapping_other2_player_gamepad_button_sprint = global.player3_gamepad_button_sprint;
				var remapping_other2_player_gamepad_button_sprint_toggle = global.player3_gamepad_button_sprint_toggle;
				var remapping_other2_player_gamepad_button_left = global.player3_gamepad_button_left;
				var remapping_other2_player_gamepad_button_right = global.player3_gamepad_button_right;
				var remapping_other2_player_gamepad_button_down = global.player3_gamepad_button_down;
				var remapping_other2_player_gamepad_button_up = global.player3_gamepad_button_up;
				var remapping_other2_player_gamepad_button_tongue = global.player3_gamepad_button_tongue;
				var remapping_other2_player_gamepad_button_zoom_in = global.player3_gamepad_button_zoom_in;
				var remapping_other2_player_gamepad_button_zoom_out = global.player3_gamepad_button_zoom_out;
				
				var remapping_other2_player_gamepad_button2_dive = global.player3_gamepad_button2_dive;
				var remapping_other2_player_gamepad_button2_jump = global.player3_gamepad_button2_jump;
				var remapping_other2_player_gamepad_button2_crouch = global.player3_gamepad_button2_crouch;
				var remapping_other2_player_gamepad_button2_crouch_toggle = global.player3_gamepad_button2_crouch_toggle;
				var remapping_other2_player_gamepad_button2_sprint = global.player3_gamepad_button2_sprint;
				var remapping_other2_player_gamepad_button2_sprint_toggle = global.player3_gamepad_button2_sprint_toggle;
				var remapping_other2_player_gamepad_button2_left = global.player3_gamepad_button2_left;
				var remapping_other2_player_gamepad_button2_right = global.player3_gamepad_button2_right;
				var remapping_other2_player_gamepad_button2_down = global.player3_gamepad_button2_down;
				var remapping_other2_player_gamepad_button2_up = global.player3_gamepad_button2_up;
				var remapping_other2_player_gamepad_button2_tongue = global.player3_gamepad_button2_tongue;
				var remapping_other2_player_gamepad_button2_zoom_in = global.player3_gamepad_button2_zoom_in;
				var remapping_other2_player_gamepad_button2_zoom_out = global.player3_gamepad_button2_zoom_out;
				
				var remapping_other3_player_gamepad_button_dive = global.player1_gamepad_button_dive;
				var remapping_other3_player_gamepad_button_jump = global.player1_gamepad_button_jump;
				var remapping_other3_player_gamepad_button_crouch = global.player1_gamepad_button_crouch;
				var remapping_other3_player_gamepad_button_crouch_toggle = global.player1_gamepad_button_crouch_toggle;
				var remapping_other3_player_gamepad_button_sprint = global.player1_gamepad_button_sprint;
				var remapping_other3_player_gamepad_button_sprint_toggle = global.player1_gamepad_button_sprint_toggle;
				var remapping_other3_player_gamepad_button_left = global.player1_gamepad_button_left;
				var remapping_other3_player_gamepad_button_right = global.player1_gamepad_button_right;
				var remapping_other3_player_gamepad_button_down = global.player1_gamepad_button_down;
				var remapping_other3_player_gamepad_button_up = global.player1_gamepad_button_up;
				var remapping_other3_player_gamepad_button_tongue = global.player1_gamepad_button_tongue;
				var remapping_other3_player_gamepad_button_zoom_in = global.player1_gamepad_button_zoom_in;
				var remapping_other3_player_gamepad_button_zoom_out = global.player1_gamepad_button_zoom_out;
				
				var remapping_other3_player_gamepad_button2_dive = global.player1_gamepad_button2_dive;
				var remapping_other3_player_gamepad_button2_jump = global.player1_gamepad_button2_jump;
				var remapping_other3_player_gamepad_button2_crouch = global.player1_gamepad_button2_crouch;
				var remapping_other3_player_gamepad_button2_crouch_toggle = global.player1_gamepad_button2_crouch_toggle;
				var remapping_other3_player_gamepad_button2_sprint = global.player1_gamepad_button2_sprint;
				var remapping_other3_player_gamepad_button2_sprint_toggle = global.player1_gamepad_button2_sprint_toggle;
				var remapping_other3_player_gamepad_button2_left = global.player1_gamepad_button2_left;
				var remapping_other3_player_gamepad_button2_right = global.player1_gamepad_button2_right;
				var remapping_other3_player_gamepad_button2_down = global.player1_gamepad_button2_down;
				var remapping_other3_player_gamepad_button2_up = global.player1_gamepad_button2_up;
				var remapping_other3_player_gamepad_button2_tongue = global.player1_gamepad_button2_tongue;
				var remapping_other3_player_gamepad_button2_zoom_in = global.player1_gamepad_button2_zoom_in;
				var remapping_other3_player_gamepad_button2_zoom_out = global.player1_gamepad_button2_zoom_out;
				#endregion /*Other player's keys END*/
				
			}
			#endregion /*Remapping Player 4 Key Variables END*/
			
			#region /*Remap Key Dive*/
			if (menu == "remap_key_dive")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_dive > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_dive, key1_x, menu_y_remap_key_dive + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_dive + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_dive > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_dive, key1_x, menu_y_remap_key_dive + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_dive + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Dive END*/
			
			#region /*Remap Key Jump*/
			if (menu == "remap_key_jump")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_jump > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_jump, key1_x, menu_y_remap_key_jump + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_jump + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_jump > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_jump, key1_x, menu_y_remap_key_jump + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_jump + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Jump END*/
			
			#region /*Remap Key Crouch */
			if (menu == "remap_key_crouch")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_crouch > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_crouch, key1_x, menu_y_remap_key_crouch + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_crouch + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_crouch > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_crouch, key1_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch */
			
			#region /*Remap Key Crouch Toggle*/
			if (menu == "remap_key_crouch_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_crouch_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_crouch_toggle, key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_crouch_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_crouch_toggle, key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Crouch Toggle END*/
			
			#region /*Remap Key Sprint*/
			if (menu == "remap_key_sprint")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_sprint > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_sprint, key1_x, menu_y_remap_key_sprint + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_sprint + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_sprint > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_sprint, key1_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint END*/
			
			#region /*Remap Key Sprint Toggle*/
			if (menu == "remap_key_sprint_toggle")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_sprint_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_sprint_toggle, key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_sprint_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_sprint_toggle, key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Sprint Toggle END*/
			
			#region /*Remap Key Left*/
			if (menu == "remap_key_left")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_left > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_left, key1_x, menu_y_remap_key_left + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_left + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_left > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_left, key1_x, menu_y_remap_key_left + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_left + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Left END*/
			
			#region /*Remap Key Right*/
			if (menu == "remap_key_right")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_right > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_right, key1_x, menu_y_remap_key_right + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_right + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_right > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_right, key1_x, menu_y_remap_key_right + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_right + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Right END*/
			
			#region /*Remap Key Down*/
			if (menu == "remap_key_down")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_down > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_down, key1_x, menu_y_remap_key_down + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_down + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_down > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_down, key1_x, menu_y_remap_key_down + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_down + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Down END*/
			
			#region /*Remap Key Up*/
			if (menu == "remap_key_up")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_up > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_up, key1_x, menu_y_remap_key_up + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_up + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_up > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_up, key1_x, menu_y_remap_key_up + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_up + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Up END*/
			
			#region /*Remap Key Tongue*/
			if (remapping_player = 0)
			and (allow_player1_tongue = true)
			or (remapping_player = 1)
			and (allow_player2_tongue = true)
			or (remapping_player = 2)
			and (allow_player3_tongue = true)
			or (remapping_player = 3)
			and (allow_player4_tongue = true)
			{
				if (menu == "remap_key_tongue")
				and (menu_remap_key_number = 0)
				{
					if(remapping_player_gamepad_button_tongue > noone)
					{
						scr_draw_gamepad_buttons(remapping_player_gamepad_button_tongue, key1_x, menu_y_remap_key_tongue + menu_y_offset, 1, c_white, 1);
					}
					else
					{
						scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_tongue + menu_y_offset, 1, c_gray, 1);
					}
				}
				else
				{
					if(remapping_player_gamepad_button_tongue > noone)
					{
						scr_draw_gamepad_buttons(remapping_player_gamepad_button_tongue, key1_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, c_white, 0.9);
					}
					else
					{
						scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, c_gray, 0.9);
					}
				}
			}
			#endregion /*Remap Key Tongue END*/
			
			#region /*Remap Key Zoom In*/
			if (menu == "remap_key_zoom_in")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_zoom_in > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_zoom_in, key1_x, menu_y_remap_key_zoom_in + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_zoom_in + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_zoom_in > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_zoom_in, key1_x, menu_y_remap_key_zoom_in + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_zoom_in + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Zoom In END*/
			
			#region /*Remap Key Zoom Out*/
			if (menu == "remap_key_zoom_out")
			and (menu_remap_key_number = 0)
			{
				if(remapping_player_gamepad_button_zoom_out > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_zoom_out, key1_x, menu_y_remap_key_zoom_out + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_zoom_out + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button_zoom_out > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button_zoom_out, key1_x, menu_y_remap_key_zoom_out + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key1_x, menu_y_remap_key_zoom_out + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key Zoom In END*/
			
			#region /*"OR" text*/
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_dive + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_jump + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_crouch + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_crouch_toggle + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_sprint + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_sprint_toggle + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_left + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_right + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_down + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_up + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			if (remapping_player = 0)
			and (allow_player1_tongue = true)
			or (remapping_player = 1)
			and (allow_player2_tongue = true)
			or (remapping_player = 2)
			and (allow_player3_tongue = true)
			or (remapping_player = 3)
			and (allow_player4_tongue = true)
			{
				scr_draw_text_outlined(or_text_x, menu_y_remap_key_tongue + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_zoom_in + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			scr_draw_text_outlined(or_text_x, menu_y_remap_key_zoom_out + menu_y_offset, l10n_text("Or"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			#endregion /*"OR" text END*/
			
			#region /*Remap Key 2 Dive*/
			if (menu == "remap_key_dive")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_dive > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_dive, key2_x, menu_y_remap_key_dive + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_dive + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_dive > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_dive, key2_x, menu_y_remap_key_dive + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_dive + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Dive END*/
			
			#region /*Remap Key 2 Jump*/
			if (menu == "remap_key_jump")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_jump > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_jump, key2_x, menu_y_remap_key_jump + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_jump + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_jump > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_jump, key2_x, menu_y_remap_key_jump + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_jump + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Jump END*/
			
			#region /*Remap Key 2 Crouch */
			if (menu == "remap_key_crouch")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_crouch > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_crouch, key2_x, menu_y_remap_key_crouch + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_crouch + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_crouch > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_crouch, key2_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_crouch + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch END*/
			
			#region /*Remap Key 2 Crouch Toggle*/
			if (menu == "remap_key_crouch_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_crouch_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_crouch_toggle, key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_crouch_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_crouch_toggle, key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_crouch_toggle + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Crouch Toggle END*/
			
			#region /*Remap Key 2 Sprint*/
			if (menu == "remap_key_sprint")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_sprint > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_sprint, key2_x, menu_y_remap_key_sprint + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_sprint + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_sprint > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_sprint, key2_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_sprint + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint END*/
			
			#region /*Remap Key 2 Sprint Toggle*/
			if (menu == "remap_key_sprint_toggle")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_sprint_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_sprint_toggle, key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_sprint_toggle > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_sprint_toggle, key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_sprint_toggle + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Sprint Toggle END*/
			
			#region /*Remap Key 2 Left*/
			if (menu == "remap_key_left")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_left > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_left, key2_x, menu_y_remap_key_left + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_left + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_left > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_left, key2_x, menu_y_remap_key_left + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_left + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Left END*/
			
			#region /*Remap Key 2 Right*/
			if (menu == "remap_key_right")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_right > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_right, key2_x, menu_y_remap_key_right + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_right + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_right > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_right, key2_x, menu_y_remap_key_right + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_right + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Right END*/
			
			#region /*Remap Key 2 Down*/
			if (menu == "remap_key_down")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_down > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_down, key2_x, menu_y_remap_key_down + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_down + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_down > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_down, key2_x, menu_y_remap_key_down + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_down + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Down END*/
			
			#region /*Remap Key 2 Up*/
			if (menu == "remap_key_up")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_up > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_up, key2_x, menu_y_remap_key_up + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_up + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_up > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_up, key2_x, menu_y_remap_key_up + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_up + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Up END*/
			
			#region /*Remap Key 2 Tongue*/
			if (remapping_player = 0)
			and (allow_player1_tongue = true)
			or (remapping_player = 1)
			and (allow_player2_tongue = true)
			or (remapping_player = 2)
			and (allow_player3_tongue = true)
			or (remapping_player = 3)
			and (allow_player4_tongue = true)
			{
				if (menu == "remap_key_tongue")
				and (menu_remap_key_number = 2)
				{
					if(remapping_player_gamepad_button2_tongue > noone)
					{
						scr_draw_gamepad_buttons(remapping_player_gamepad_button2_tongue, key2_x, menu_y_remap_key_tongue + menu_y_offset, 1, c_white, 1);
					}
					else
					{
						scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_tongue + menu_y_offset, 1, c_gray, 1);
					}
				}
				else
				{
					if(remapping_player_gamepad_button2_tongue > noone)
					{
						scr_draw_gamepad_buttons(remapping_player_gamepad_button2_tongue, key2_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, c_white, 0.9);
					}
					else
					{
						scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_tongue + menu_y_offset, 0.9, c_gray, 0.9);
					}
				}
			}
			#endregion /*Remap Key 2 Tongue END*/
			
			#region /*Remap Key 2 Zoom In*/
			if (menu == "remap_key_zoom_in")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_zoom_in > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_zoom_in, key2_x, menu_y_remap_key_zoom_in + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_zoom_in + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_zoom_in > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_zoom_in, key2_x, menu_y_remap_key_zoom_in + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_zoom_in + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Zoom In END*/
			
			#region /*Remap Key 2 Zoom Out*/
			if (menu == "remap_key_zoom_out")
			and (menu_remap_key_number = 2)
			{
				if(remapping_player_gamepad_button2_zoom_out > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_zoom_out, key2_x, menu_y_remap_key_zoom_out + menu_y_offset, 1, c_white, 1);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_zoom_out + menu_y_offset, 1, c_gray, 1);
				}
			}
			else
			{
				if(remapping_player_gamepad_button2_zoom_out > noone)
				{
					scr_draw_gamepad_buttons(remapping_player_gamepad_button2_zoom_out, key2_x, menu_y_remap_key_zoom_out + menu_y_offset, 0.9, c_white, 0.9);
				}
				else
				{
					scr_draw_gamepad_buttons(noone, key2_x, menu_y_remap_key_zoom_out + menu_y_offset, 0.9, c_gray, 0.9);
				}
			}
			#endregion /*Remap Key 2 Zoom Out END*/
			
			#endregion /*Show the keys for every player END*/
			
		}
		#endregion /*Show what key is used END*/
		
		#region /*All the keys you can remap*/
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		#region /*Mouse Navigation*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_dive + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_jump + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_jump + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_crouch + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_sprint + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_left + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_left + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_right + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_right + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_down + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_down + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 0;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_up + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_up";
			menu_remap_key_number = 0;
			can_navigate_settings_sidebar = false;
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_tongue + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (remapping_player = 0)
			and (allow_player1_tongue = true)
			or (remapping_player = 1)
			and (allow_player2_tongue = true)
			or (remapping_player = 2)
			and (allow_player3_tongue = true)
			or (remapping_player = 3)
			and (allow_player4_tongue = true)
			{
				menu = "remap_key_tongue";
				menu_remap_key_number = 0;
				can_navigate_settings_sidebar = false;
			}
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_zoom_in + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_zoom_in";
			menu_remap_key_number = 0;
			can_navigate_settings_sidebar = false;
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_zoom_out + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_zoom_out";
			menu_remap_key_number = 0;
			can_navigate_settings_sidebar = false;
		}
		
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_dive + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_dive + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_dive";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_jump + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_jump + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_jump";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_crouch + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_crouch";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_crouch_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_sprint + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_sprint";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_sprint_toggle";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_left + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_left + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_left";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_right + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_right + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_right";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_down + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_down + menu_y_offset + 32)) and (input_key == false) and (open_dropdown = false) and (global.controls_used_for_menu_navigation == "mouse")
		{menu = "remap_key_down";menu_remap_key_number = 2;can_navigate_settings_sidebar = false;}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_up + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_up";
			menu_remap_key_number = 2;
			can_navigate_settings_sidebar = false;
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_tongue + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			if (remapping_player = 0)
			and (allow_player1_tongue = true)
			or (remapping_player = 1)
			and (allow_player2_tongue = true)
			or (remapping_player = 2)
			and (allow_player3_tongue = true)
			or (remapping_player = 3)
			and (allow_player4_tongue = true)
			{
				menu = "remap_key_tongue";
				menu_remap_key_number = 2;
				can_navigate_settings_sidebar = false;
			}
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_zoom_in + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_zoom_in";
			menu_remap_key_number = 2;
			can_navigate_settings_sidebar = false;
		}
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_zoom_out + menu_y_offset + 32))
		and (input_key == false)
		and (open_dropdown = false)
		and (global.controls_used_for_menu_navigation == "mouse")
		{
			menu = "remap_key_zoom_out";
			menu_remap_key_number = 2;
			can_navigate_settings_sidebar = false;
		}
		
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_dive + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_jump + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_jump + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_crouch + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_sprint + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_left + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_left + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_right + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_right + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_down + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_down + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_up + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key1_x - 34, menu_y_remap_key_tongue + menu_y_offset - 32, key1_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
		
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_dive + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_dive + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_jump + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_jump + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_crouch + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_crouch + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_crouch_toggle + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_crouch_toggle + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_sprint + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_sprint + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_sprint_toggle + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_sprint_toggle + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_left + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_left + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_right + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_right + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_down + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_down + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_up + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_up + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_tongue + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_tongue + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_zoom_in + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_zoom_in + menu_y_offset + 32))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), key2_x - 34, menu_y_remap_key_zoom_out + menu_y_offset - 32, key2_x + 32, menu_y_remap_key_zoom_out + menu_y_offset + 32))
		{
			if (mouse_check_button_pressed(mb_left))
			and (global.controls_used_for_menu_navigation == "mouse")
			and (menu_delay == 0)
			and (input_key == false)
			and (open_dropdown = false)
			{
				can_navigate_settings_sidebar = false;
				menu_delay = 3;
				input_key = true;
			}
		}
		
		if (mouse_check_button_pressed(mb_left))
		and (global.controls_used_for_menu_navigation == "mouse")
		and (menu_delay == 0)
		and (input_key == true)
		{
			can_navigate_settings_sidebar = false;
			menu_delay = 3;
			input_key = false;
		}
		#endregion /*Mouse Navigation END*/
		
		#region /*Remap Key Dive*/
		if (menu == "remap_key_dive")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_dive + menu_y_offset, 1, 1, 0, c_white, 1);
			menu_cursor_y_position = menu_y_remap_key_dive;
			scr_draw_text_outlined(410, menu_y_remap_key_dive + menu_y_offset, l10n_text("Dive"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
			if (input_key = true)
			and (can_remap_key = false)
			{
				menu_delay = 3;
				scr_gamepadremapping();
			}
			else
			if (key_a_pressed)
			and (menu_delay == 0)
			{
				menu_delay = 3;
				input_key = true;
			}
		}
		else
		{
			scr_draw_text_outlined(410, menu_y_remap_key_dive + menu_y_offset, l10n_text("Dive"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
		}
		#endregion /*Remap Key Dive END*/
		
		#region /*Remap Key Jump*/
		if (menu == "remap_key_jump"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_jump + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_jump ;
		scr_draw_text_outlined(410, menu_y_remap_key_jump + menu_y_offset, l10n_text("Jump"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_jump + menu_y_offset, l10n_text("Jump"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Jump END*/
		
		#region /*Remap Key Crouch */
		if (menu == "remap_key_crouch"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_crouch;
		scr_draw_text_outlined(410, menu_y_remap_key_crouch + menu_y_offset, l10n_text("Crouch"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_crouch + menu_y_offset, l10n_text("Crouch"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch END*/
		
		#region /*Remap Key Crouch Toggle*/
		if (menu == "remap_key_crouch_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_crouch_toggle + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_crouch_toggle;
		scr_draw_text_outlined(410, menu_y_remap_key_crouch_toggle + menu_y_offset, l10n_text("Crouch Toggle"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_crouch_toggle + menu_y_offset, l10n_text("Crouch Toggle"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Crouch Toggle END*/
		
		#region /*Remap Key Sprint*/
		if (menu == "remap_key_sprint"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_sprint;
		scr_draw_text_outlined(410, menu_y_remap_key_sprint + menu_y_offset, l10n_text("Sprint"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_sprint + menu_y_offset, l10n_text("Sprint"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint END*/
		
		#region /*Remap Key Sprint Toggle*/
		if (menu == "remap_key_sprint_toggle"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_sprint_toggle + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_sprint_toggle;
		scr_draw_text_outlined(410, menu_y_remap_key_sprint_toggle + menu_y_offset, l10n_text("Sprint Toggle"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_sprint_toggle + menu_y_offset, l10n_text("Sprint Toggle"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Sprint Toggle END*/
		
		#region /*Remap Key Left*/
		if (menu == "remap_key_left"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_left + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_left;
		scr_draw_text_outlined(410, menu_y_remap_key_left + menu_y_offset, l10n_text("Left"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_left + menu_y_offset, l10n_text("Left"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Left END*/
		
		#region /*Remap Key Right*/
		if (menu == "remap_key_right"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_right + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_right;
		scr_draw_text_outlined(410, menu_y_remap_key_right + menu_y_offset, l10n_text("Right"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_right + menu_y_offset, l10n_text("Right"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Right END*/
		
		#region /*Remap Key Down*/
		if (menu == "remap_key_down"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_down + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_down;
		scr_draw_text_outlined(410, menu_y_remap_key_down + menu_y_offset, l10n_text("Down"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_down + menu_y_offset, l10n_text("Down"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Down END*/
		
		#region /*Remap Key Up*/
		if (menu == "remap_key_up"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_up + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_up;
		scr_draw_text_outlined(410, menu_y_remap_key_up + menu_y_offset, l10n_text("Up"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_up + menu_y_offset, l10n_text("Up"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Up END*/
		
		#region /*Remap Key Tongue*/
		if (remapping_player = 0)
		and (allow_player1_tongue = true)
		or (remapping_player = 1)
		and (allow_player2_tongue = true)
		or (remapping_player = 2)
		and (allow_player3_tongue = true)
		or (remapping_player = 3)
		and (allow_player4_tongue = true)
		{
			if (menu == "remap_key_tongue")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_tongue + menu_y_offset, 1, 1, 0, c_white, 1);
				menu_cursor_y_position = menu_y_remap_key_tongue;
				scr_draw_text_outlined(410, menu_y_remap_key_tongue + menu_y_offset, l10n_text("Tongue"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
				if (input_key = true)
				and (can_remap_key = false)
				{
					menu_delay = 3;
					scr_gamepadremapping();
				}
				else
				if (key_a_pressed)
				and (menu_delay == 0)
				{
					menu_delay = 3;
					input_key = true;
				}
			}
			else
			{
				scr_draw_text_outlined(410, menu_y_remap_key_tongue + menu_y_offset, l10n_text("Tongue"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
		}
		#endregion /*Remap Key Up END*/
		
		#region /*Remap Key Zoom In*/
		if (menu == "remap_key_zoom_in"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_zoom_in + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_zoom_in;
		scr_draw_text_outlined(410, menu_y_remap_key_zoom_in + menu_y_offset, l10n_text("Zoom In"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_zoom_in + menu_y_offset, l10n_text("Zoom In"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Zoom In END*/
		
		#region /*Remap Key Zoom Out*/
		if (menu == "remap_key_zoom_out"){draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, menu_y_remap_key_zoom_out + menu_y_offset, 1, 1, 0, c_white, 1);menu_cursor_y_position = menu_y_remap_key_zoom_out;
		scr_draw_text_outlined(410, menu_y_remap_key_zoom_out + menu_y_offset, l10n_text("Zoom Out"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		if (input_key = true) and (can_remap_key = false){menu_delay = 3;scr_gamepadremapping();}else
		if (key_a_pressed) and (menu_delay == 0){menu_delay = 3; input_key = true;}}else{scr_draw_text_outlined(410, menu_y_remap_key_zoom_out + menu_y_offset, l10n_text("Zoom Out"), global.default_text_size, c_menu_outline, c_menu_fill, 1);}
		#endregion /*Remap Key Zoom Out END*/
		
		#endregion /*All the keys you can remap END*/
		
		scr_options_reset_controls_to_default_settings();
		
		#region /*Keyboards Controls Remapping Navigation*/
		
		if (menu_joystick_delay <= 0)
		{
			
			#region /*Remap key dive*/
			if (menu == "remap_key_dive")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_select_player";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key dive END*/
			
			else
			
			#region /*Remap key jump*/
			if (menu == "remap_key_jump")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_dive";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key jump END*/
			
			else
			
			#region /*Remap key crouch */
			if (menu == "remap_key_crouch")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_jump";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key crouch END*/
			
			else
			
			#region /*Remap key crouch toggle*/
			if (menu == "remap_key_crouch_toggle")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key crouch toggle END*/
			
			else
			
			#region /*Remap key sprint*/
			if (menu == "remap_key_sprint")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_crouch_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key sprint END*/
			
			else
			
			#region /*Remap key sprint toggle*/
			if (menu == "remap_key_sprint_toggle")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key sprint toggle END*/
			
			else
			
			#region /*Remap key left*/
			if (menu == "remap_key_left")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_sprint_toggle";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key left END*/
			
			else
			
			#region /*Remap key right*/
			if (menu == "remap_key_right")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_left";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key right END*/
			
			else
			
			#region /*Remap key down*/
			if (menu == "remap_key_down")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_right";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
			}
			#endregion /*Remap key down END*/
			
			else
			
			#region /*Remap key up*/
			if (menu == "remap_key_up")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_down";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					if (remapping_player = 0)
					and (allow_player1_tongue = true)
					or (remapping_player = 1)
					and (allow_player2_tongue = true)
					or (remapping_player = 2)
					and (allow_player3_tongue = true)
					or (remapping_player = 3)
					and (allow_player4_tongue = true)
					{
						menu = "remap_key_tongue";
					}
					else
					{
						menu = "remap_key_zoom_in";
					}
					menu_delay = 3;
				}
			}
			#endregion /*Remap key up END*/
			
			else
			
			#region /*Remap Key Tongue*/
			if (menu == "remap_key_tongue")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_up";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_zoom_in";
					menu_delay = 3;
				}
			}
			#endregion /*Remap Key Tongue END*/
			
			else
			
			#region /*Remap Key Zoom In*/
			if (menu == "remap_key_zoom_in")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					if (remapping_player = 0)
					and (allow_player1_tongue = true)
					or (remapping_player = 1)
					and (allow_player2_tongue = true)
					or (remapping_player = 2)
					and (allow_player3_tongue = true)
					or (remapping_player = 3)
					and (allow_player4_tongue = true)
					{
						menu = "remap_key_tongue";
					}
					else
					{
						menu = "remap_key_up";
					}
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_key_zoom_out";
					menu_delay = 3;
				}
			}
			#endregion /*Remap Key Zoom In END*/
			
			#region /*Remap Key Zoom Out*/
			if (menu == "remap_key_zoom_out")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_zoom_in";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "remap_reset";
					menu_delay = 3;
				}
			}
			#endregion /*Remap Key Zoom Out END*/
			
			else
			
			#region /*Remap reset*/
			if (menu == "remap_reset")
			and (can_remap_key = false)
			and (input_key == false)
			and (menu_delay == 0)
			and (menu_joystick_delay == 0)
			{
				if (key_up)
				{
					menu = "remap_key_zoom_out";
					menu_delay = 3;
				}
				else
				if (key_down)
				{
					menu = "up_key_is_jump_key";
					menu_delay = 3;
				}
			}
			#endregion /*Remap reset END*/
			
			#region /*Menu remap key number*/
			if (menu == "remap_key_dive")
			or (menu == "remap_key_jump")
			or (menu == "remap_key_crouch")
			or (menu == "remap_key_crouch_toggle")
			or (menu == "remap_key_sprint")
			or (menu == "remap_key_sprint_toggle")
			or (menu == "remap_key_left")
			or (menu == "remap_key_right")
			or (menu == "remap_key_down")
			or (menu == "remap_key_up")
			or (menu == "remap_key_tongue")
			or (menu == "remap_key_zoom_in")
			or (menu == "remap_key_zoom_out")
			{
				if (key_left)
				and (can_remap_key = false)
				and (input_key == false)
				and (menu_delay == 0)
				and (menu_joystick_delay == 0)
				or (key_right)
				and (can_remap_key = false)
				and (input_key == false)
				and (menu_delay == 0)
				and (menu_joystick_delay == 0)
				{
					if (menu_remap_key_number = 0)
					{
						menu_remap_key_number = 2;
						menu_delay = 3;
					}
					else
					if (menu_remap_key_number = 2)
					{
						menu_remap_key_number = 0;
						menu_delay = 3;
					}
				}
			}
			#endregion /*Menu remap key number*/
			
		}
		
		#endregion /*Keyboards Controls Remapping Navigation END*/
		
		#endregion /*Remap Gamepad and Mouse END*/
		
		#region /*Controls checkmarks and dropdown menu settings*/
		if (remapping_player = 0)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, l10n_text("Up key is jump key"), "up_key_is_jump_key", global.player1_up_key_is_jump_key);
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, l10n_text("Double-tap direction to run"), "double_tap_to_run", global.player1_double_tap_to_run);
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, l10n_text("Always run"), "always_run", global.player1_sprint_toggle);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, l10n_text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, l10n_text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, l10n_text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to gamepad"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_gamepad);
			if (global.enable_chosen_controller_used = true)
			{
				draw_menu_dropdown(390, menu_y_chosen_controller_used + menu_y_offset, l10n_text("Chosen Controller Used"), "chosen_controller_used", global.chosen_controller_used, l10n_text("Xbox One"), l10n_text("Xbox Series X/S"), l10n_text("Nintendo Switch"), l10n_text("Playstation 4"), l10n_text("Playstation 5"));
			}
			if (os_type != os_ios)
			and (os_type != os_android)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, l10n_text("Show Controls"), "show_controls", global.player1_show_controls, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			}
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, l10n_text("Drop down from rope"), "drop_from_rope", global.player1_drop_from_rope, l10n_text("Release Jump"), l10n_text("Down or Jump"), l10n_text("Only Down"), l10n_text("Only Jump"), l10n_text("Down + Jump"));
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, l10n_text("Wall Jump"), "wall_jump_setting", global.player1_wall_jump_setting, l10n_text("Off"), l10n_text("When touching wall"), l10n_text("When holding towards the wall"));
		}
		else
		if (remapping_player = 1)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, l10n_text("Up key is jump key"), "up_key_is_jump_key", global.player2_up_key_is_jump_key);
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, l10n_text("Double-tap direction to run"), "double_tap_to_run", global.player2_double_tap_to_run);
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, l10n_text("Always run"), "always_run", global.player2_sprint_toggle);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, l10n_text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, l10n_text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, l10n_text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to gamepad"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_gamepad);
			if (global.enable_chosen_controller_used = true)
			{
				draw_menu_dropdown(390, menu_y_chosen_controller_used + menu_y_offset, l10n_text("Chosen Controller Used"), "chosen_controller_used", global.chosen_controller_used, l10n_text("Xbox One"), l10n_text("Xbox Series X/S"), l10n_text("Nintendo Switch"), l10n_text("Playstation 4"), l10n_text("Playstation 5"));
			}
			if (os_type != os_ios)
			and (os_type != os_android)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, l10n_text("Show Controls"), "show_controls", global.player2_show_controls, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			}
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, l10n_text("Drop down from rope"), "drop_from_rope", global.player2_drop_from_rope, l10n_text("Release Jump"), l10n_text("Down or Jump"), l10n_text("Only Down"), l10n_text("Only Jump"), l10n_text("Down + Jump"));
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, l10n_text("Wall Jump"), "wall_jump_setting", global.player2_wall_jump_setting, l10n_text("Off"), l10n_text("When touching wall"), l10n_text("When holding towards the wall"));
		}
		else
		if (remapping_player = 2)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, l10n_text("Up key is jump key"), "up_key_is_jump_key", global.player3_up_key_is_jump_key);
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, l10n_text("Double-tap direction to run"), "double_tap_to_run", global.player3_double_tap_to_run);
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, l10n_text("Always run"), "always_run", global.player3_sprint_toggle);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, l10n_text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player3_cancel_dive_by_pressing_jump_or_dive_button);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, l10n_text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player3_cancel_dive_by_pressing_opposite_direction);
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, l10n_text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player3_down_and_jump_to_groundpound);
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to gamepad"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_gamepad);
			if (global.enable_chosen_controller_used = true)
			{
				draw_menu_dropdown(390, menu_y_chosen_controller_used + menu_y_offset, l10n_text("Chosen Controller Used"), "chosen_controller_used", global.chosen_controller_used, l10n_text("Xbox One"), l10n_text("Xbox Series X/S"), l10n_text("Nintendo Switch"), l10n_text("Playstation 4"), l10n_text("Playstation 5"));
			}
			if (os_type != os_ios)
			and (os_type != os_android)
			{
				draw_menu_dropdown(390, menu_y_show_controls+ menu_y_offset, l10n_text("Show Controls"), "show_controls", global.player3_show_controls, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			}
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, l10n_text("Drop down from rope"), "drop_from_rope", global.player3_drop_from_rope, l10n_text("Release Jump"), l10n_text("Down or Jump"), l10n_text("Only Down"), l10n_text("Only Jump"), l10n_text("Down + Jump"));
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, l10n_text("Wall Jump"), "wall_jump_setting", global.player3_wall_jump_setting, l10n_text("Off"), l10n_text("When touching wall"), l10n_text("When holding towards the wall"));
		}
		else
		if (remapping_player = 3)
		{
			draw_menu_checkmark(390, menu_y_up_key_is_jump_key + menu_y_offset, l10n_text("Up key is jump key"), "up_key_is_jump_key", global.player4_up_key_is_jump_key);
			draw_menu_checkmark(390, menu_y_double_tap_direction_to_run + menu_y_offset, l10n_text("Double-tap direction to run"), "double_tap_to_run", global.player4_double_tap_to_run);
			draw_menu_checkmark(390, menu_y_always_run + menu_y_offset, l10n_text("Always run"), "always_run", global.player4_sprint_toggle);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_jump_or_dive_button + menu_y_offset, l10n_text("Cancel dive by pressing the jump or dive key"), "cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
			draw_menu_checkmark(390, menu_y_cancel_dive_by_pressing_opposite_direction + menu_y_offset, l10n_text("Cancel dive by pressing the opposite direction"), "cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
			draw_menu_checkmark(390, menu_y_down_and_jump_to_groundpound + menu_y_offset, l10n_text("Down + Jump to Ground Pound"), "down_and_jump_to_groundpound", global.player4_down_and_jump_to_groundpound);
			draw_menu_checkmark(390, menu_y_show_prompt_when_changing_controller + menu_y_offset, l10n_text("Show prompt when changing to gamepad"), "show_prompt_when_changing_controller", global.show_prompt_when_changing_to_gamepad);
			if (global.enable_chosen_controller_used = true)
			{
				draw_menu_dropdown(390, menu_y_chosen_controller_used + menu_y_offset, l10n_text("Chosen Controller Used"), "chosen_controller_used", global.chosen_controller_used, l10n_text("Xbox One"), l10n_text("Xbox Series X/S"), l10n_text("Nintendo Switch"), l10n_text("Playstation 4"), l10n_text("Playstation 5"));
			}
			if (os_type != os_ios)
			and (os_type != os_android)
			{
				draw_menu_dropdown(390, menu_y_show_controls + menu_y_offset, l10n_text("Show Controls"), "show_controls", global.player4_show_controls, l10n_text("Never Show"), l10n_text("After 1 Second"), l10n_text("After 2 Seconds"), l10n_text("After 3 Seconds"), l10n_text("After 4 Seconds"), l10n_text("After 5 Seconds"), l10n_text("After 6 Seconds"), l10n_text("After 7 Seconds"), l10n_text("After 8 Seconds"), l10n_text("After 9 Seconds"), l10n_text("Always Show"));
			}
			draw_menu_dropdown(390, menu_y_drop_down_from_rope + menu_y_offset, l10n_text("Drop down from rope"), "drop_from_rope", global.player4_drop_from_rope, l10n_text("Release Jump"), l10n_text("Down or Jump"), l10n_text("Only Down"), l10n_text("Only Jump"), l10n_text("Down + Jump"));
			draw_menu_dropdown(390, menu_y_wall_jump_setting+ menu_y_offset, l10n_text("Wall Jump"), "wall_jump_setting", global.player4_wall_jump_setting, l10n_text("Off"), l10n_text("When touching wall"), l10n_text("When holding towards the wall"));
		}
		#endregion /*Controls checkmarks and dropdown menu settings END*/
		
		#region /*Menu cursor y position*/
		if (menu == "chosen_controller_used")
		{
			menu_cursor_y_position = menu_y_chosen_controller_used + 100;
		}
		if (menu == "show_controls")
		{
			menu_cursor_y_position = menu_y_show_controls + 100;
		}
		if (menu == "drop_from_rope")
		{
			menu_cursor_y_position = menu_y_drop_down_from_rope;
		}
		if (menu == "wall_jump_setting")
		{
			menu_cursor_y_position = menu_y_wall_jump_setting;
		}
		#endregion /*Menu cursor y position END*/
		
		draw_menu_dropdown(390, 50 + menu_y_offset, l10n_text("Remap This Player"), "remap_select_player", remapping_player, l10n_text("Player 1"), l10n_text("Player 2"), l10n_text("Player 3"), l10n_text("Player 4")); /*Remap Select Player - Which player do you want to remap the controls for?*/
		
		#region /*Show the player when they can input a gamepad button to remap controls*/
		if (input_key = true)
		{
			draw_set_alpha(0.75);
			draw_rectangle_color(window_get_width() / 2 - 252, 32 - 20, window_get_width() / 2 + 252, 64 + 20, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			
			if (remapping_player = 0) /*Text saying input gamepad button now for player 1*/
			{
				scr_draw_text_outlined(window_get_width() / 2, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 1"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player = 1) /*Text saying input gamepad button now for player 2*/
			{
				scr_draw_text_outlined(window_get_width() / 2, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 2"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player = 2) /*Text saying input gamepad button now for player 3*/
			{
				scr_draw_text_outlined(window_get_width() / 2, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 3"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			else
			
			if (remapping_player = 3) /*Text saying input gamepad button now for player 4 */
			{
				scr_draw_text_outlined(window_get_width() / 2, 32, l10n_text("INPUT BUTTON NOW FOR PLAYER 4"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			}
			
			scr_draw_text_outlined(window_get_width() / 2 - 10, 64, l10n_text("Buttons can be disabled using"), global.default_text_size, c_menu_outline, c_menu_fill, 1);
			if (global.controls_used_for_menu_navigation == "controller")
			{
				scr_draw_gamepad_buttons(gp_start, window_get_width() / 2 + 220, 64, 0.50, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, vk_escape, window_get_width() / 2 + 220, 64, 0.50, 0.50, 0, c_white, 1);
			}
		}
		#endregion /*Show the player when they can input a gamepad button to remap controls END*/
		
	}
	#endregion /*Controller Gamepad END*/
	
}