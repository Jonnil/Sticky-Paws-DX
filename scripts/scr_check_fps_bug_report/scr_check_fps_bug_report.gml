/// @function scr_check_fps_bug_report(simulated_fps)
/// @description Monitors FPS and accumulates the duration that FPS remains below an acceptable threshold. When FPS recovers, if the low-FPS period was significant, a report is output.
/// @param simulated_fps Optional: Use this value as the current FPS for testing; defaults to fps_real.
function scr_check_fps_bug_report(simulated_fps = fps_real)
{
	var acceptable_fps_threshold = 50;
	var low_fps_trigger_duration = 0.25;

	var current_fps = simulated_fps;

	var dt = 1 / game_get_speed(gamespeed_fps);

	static accumulated_low_fps_duration = 0;
	static low_fps_active = false;
	static lowest_detected_fps = 9999;

	if (current_fps < acceptable_fps_threshold)
	{
		/* Accumulate low-FPS time */
		accumulated_low_fps_duration += dt;

		if (!low_fps_active)
		{
			low_fps_active = true;
			lowest_detected_fps = current_fps;
		}
		else
		{
			if (current_fps < lowest_detected_fps)
			{
				lowest_detected_fps = current_fps;
			}
		}
	}
	else
	{
		/* FPS has recovered */
		if (low_fps_active)
		{
			if (accumulated_low_fps_duration >= low_fps_trigger_duration)
			{
				var report = "";
				report += "=== Low FPS Event Ended ===\n";
				report += "Low FPS lasted for: " + string(accumulated_low_fps_duration) + " seconds\n";
				report += "Lowest FPS detected: " + string(lowest_detected_fps) + "\n";
				report += "Recovery FPS: " + string(current_fps) + "\n";
				show_debug_message(report);
			}

			accumulated_low_fps_duration = 0;
			low_fps_active = false;
			lowest_detected_fps = 9999;
		}
	}
}
