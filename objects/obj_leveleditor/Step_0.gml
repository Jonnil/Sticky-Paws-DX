if (window_get_height() != old_window_get_height)
if (window_get_width() != old_window_get_width)
{
	scr_set_screen_size();
	old_window_get_height = window_get_height();
	old_window_get_width = window_get_width();
}