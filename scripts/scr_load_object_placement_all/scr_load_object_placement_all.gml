function scr_load_object_placement_all()
{
	
	#region /* Is the game loading from main game or from level editor? */
	if (global.character_select_in_this_menu == "main_game")
	or (global.create_level_from_template == true)
	{
		var load_main_game_level = true;
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		var load_main_game_level = false;
		
		#region /* Create directories */
		
		#region /* Create directory for saving custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)));
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		}
		#endregion /* Create directory for saving custom levels END */
		
		#region /* Create directory for backgrouns in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/backgrounds");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/backgrounds");
		}
		#endregion /* Create directory for backgrounds in custom levels END */
		
		#region /* Create directory for data in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/data");
		}
		#endregion /* Create directory for data in custom levels END */
		
		#region /* Create directory for sounds in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/sound");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/sound"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/sound");
		}
		#endregion /* Create directory for sounds in custom levels END */
		
		#region /* Create directory for tilesets in custom levels */
		if (global.select_level_index >= 1)
		and (global.create_level_from_template == false)
		and (!directory_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets"))
		{
			directory_create(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/tilesets");
		}
		else
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets"))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name) + "/tilesets");
		}
		#endregion /* Create directory for tilesets in custom levels END */
		
		#endregion /* Create directories END */
		
	}
	#endregion /* Is the game loading from main game or from level editor? END */
	
	#region /* Object Placement All */
	var file, str, str_pos, str_temp;
	
	/* Let's create our awesome struct! Names may vary but I'd recommend keeping them to 1 letter/symbol since we can only check for that
	Also, you can set some default values here since if no value is found it uses what's here*/
	var var_struct =
	{
		X : 0,
		Y : 0,
		O : 0,
		E : 1,
		N : 1,
		H : 1,
		Q : 0,
		W : 0,
		L : 0
	}
	
	if (load_main_game_level == true)
	and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.txt"))
	{
		file = file_text_open_read("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.txt");
	}
	else
	if (load_main_game_level == false)
	and (global.select_level_index >= 1)
	and (global.create_level_from_template == false)
	and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement_all.txt"))
	{
		file = file_text_open_read(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_placement_all.txt");
	}
	else
	if (load_main_game_level == false)
	and (global.level_name != "")
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.txt"))
	{
		file = file_text_open_read(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.txt");
	}
	else
	{
		file = -1;
	}
	
	if (file != -1)
	{
		str = file_text_read_string(file);
		/* file_text_readln(file); things work without this, even when tutorial I follow wanted to use this. Keep just in case */
		str_temp = "";
		str_pos = 1;
		while(str_pos <= string_length(str))
		{
			/* | = chr("124") */
			while (string_char_at(str, str_pos) != "X")
			and (string_char_at(str, str_pos) != "Y")
			and (string_char_at(str, str_pos) != "O")
			and (string_char_at(str, str_pos) != "E")
			and (string_char_at(str, str_pos) != "N")
			and (string_char_at(str, str_pos) != "H")
			and (string_char_at(str, str_pos) != "Q")
			and (string_char_at(str, str_pos) != "W")
			and (string_char_at(str, str_pos) != "L")
			and (string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			switch (string_char_at(str, str_pos))
			{
				case "X":
				var_struct.X = string(str_temp);
				break
				case "Y": 
				var_struct.Y = string(str_temp);
				break
				case "O":
				var_struct.O = string(str_temp);
				break
				case "E":
				var_struct.E = string(str_temp);
				break
				case "N":
				var_struct.N = string(str_temp);
				break
				case "H":
				var_struct.H = string(str_temp);
				break
				case "Q":
				var_struct.Q = string(str_temp);
				break
				case "W":
				var_struct.W = string(str_temp);
				break
				case "L":
				var_struct.L = string(str_temp);
				break
			}
			str_temp = "";
			if (string_char_at(str, str_pos) == "|")
			{
				
				#region /* Place the object */
				with(instance_create_depth(var_struct.X, var_struct.Y, 0, obj_leveleditor_placed_object))
				{
					object = var_struct.O;
					easy = var_struct.E;
					normal = var_struct.N;
					hard = var_struct.H;
					second_x = var_struct.Q;
					second_y = var_struct.W;
				}
				if (var_struct.L >= 1)
				{
					for(i = 1; i <= var_struct.L; i += 1)
					{
						with(instance_create_depth(real(var_struct.X) + (32 * i), var_struct.Y, 0, obj_leveleditor_placed_object))
						{
							object = var_struct.O;
							easy = var_struct.E;
							normal = var_struct.N;
							hard = var_struct.H;
							second_x = var_struct.Q;
							second_y = var_struct.W;
						}
					}
				}
				#endregion /* Place the object END */
				
				/* Reset these var structs once you have created the object, because if a object changes these, there is cases where the game remebers these variables and wrong objects get placed */
				var_struct.E = 1;
				var_struct.N = 1;
				var_struct.H = 1;
				var_struct.Q = 0;
				var_struct.W = 0;
				var_struct.L = 0;
				
			}
			str_pos += 1;
			
		}
		file_text_close(file);
	}
	#endregion /* Object Placement All END */
	
}