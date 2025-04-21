/// @function scr_debug_init_cheat_codes()
/// @description Initializes all cheat codes. Call this in your debug manager's Create event
function scr_debug_init_cheat_codes()
{
	/* I'm including classic cheat codes from video game history */
	/* Some consoles like the Sega Genesis have a C button, which modern controllers don't have */
	/* So I'm mapping the C button from a Sega Genesis controller to the X button on a Xbox controller */
	
	global.cheat_codes = [
		{
			code: ["UP", "X", "DOWN", "X", "LEFT", "X", "RIGHT", "X", "A+START"],
			progress: 0,
			hold_required: "",
			action: function()
			{
				global.debug_screen = !global.debug_screen;
				show_debug_message("[scr_debug_init_cheat_codes] Debug mode toggled: " + string(global.debug_screen));
			}
		}
		,
		{
			code: ["UP", "LEFT", "DOWN", "RIGHT", "DOWN", "UP", "UP", "DOWN", "RIGHT", "RIGHT", "B"],
			progress: 0,
			hold_required: "",
			action: function()
			{
				scr_unlock_placable_level_objects(true);
				show_debug_message("[scr_debug_init_cheat_codes] Unlocked all objects in level editor");
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
		
		if (input_str == string_upper(cheat.code[cheat.progress]))
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
	if (global.debug_screen)
	{
		for (var i = 0; i < array_length(global.cheat_codes); i++)
		{
			var cheat = global.cheat_codes[i];
			var progress = cheat.progress;
			var total = array_length(cheat.code);
			show_debug_message("[scr_debug_print_cheat_progress] Cheat code " + string(i) + ": Progress " + string(progress) + " / " + string(total));
			
			if (progress < total)
			{
				show_debug_message("[scr_debug_print_cheat_progress]  Next expected: " + cheat.code[progress]);
			}
			else
			{
				show_debug_message("[scr_debug_print_cheat_progress]  Cheat complete!");
			}
		}
	}
}

/// @function scr_debug_process_cheat_inputs()
/* Call this in your debug manager's Step event to process inputs */
function scr_debug_process_cheat_inputs()
{
	/* D-Pad */
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
	|| (keyboard_check_pressed(vk_up))
	{
		scr_debug_check_cheat_input("UP");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
	|| (keyboard_check_pressed(vk_down))
	{
		scr_debug_check_cheat_input("DOWN");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padl))
	|| (keyboard_check_pressed(vk_left))
	{
		scr_debug_check_cheat_input("LEFT");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_padr))
	|| (keyboard_check_pressed(vk_right))
	{
		scr_debug_check_cheat_input("RIGHT");
	}
	else
	
	/* Face Buttons */
	if (gamepad_button_check_released(global.player_slot[1], gp_face1)) /* Needs to be check on released, to make "A + Start" work */
	|| (keyboard_check_released(ord("A")))
	{
		scr_debug_check_cheat_input("A");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
	|| (keyboard_check_pressed(ord("B")))
	{
		scr_debug_check_cheat_input("B");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face3))
	|| (keyboard_check_pressed(ord("X")))
	{
		scr_debug_check_cheat_input("X");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
	|| (keyboard_check_pressed(ord("Y")))
	{
		scr_debug_check_cheat_input("Y");
	}
	else
	
	/* Shoulder Buttons */
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderl))
	|| (keyboard_check_pressed(ord("L")))
	{
		scr_debug_check_cheat_input("SHOULDERL");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderlb))
	{
		scr_debug_check_cheat_input("SHOULDERLB");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderr))
	|| (keyboard_check_pressed(ord("R")))
	{
		scr_debug_check_cheat_input("SHOULDERR");
	}
	else
	if (gamepad_button_check_pressed(global.player_slot[1], gp_shoulderrb))
	{
		scr_debug_check_cheat_input("SHOULDERRB");
	}
	
	/* A + Start Button */
	/* Process combination input for the final element: A+Start */
	/* We check this explicitly by testing if both buttons are pressed */
	if (gamepad_button_check(global.player_slot[1], gp_face1) 
	&& gamepad_button_check_pressed(global.player_slot[1], gp_start))
	|| (keyboard_check(ord("A")))
	|| (keyboard_check_pressed(vk_enter))
	{
		/* Here, we send the canonical string for the combination */
		scr_debug_check_cheat_input("A+START");
	}
}