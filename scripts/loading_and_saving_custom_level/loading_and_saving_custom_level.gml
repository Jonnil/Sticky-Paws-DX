function scr_load_object_placement_json()
{
	if (global.character_select_in_this_menu == "main_game" || global.create_level_from_template == true)
		load_main_game_level = true;
	else
	{
		var load_main_game_level = false;
		if (global.level_name != "")
		{
			var directories = ["backgrounds", "data", "sound", "tilesets"];
			for (var i = 0; i < array_length_1d(directories); i++)
			{
				var dir_path = working_directory + "/custom_levels/" + string(global.level_name) + "/" + directories[i];
				if (!directory_exists(dir_path))
					directory_create(dir_path);
			}
		}
	}
	
	var var_struct = {X : 0, Y : 0, O : 0, E : 1, N : 1, H : 1, Q : 0, W : 0, L : 0};
	
	var file_path = "";
	if (load_main_game_level)
		file_path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.json";
	else if (global.level_name != "")
		file_path = working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.json";
	
	if (file_exists(file_path))
	{
		var file = file_text_open_read(file_path)
		var json_string = file_text_read_string(file);
		file_text_close(file);
		
		var data = json_parse(json_string);
		
		for (var i = 0; i < array_length(data); i++)
		{
			var var_struct = data[i];
			
			new_obj = instance_create_depth(real(var_struct.X), real(var_struct.Y), 0, obj_leveleditor_placed_object);
			if (new_obj)
			{
				new_obj.object = var_struct.O;
			    new_obj.easy = var_struct.E;
			    new_obj.normal = var_struct.N;
			    new_obj.hard = var_struct.H;
			    new_obj.second_x = var_struct.Q;
			    new_obj.second_y = var_struct.W;
			}
			/* Reset the var struct variables after creating the object */
			var_struct.E = 1;var_struct.N = 1;var_struct.H = 1;var_struct.Q = 0;var_struct.W = 0;var_struct.L = 0;
		}
	}
}

function scr_load_object_placement_txt()
{
	if (global.character_select_in_this_menu == "main_game" || global.create_level_from_template == true)
		load_main_game_level = true;
	else
	{
		var load_main_game_level = false;
		if (global.level_name != "")
		{
			var directories = ["backgrounds", "data", "sound", "tilesets"];
			for (var i = 0; i < array_length_1d(directories); i++)
			{
				var dir_path = working_directory + "/custom_levels/" + string(global.level_name) + "/" + directories[i];
				if (!directory_exists(dir_path))
					directory_create(dir_path);
			}
		}
	}
	
	var var_struct = {X : 0, Y : 0, O : 0, E : 1, N : 1, H : 1, Q : 0, W : 0, L : 0};
	
	var file_path = "";
	if (load_main_game_level)
		file_path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.txt";
	else if (global.level_name != "")
		file_path = working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.txt";
	
	var file = file_exists(file_path) ? file_text_open_read(file_path) : -1;
	
	if (file != -1)
	{
		var str, str_pos, str_temp;
		str = file_text_read_string(file);
		str_temp = "";
		str_pos = 1;
		while(str_pos <= string_length(str))
		{
			while (string_char_at(str, str_pos) != "X" && string_char_at(str, str_pos) != "Y" && string_char_at(str, str_pos) != "O" && string_char_at(str, str_pos) != "E" && string_char_at(str, str_pos) != "N" && string_char_at(str, str_pos) != "H" && string_char_at(str, str_pos) != "Q" && string_char_at(str, str_pos) != "W" && string_char_at(str, str_pos) != "L" && string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			switch (string_char_at(str, str_pos))
			{
				case "X": var_struct.X = string(str_temp); break;
				case "Y": var_struct.Y = string(str_temp); break;
				case "O": var_struct.O = string(str_temp); break;
				case "E": var_struct.E = string(str_temp); break;
				case "N": var_struct.N = string(str_temp); break;
				case "H": var_struct.H = string(str_temp); break;
				case "Q": var_struct.Q = string(str_temp); break;
				case "W": var_struct.W = string(str_temp); break;
				case "L": var_struct.L = string(str_temp); break;
			}
			str_temp = "";
			
			#region /* When code sees | in string, then place object */
			if (string_char_at(str, str_pos) == "|")
			{
				//scr_unlock_placable_objects(var_struct.O);
				
				/* Place the object and set its properties in one loop */
				for (i = 0; i <= var_struct.L; i += 1)
				{
					new_obj = instance_create_depth(real(var_struct.X) + real(32 * i), real(var_struct.Y), 0, obj_leveleditor_placed_object);
					if (new_obj)
					{
						new_obj.object = var_struct.O;
						new_obj.easy = var_struct.E;
						new_obj.normal = var_struct.N;
						new_obj.hard = var_struct.H;
						new_obj.second_x = var_struct.Q;
						new_obj.second_y = var_struct.W;
					}
				}
				
				/* Reset the var struct variables after creating the object */
				var_struct.E = 1;var_struct.N = 1;var_struct.H = 1;var_struct.Q = 0;var_struct.W = 0;var_struct.L = 0;
			}
			#endregion /* When code sees | in string, then place object END */
			
			str_pos += 1;
			
		}
		file_text_close(file);
	}
}

function scr_save_custom_level()
{
	if (global.save_custom_level_as_json == true)
	{
		scr_save_custom_level_json();
	}
	else
	{
		scr_save_custom_level_txt();
	}
}

function scr_save_custom_level_json()
{
	with(obj_leveleditor_placed_object)
	{
		scr_set_length_variable();
	}
	
	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
	{
		
		/* Create directory for saving custom levels */
		if (global.level_name != "" && !directory_exists(working_directory + "/custom_levels/" + string(global.level_name))) directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		
		#region /* Save object placement */
		if (global.level_name != "")
		{
			var file = file_text_open_write(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.json"); /* Open file for writing */
		}
		
		var data = [];
		
		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			for (var i = 0; i <= repeat_length; i++)
	        {
	            var obj_data = {
	                X: string(x + 32 * i),
	                Y: string(y),
	                O: string(object),
					
					E: string(easy),
					N: string(normal),
					H: string(hard),
					Q: string(second_x),
					W: string(second_y),
					L: string(repeat_length)
	            };
				
				//* Only add the "E" variable if easy is not true */
		        //if (!easy) obj_data.E = string(easy);
				
		        ///* Only add the "N" variable if normal is not true */
		        //if (!normal) obj_data.N = string(normal);
				
		        ///* Only add the "H" variable if hard is not true */
		        //if (!hard) obj_data.H = string(hard);
				
				//var obj_ids = ds_list_create();
				//ds_list_add(obj_ids, level_object_id.id_spring);
				//ds_list_add(obj_ids, level_object_id.id_door);
				//ds_list_add(obj_ids, level_object_id.id_water_level_change_slow);
				//ds_list_add(obj_ids, level_object_id.id_water_level_change_fast);
				//ds_list_add(obj_ids, level_object_id.id_water_level_change_faster);
				//ds_list_add(obj_ids, level_object_id.id_arrow_sign);
				//ds_list_add(obj_ids, level_object_id.id_arrow_sign_small);
				//ds_list_add(obj_ids, level_object_id.id_water);
				//ds_list_add(obj_ids, level_object_id.id_breathable_water);
				
				//if (ds_list_find_index(obj_ids, object) != -1)
				//{
				//	/* Always save second x AND y for these objects no matter what, even if they are on coordinate 0 */
				//	obj_data.Q = string(second_x);
				//	obj_data.W = string(second_y);
				//}
				//ds_list_destroy(obj_ids);
				
				//if (repeat_length >= 1) /* Only save "L" if length variable is 1 or above */
				//{
				//	obj_data.L = string(repeat_length);
				//}
				
	            data[array_length_1d(data)] = obj_data;
	        }
		}
		#endregion /* Write all objects to file END */
		
		var json_string = json_stringify(data);
		file_text_write_string(file, json_string); /* Write string with wall information to file and start a new line */
		file_text_close(file);
		#endregion /* Save object placement END */
		
		scr_save_level_information(); /* At the very end when saving a custom level, save the level information */
	}
	#endregion /* Save Custom Level END */
	
}

function scr_save_custom_level_txt()
{
	with(obj_leveleditor_placed_object)
	{
		scr_set_length_variable();
	}
	
	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
	{
		
		/* Create directory for saving custom levels */
		if (global.level_name != "" && !directory_exists(working_directory + "/custom_levels/" + string(global.level_name))) directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		
		#region /* Save object placement */
		var file, str;
		if (global.level_name != "")
		{
			file = file_text_open_write(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_placement_all.txt"); /* Open file for writing */
		}
		str = ""; /* Reset string var */
		
		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			if (!easy && !normal && !hard){instance_destroy();}
			
			if (repeat_length >= 0) /* Only save object if length variable is 0 or above */
			{
				str += string(x) + "X" + string(y) + "Y" + string(object) + "O";
				
				var difficulties = ds_list_create();
				if (easy == false) ds_list_add(difficulties, "E");
				if (normal == false) ds_list_add(difficulties, "N");
				if (hard == false) ds_list_add(difficulties, "H");

				for (var i = 0; i < ds_list_size(difficulties); i++) {
					str += string(difficulties[| i]);
				}
				
				var obj_ids = ds_list_create();
				ds_list_add(obj_ids, level_object_id.id_spring);
				ds_list_add(obj_ids, level_object_id.id_door);
				ds_list_add(obj_ids, level_object_id.id_water_level_change_slow);
				ds_list_add(obj_ids, level_object_id.id_water_level_change_fast);
				ds_list_add(obj_ids, level_object_id.id_water_level_change_faster);
				ds_list_add(obj_ids, level_object_id.id_arrow_sign);
				ds_list_add(obj_ids, level_object_id.id_arrow_sign_small);
				ds_list_add(obj_ids, level_object_id.id_water);
				ds_list_add(obj_ids, level_object_id.id_breathable_water);
				
				if (ds_list_find_index(obj_ids, object) != -1)
				{
					/* Always save second x AND y for these objects no matter what, even if they are on coordinate 0 */
					str += string(second_x) + "Q";
					str += string(second_y) + "W";
				}
				
				ds_list_destroy(obj_ids);
				
				if (repeat_length >= 1) /* Only save "L" if length variable is 1 or above */
				{
					str += string(repeat_length) + "L";
				}
				str += "|";
			}
		}
		#endregion /* Write all objects to file END */
		
		file_text_write_string(file, str); /* Write string with wall information to file and start a new line */
		file_text_close(file);
		#endregion /* Save object placement END */
		
		scr_save_level_information(); /* At the very end when saving a custom level, save the level information */
	}
	#endregion /* Save Custom Level END */
	
}

function scr_save_level_information()
{
	
	#region /* Save Level Information */
	if (global.level_name != "")
	{
		ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		if (!ini_key_exists("info", "first_created_on_version"))
		{
			ini_write_string("info", "first_created_on_version", "v" + string(scr_get_build_date()));
		}
		ini_write_string("info", "level_name", global.level_name);
		ini_write_string("info", "username", global.username);
		ini_write_real("info", "clear_check", false);
		ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			
		var player_starts = [		[obj_level_player_1_start, "level_player_1_start"],
			[obj_level_player_2_start, "level_player_2_start"],
			[obj_level_player_3_start, "level_player_3_start"],
			[obj_level_player_4_start, "level_player_4_start"]
		];
		for (var i = 0; i < array_length_1d(player_starts); i++)
		{
			var player_start = player_starts[i];
			ini_write_real("info", player_start[1] + "_x", player_start[0].x);
			ini_write_real("info", player_start[1] + "_y", player_start[0].y);
		}
			
		ini_write_real("info", "level_end_x", obj_level_end.x);
		ini_write_real("info", "level_end_y", obj_level_end.y);
		ini_write_real("info", "level_height", obj_level_height.y);
		ini_write_real("info", "level_width", obj_level_width.x);
		ini_write_real("info", "water_level_height", obj_water_level_height.y);
			
		ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
		ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
		ini_write_real("info", "default_view_height", global.default_view_height);
		ini_write_real("info", "default_view_width", global.default_view_width);
		ini_write_real("info", "deactivate_objects_from_most_zoomed_out", global.deactivate_objects_from_most_zoomed_out);
		ini_write_real("info", "rain", global.rain);
		ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
		ini_write_real("info", "time_countdown", global.time_countdown);
			
		#region /* Save Custom Background Settings */
			
		#region /* Save Custom Backgrounds Offset */
		ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", custom_background_1_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", custom_background_1_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", custom_background_2_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", custom_background_2_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", custom_background_3_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", custom_background_3_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", custom_background_4_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", custom_background_4_y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_1_x_offset", obj_foreground1.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_1_y_offset", obj_foreground1.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_x_offset", obj_foreground_above_static_objects.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_y_offset", obj_foreground_above_static_objects.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_2_x_offset", obj_foreground2.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_2_y_offset", obj_foreground2.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", obj_foreground_secret.x);
		ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", obj_foreground_secret.y);
		#endregion /* Save Custom Backgrounds Offset END */
			
		#region /* Save Custom Backgrounds Parallax */
		ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", custom_background_1_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", custom_background_1_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", custom_background_2_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", custom_background_2_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", custom_background_3_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", custom_background_3_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", custom_background_4_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", custom_background_4_y_parallax);
		#endregion /* Save Custom Backgrounds Parallax END */
			
		#region /* Save Custom Backgrounds Scale */
		ini_write_real("Custom Backgrounds", "custom_background_1_x_scale", custom_background_1_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background_1_y_scale", custom_background_1_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background_2_x_scale", custom_background_2_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background_2_y_scale", custom_background_2_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background_3_x_scale", custom_background_3_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background_3_y_scale", custom_background_3_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background_4_x_scale", custom_background_4_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background_4_y_scale", custom_background_4_y_scale);
		#endregion /* Save Custom Backgrounds Scale END */
			
		#region /* Save Custom Backgrounds Tiled */
		ini_write_real("Custom Backgrounds", "custom_background_1_htiled", custom_background_1_htiled);
		ini_write_real("Custom Backgrounds", "custom_background_1_vtiled", custom_background_1_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background_2_htiled", custom_background_2_htiled);
		ini_write_real("Custom Backgrounds", "custom_background_2_vtiled", custom_background_2_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background_3_htiled", custom_background_3_htiled);
		ini_write_real("Custom Backgrounds", "custom_background_3_vtiled", custom_background_3_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background_4_htiled", custom_background_4_htiled);
		ini_write_real("Custom Backgrounds", "custom_background_4_vtiled", custom_background_4_vtiled);
		#endregion /* Save Custom Backgrounds Tiled END */
			
		#endregion /* Save Custom Background Settings END */
			
		ini_close();
	}
	#endregion /* Save Level Information END */
	
}