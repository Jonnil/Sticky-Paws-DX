/// @description obj_debug_manager Draw GUI Event

scr_debug_reset_visibility_draw_cache();

/* Draw FPS info if enabled */
scr_debug_draw_fps();

/* Draw overall instance count info if enabled */
scr_debug_draw_instance_count();

/* Draw any extra curated ALWAYS-mode debug widgets when the main overlay is closed */
scr_debug_draw_always_registry_widgets();

/* Draw detailed (all) instance count info if enabled */
scr_debug_draw_all_instance_count();

/* Keep ALWAYS-mode settings debug text inside the compact overlay even when the main debug screen is off */
if (!global.debug_screen
&& scr_debug_should_use_compact_overlay())
{
	scr_debug_draw_compact_overlay();
}

/* Process the rest of the debug screen. Like telemetry, mouse toggles, extra debug text, etc. */
scr_debug_draw_debug_logic();
