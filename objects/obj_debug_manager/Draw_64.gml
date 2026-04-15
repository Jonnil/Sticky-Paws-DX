/// @description obj_debug_manager Draw GUI Event

/* Draw FPS info if enabled */
scr_debug_draw_fps();

/* Draw overall instance count info if enabled */
scr_debug_draw_instance_count();

/* Draw any extra curated ALWAYS-mode debug widgets when the main overlay is closed */
scr_debug_draw_always_registry_widgets();

/* Draw detailed (all) instance count info if enabled */
scr_debug_draw_all_instance_count();

/* Process the rest of the debug screen. Like telemetry, mouse toggles, extra debug text, etc. */
scr_debug_draw_debug_logic();
