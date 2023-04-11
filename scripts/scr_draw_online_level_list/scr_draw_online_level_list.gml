function scr_draw_online_level_list()
{
	if (menu = "online_level_list_load")
	{
		scr_draw_text_outlined(display_get_width() * 0.5, 64, "Online Level List Load");
		
		#region /* Get Online Level List */
		content_type = ""; /* Need to clear the content_type, so Async - HTTP Event is running correctly */
		
		/* Create DS Map to hold the HTTP Header info */
		map = ds_map_create();
		
		/* Add to the header DS Map */
		ds_map_add(map, "Host", global.base_url);
		ds_map_add(map, "Content-Type", "application/json");
		ds_map_add(map, "User-Agent", "gmdownloader");
		
		/* Send the HTTP GET request to the /download endpoint */
		global.http_request_id = http_request("http://" + global.base_url + "/levels", "GET", map, "");
		ds_map_destroy(map);
		#endregion /* Get Online Level List END */
		
		menu = "online_level_list_menu";
	}
	else
	if (menu = "online_level_list_menu")
	{
		var number_levels_loaded = 10; /* How many levels are loaded at one page */
		
		#region /* If there is a online level list loaded, interpret that as a struct using "json parse" */
		if (global.online_level_list != "")
		{
			/* chr(34) = " */
			str = string_replace_all(global.online_level_list, "[{" + chr(34), "{" + chr(34) + "online_levels" + chr(34) + ": { " + chr(34)) /* Replace [{ with {"online_levels": { " */
			str = string_replace_all(str, "}]", "}}"); /* Replace "}] with "}}" */
			str = string_replace_all(str, "},{", ", ");
			
			for(var n = 0; n < number_levels_loaded; n++)
			{
				str = string_replace(str, "e" + chr(34), "e" + string(n) + chr(34));
				str = string_replace(str, "d" + chr(34), "d" + string(n) + chr(34));
			}
			
			json = string(str);
			data = json_parse(json);
			
			/* Check if the struct has myObj variable */
			if (variable_struct_exists(data, "online_levels"))
			{
				/* Check if it's a struct */
				if (is_struct(data.online_levels))
				{
					/* Print all struct members to the log */
					var _names = variable_struct_get_names(data.online_levels);
					var _str = "";
					for (var i = 0; i < array_length(_names); i++;)
					{
						_str = _names[i] + ": " + string(variable_struct_get(data.online_levels, _names[i]));
						draw_set_halign(fa_left);
						scr_draw_text_outlined(320, 64 + 32 * i, _str)
					}
				}
			}
		}
		#endregion /* If there is a online level list loaded, interpret that as a struct using "json parse" END */
		
	}
}