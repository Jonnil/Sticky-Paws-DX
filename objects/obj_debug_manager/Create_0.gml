/// @description obj_debug_manager Create Event
persistent = true;
depth = -9900;

global.menu_dropdown_popup_request = undefined;
global.switch_startup_online_retry_timer = 0;

/* Define a priority list of objects by their object names that the debugger should consider */
debug_target_list = [
	obj_camera,
	obj_camera_map,
	obj_leveleditor,
	obj_pause,
	obj_title,
];

debug_target = noone;
simulated_fps = 60;

scr_debug_reset_visibility_draw_cache();

scr_debug_init_cheat_codes();

scr_screenshot_init();
