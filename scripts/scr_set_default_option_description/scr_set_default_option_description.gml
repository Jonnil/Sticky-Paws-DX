function scr_set_default_dropdown_description(menu_index = "", option_description = "")
{
	if (menu == menu_index)
	{
		global.option_default = -2;
		if (option_description != "")
		{
			global.option_description = option_description;
		}
		else
		{
			global.option_description = "";
		}
	}
}
