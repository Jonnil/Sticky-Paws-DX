/* "steam update" is necessary to run before "steam stats ready" can be enabled, which is required before getting or setting steam achievement information */
/* "steam update" is necessary to run after "steam set achievement" or "steam set stat int" too. This triggers the achievement notification to show up */
/* So "steam update" is necessary to run both before all the steam achievement code and after all the steam achievement code to function properly */

function scr_set_achievement(ach_name) {
	steam_update(); /* "steam update" is necessary to run before "steam stats ready" can be enabled */
	if (!steam_get_achievement(ach_name)) {
		steam_set_achievement(ach_name);
		steam_update(); /* "steam update" is necessary to run after "steam set achievement". This triggers the achievement notification to show up */
	}
}

function scr_set_stat_achievement(stat_name, set_stat_to) {
	steam_update(); /* "steam update" is necessary to run before "steam stats ready" can be enabled */
	if (steam_get_stat_int(stat_name) < set_stat_to) {
		steam_set_stat_int(stat_name, set_stat_to);
		steam_update(); /* "steam update" is necessary to run after "steam set stat int". This triggers the achievement notification to show up */
	}
}