// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_achievement(ach_name) {
	if (global.steam_api) {
		if (!steam_get_achievement(ach_name)) {
			steam_set_achievement(ach_name);
		}
	}
	else {
		scr_enable_steam_api();
	}
}