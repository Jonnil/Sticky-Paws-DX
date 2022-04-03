#region /*Menu cursor image speed*/
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /*Menu cursor image speed END*/

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (menu = "purchase_now")
{
	if (key_a_pressed)
	and (menu_delay = 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 64, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 64 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay = 0)
	{
		url_open(string(global.link_to_steam_page));
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay = 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_down)
	and (menu_delay = 0)
	{
		menu = "continue_playing";
		menu_delay = 3;
	}
}
else
if (menu = "continue_playing")
{
	if (key_a_pressed)
	and (menu_delay = 0)
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 106, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 106 + 42))
	and (mouse_check_button_pressed(mb_left))
	and (menu_delay = 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_b_pressed)
	and (menu_delay = 0)
	{
		menu = noone;
		show_demo_over_message = false;
		menu_delay = 3;
	}
	if (key_up)
	and (menu_delay = 0)
	{
		menu = "purchase_now";
		menu_delay = 3;
	}
}
