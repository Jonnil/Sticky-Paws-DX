/// @function scr_language_pack_update(forced)
/// @description This script checks if a language pack update should occur, based on the user's
/// chosen auto-update interval and the time elapsed since the last update. It also supports a
/// forced update (e.g., when the user clicks "Check for language pack updates").
function scr_language_pack_update(forced = false)
{
	/* 1. Read the langauge last update time from config.ini */
	/*	We'll store it under the [language_updates] section, key: "language_last_update_real" */
	ini_open(game_save_id + "save_file/config.ini");
	var language_last_update_real = ini_read_real("language_updates", "language_last_update_real", 0);
	ini_close();
	
	/* If we never stored it before, set it to an old date/time so that the next check can trigger */
	if (language_last_update_real == 0)
	{
		/* For convenience, pick an old date so the script sees it as "very old" */
		language_last_update_real = date_create_datetime(1971, 1, 1, 0, 0, 0);
	}
	
	/* 2. Determine the user's chosen interval */
	var interval_choice = global.language_auto_update_interval; 
	/* 0 = Never, 1 = On Startup, 2 = Each Week, 3 = Each Month, 4 = Each Year */
	
	/* 3. If "Never" and not forced, we do nothing */
	if (interval_choice == 0
	&& !forced)
	{
		return; 
	}
	
	/* 4. Compute how long it’s been since the last update */
	var language_current_time = date_current_datetime();
	var diff_in_seconds = date_second_span(language_last_update_real, language_current_time);
	
	/* 5. Based on the chosen interval, decide if we should skip or proceed with the update */
	/* If forced = true, we always skip these checks and proceed */
	if (!forced)
	{
		switch (interval_choice)
		{
			case 1: 
				/* On Startup => Always update on startup, no time check needed */
				break;
				
			case 2: 
				/* Each Week (7 days ~ 604,800 seconds) */
				if (diff_in_seconds < 604800) return;
				break;
				
			case 3:
				/* Each Month (approx. 30 days ~ 2,592,000 seconds) */
				if (diff_in_seconds < 2592000) return;
				break;
				
			case 4:
				/* Each Year (approx. 365 days ~ 31,536,000 seconds) */
				if (diff_in_seconds < 31536000) return;
				break;
		}
	}
	
	/* 6. If we get here, it means either forced is true, or the time threshold is met => Perform the update */
	scr_download_language_packs();
}
