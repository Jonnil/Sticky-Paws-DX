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
		
		//if (global.online_level_list != "")
		//{
		//	var result_map = json_parse(global.online_level_list);
		//	var list = ds_map_find_value(result_map, "name");
		//	//if (list != undefined) /* Don't run this code if it's undefined, otherwise it can crash the game */
		//	//{
		//	var size = ds_list_size(list);
		//	for (var n = 0; n < size; n++;)
		//	{
		//		var online_level_list_map = ds_list_find_value(list, n);
		//		var curr = ds_map_find_first(online_level_list_map);
		//		while (is_string(curr))
		//		{
		//			scr_draw_text_outlined(display_get_width() * 0.5, 50 * n, string(ds_map_find_value(online_level_list_map, "name")));
		//			curr = ds_map_find_next(online_level_list_map, curr);
		//		}
		//	}
		//	//}
		//	ds_map_destroy(result_map);
		//}
		
		#region /* If there is a online level list loaded, interpret that as a struct using "json parse" */
		if (global.online_level_list != "")
		{
			str1 = global.online_level_list;
			str2 = string_replace_all(str1, "\"", "\\" + chr(34));
			str3 = string_replace_all(str2, "[", "\"");
			str4 = string_replace_all(str3, "]", "\"");
			str5 = string_replace_all(str4,
			chr(34) + "{\\" + chr(34),
			chr(34) + "{\\" + chr(34) + "online_levels\\" + chr(34) + ": { \\" + chr(34));
			str6 = string_replace_all(str5,
			chr(34) + "}" + chr(34),
			chr(34) + "}}" + chr(34));
			str7 = string_replace_all(str6, "},{", ",")
			
			clipboard_set_text(str7);
			
			json = string(str7);
			//json = "{\"online_levels\": { \"name\":\"levels/NDGTG0P2P.zip\",\"time_created\":\"2023-04-01T21:20:10Z\",\"name\":\"levels/2FTSHTTPB.zip\",\"time_created\":\"2023-04-01T20:55:43Z\",\"name\":\"levels/TEST_DATA.zip\",\"time_created\":\"2023-03-23T21:55:20Z\"}}"
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
						show_message(_str);
					}
				}
			}
		}
		#endregion /* If there is a online level list loaded, interpret that as a struct using "json parse" END */
		
	}
}