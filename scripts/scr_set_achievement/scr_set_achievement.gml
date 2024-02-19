function scr_set_achievement(ach_name) {
	if (global.steam_api) {
		if (!steam_get_achievement(ach_name)) {
			steam_set_achievement(ach_name);
			steam_update(); /* "steam update" is necessary to run after "steam set achievement". This triggers the achievement notification to show up */
		}
	}
	else {
		scr_enable_steam_api();
	}
}

function scr_set_stat_achievement(stat_name, set_stat_to) {
	if (global.steam_api) {
		if (steam_get_stat_int(stat_name) < set_stat_to) {
			steam_set_stat_int(stat_name, set_stat_to);
			steam_update(); /* "steam update" is necessary to run after "steam set stat int". This triggers the achievement notification to show up */
		}
	}
	else {
		scr_enable_steam_api();
	}
}