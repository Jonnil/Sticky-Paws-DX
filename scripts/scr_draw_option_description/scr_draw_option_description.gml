function scr_draw_option_description()
{
	/* Description that shows up when changing certain options. Should describe what the option does */
	var text_fill = c_white;
	if (global.option_default == 1)
	{
		var option_default = l10n_text("On by default");
		var text_fill = c_lime;
	}
	else
	if (global.option_default == 0)
	{
		var option_default = l10n_text("Off by default");
	}
	else
	{
		var option_default = "";
	}
	
	if (global.option_description != "" && global.option_default == -2)
	{
		var option_description_text = l10n_text("Default") + ": " + string(global.option_description);
	}
	else
	if (global.option_description != "" && option_default != "")
	{
		var option_description_text = string(global.option_description) + " - " + string(option_default);
	}
	else
	if (global.option_description != "")
	{
		var option_description_text = string(global.option_description);
	}
	else
	{
		var option_description_text = string(option_default);
	}
	
	if (option_description_text != "")
	{
		draw_set_alpha(1);
		draw_roundrect_color_ext((display_get_gui_width() * 0.5) - (string_width(option_description_text) * 0.5), display_get_gui_height() - 32, (display_get_gui_width() * 0.5) + (string_width(option_description_text) * 0.5), display_get_gui_height(), 50, 50, c_black, c_black, false);
		draw_set_halign(fa_center);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 16, string(option_description_text), global.default_text_size, c_black, text_fill, 1);
	}
	
	/* Reset these at the end of the code so when you aren't selecting a option using these, the description menu dissapears */
	global.option_default = -1;
	global.option_description = "";
}