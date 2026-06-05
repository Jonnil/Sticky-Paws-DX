enum screenshot_mode
{
	clean = 0,
	full = 1
}

function scr_screenshot_init()
{
	global.screenshot_key = vk_f2;
	global.screenshot_full_modifier = vk_shift;
	global.screenshot_folder = game_save_id + "screenshots/";
	global.screenshot_default_mode = screenshot_mode.clean;
	global.screenshot_steam_mode = screenshot_mode.full;
	global.screenshot_enable_steam_upload = true;
	global.screenshot_filename_prefix = "Sticky_Paws";
	global.screenshot_pending = [];
	global.screenshot_last_path = "";
	global.screenshot_last_result = "";

	scr_screenshot_ensure_folder();
}

function scr_screenshot_step()
{
	if (!scr_screenshot_supported())
	{
		return;
	}

	if (!variable_global_exists("screenshot_pending"))
	{
		scr_screenshot_init();
	}

	if (keyboard_check_pressed(global.screenshot_key))
	{
		var request_mode = global.screenshot_default_mode;

		if (keyboard_check(global.screenshot_full_modifier))
		{
			request_mode = screenshot_mode.full;
		}

		scr_screenshot_request(request_mode, false);
	}

	if (global.screenshot_enable_steam_upload)
	&& (scr_screenshot_can_use_steam())
	{
		steam_update();

		if (steam_is_screenshot_requested())
		{
			scr_screenshot_request(global.screenshot_steam_mode, true);
		}
	}
}

function scr_screenshot_draw_gui_end()
{
	if (!scr_screenshot_supported())
	{
		return;
	}

	if (!variable_global_exists("screenshot_pending"))
	{
		return;
	}

	var pending_count = array_length(global.screenshot_pending);

	if (pending_count <= 0)
	{
		return;
	}

	var pending = global.screenshot_pending;
	global.screenshot_pending = [];

	for (var i = 0; i < pending_count; i++)
	{
		var request = pending[i];
		scr_screenshot_capture(request.mode, request.send_to_steam);
	}
}

function scr_screenshot_request(mode = screenshot_mode.clean, send_to_steam = false)
{
	if (!scr_screenshot_supported())
	{
		return false;
	}

	if (!variable_global_exists("screenshot_pending"))
	{
		scr_screenshot_init();
	}

	if (mode != screenshot_mode.clean)
	&& (mode != screenshot_mode.full)
	{
		mode = screenshot_mode.clean;
	}

	array_push(global.screenshot_pending, {
		mode: mode,
		send_to_steam: send_to_steam
	});

	return true;
}

function scr_screenshot_capture(mode, send_to_steam)
{
	var screenshot_width = round(window_get_width());
	var screenshot_height = round(window_get_height());

	if (screenshot_width <= 0 || screenshot_height <= 0)
	{
		global.screenshot_last_result = "invalid_window_size";
		show_debug_message("[scr_screenshot] Skipped because the window size is invalid.");
		return false;
	}

	scr_screenshot_ensure_folder();

	var filename = scr_screenshot_get_unique_filename();
	var saved = false;

	if (mode == screenshot_mode.full)
	{
		screen_save_part(filename, 0, 0, screenshot_width, screenshot_height);
		saved = file_exists(filename);
	}
	else
	{
		saved = scr_screenshot_save_clean(filename, screenshot_width, screenshot_height);
	}

	if (!saved)
	{
		global.screenshot_last_path = filename;
		global.screenshot_last_result = "failed";
		show_debug_message("[scr_screenshot] Failed to save screenshot: " + string(filename));
		return false;
	}

	global.screenshot_last_path = filename;
	global.screenshot_last_result = "saved";
	show_debug_message("[scr_screenshot] Saved screenshot: " + string(filename));

	if (send_to_steam)
	&& (global.screenshot_enable_steam_upload)
	&& (scr_screenshot_can_use_steam())
	{
		var steam_filename = scr_screenshot_get_steam_filename(filename);
		var steam_handle = steam_send_screenshot(steam_filename, screenshot_width, screenshot_height);
		show_debug_message("[scr_screenshot] Steam screenshot handle: " + string(steam_handle));
	}

	return true;
}

function scr_screenshot_save_clean(filename, screenshot_width, screenshot_height)
{
	var capture_surface = surface_create(screenshot_width, screenshot_height);

	if (!surface_exists(capture_surface))
	{
		show_debug_message("[scr_screenshot] Failed to create clean screenshot surface.");
		return false;
	}

	var drew_source = false;

	surface_set_target(capture_surface);
	draw_clear_alpha(c_black, 1);
	gpu_set_colorwriteenable(true, true, true, false);

	if (variable_global_exists("pause_screenshot"))
	&& (sprite_exists(global.pause_screenshot))
	{
		var pause_width = sprite_get_width(global.pause_screenshot);
		var pause_height = sprite_get_height(global.pause_screenshot);

		if (pause_width > 0 && pause_height > 0)
		{
			draw_sprite_ext(global.pause_screenshot, 0, 0, 0, screenshot_width / pause_width, screenshot_height / pause_height, 0, c_white, 1);
			drew_source = true;
		}
	}

	if (!drew_source)
	&& (surface_exists(application_surface))
	{
		draw_surface_stretched(application_surface, 0, 0, screenshot_width, screenshot_height);
		drew_source = true;
	}

	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();

	if (drew_source)
	{
		surface_save(capture_surface, filename);
	}
	else
	{
		show_debug_message("[scr_screenshot] Skipped clean screenshot because no clean source was available.");
	}

	surface_free(capture_surface);

	return drew_source && file_exists(filename);
}

function scr_screenshot_ensure_folder()
{
	if (!variable_global_exists("screenshot_folder"))
	{
		global.screenshot_folder = game_save_id + "screenshots/";
	}

	if (!directory_exists(global.screenshot_folder))
	{
		directory_create(global.screenshot_folder);
	}
}

function scr_screenshot_get_unique_filename()
{
	var now = date_current_datetime();
	var date_text = string(date_get_year(now))
		+ "-" + scr_screenshot_pad(date_get_month(now), 2)
		+ "-" + scr_screenshot_pad(date_get_day(now), 2);
	var time_text = scr_screenshot_pad(date_get_hour(now), 2)
		+ "." + scr_screenshot_pad(date_get_minute(now), 2)
		+ "." + scr_screenshot_pad(date_get_second(now), 2);

	var base_filename = global.screenshot_folder + global.screenshot_filename_prefix + "_" + date_text + "_" + time_text;
	var filename = base_filename + ".png";
	var suffix = 1;

	while (file_exists(filename))
	{
		filename = base_filename + "_" + string(suffix) + ".png";
		suffix++;
	}

	return filename;
}

function scr_screenshot_pad(value, digits)
{
	var text = string(floor(value));

	while (string_length(text) < digits)
	{
		text = "0" + text;
	}

	return text;
}

function scr_screenshot_supported()
{
	return (os_browser == browser_not_a_browser);
}

function scr_screenshot_can_use_steam()
{
	return ((os_type == os_windows)
		|| (os_type == os_macosx)
		|| (os_type == os_linux))
		&& steam_initialised();
}

function scr_screenshot_get_steam_filename(filename)
{
	var base_path = game_save_id;

	if (base_path != "")
	&& (string_pos(base_path, filename) == 1)
	{
		return string_delete(filename, 1, string_length(base_path));
	}

	return filename;
}
