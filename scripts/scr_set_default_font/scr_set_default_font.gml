function scr_set_default_font()
{
	if (global.language_localization = 2)
	and (asset_get_type("font_japanese") == asset_font)
	{
		draw_set_font(font_japanese);
	}
	else
	if (asset_get_type("font_default") == asset_font)
	{
		draw_set_font(font_default);
	}
}