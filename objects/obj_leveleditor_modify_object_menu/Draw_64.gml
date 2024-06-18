var max_characters = 200;
modify_object_text = scr_draw_name_input_screen(modify_object_text, max_characters, c_white, 1, true, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "ok", "cancel", false, true, false);
scr_draw_text_outlined(display_get_gui_width() * 0.5, 32, string(modify_object_description), global.default_text_size, c_black, c_white, 1);

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();