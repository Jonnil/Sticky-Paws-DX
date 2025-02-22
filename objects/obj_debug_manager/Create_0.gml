/// @description obj_debug_manager Create Event
persistent = true;
depth = -9900;

/* Define a priority list of objects by their object names that the debugger should consider */
debug_target_list = [
	obj_camera,
	obj_camera_map,
	obj_leveleditor,
	obj_pause,
	obj_title,
];

debug_target = noone;

scr_debug_init_cheat_codes();