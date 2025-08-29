/// @description obj_debug_manager Draw GUI Event

/* Draw FPS info if enabled */
scr_debug_draw_fps();

/* Draw overall instance count info if enabled */
scr_debug_draw_instance_count();

/* Draw detailed (all) instance count info if enabled */
scr_debug_draw_all_instance_count();

/* Process the rest of the debug screen. Like telemetry, mouse toggles, extra debug text, etc. */
scr_debug_draw_debug_logic();

/* Draw darken screen and cursor mouse */
scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();
