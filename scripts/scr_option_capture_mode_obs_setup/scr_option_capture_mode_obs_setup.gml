/// @function scr_option_capture_mode_obs_setup(width, height)
/* The setup page only exports files. Applying a game preset remains an explicit
   choice in Capture Mode; OBS imports and the test recording belong to the user. */
function scr_option_capture_mode_obs_setup(get_window_width, get_window_height)
{
	var export_state = scr_capture_mode_obs_setup_state();
	var setup_title_x = 370 + ((get_window_width - 370) * 0.5);
	var setup_button_width = clamp(get_window_width - 464, 370, 560);
	var setup_button_x = setup_title_x - setup_button_width * 0.5;
	var setup_back_y = get_window_height < 680 ? 68 : 84;
	var setup_save_y = get_window_height - 180;
	var setup_desktop_y = setup_save_y + 50;
	var setup_folder_y = setup_desktop_y + 50;
	scr_draw_settings_overlay_title(setup_title_x, 34, l10n_text("OBS Recording Setup"), min(get_window_width - 430, 760));

	var setup_back = draw_menu_button(setup_button_x, setup_back_y, l10n_text("Back to Capture Mode"), "capture_mode_obs_setup_back", "", c_lime, 1, setup_button_width);
	if (setup_back && menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu = "capture_mode_obs_setup";
		menu_y_offset = 0;
		menu_y_offset_real = 0;
		menu_delay = 3;
	}

	var setup_platform = scr_capture_mode_obs_platform();
	var setup_platform_text = "";
	if (setup_platform == "windows")
	{
		setup_platform_text = l10n_text("This Windows setup uses Game Capture to record the picture and only the game's audio. Use the latest stable version of OBS Studio. If its Capture Audio option is missing, update OBS Studio.");
	}
	else
	if (setup_platform == "linux" || setup_platform == "linux_compatibility")
	{
		setup_platform_text = (setup_platform == "linux_compatibility"
			? l10n_text("A Linux compatibility tool was detected. The ZIP will use the Linux OBS setup. ")
			: "")
			+ l10n_text("When Linux asks what to share, select only Sticky Paws. Game-only audio must be added manually in OBS. Use the latest stable version of OBS Studio. This Linux setup still needs testing.");
	}
	else
	if (setup_platform == "macos")
	{
		setup_platform_text = l10n_text("The ZIP includes an OBS Profile for macOS. A Scene Collection is not included yet because the macOS capture source still needs to be configured and tested. Use the latest stable OBS Studio version supported by your macOS version.");
	}
	var setup_import_text = setup_platform == "macos"
		? l10n_text("Extract the ZIP. In OBS, import the Profile folder through Profile > Import. Follow READ ME FIRST.txt to create a scene and choose your recording folder.")
		: l10n_text("Extract the ZIP. In OBS, import the Profile folder through Profile > Import, then import Scene Collection.json through Scene Collection > Import. Select both imported items and choose your recording folder.");
	var setup_body = l10n_text("Save a ZIP for the footage you need. Handheld Capture uses 1280 x 720. Desktop Capture uses 1920 x 1080. Both record at 60 FPS.")
		+ "\n\n" + setup_import_text
		+ "\n\n" + setup_platform_text
		+ "\n\n" + l10n_text("Enable the matching Capture Mode preset, then check a ten-second recording. Stop after each take for separate MP4s. Keep the original MKVs until the MP4s are checked.")
		+ "\n\n" + l10n_text("Saving files does not start OBS or apply a game preset. Full instructions are inside the ZIP.");
	if (export_state.message != "") setup_body += "\n\n" + export_state.message;
	var setup_text_top = setup_back_y + 58;
	var setup_text_scale = global.default_text_size * 0.7;
	var setup_metrics = undefined;
	for (var fit_attempt = 0; fit_attempt < 24; fit_attempt++)
	{
		setup_metrics = scr_get_wrapped_text_metrics(setup_body, get_window_width - 434, 0, setup_text_scale);
		if (setup_metrics.text_height <= setup_save_y - setup_text_top - 20) break;
		setup_text_scale *= 0.92;
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	for (var line_index = 0; line_index < setup_metrics.line_count; line_index++)
	{
		var line_y = setup_text_top + setup_metrics.line_box_height * 0.5
			+ line_index * (setup_metrics.line_box_height + setup_metrics.line_gap);
		scr_draw_text_outlined(402, line_y, setup_metrics.lines[line_index], setup_text_scale, c_black, c_white, 1);
	}

	var save_handheld = draw_menu_button(setup_button_x, setup_save_y, l10n_text("Save Handheld Capture Setup"), "capture_mode_obs_setup_720", "", export_state.busy ? c_gray : c_aqua, 1, setup_button_width);
	var save_desktop = draw_menu_button(setup_button_x, setup_desktop_y, l10n_text("Save Desktop Capture Setup"), "capture_mode_obs_setup_1080", "", export_state.busy ? c_gray : c_aqua, 1, setup_button_width);
	var setup_can_open = export_state.path != "" && global.enable_open_custom_folder;
	var open_setup = false;
	if (setup_can_open)
	{
		open_setup = draw_menu_button(setup_button_x, setup_folder_y, l10n_text("Open Saved OBS Setup Folder"), "capture_mode_obs_setup_folder", "", c_yellow, 1, setup_button_width);
	}
	if ((save_handheld || save_desktop) && !export_state.busy
		&& menu_delay == 0 && menu_joystick_delay == 0)
	{
		scr_capture_mode_obs_export(save_handheld ? 1280 : 1920, save_handheld ? 720 : 1080);
		menu_delay = 3;
	}
	if (open_setup && menu_delay == 0 && menu_joystick_delay == 0)
	{
		scr_open_folder(filename_dir(export_state.path));
	}

	menu_cursor_y_position = setup_back_y;
	global.option_description = l10n_text("Returns to the Capture Mode menu");
	if (menu == "capture_mode_obs_setup_720" || menu == "capture_mode_obs_setup_1080")
	{
		menu_cursor_y_position = menu == "capture_mode_obs_setup_720" ? setup_save_y : setup_desktop_y;
		global.option_description = menu == "capture_mode_obs_setup_720"
			? l10n_text("Handheld Capture setup\nResolution: 1280 x 720 (720p)\nFrame rate: 60 FPS\nSaves an OBS Profile, Scene Collection when available, and instructions as a ZIP")
			: l10n_text("Desktop Capture setup\nResolution: 1920 x 1080 (1080p)\nFrame rate: 60 FPS\nSaves an OBS Profile, Scene Collection when available, and instructions as a ZIP");
	}
	if (menu == "capture_mode_obs_setup_folder")
	{
		menu_cursor_y_position = setup_folder_y;
		global.option_description = l10n_text("Opens the folder containing your saved OBS setup ZIP");
	}
	menu_cursor_y_position_end = (setup_can_open ? setup_folder_y : setup_desktop_y) + 64;
}

/// @function scr_option_capture_mode_obs_setup_navigate()
function scr_option_capture_mode_obs_setup_navigate()
{
	if (!(key_up || key_down) || open_dropdown || menu_delay != 0 || menu_joystick_delay != 0) return;
	var setup_navigation = ["capture_mode_obs_setup_back", "capture_mode_obs_setup_720", "capture_mode_obs_setup_1080"];
	if (scr_capture_mode_obs_setup_state().path != "" && global.enable_open_custom_folder)
	{
		array_push(setup_navigation, "capture_mode_obs_setup_folder");
	}
	for (var nav_index = 0; nav_index < array_length(setup_navigation); nav_index++)
	{
		if (menu == setup_navigation[nav_index])
		{
			menu = setup_navigation[(nav_index + (key_up ? -1 : 1) + array_length(setup_navigation)) mod array_length(setup_navigation)];
			menu_delay = 3;
			break;
		}
	}
}
