modify_object_text = keyboard_string;
scr_draw_name_input_screen(modify_object_text, 100, c_white, 1, true, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, "ok", "cancel", false, true, false, true);
scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 - 128, l10n_text("Type what the sign should say"), global.default_text_size, c_black, c_white, 1);

scr_draw_cursor_mouse();