/* THIS IS LOADING JSON FILE */
function scr_load_object_placement_json()
{
	var load_main_game_level = true;
	if (global.character_select_in_this_menu == "main_game" || global.create_level_from_template)
	{
		load_main_game_level = true;
	}
	else
	{
		load_main_game_level = false;
		if (global.level_name != "")
		{
			var directories = ["background", "data", "sound", "tilesets"];
			for (var i = 0; i < array_length_1d(directories); i++)
			{
				var dir_path = global.use_cache_or_working + "custom_levels/" + global.level_name + "/" + directories[i];
				if (!directory_exists(dir_path))
					directory_create(dir_path);
			}
		}
	}
	
	var file_path = "";
	if (load_main_game_level)
		file_path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.json";
	else if (global.level_name != "")
		file_path = global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/object_placement_all.json";
	
	if (file_exists(file_path))
	{
		var var_struct = {X : 0, Y : 0, O : 0, E : 1, N : 1, H : 1, Q : 0, W : 0, L : 0};
		/*
			X = x position
			Y = y position
			O = object
			E = easy difficulty layer
			N = normal difficulty layer
			H = hard difficulty layer
			Q = custom value 1
			W = custom value 2
			L = length repetition
		*/
		var placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
		var file = file_text_open_read(file_path)
		var json_string = file_text_read_string(file);
		file_text_close(file);
		
		var data = json_parse(json_string);
		
		for (var i = 0; i < array_length(data); i++)
		{
			var_struct = data[i];
			ds_list_add(placed_objects_list, var_struct.O);
			
			if variable_struct_exists(var_struct, "L")
			{
				for (var j = 0; j <= var_struct.L; j += 1)
				{
					new_obj = instance_create_depth(real(var_struct.X) + real(32 * j), real(var_struct.Y), 0, obj_leveleditor_placed_object);
					if (new_obj)
					{
						new_obj.object = var_struct.O;
						
						if variable_struct_exists(var_struct, "E") new_obj.easy = var_struct.E else new_obj.easy = 1;
						if variable_struct_exists(var_struct, "N") new_obj.normal = var_struct.N else new_obj.normal = 1;
						if variable_struct_exists(var_struct, "H") new_obj.hard = var_struct.H else new_obj.hard = 1;
						if variable_struct_exists(var_struct, "Q") new_obj.second_x = var_struct.Q else new_obj.second_x = 0;
						if variable_struct_exists(var_struct, "W") new_obj.second_y = var_struct.W else new_obj.second_y = 0;
					}
				}
			}
			else
			{
				new_obj = instance_create_depth(real(var_struct.X), real(var_struct.Y), 0, obj_leveleditor_placed_object);
				if (new_obj)
				{
					new_obj.object = var_struct.O;
						
					if variable_struct_exists(var_struct, "E") new_obj.easy = var_struct.E else new_obj.easy = 1;
					if variable_struct_exists(var_struct, "N") new_obj.normal = var_struct.N else new_obj.normal = 1;
					if variable_struct_exists(var_struct, "H") new_obj.hard = var_struct.H else new_obj.hard = 1;
					if variable_struct_exists(var_struct, "Q") new_obj.second_x = var_struct.Q else new_obj.second_x = 0;
					if variable_struct_exists(var_struct, "W") new_obj.second_y = var_struct.W else new_obj.second_y = 0;
				}
			}
			/* Reset the var struct variables after creating the object */
			var_struct.E = 1;var_struct.N = 1;var_struct.H = 1;var_struct.Q = 0;var_struct.W = 0;var_struct.L = 0;
		}
		
		#region /* Save unlockable objects, only if the file exists */
		/* Open the INI file */
		if (file_exists(working_directory + "save_file/file" + string(global.file) + ".ini")) /* Check if the file even exists before opening, otherwise game doesn't function properly */
		{
			ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
			
			/* Iterate over the ds_list and write each element to the INI file */
			for (var i = 0; i < ds_list_size(placed_objects_list); i++) {
				var value = ds_list_find_value(placed_objects_list, i);
				if (!ini_key_exists("Unlock Placable Objects", value))
				{
					/* Only write to the INI file if it exists and the object is not already unlocked */
					ini_write_real("Unlock Placable Objects", value, true);
				}
			}
			
			/* Close the INI file */
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		ds_list_destroy(placed_objects_list);
		#endregion /* Save unlockable objects, only if the file exists END */
		
	}
}

/* THIS IS SAVING .JSON FILE */
function scr_save_custom_level_json()
{
	global.create_level_from_template = false; /* Set this variable to false, so that the level can properly save and load after you have loaded a template level */
	
	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
	{
		
		/* Create directory for saving custom levels */
		if (!global.automatically_play_downloaded_level && global.level_name != "" && !file_exists(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini")) directory_create(working_directory + "custom_levels/" + global.level_name);
		
		var file
		
		#region /* Save object placement */
		if (global.level_name != "")
		{
			file = file_text_open_write(working_directory + "custom_levels/" + global.level_name + "/data/object_placement_all.json"); /* Open file for writing */
		}
		
		var data = [];
		global.max_length_iterations = room_width div 32;
		
		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			scr_set_length_variable();
			if (repeat_length >= 0) /* Only save object if length variable is 0 or above */
			{
				var obj_data = {
		            X: string(x),
		            Y: string(y),
		            O: string(object),
		        };
				
				/* Only add the "E" variable if easy is not true */
			    if (!easy) obj_data.E = string(easy);
				
			    /* Only add the "N" variable if normal is not true */
			    if (!normal) obj_data.N = string(normal);
				
			    /* Only add the "H" variable if hard is not true */
			    if (!hard) obj_data.H = string(hard);
				
				var obj_ids = ds_list_create();
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_DOOR);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ARROW_SIGN);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_LAVA);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BREATHABLE_WATER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_SIGN_READABLE);
				
				if (ds_list_find_index(obj_ids, object) != -1)
				{
					/* Always save second x AND y for these objects no matter what, even if they are on coordinate 0 */
					obj_data.Q = string(second_x);
					obj_data.W = string(second_y);
				}
				ds_list_destroy(obj_ids);
				
				if (repeat_length >= 1) /* Only save "L" if length variable is 1 or above */
				{
					obj_data.L = string(repeat_length);
				}
				
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

/* THIS IS SAVING ADDITIONAL LEVEL INFORMATION IN A .INI FILE */
function scr_save_level_information()
{
	
	#region /* Save Level Information */
	if (global.level_name != "")
	&& (!global.create_level_from_template) /* Don't save when you are creating a level from template, as it will incorrectly create a "levels" folder in Local AppData */
	{
		ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
		if (!ini_key_exists("info", "first_created_on_version"))
		{
			ini_write_string("info", "first_created_on_version", "v" + scr_get_build_date());
		}
		ini_write_string("info", "level_name", global.level_name);
		ini_write_string("info", "username", global.username);
		ini_write_real("info", "clear_check", false);
		ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
			
		var player_starts = [		[obj_level_player1_start, "level_player1_start"],
			[obj_level_player2_start, "level_player2_start"],
			[obj_level_player3_start, "level_player3_start"],
			[obj_level_player4_start, "level_player4_start"]
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
		ini_write_real("info", "rain", global.rain);
		ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
		ini_write_real("info", "time_countdown", global.time_countdown);
		
		#region /* Reset Fastest Time and Score */
		ini_key_delete("rank", "rank_timeattack_millisecond");
		ini_key_delete("rank", "rank_timeattack_second");
		ini_key_delete("rank", "rank_timeattack_minute");
		ini_key_delete("rank", "rank_timeattack_realmillisecond");
		ini_key_delete("rank", "rank_level_score");
		#endregion /* Reset Fastest Time and Score END */
		
		#region /* Save Custom Background Settings */
		
		#region /* Save Custom Backgrounds Offset */
		ini_write_real("Custom Backgrounds", "custom_background1_x_offset", custom_background1_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background1_y_offset", custom_background1_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background2_x_offset", custom_background2_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background2_y_offset", custom_background2_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background3_x_offset", custom_background3_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background3_y_offset", custom_background3_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background4_x_offset", custom_background4_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background4_y_offset", custom_background4_y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground1_x_offset", obj_foreground1.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground1_y_offset", obj_foreground1.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground1_5_x_offset", obj_foreground1_5.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground1_5_y_offset", obj_foreground1_5.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground2_x_offset", obj_foreground2.x_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground2_y_offset", obj_foreground2.y_offset);
		ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", obj_foreground_secret.x);
		ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", obj_foreground_secret.y);
		#endregion /* Save Custom Backgrounds Offset END */
		
		#region /* Save Custom Backgrounds Parallax */
		ini_write_real("Custom Backgrounds", "custom_background1_x_parallax", custom_background1_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background1_y_parallax", custom_background1_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background2_x_parallax", custom_background2_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background2_y_parallax", custom_background2_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background3_x_parallax", custom_background3_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background3_y_parallax", custom_background3_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background4_x_parallax", custom_background4_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background4_y_parallax", custom_background4_y_parallax);
		#endregion /* Save Custom Backgrounds Parallax END */
		
		#region /* Save Custom Backgrounds Scale */
		ini_write_real("Custom Backgrounds", "custom_background1_x_scale", custom_background1_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background1_y_scale", custom_background1_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background2_x_scale", custom_background2_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background2_y_scale", custom_background2_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background3_x_scale", custom_background3_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background3_y_scale", custom_background3_y_scale);
		ini_write_real("Custom Backgrounds", "custom_background4_x_scale", custom_background4_x_scale);
		ini_write_real("Custom Backgrounds", "custom_background4_y_scale", custom_background4_y_scale);
		#endregion /* Save Custom Backgrounds Scale END */
		
		#region /* Save Custom Backgrounds Tiled */
		ini_write_real("Custom Backgrounds", "custom_background1_htiled", custom_background1_htiled);
		ini_write_real("Custom Backgrounds", "custom_background1_vtiled", custom_background1_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background2_htiled", custom_background2_htiled);
		ini_write_real("Custom Backgrounds", "custom_background2_vtiled", custom_background2_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background3_htiled", custom_background3_htiled);
		ini_write_real("Custom Backgrounds", "custom_background3_vtiled", custom_background3_vtiled);
		ini_write_real("Custom Backgrounds", "custom_background4_htiled", custom_background4_htiled);
		ini_write_real("Custom Backgrounds", "custom_background4_vtiled", custom_background4_vtiled);
		#endregion /* Save Custom Backgrounds Tiled END */
		
		#endregion /* Save Custom Background Settings END */
		
		ini_close();
		
		/* Update custom level save data */
		ini_open(working_directory + "save_file/custom_level_save.ini");
		ini_key_delete(global.level_name, "checkpoint_x");
		ini_key_delete(global.level_name, "checkpoint_y");
		ini_key_delete(global.level_name, "checkpoint_millisecond");
		ini_key_delete(global.level_name, "checkpoint_second");
		ini_key_delete(global.level_name, "checkpoint_minute");
		ini_key_delete(global.level_name, "checkpoint_realmillisecond");
		ini_key_delete(global.level_name, "checkpoint_direction");
		ini_close();
		
		#region /* Unlocked objects should be set as not recently unlocked anymore */
		/* Open the INI file */
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
		
		/* Iterate over the ds_list and write each element to the INI file */
		for (var i = 0; i < ds_list_size(placed_objects_list); i++) {
			var value = ds_list_find_value(placed_objects_list, i);
			ini_write_real("Unlock Placable Objects", value, 2);
		}
		
		/* Close the INI file */
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		ds_list_destroy(placed_objects_list);
		placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
		#endregion /* Unlocked objects should be set as not recently unlocked anymore END */
		
	}
	#endregion /* Save Level Information END */
	
}