/// @function scr_debug_init_cheat_codes()
/// @description Initializes the hidden debug cheat code state.
function scr_debug_init_cheat_codes()
{
	global.cheat_codes = [
		{
			name: "debug_menu_unlock",
			code: ["UP", "RIGHT", "DOWN", "LEFT", "UP", "RIGHT", "DOWN", "LEFT"],
			requires_hold: true,
			on_match: function()
			{
				scr_debug_unlock_debug_menu();
			}
		}
	];

	global.cheat_input_buffer = [];
	global.cheat_input_buffer_max = 16;
	global.cheat_stick_press_threshold = 0.7;
	global.cheat_stick_release_threshold = 0.35;
	global.cheat_axis_state =
	{
		left_active: false,
		right_active: false,
		up_active: false,
		down_active: false
	};
}

/// @function scr_debug_check_cheat_input(input_str)
/// @description Processes a single canonical cheat input token.
function scr_debug_check_cheat_input(input_str)
{
	if (input_str == "")
	{
		return;
	}

	scr_debug_push_cheat_input(string_upper(input_str));

	var gate_active = scr_debug_cheat_gate_active();

	for (var i = 0; i < array_length(global.cheat_codes); i++)
	{
		var cheat = global.cheat_codes[i];

		if (cheat.requires_hold && !gate_active)
		{
			continue;
		}

		if (scr_debug_buffer_ends_with(global.cheat_input_buffer, cheat.code))
		{
			cheat.on_match();
			scr_debug_reset_cheat_input_buffer();
			break;
		}
	}

	scr_debug_print_cheat_progress();
}

/// @function scr_debug_print_cheat_progress()
/// @description Prints the current cheat buffer when the debug overlay is visible.
function scr_debug_print_cheat_progress()
{
	if (!global.debug_screen)
	{
		return;
	}

	var buffer_length = array_length(global.cheat_input_buffer);
	if (buffer_length <= 0)
	{
		return;
	}

	var cheat_progress_text = "";
	for (var i = 0; i < buffer_length; i++)
	{
		if (i > 0)
		{
			cheat_progress_text += ", ";
		}

		cheat_progress_text += string(global.cheat_input_buffer[i]);
	}

	show_debug_message("[scr_debug_print_cheat_progress] Cheat buffer: " + cheat_progress_text);
}

/// @function scr_debug_process_cheat_inputs()
/// @description Polls the hidden debug cheat inputs once per step.
function scr_debug_process_cheat_inputs()
{
	if (!scr_debug_should_listen_for_cheats())
	{
		scr_debug_reset_cheat_input_buffer();
		scr_debug_reset_cheat_axis_state();
		return;
	}

	if (!scr_debug_cheat_gate_active())
	{
		scr_debug_reset_cheat_input_buffer();
		scr_debug_reset_cheat_axis_state();
		return;
	}

	var input_str = scr_debug_get_next_cheat_direction();
	if (input_str != "")
	{
		scr_debug_check_cheat_input(input_str);
	}
}

/// @function scr_debug_cheat_gate_active()
/// @description Returns true when the hidden cheat gate buttons are held.
function scr_debug_cheat_gate_active()
{
	var slot = global.player_slot[1];
	var gamepad_gate_active = false;

	if ((is_real(slot))
	&& (slot >= 0)
	&& gamepad_is_connected(slot))
	{
		gamepad_gate_active = gamepad_button_check(slot, gp_shoulderl)
			&& gamepad_button_check(slot, gp_shoulderr);
	}

	var keyboard_gate_active = keyboard_check(ord("L"))
		&& keyboard_check(ord("R"));

	return gamepad_gate_active || keyboard_gate_active;
}

/// @function scr_debug_should_capture_navigation_input()
/// @description Returns true when menu navigation should be suppressed for cheat entry.
function scr_debug_should_capture_navigation_input()
{
	return scr_debug_should_listen_for_cheats()
		&& scr_debug_cheat_gate_active();
}

/// @function scr_debug_get_cheat_context_target()
/// @description Returns the active title/pause menu instance used for cheat entry.
function scr_debug_get_cheat_context_target()
{
	if (instance_exists(obj_pause))
	{
		return instance_find(obj_pause, 0);
	}

	if (instance_exists(obj_title))
	{
		return instance_find(obj_title, 0);
	}

	return noone;
}

/// @function scr_debug_should_listen_for_cheats()
/// @description Restricts cheat entry to title and pause flows, excluding text/rebind input.
function scr_debug_should_listen_for_cheats()
{
	var target = scr_debug_get_cheat_context_target();
	if (target == noone)
	{
		return false;
	}

	if (variable_instance_exists(target, "input_key")
	&& target.input_key)
	{
		return false;
	}

	if (variable_instance_exists(target, "input_gamepad_button")
	&& target.input_gamepad_button)
	{
		return false;
	}

	return true;
}

/// @function scr_debug_reset_cheat_input_buffer()
/// @description Clears the directional cheat input buffer.
function scr_debug_reset_cheat_input_buffer()
{
	global.cheat_input_buffer = [];
}

/// @function scr_debug_reset_cheat_axis_state()
/// @description Resets analog stick edge tracking used for cheat entry.
function scr_debug_reset_cheat_axis_state()
{
	global.cheat_axis_state.left_active = false;
	global.cheat_axis_state.right_active = false;
	global.cheat_axis_state.up_active = false;
	global.cheat_axis_state.down_active = false;
}

/// @function scr_debug_push_cheat_input(input_str)
/// @description Appends a token to the cheat buffer and trims old entries.
function scr_debug_push_cheat_input(input_str)
{
	var buffer_length = array_length(global.cheat_input_buffer);
	global.cheat_input_buffer[buffer_length] = input_str;

	var overflow = array_length(global.cheat_input_buffer) - global.cheat_input_buffer_max;
	if (overflow > 0)
	{
		array_delete(global.cheat_input_buffer, 0, overflow);
	}
}

/// @function scr_debug_buffer_ends_with(buffer, code)
/// @description Returns true when the cheat buffer ends with the target code.
function scr_debug_buffer_ends_with(buffer, code)
{
	var buffer_length = array_length(buffer);
	var code_length = array_length(code);

	if (buffer_length < code_length)
	{
		return false;
	}

	var start_index = buffer_length - code_length;
	for (var i = 0; i < code_length; i++)
	{
		if (buffer[start_index + i] != string_upper(code[i]))
		{
			return false;
		}
	}

	return true;
}

/// @function scr_debug_get_next_cheat_direction()
/// @description Returns a single canonical direction token from D-pad, keyboard, or left stick.
function scr_debug_get_next_cheat_direction()
{
	var slot = global.player_slot[1];

	if ((is_real(slot))
	&& (slot >= 0)
	&& gamepad_is_connected(slot))
	{
		if (gamepad_button_check_pressed(slot, gp_padu))
		{
			return "UP";
		}

		if (gamepad_button_check_pressed(slot, gp_padr))
		{
			return "RIGHT";
		}

		if (gamepad_button_check_pressed(slot, gp_padd))
		{
			return "DOWN";
		}

		if (gamepad_button_check_pressed(slot, gp_padl))
		{
			return "LEFT";
		}
	}

	if (keyboard_check_pressed(vk_up))
	{
		return "UP";
	}

	if (keyboard_check_pressed(vk_right))
	{
		return "RIGHT";
	}

	if (keyboard_check_pressed(vk_down))
	{
		return "DOWN";
	}

	if (keyboard_check_pressed(vk_left))
	{
		return "LEFT";
	}

	if ((is_real(slot))
	&& (slot >= 0)
	&& gamepad_is_connected(slot))
	{
		var left_stick_x = gamepad_axis_value(slot, gp_axislh);
		var left_stick_y = gamepad_axis_value(slot, gp_axislv);

		var direction_input = scr_debug_poll_cheat_axis_direction(left_stick_y, "up_active", false, "UP");
		if (direction_input != "")
		{
			return direction_input;
		}

		direction_input = scr_debug_poll_cheat_axis_direction(left_stick_x, "right_active", true, "RIGHT");
		if (direction_input != "")
		{
			return direction_input;
		}

		direction_input = scr_debug_poll_cheat_axis_direction(left_stick_y, "down_active", true, "DOWN");
		if (direction_input != "")
		{
			return direction_input;
		}

		direction_input = scr_debug_poll_cheat_axis_direction(left_stick_x, "left_active", false, "LEFT");
		if (direction_input != "")
		{
			return direction_input;
		}
	}

	return "";
}

/// @function scr_debug_poll_cheat_axis_direction(axis_value, state_key, positive_direction, token)
/// @description Converts a left-stick axis threshold crossing into a discrete cheat press.
function scr_debug_poll_cheat_axis_direction(axis_value, state_key, positive_direction, token)
{
	var is_active = variable_struct_get(global.cheat_axis_state, state_key);

	if (!is_active)
	{
		var crossed_press_threshold = positive_direction
			? axis_value >= global.cheat_stick_press_threshold
			: axis_value <= -global.cheat_stick_press_threshold;

		if (crossed_press_threshold)
		{
			variable_struct_set(global.cheat_axis_state, state_key, true);
			return token;
		}
	}
	else
	{
		var crossed_release_threshold = positive_direction
			? axis_value <= global.cheat_stick_release_threshold
			: axis_value >= -global.cheat_stick_release_threshold;

		if (crossed_release_threshold)
		{
			variable_struct_set(global.cheat_axis_state, state_key, false);
		}
	}

	return "";
}

/// @function scr_debug_unlock_debug_menu()
/// @description Unlocks the hidden debug tab for the current session.
function scr_debug_unlock_debug_menu()
{
	if (!global.debug_menu_unlocked)
	{
		global.debug_menu_unlocked = true;
		scr_debug_show_toast("Debug menu unlocked");
		show_debug_message("[scr_debug_unlock_debug_menu] Hidden debug tab unlocked for this session.");
	}
}

/// @function scr_debug_set_level_editor_objects_unlocked(enabled)
/// @description Enables or disables the session-only level editor unlock override.
function scr_debug_set_level_editor_objects_unlocked(enabled)
{
	var enabled_state = (enabled != 0);
	global.debug_unlock_all_level_editor_objects = enabled_state;

	if (enabled_state)
	{
		if (instance_exists(obj_leveleditor))
		{
			with (instance_find(obj_leveleditor, 0))
			{
				scr_unlock_placable_level_objects(true);
			}
		}

		scr_debug_show_toast("Level editor objects unlocked");
		show_debug_message("[scr_debug_set_level_editor_objects_unlocked] Unlocked all level editor objects for this session.");
	}
	else
	{
		if (instance_exists(obj_leveleditor))
		{
			with (instance_find(obj_leveleditor, 0))
			{
				scr_unlock_placable_level_objects(false);
			}
		}

		show_debug_message("[scr_debug_set_level_editor_objects_unlocked] Restored normal level editor object unlock state.");
	}
}

/// @function scr_debug_show_toast(message_key)
/// @description Shows a short above-GUI toast using the existing score-up object.
function scr_debug_show_toast(message_key)
{
	var toast = instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up);
	toast.above_gui = true;
	toast.above_gui_x = display_get_gui_width() * 0.5;
	toast.above_gui_y = 64;
	toast.above_gui_scale = 0.75;
	toast.score_up = message_key;
}
