/// @function scr_debug_init_cheat_codes()
/* Initializes all cheat codes. Call this in your debug manager's Create event */
function scr_debug_init_cheat_codes()
{
	global.cheat_codes = [
		{
			code: ["UP", "SHOULDERL", "DOWN", "SHOULDERL", "LEFT", "SHOULDERL", "RIGHT", "SHOULDERL", "A+START"],
			progress: 0,
			hold_required: "",
			action: function()
			{
				global.debug_screen = !global.debug_screen;
				show_debug_message("Debug mode toggled: " + string(global.debug_screen));
			}
		}
	];
}

/// @function scr_debug_check_cheat_input(input_str)
/* Processes a single input string for all defined cheat codes */
function scr_debug_check_cheat_input(input_str)
{
	for (var i = 0; i < array_length(global.cheat_codes); i++)
	{
		var cheat = global.cheat_codes[i];
		
		/* If this cheat code requires a hold key and it is not currently held, reset its progress */
		if (cheat.hold_required != ""
		&& !gamepad_button_check(global.player_slot[1], cheat.hold_required))
		{
			cheat.progress = 0;
			continue; /* Skip processing this cheat code for this input */
		}
		
		if (input_str == cheat.code[cheat.progress])
		{
			cheat.progress++; /* Advance progress if input is correct */
			
			/* If the entire code has been entered: */
			if (cheat.progress == array_length(cheat.code))
			{
				cheat.action();
				cheat.progress = 0; /* Reset progress after activation */
			}
		}
		else
		{
			cheat.progress = 0; /* Reset progress if input doesn't match */
		}
	}
	
	/* Debug: Print out cheat code progress for all cheat codes */
	scr_debug_print_cheat_progress();
}

/// @function scr_debug_print_cheat_progress()
/* Prints the current progress for each cheat code to the debug console */
function scr_debug_print_cheat_progress()
{
	for (var i = 0; i < array_length(global.cheat_codes); i++)
	{
		var cheat = global.cheat_codes[i];
		var progress = cheat.progress;
		var total = array_length(cheat.code);
		show_debug_message("Cheat code " + string(i) + ": Progress " + string(progress) + " / " + string(total));
		if (progress < total)
		{
			show_debug_message("  Next expected: " + cheat.code[progress]);
		}
		else
		{
			show_debug_message("  Cheat complete!");
		}
	}
}

/// @function scr_debug_process_cheat_inputs()
/* Call this in your debug manager's Step event to process inputs */
function scr_debug_process_cheat_inputs()
{
	/* D-Pad */
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
	{
		scr_debug_check_cheat_input("UP");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
	{
		scr_debug_check_cheat_input("DOWN");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padl))
	{
		scr_debug_check_cheat_input("LEFT");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padr))
	{
		scr_debug_check_cheat_input("RIGHT");
	}
	
	/* Face Buttons */
	if (gamepad_button_check_released(global.player_slot[1], gp_face1)) /* Needs to be check on released, to make "A + Start" work */
	{
		scr_debug_check_cheat_input("A");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
	{
		scr_debug_check_cheat_input("B");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face3))
	{
		scr_debug_check_cheat_input("X");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
	{
		scr_debug_check_cheat_input("Y");
	}
	
	/* Shoulder Buttons */
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderl))
	{
		scr_debug_check_cheat_input("SHOULDERL");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderlb))
	{
		scr_debug_check_cheat_input("SHOULDERLB");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderr))
	{
		scr_debug_check_cheat_input("SHOULDERR");
	}
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderrb))
	{
		scr_debug_check_cheat_input("SHOULDERRB");
	}
	
	/* A + Start Button */
	/* Process combination input for the final element: A+Start */
	/* We check this explicitly by testing if both buttons are pressed */
	if (gamepad_button_check(global.player_slot[1], gp_face1) 
	&& gamepad_button_check_pressed(global.player_slot[1], gp_start))
	{
		/* Here, we send the canonical string for the combination */
		scr_debug_check_cheat_input("A+START");
	}
}