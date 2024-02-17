function scr_enable_steam_api() {
	/* Enable Steam API */
	global.steam_api = false;
	steam_update(); /* "steam update" is necessary to run before "steam stats ready" can be enabled */
	
	if (!global.steam_api && steam_initialised()) {
		show_debug_message("steam_initialised");
		if (steam_is_overlay_enabled()) {
			show_debug_message("steam_is_overlay_enabled");
			if (steam_stats_ready()) {
				show_debug_message("steam_stats_ready");
				global.steam_api = true;
				show_debug_message("global.steam_api = true;");
			}
			else {
				show_debug_message("steam_stats_ready FAILED");
			}
		}
		else {
			show_debug_message("steam_is_overlay_enabled FAILED");
		}
	}
	else {
		show_debug_message("steam_initialised FAILED");
	}
}