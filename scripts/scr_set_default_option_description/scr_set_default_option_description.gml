function scr_set_default_dropdown_description(menu_index = "", option_description = "")
{
	if (!variable_instance_exists(self, "dropdown_default_descriptions")
	|| !is_struct(dropdown_default_descriptions))
	{
		dropdown_default_descriptions = {};
	}

	variable_struct_set(dropdown_default_descriptions, string(menu_index), string(option_description));

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

function scr_get_default_dropdown_description(menu_index = "")
{
	if (variable_instance_exists(self, "dropdown_default_descriptions")
	&& is_struct(dropdown_default_descriptions)
	&& variable_struct_exists(dropdown_default_descriptions, string(menu_index)))
	{
		return string(variable_struct_get(dropdown_default_descriptions, string(menu_index)));
	}

	return "";
}

function scr_set_default_option_description(menu_index = "", default_option = "", option_description = "")
{
	if (menu == menu_index)
	{
		global.option_default = -2;
		global.option_description = string(default_option);

		if (option_description != "")
		{
			global.option_description += " - " + string(option_description);
		}
	}
}
