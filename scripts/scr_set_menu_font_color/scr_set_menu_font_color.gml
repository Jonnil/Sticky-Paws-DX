function scr_set_menu_font_color()
{
	if (global.background_brightness_menu > 0)
	{
		c_menu_outline = c_white;
		c_menu_fill = c_black;
	}
	else
	{
		c_menu_outline = c_black;
		c_menu_fill = c_white;
	}
}