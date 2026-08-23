/// @description obj_debug_manager Step Event
/* Main debug routine. Calls all sub-functions that handle different debug aspects */

/* Reset queued dropdown popups so the active menu can request a fresh one during Draw GUI. */
global.menu_dropdown_popup_request = undefined;

/* Advance a bounded Capture Mode window transition at most once per Step. */
scr_capture_mode_update_window_transition();

/* Keep the active capture preset stable if another settings screen changes one of its owned values. */
scr_capture_mode_maintain();

/* Toggle the debug screen when the proper keys/buttons are pressed */
scr_debug_toggle_screen();

/* Always run crash error handling. It registers our exception handler */
scr_crash_error_handling();

/* Handle controller port assignments based on the platform and input */
scr_debug_handle_controller_ports();

/* Detect when controllers are connected/disconnected */
scr_debug_detect_controller_disconnections();

scr_screenshot_step();

/* Loop through the list to find the first available instance */
for (var i = 0; i < array_length(debug_target_list); i++)
{
	/* Check if an instance of the object exists */
	if (instance_exists(debug_target_list[i]))
	{
		/* Get the first instance of that object */
		debug_target = instance_find(debug_target_list[i], 0);
		break; /* Stop at the first one found */
	}
}

scr_debug_process_cheat_inputs();

scr_check_fps_bug_report();

if (global.debug_screen)
&& (keyboard_check(vk_control)
|| keyboard_check(vk_shift))
&& (keyboard_check(ord("M")))
{
	/* Grab the current date/time as a string */
	var now = date_current_datetime();

	/* Show the menu variable and timestamp in the debug console */
	show_debug_message("[obj_debug_manager " + string(now) + "] menu = " + string(debug_target.menu));
}

if (os_type == os_switch)
&& (room != rm_splash_screen)
{
	if (global.switch_startup_online_retry_timer > 0)
	{
		global.switch_startup_online_retry_timer--;
	}
	else
	if (variable_global_exists("switch_startup_token_prefetch_active"))
	&& (global.switch_startup_token_prefetch_active)
	{
		/* Continue the silent startup prefetch after leaving the splash screen so
		flight mode boots can recover later without manual input. */
		var passive_network_available = scr_get_cached_passive_network_status(false);

		if (passive_network_available)
		{
			scr_switch_try_startup_token_prefetch();
		}

		if (global.switch_startup_token_prefetch_active)
		{
			global.switch_startup_online_retry_timer = 60;
		}
	}
}

/* First update the language pack */
scr_language_pack_update(false);

/* If there are missing translation keywords that have not yet been sent, do that now */
scr_check_daily_translation_flush();

/* Upload any pending crash logs to the server */
scr_send_pending_crash_logs();

/* URL validation is deferred while offline or during the splash screen. */
scr_process_pending_url_checks();
