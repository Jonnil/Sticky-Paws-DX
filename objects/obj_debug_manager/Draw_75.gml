/// @description obj_debug_manager Draw GUI End Event

/* Draw queued dropdown popups after the rest of the GUI so open dropdowns always stay on top. */
scr_menu_dropdown_draw_deferred_popup();

/* Draw darken screen and cursor mouse last so they remain visible above popup content. */
scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();
