/// @function scr_option_capture_mode_is_page()
/* Shared page detection for the Options dispatcher and its description panel. */
function scr_option_capture_mode_is_page()
{
	return (global.settings_sidebar_menu == "debug_settings"
		|| global.settings_sidebar_menu == "video_settings")
		&& (string_pos("capture_mode_", string(menu)) == 1)
		&& (menu != "capture_mode_menu");
}

/// @function scr_option_capture_mode_get_back_target()
/* Returns the parent selection; the Options dispatcher owns input timing and offsets. */
function scr_option_capture_mode_get_back_target()
{
	if (string_pos("capture_mode_obs_setup_", string(menu)) == 1) return "capture_mode_obs_setup";
	var capture_mode_confirmation_active = string_pos("capture_mode_confirm_", string(menu)) == 1;
	var capture_mode_tutorial_details_active = string_pos("capture_mode_tutorial_details_", string(menu)) == 1;
	var capture_mode_recording_checklist_active = string_pos("capture_mode_recording_checklist_", string(menu)) == 1;

	return capture_mode_confirmation_active
		? "capture_mode_back"
		: (capture_mode_tutorial_details_active
			? "capture_mode_tutorial_signs"
			: (capture_mode_recording_checklist_active
				? "capture_mode_recording_checklist"
				: (global.settings_sidebar_menu == "video_settings" ? "video_capture_mode_menu" : "capture_mode_menu")));
}

/// @function scr_option_capture_mode_uses_option_description()
/* The main Capture Mode page has enough space for the normal description panel.
   Detail and confirmation pages use their full height for their own content. */
function scr_option_capture_mode_uses_option_description()
{
	return menu == "capture_mode_back"
		|| menu == "capture_mode_pc"
		|| menu == "capture_mode_switch"
		|| menu == "capture_mode_tutorial_signs"
		|| menu == "capture_mode_recording_checklist"
		|| menu == "capture_mode_obs_setup"
		|| menu == "capture_mode_restore";
}

/// @function scr_option_capture_mode_tutorial_signs_setting(option_x, option_y)
/* Draws the Game Settings checkbox using the same session-only Capture Mode preference. */
function scr_option_capture_mode_tutorial_signs_setting(option_x, option_y)
{
	/* This is the same live setting shown inside Capture Mode. Either menu may
	   change it, while the player's pre-capture preference remains protected. */
	var capture_mode_controls_tutorial_signs = scr_capture_mode_is_active();
	var tutorial_signs_visible = capture_mode_controls_tutorial_signs
		? scr_capture_mode_get_tutorial_signs_visible()
		: global.show_tutorial_signs;
	var tutorial_signs_option_description = capture_mode_controls_tutorial_signs
		? l10n_text("Changes tutorial signs for the current Capture Mode session. Your normal setting returns when Capture Mode is turned off.")
		: l10n_text("Shows tutorial signs with helpful gameplay tips");
	var changed_tutorial_signs_visible = draw_menu_checkmark(option_x, option_y, l10n_text("Show Tutorial Signs"), "show_tutorial_signs", tutorial_signs_visible, true,
		tutorial_signs_option_description);

	if (capture_mode_controls_tutorial_signs)
	{
		scr_capture_mode_set_tutorial_signs_visible(changed_tutorial_signs_visible);
	}
	else
	{
		global.show_tutorial_signs = changed_tutorial_signs_visible;
	}
}

/// @function scr_option_capture_mode(get_window_width, get_window_height)
/* Draws Capture Mode, its confirmations, tutorial details, and recording checklist.
   Called from scr_option_menu in the menu controller's instance scope. The GUI
   dimensions are passed explicitly because caller-local variables are not shared.
   Applying and restoring presets remains in the scr_capture_mode_* runtime helpers. */
function scr_option_capture_mode(get_window_width, get_window_height)
{
	if (string_pos("capture_mode_obs_setup_", string(menu)) == 1)
	{
		scr_option_capture_mode_obs_setup(get_window_width, get_window_height);
		return;
	}
	var capture_mode_confirmation_menu_active = string_pos("capture_mode_confirm_", string(menu)) == 1;
	var capture_mode_tutorial_details_menu_active = string_pos("capture_mode_tutorial_details_", string(menu)) == 1;
	var capture_mode_recording_checklist_menu_active = string_pos("capture_mode_recording_checklist_", string(menu)) == 1;

	var capture_title_x = 370 + ((get_window_width - 370) * 0.5);
	var capture_button_width = clamp(get_window_width - 464, 370, 560);
	var capture_button_x = capture_title_x - (capture_button_width * 0.5);
	var capture_main_compact = get_window_height < 680;
	var capture_back_y = capture_main_compact ? 68 : 84;
	var capture_pc_y = capture_main_compact ? 272 : 344;
	var capture_button_spacing = capture_main_compact ? 48 : 56;
	var capture_pc_available = global.enable_option_for_pc;
	var capture_obs_available = scr_capture_mode_obs_setup_available();
	var capture_switch_y = capture_pc_available ? capture_pc_y + capture_button_spacing : capture_pc_y;
	var capture_tutorial_signs_y = capture_switch_y + capture_button_spacing;
	var capture_recording_checklist_y = capture_tutorial_signs_y + capture_button_spacing;
	var capture_obs_setup_y = capture_recording_checklist_y + capture_button_spacing;
	var capture_restore_y = capture_obs_available ? capture_obs_setup_y + capture_button_spacing : capture_obs_setup_y;

	if (capture_mode_tutorial_details_menu_active)
	{
		var capture_details_title_y = capture_main_compact ? 34 : 42;
		var capture_details_text_top = capture_main_compact ? 116 : 142;
		var capture_details_toggle_y = min(get_window_height - (capture_main_compact ? 68 : 88), capture_main_compact ? 508 : 600);
		var capture_details_text_x = 402;
		var capture_details_text_right = max(capture_details_text_x + 1, get_window_width - 32);
		var capture_details_wrap_width = max(1, capture_details_text_right - capture_details_text_x);
		var capture_details_text_scale = global.default_text_size * clamp((get_window_width - 430) / 850, 0.38, capture_main_compact ? 0.62 : 0.76);
		var capture_details_min_text_scale = global.default_text_size * 0.3;
		var capture_details_body_text = l10n_text("By default, Capture Mode hides tutorial signs so the characters, scenery, and action are easier to see in recorded footage.")
			+ "\n\n"
			+ l10n_text("Some scenery overlaps the signs. In a few places, hiding a sign can make the scene look incomplete.")
			+ "\n\n"
			+ l10n_text("This is only visual and does not affect gameplay. Review those moments and leave them out when choosing clips.")
			+ "\n\n"
			+ l10n_text("If a shot looks better with its tutorial sign, choose Shown below. This choice is temporary.");
		var capture_details_body_metrics = undefined;
		var capture_details_available_height = max(1, capture_details_toggle_y - 34 - capture_details_text_top);

		for (var capture_details_fit_attempt = 0; capture_details_fit_attempt < 20; capture_details_fit_attempt++)
		{
			capture_details_body_metrics = scr_get_wrapped_text_metrics(capture_details_body_text, capture_details_wrap_width, 0, capture_details_text_scale);
			if (capture_details_body_metrics.text_height <= capture_details_available_height
			|| capture_details_text_scale <= capture_details_min_text_scale)
			{
				break;
			}

			capture_details_text_scale = max(capture_details_min_text_scale, capture_details_text_scale * 0.9);
		}

		capture_details_body_metrics = scr_get_wrapped_text_metrics(capture_details_body_text, capture_details_wrap_width, 0, capture_details_text_scale);
		scr_draw_settings_overlay_title(capture_title_x, capture_details_title_y, l10n_text("Tutorial Signs in Capture Mode"), min(get_window_width - 430, 760));

		var close_capture_tutorial_details = draw_menu_button(capture_button_x, capture_back_y, l10n_text("Back to Capture Mode"), "capture_mode_tutorial_details_back", "", c_lime, 1, capture_button_width);
		if (close_capture_tutorial_details)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_tutorial_signs";
			menu_y_offset = 0;
			menu_y_offset_real = 0;
			menu_delay = 3;
		}

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		for (var capture_details_line_index = 0; capture_details_line_index < capture_details_body_metrics.line_count; capture_details_line_index++)
		{
			var capture_details_line_y = capture_details_text_top
				+ (capture_details_body_metrics.line_box_height * 0.5)
				+ (capture_details_line_index * (capture_details_body_metrics.line_box_height + capture_details_body_metrics.line_gap));
			scr_draw_text_outlined(capture_details_text_x, capture_details_line_y, capture_details_body_metrics.lines[capture_details_line_index], capture_details_text_scale, c_black, c_white, 1);
		}

		var capture_tutorial_signs_visible = scr_capture_mode_get_tutorial_signs_visible();
		var capture_tutorial_toggle_label = capture_tutorial_signs_visible
			? l10n_text("Tutorial Signs: Shown")
			: l10n_text("Tutorial Signs: Hidden (Recommended)");
		var toggle_capture_tutorial_signs = draw_menu_button(capture_button_x, capture_details_toggle_y, capture_tutorial_toggle_label, "capture_mode_tutorial_details_toggle", "", capture_tutorial_signs_visible ? c_yellow : c_lime, 1, capture_button_width);

		if (toggle_capture_tutorial_signs)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			scr_capture_mode_set_tutorial_signs_visible(!capture_tutorial_signs_visible);
			menu = "capture_mode_tutorial_details_toggle";
			menu_delay = 3;
		}

		if (menu == "capture_mode_tutorial_details_back")
		{
			global.option_description = l10n_text("Returns to the Capture Mode menu");
			menu_cursor_y_position = capture_back_y;
		}
		else
		{
			global.option_description = l10n_text("Changes whether tutorial signs are hidden or shown during Capture Mode");
			menu_cursor_y_position = capture_details_toggle_y;
		}

		menu_cursor_y_position_end = capture_details_toggle_y + 64;
	}
	else
	if (capture_mode_recording_checklist_menu_active)
	{
		var capture_checklist_title_y = capture_main_compact ? 34 : 42;
		var capture_checklist_text_top = capture_main_compact ? 112 : 142;
		var capture_checklist_text_x = 402;
		var capture_checklist_text_right = max(capture_checklist_text_x + 1, get_window_width - 32);
		var capture_checklist_wrap_width = max(1, capture_checklist_text_right - capture_checklist_text_x);
		var capture_checklist_text_scale = global.default_text_size * clamp((get_window_width - 430) / 850, 0.36, capture_main_compact ? 0.6 : 0.72);
		var capture_checklist_min_text_scale = global.default_text_size * 0.28;
		var capture_checklist_body_text = l10n_text("Game setup")
			+ "\n"
			+ l10n_text("1. Choose the Capture Mode preset that matches the footage you need.")
			+ "\n"
			+ l10n_text("Desktop Capture uses 1920 x 1080 (1080p). Handheld Capture uses 1280 x 720 (720p). Both use 60 FPS.")
			+ "\n"
			+ l10n_text("2. Wait until the selected preset says it is applied before recording.")
			+ "\n"
			+ l10n_text("3. Confirm that gameplay sounds are audible while music and musical jingles are silent.")
			+ "\n"
			+ l10n_text("Capture Mode turns off when the game closes. Enable it again after restarting.")
			+ "\n\n"
			+ l10n_text("Recorder checks")
			+ "\n"
			+ l10n_text("1. Set your recording software to the selected preset's resolution at 60 FPS.")
			+ "\n"
			+ l10n_text("2. Make sure the game fills the recording frame.")
			+ "\n"
			+ l10n_text("3. Record ten seconds of movement and sound, then play it back.")
			+ "\n"
			+ l10n_text("4. Check picture quality, smooth movement, sound, overlays, and cursor visibility.")
			+ "\n"
			+ l10n_text("5. Check areas with hidden tutorial signs for incomplete-looking scenery.")
			+ "\n"
			+ l10n_text("6. Record several takes with extra time before and after each action.")
			+ "\n"
			+ l10n_text("7. Note the level and useful moment from each take.")
			+ "\n"
			+ l10n_text("8. Turn Capture Mode off when finished to restore your settings.");
		var capture_checklist_body_metrics = undefined;
		var capture_checklist_available_height = max(1, get_window_height - 28 - capture_checklist_text_top);

		for (var capture_checklist_fit_attempt = 0; capture_checklist_fit_attempt < 20; capture_checklist_fit_attempt++)
		{
			capture_checklist_body_metrics = scr_get_wrapped_text_metrics(capture_checklist_body_text, capture_checklist_wrap_width, 0, capture_checklist_text_scale);
			if (capture_checklist_body_metrics.text_height <= capture_checklist_available_height
			|| capture_checklist_text_scale <= capture_checklist_min_text_scale)
			{
				break;
			}

			capture_checklist_text_scale = max(capture_checklist_min_text_scale, capture_checklist_text_scale * 0.9);
		}

		capture_checklist_body_metrics = scr_get_wrapped_text_metrics(capture_checklist_body_text, capture_checklist_wrap_width, 0, capture_checklist_text_scale);
		scr_draw_settings_overlay_title(capture_title_x, capture_checklist_title_y, l10n_text("Recording Checklist"), min(get_window_width - 430, 760));

		var close_capture_recording_checklist = draw_menu_button(capture_button_x, capture_back_y, l10n_text("Back to Capture Mode"), "capture_mode_recording_checklist_back", "", c_lime, 1, capture_button_width);
		if (close_capture_recording_checklist)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_recording_checklist";
			menu_y_offset = 0;
			menu_y_offset_real = 0;
			menu_delay = 3;
		}

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		for (var capture_checklist_line_index = 0; capture_checklist_line_index < capture_checklist_body_metrics.line_count; capture_checklist_line_index++)
		{
			var capture_checklist_line_y = capture_checklist_text_top
				+ (capture_checklist_body_metrics.line_box_height * 0.5)
				+ (capture_checklist_line_index * (capture_checklist_body_metrics.line_box_height + capture_checklist_body_metrics.line_gap));
			scr_draw_text_outlined(capture_checklist_text_x, capture_checklist_line_y, capture_checklist_body_metrics.lines[capture_checklist_line_index], capture_checklist_text_scale, c_black, c_white, 1);
		}

		global.option_description = l10n_text("Returns to the Capture Mode menu");
		menu_cursor_y_position = capture_back_y;
		menu_cursor_y_position_end = capture_back_y + 64;
	}
	else
	if (!capture_mode_confirmation_menu_active)
	{
		scr_draw_settings_overlay_title(capture_title_x, 42, l10n_text("Capture Mode"), min(get_window_width - 430, 620));

		var close_capture_mode_menu = draw_menu_button(capture_button_x, capture_back_y, l10n_text("Back"), "capture_mode_back", "", c_lime, 1, capture_button_width);
		if (close_capture_mode_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = global.settings_sidebar_menu == "video_settings"
				? "video_capture_mode_menu"
				: "capture_mode_menu";
			menu_y_offset = 0;
			menu_y_offset_real = 0;
			menu_delay = 3;
		}

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var capture_status_color = scr_capture_mode_is_active() ? c_lime : c_ltgray;
		var capture_status_y = capture_main_compact ? 126 : 154;
		var capture_transition_active = variable_global_exists("capture_mode_window_transition")
			&& is_struct(global.capture_mode_window_transition);
		var capture_status_suffix = capture_transition_active
			? (scr_capture_mode_is_active() ? l10n_text("Applying window changes...") : l10n_text("Restoring the original window..."))
			: (scr_capture_mode_is_active() ? l10n_text("Preset applied") : "");
		var capture_status_text = l10n_text("Current Mode") + ": " + scr_capture_mode_get_name();
		if (capture_status_suffix != "")
		{
			capture_status_text += " (" + capture_status_suffix + ")";
		}
		var capture_status_scale = global.default_text_size * clamp((get_window_width - 430) / 680, 0.5, 1);
		scr_draw_text_outlined(capture_title_x, capture_status_y, capture_status_text, capture_status_scale, c_black, capture_status_color, 1);
		var capture_intro_scale = global.default_text_size * clamp((get_window_width - 430) / 750, 0.45, 0.78);
		var capture_intro_y = capture_main_compact ? 176 : 212;
		var capture_intro_spacing = capture_main_compact ? 22 : 28;
		scr_draw_text_outlined(capture_title_x, capture_intro_y, l10n_text("Capture Mode prepares the game for recording."), capture_intro_scale, c_black, c_white, 1);
		var capture_recorder_text = capture_obs_available
			? l10n_text("OBS Setup saves recording settings for you to import into OBS.")
			: l10n_text("It does not start or configure your recording software.");
		scr_draw_text_outlined(capture_title_x, capture_intro_y + capture_intro_spacing, capture_recorder_text, capture_intro_scale, c_black, c_white, 1);
		scr_draw_text_outlined(capture_title_x, capture_intro_y + (capture_intro_spacing * 2), l10n_text("Select a preset to review the main changes before they are applied."), capture_intro_scale, c_black, c_white, 1);
		scr_draw_text_outlined(capture_title_x, capture_intro_y + (capture_intro_spacing * 3), l10n_text("Your original settings return when Capture Mode is turned off."), capture_intro_scale, c_black, c_white, 1);

		var review_pc_capture_mode = false;
		if (capture_pc_available)
		{
			review_pc_capture_mode = draw_menu_button(capture_button_x, capture_pc_y, l10n_text("Desktop Capture"), "capture_mode_pc", "", c_aqua, 1, capture_button_width);
		}
		var review_switch_capture_mode = draw_menu_button(capture_button_x, capture_switch_y, l10n_text("Handheld Capture"), "capture_mode_switch", "", c_red, 1, capture_button_width);
		var capture_tutorial_signs_visible = scr_capture_mode_get_tutorial_signs_visible();
		var capture_tutorial_signs_label = capture_tutorial_signs_visible
			? l10n_text("Tutorial Signs: Shown")
			: l10n_text("Tutorial Signs: Hidden for cleaner footage");
		var review_capture_tutorial_signs = draw_menu_button(capture_button_x, capture_tutorial_signs_y, capture_tutorial_signs_label, "capture_mode_tutorial_signs", "", capture_tutorial_signs_visible ? c_yellow : c_lime, 1, capture_button_width);
		var review_capture_recording_checklist = draw_menu_button(capture_button_x, capture_recording_checklist_y, l10n_text("Recording Checklist"), "capture_mode_recording_checklist", "", c_aqua, 1, capture_button_width);
		if (capture_obs_available)
		{
			var review_capture_obs_setup = draw_menu_button(capture_button_x, capture_obs_setup_y, l10n_text("OBS Recording Setup"), "capture_mode_obs_setup", "", c_aqua, 1, capture_button_width);
			if (review_capture_obs_setup && menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "capture_mode_obs_setup_back";
				menu_delay = 3;
			}
		}

		if (review_pc_capture_mode)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_confirm_pc_cancel";
			menu_delay = 3;
		}

		if (review_switch_capture_mode)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_confirm_switch_cancel";
			menu_delay = 3;
		}

		if (review_capture_tutorial_signs)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_tutorial_details_back";
			menu_delay = 3;
		}

		if (review_capture_recording_checklist)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = "capture_mode_recording_checklist_back";
			menu_delay = 3;
		}

		if (scr_capture_mode_is_active())
		{
			var review_capture_restore = draw_menu_button(capture_button_x, capture_restore_y, l10n_text("Turn Off and Restore Settings"), "capture_mode_restore", "", c_yellow, 1, capture_button_width);

			if (review_capture_restore)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu = "capture_mode_confirm_restore_cancel";
				menu_delay = 3;
			}
		}

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var capture_screenshot_tip_anchor_y = scr_capture_mode_is_active()
			? capture_restore_y
			: (capture_obs_available ? capture_obs_setup_y : capture_recording_checklist_y);
		if (global.enable_option_for_pc
		&& get_window_height >= capture_screenshot_tip_anchor_y + 124)
		{
			scr_draw_text_outlined(capture_title_x, capture_screenshot_tip_anchor_y + 78, l10n_text("F2 saves a clean screenshot without menus."), global.default_text_size * 0.72, c_black, c_ltgray, 1);
			scr_draw_text_outlined(capture_title_x, capture_screenshot_tip_anchor_y + 106, l10n_text("Shift + F2 saves the complete window, including menus."), global.default_text_size * 0.72, c_black, c_ltgray, 1);
		}

		if (menu == "capture_mode_back")
		{
			global.option_description = global.settings_sidebar_menu == "video_settings"
				? l10n_text("Returns to Video settings")
				: l10n_text("Returns to the main Debug tab");
			menu_cursor_y_position = capture_back_y;
		}
		else
		if (menu == "capture_mode_pc")
		{
			global.option_description = l10n_text("Desktop Capture\nResolution: 1920 x 1080 (1080p)\nFrame rate: 60 FPS\nPrepares full-size desktop footage and keeps the game centered in the recording frame");
			menu_cursor_y_position = capture_pc_y;
		}
		else
		if (menu == "capture_mode_switch")
		{
			global.option_description = l10n_text("Handheld Capture\nResolution: 1280 x 720 (720p)\nFrame rate: 60 FPS\nPrepares compact 720p footage and keeps the game centered in the recording frame");
			menu_cursor_y_position = capture_switch_y;
		}
		else
		if (menu == "capture_mode_tutorial_signs")
		{
			global.option_description = l10n_text("Opens an explanation of tutorial signs and their Capture Mode setting");
			menu_cursor_y_position = capture_tutorial_signs_y;
		}
		else
		if (menu == "capture_mode_recording_checklist")
		{
			global.option_description = l10n_text("Opens a checklist for recording gameplay with either Capture Mode preset");
			menu_cursor_y_position = capture_recording_checklist_y;
		}
		else
		if (menu == "capture_mode_obs_setup")
		{
			global.option_description = l10n_text("Saves OBS recording settings and explains how to import and test them");
			menu_cursor_y_position = capture_obs_setup_y;
		}
		else
		if (menu == "capture_mode_restore")
		{
			global.option_description = l10n_text("Reviews the original settings that will be restored");
			menu_cursor_y_position = capture_restore_y;
		}

		menu_cursor_y_position_end = scr_capture_mode_is_active()
			? capture_restore_y + 64
			: (capture_obs_available ? capture_obs_setup_y : capture_recording_checklist_y) + 64;
	}
	else
	{
		var confirm_pc_capture = string_pos("capture_mode_confirm_pc_", string(menu)) == 1;
		var confirm_switch_capture = string_pos("capture_mode_confirm_switch_", string(menu)) == 1;
		var confirm_restore_capture = string_pos("capture_mode_confirm_restore_", string(menu)) == 1;
		var capture_confirm_apply_id = confirm_pc_capture
			? "capture_mode_confirm_pc_apply"
			: (confirm_switch_capture ? "capture_mode_confirm_switch_apply" : "capture_mode_confirm_restore_apply");
		var capture_confirm_cancel_id = confirm_pc_capture
			? "capture_mode_confirm_pc_cancel"
			: (confirm_switch_capture ? "capture_mode_confirm_switch_cancel" : "capture_mode_confirm_restore_cancel");
		var capture_confirm_title = confirm_pc_capture
			? l10n_text("Enable Desktop Capture Mode?")
			: (confirm_switch_capture ? l10n_text("Enable Handheld Capture Mode?") : l10n_text("Turn Off Capture Mode?"));
		var capture_confirm_color = confirm_pc_capture ? c_aqua : (confirm_switch_capture ? c_red : c_yellow);
		var capture_tutorial_confirmation_line = scr_capture_mode_get_tutorial_signs_visible()
			? l10n_text("Tutorial signs and their button instructions remain visible.")
			: l10n_text("Tutorial signs and their button instructions are hidden for cleaner footage.");
		var capture_confirm_lines = [];

		if (confirm_pc_capture)
		{
			capture_confirm_lines = [
				l10n_text("The game changes to a 1920 x 1080 window for recording desktop footage."),
				l10n_text("Menus and on-screen text are automatically sized for this resolution."),
				l10n_text("Timers, counters, player labels, new item messages, and other gameplay displays are hidden."),
				capture_tutorial_confirmation_line,
				l10n_text("Arrows showing routes, objectives, exits, or off-screen players are hidden."),
				l10n_text("The Debug Screen, collision outlines, and other visuals used for testing are hidden."),
				l10n_text("Audio is locked. Music and Melody are 0%. Main, Sound, Ambient, Footsteps, and Voices are 70%."),
				l10n_text("Button icons automatically match the controls each player uses."),
				l10n_text("On PC, the game keeps running and the screen does not darken when another window is selected.")
			];
		}
		else
		if (confirm_switch_capture)
		{
			capture_confirm_lines = [
				global.enable_option_for_pc
					? l10n_text("The game changes to exactly 1280 x 720 (720p) for handheld recording.")
					: l10n_text("The game uses exactly 1280 x 720 (720p) for handheld recording."),
				l10n_text("Record at 60 FPS. Do not substitute 1080p, 1440p, or 4K."),
				l10n_text("Menus and on-screen text are automatically sized for this resolution."),
				l10n_text("Timers, counters, player labels, new item messages, and other gameplay displays are hidden."),
				capture_tutorial_confirmation_line,
				l10n_text("Arrows showing routes, objectives, exits, or off-screen players are hidden."),
				l10n_text("The Debug Screen, collision outlines, and other visuals used for testing are hidden."),
				l10n_text("Audio is locked. Music and Melody are 0%. Main, Sound, Ambient, Footsteps, and Voices are 70%."),
				l10n_text("One consistent set of gamepad button icons is shown for every player.")
			];

			if (global.enable_option_for_pc)
			{
				array_push(capture_confirm_lines, l10n_text("On PC, the game keeps running and the screen does not darken when another window is selected."));
			}
		}
		else
		{
			capture_confirm_lines = [
				l10n_text("Your settings return to the values they had before Capture Mode was enabled."),
				l10n_text("This includes the window, gameplay displays, tutorial signs, arrows, button instructions, button icons, and audio."),
				l10n_text("Settings for the Debug Screen, collision outlines, and window focus also return.")
			];
		}

		/* The more detailed enable explanations need the compact layout at lower resolutions. */
		var capture_confirm_compact = get_window_height < 640
			|| (!confirm_restore_capture && get_window_height < 720);
		var capture_confirm_title_y = capture_confirm_compact ? 42 : 68;
		var capture_confirm_text_top = capture_confirm_compact ? 78 : 132;
		var capture_confirm_apply_y = get_window_height - (capture_confirm_compact ? 100 : 158);
		var capture_confirm_cancel_y = get_window_height - (capture_confirm_compact ? 52 : 104);
		var capture_confirm_text_x = 402;
		var capture_confirm_text_right = max(capture_confirm_text_x + 1, get_window_width - 32);
		var capture_confirm_wrap_width = max(1, capture_confirm_text_right - capture_confirm_text_x);
		var capture_confirm_text_scale = global.default_text_size * clamp((get_window_width - 430) / 850, 0.35, capture_confirm_compact ? 0.58 : 0.72);
		var capture_confirm_min_text_scale = global.default_text_size * 0.28;
		var show_capture_snapshot_note = !confirm_restore_capture
			&& (!capture_confirm_compact || get_window_height >= 520);
		var capture_confirm_body_text = "";

		for (var capture_paragraph_index = 0; capture_paragraph_index < array_length(capture_confirm_lines); capture_paragraph_index++)
		{
			if (capture_paragraph_index > 0)
			{
				capture_confirm_body_text += "\n";
			}

			capture_confirm_body_text += string(capture_confirm_lines[capture_paragraph_index]);
		}

		var capture_snapshot_text = l10n_text("Before Capture Mode turns on, your current settings are remembered.")
			+ "\n"
			+ l10n_text("These changes are temporary. Turning Capture Mode off restores your settings.");
		var capture_confirm_body_metrics = undefined;
		var capture_snapshot_metrics = undefined;
		var capture_snapshot_gap = capture_confirm_compact ? 10 : 22;
		var capture_confirm_content_bottom = capture_confirm_apply_y - (capture_confirm_compact ? 16 : 24);
		var capture_confirm_available_height = max(1, capture_confirm_content_bottom - capture_confirm_text_top);

		/* Wrap first, then reduce the shared scale only when the complete text block needs it. */
		for (var capture_fit_attempt = 0; capture_fit_attempt < 20; capture_fit_attempt++)
		{
			capture_confirm_body_metrics = scr_get_wrapped_text_metrics(capture_confirm_body_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);
			capture_snapshot_metrics = scr_get_wrapped_text_metrics(capture_snapshot_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);

			var capture_confirm_total_height = capture_confirm_body_metrics.text_height;
			if (show_capture_snapshot_note)
			{
				capture_confirm_total_height += capture_snapshot_gap + capture_snapshot_metrics.text_height;
			}

			var capture_confirm_widest_line = 1;
			for (var capture_width_index = 0; capture_width_index < capture_confirm_body_metrics.line_count; capture_width_index++)
			{
				capture_confirm_widest_line = max(capture_confirm_widest_line, string_width(string(capture_confirm_body_metrics.lines[capture_width_index])) * capture_confirm_text_scale);
			}
			if (show_capture_snapshot_note)
			{
				for (var capture_note_width_index = 0; capture_note_width_index < capture_snapshot_metrics.line_count; capture_note_width_index++)
				{
					capture_confirm_widest_line = max(capture_confirm_widest_line, string_width(string(capture_snapshot_metrics.lines[capture_note_width_index])) * capture_confirm_text_scale);
				}
			}

			var capture_confirm_fits_width = capture_confirm_widest_line <= capture_confirm_wrap_width;
			var capture_confirm_fits_height = capture_confirm_total_height <= capture_confirm_available_height;
			if (capture_confirm_fits_width && capture_confirm_fits_height)
			{
				break;
			}
			if (capture_confirm_text_scale <= capture_confirm_min_text_scale)
			{
				/* Keep the main explanation readable on unusually short windows. */
				if (!capture_confirm_fits_height && show_capture_snapshot_note)
				{
					show_capture_snapshot_note = false;
					continue;
				}

				break;
			}

			var capture_confirm_next_scale = capture_confirm_text_scale * 0.9;
			if (!capture_confirm_fits_width)
			{
				capture_confirm_next_scale = min(capture_confirm_next_scale, capture_confirm_text_scale * capture_confirm_wrap_width / capture_confirm_widest_line * 0.98);
			}
			capture_confirm_text_scale = max(capture_confirm_min_text_scale, capture_confirm_next_scale);
		}

		/* Keep the measurements synchronized with the final scale selected above. */
		capture_confirm_body_metrics = scr_get_wrapped_text_metrics(capture_confirm_body_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);
		capture_snapshot_metrics = scr_get_wrapped_text_metrics(capture_snapshot_text, capture_confirm_wrap_width, 0, capture_confirm_text_scale);

		draw_set_alpha(0.88);
		draw_rectangle_color(370, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		scr_draw_settings_overlay_title(capture_title_x, capture_confirm_title_y, capture_confirm_title, min(get_window_width - 430, 760));

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		for (var capture_line_index = 0; capture_line_index < capture_confirm_body_metrics.line_count; capture_line_index++)
		{
			var capture_line_center_y = capture_confirm_text_top
				+ (capture_confirm_body_metrics.line_box_height * 0.5)
				+ (capture_line_index * (capture_confirm_body_metrics.line_box_height + capture_confirm_body_metrics.line_gap));
			scr_draw_text_outlined(capture_confirm_text_x, capture_line_center_y, capture_confirm_body_metrics.lines[capture_line_index], capture_confirm_text_scale, c_black, c_white, 1);
		}

		if (show_capture_snapshot_note)
		{
			var capture_snapshot_text_top = capture_confirm_text_top + capture_confirm_body_metrics.text_height + capture_snapshot_gap;
			for (var capture_note_line_index = 0; capture_note_line_index < capture_snapshot_metrics.line_count; capture_note_line_index++)
			{
				var capture_note_line_center_y = capture_snapshot_text_top
					+ (capture_snapshot_metrics.line_box_height * 0.5)
					+ (capture_note_line_index * (capture_snapshot_metrics.line_box_height + capture_snapshot_metrics.line_gap));
				scr_draw_text_outlined(capture_confirm_text_x, capture_note_line_center_y, capture_snapshot_metrics.lines[capture_note_line_index], capture_confirm_text_scale, c_black, c_lime, 1);
			}
		}

		var capture_apply_label = confirm_restore_capture ? l10n_text("Restore Settings") : l10n_text("Enable Capture Mode");
		var apply_capture_confirmation = draw_menu_button(capture_button_x, capture_confirm_apply_y, capture_apply_label, capture_confirm_apply_id, "", capture_confirm_color, 1, capture_button_width);
		var cancel_capture_confirmation = draw_menu_button(capture_button_x, capture_confirm_cancel_y, l10n_text("Cancel"), capture_confirm_cancel_id, "", c_lime, 1, capture_button_width);

		if (apply_capture_confirmation)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			var capture_mode_change_succeeded = false;
			if (confirm_pc_capture)
			{
				capture_mode_change_succeeded = scr_capture_mode_apply(CAPTURE_MODE_PRESET.PC);
			}
			else
			if (confirm_switch_capture)
			{
				capture_mode_change_succeeded = scr_capture_mode_apply(CAPTURE_MODE_PRESET.SWITCH_HANDHELD);
			}
			else
			{
				capture_mode_change_succeeded = scr_capture_mode_restore();
			}

			if (capture_mode_change_succeeded)
			{
				menu = "capture_mode_back";
				menu_y_offset = 0;
				menu_y_offset_real = 0;
			}
			else
			{
				scr_debug_show_toast("Please wait for the current window change to finish");
			}
			menu_delay = 3;
		}

		if (cancel_capture_confirmation)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu = confirm_pc_capture
				? "capture_mode_pc"
				: (confirm_switch_capture ? "capture_mode_switch" : "capture_mode_restore");
			menu_delay = 3;
		}

		global.option_description = confirm_restore_capture
			? l10n_text("Confirm whether to restore the original pre-capture settings")
			: l10n_text("Choose whether to enable the selected Capture Mode");
		menu_cursor_y_position = (menu == capture_confirm_apply_id)
			? capture_confirm_apply_y
			: capture_confirm_cancel_y;
		menu_cursor_y_position_end = capture_confirm_cancel_y + 64;
	}
}

/// @function scr_option_capture_mode_navigate()
/* Runs at the original navigation stage, after drawing and mouse handling. */
function scr_option_capture_mode_navigate()
{
	if (string_pos("capture_mode_obs_setup_", string(menu)) == 1)
	{
		scr_option_capture_mode_obs_setup_navigate();
		return;
	}
	if (string_pos("capture_mode_confirm_", string(menu)) == 1)
	{
		if ((key_up || key_down || key_left || key_right)
		&& (!open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0))
		{
			menu_delay = 3;

			if (string_pos("_apply", string(menu)) > 0)
			{
				menu = string_replace(string(menu), "_apply", "_cancel");
			}
			else
			{
				menu = string_replace(string(menu), "_cancel", "_apply");
			}
		}
	}
	else
	if (string_pos("capture_mode_tutorial_details_", string(menu)) == 1)
	{
		if ((key_up || key_down || key_left || key_right)
		&& (!open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0))
		{
			menu_delay = 3;
			menu = (menu == "capture_mode_tutorial_details_back")
				? "capture_mode_tutorial_details_toggle"
				: "capture_mode_tutorial_details_back";
		}
	}
	else
	if (string_pos("capture_mode_", string(menu)) == 1)
	&& (menu != "capture_mode_menu")
	{
		var capture_mode_navigation = ["capture_mode_back"];

		if (global.enable_option_for_pc)
		{
			array_push(capture_mode_navigation, "capture_mode_pc");
		}

		array_push(capture_mode_navigation, "capture_mode_switch");
		array_push(capture_mode_navigation, "capture_mode_tutorial_signs");
		array_push(capture_mode_navigation, "capture_mode_recording_checklist");
		if (scr_capture_mode_obs_setup_available()) array_push(capture_mode_navigation, "capture_mode_obs_setup");

		if (scr_capture_mode_is_active())
		{
			array_push(capture_mode_navigation, "capture_mode_restore");
		}

		var capture_mode_navigation_index = -1;
		for (var capture_nav_index = 0; capture_nav_index < array_length(capture_mode_navigation); capture_nav_index++)
		{
			if (menu == capture_mode_navigation[capture_nav_index])
			{
				capture_mode_navigation_index = capture_nav_index;
				break;
			}
		}

		if (capture_mode_navigation_index >= 0
		&& (key_up || key_down)
		&& (!open_dropdown)
		&& (menu_delay == 0 && menu_joystick_delay == 0))
		{
			var capture_navigation_direction = key_up ? -1 : 1;
			var capture_next_navigation_index = (capture_mode_navigation_index + capture_navigation_direction + array_length(capture_mode_navigation)) mod array_length(capture_mode_navigation);
			menu = capture_mode_navigation[capture_next_navigation_index];
			menu_delay = 3;
		}
	}
}
