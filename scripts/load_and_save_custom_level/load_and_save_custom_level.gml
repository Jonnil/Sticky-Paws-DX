#region /* THIS IS LOADING JSON FILE */
function scr_load_object_placement_json()
{
	/* Initialize flag for determining which level type to load */
	var load_main_game_level = true;

	/* Check if we are in the main game or creating a level from a template */
	if (global.character_select_in_this_menu == "main_game"
	|| global.create_level_from_template)
	{
		load_main_game_level = true;
	}
	else
	{
		load_main_game_level = false;

		/* Ensure directories exist for custom levels if level name is set */
		if (string(global.level_name) != "")
		{
			var directories = ["background", "data", "sound", "tilesets"];
			var base_path = global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/";

			for (var i = 0; i < array_length(directories); i++)
			{
				var dir_path = base_path + directories[i];

				if (!directory_exists(dir_path))
				{
					directory_create(dir_path);
				}
			}
		}
	}

	/* Determine file path based on the level type */
	var file_path = "";

	if (load_main_game_level)
	{
		file_path = "levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/object_placement_all.json";
	}
	else
	if (string(global.level_name) != "")
	{
		file_path = global.use_temp_or_working + "custom_levels/" + string(global.level_name) + "/data/object_placement_all.json";
	}

	/* Load object placement data if the file exists */
	if (file_exists(file_path))
	{
		/* Define object structure */
		var var_struct = {
			X: 0, Y: 0, O: 0, E: 1, N: 1, H: 1, Q: 0, W: 0, I: 0, L: 0
		};

		/*
			Object Structure Explanation:
			X = x position
			Y = y position
			O = object
			E = easy difficulty layer
			N = normal difficulty layer
			H = hard difficulty layer
			Q = custom value 1 (second x)
			W = custom value 2 (second y)
			I = item inside
			L = length repetition
		*/

		/* Create a DS list to hold placed objects */
		var placed_objects_list = ds_list_create();
		var file = file_text_open_read(file_path);
		var json_string = file_text_read_string(file);
		file_text_close(file); /* Don't commit the save data on Switch, this is only temporary! */

		var online_content_metadata = json_parse(json_string); /* Parse the JSON response containing metadata for each available online content */

		/* Iterate over JSON data to create objects */
		for (var i = 0; i < array_length(online_content_metadata); i++)
		{
			var_struct = online_content_metadata[i];
			ds_list_add(placed_objects_list, var_struct.O);

			/* Handle object repetition */
			if (variable_struct_exists(var_struct, "L"))
			{
				for (var j = 0; j <= var_struct.L; j++)
				{
					var new_obj = instance_create_depth(
						real(var_struct.X) + (32 * j),
						real(var_struct.Y),
						0,
						obj_leveleditor_placed_object
					);

					if (new_obj)
					{
						new_obj.object = var_struct.O;
						new_obj.easy = variable_struct_exists(var_struct, "E") ? var_struct.E : 1;
						new_obj.normal = variable_struct_exists(var_struct, "N") ? var_struct.N : 1;
						new_obj.hard = variable_struct_exists(var_struct, "H") ? var_struct.H : 1;
						new_obj.second_x = variable_struct_exists(var_struct, "Q") ? var_struct.Q : 0;
						new_obj.second_y = variable_struct_exists(var_struct, "W") ? var_struct.W : 0;
						new_obj.item_inside = variable_struct_exists(var_struct, "I") ? var_struct.I : 0;
					}
				}
			}
			else
			{
				var new_obj = instance_create_depth(
					real(var_struct.X),
					real(var_struct.Y),
					0,
					obj_leveleditor_placed_object
				);

				if (new_obj)
				{
					new_obj.object = var_struct.O;
					new_obj.easy = variable_struct_exists(var_struct, "E") ? var_struct.E : 1;
					new_obj.normal = variable_struct_exists(var_struct, "N") ? var_struct.N : 1;
					new_obj.hard = variable_struct_exists(var_struct, "H") ? var_struct.H : 1;
					new_obj.second_x = variable_struct_exists(var_struct, "Q") ? var_struct.Q : 0;
					new_obj.second_y = variable_struct_exists(var_struct, "W") ? var_struct.W : 0;
					new_obj.item_inside = variable_struct_exists(var_struct, "I") ? var_struct.I : 0;
				}
			}

			/* Reset the var struct variables after processing each object */
			var_struct.E = 1;
			var_struct.N = 1;
			var_struct.H = 1;
			var_struct.Q = 0;
			var_struct.W = 0;
			var_struct.I = 0;
			var_struct.L = 0;
		}

		/* Save unlockable objects if the file exists */
		#region /* Save unlockable objects */
		var save_path = game_save_id + "save_file/file" + string(global.file) + ".ini";
		if (file_exists(save_path))
		{
			/* Open the INI file */
			ini_open(save_path);

			/* Iterate over the ds_list and write each element to the INI file */
			for (var i = 0; i < ds_list_size(placed_objects_list); i++)
			{
				var value = ds_list_find_value(placed_objects_list, i);
				/* Only write to the INI file if it exists and the object is not already unlocked */
				if (!ini_key_exists("Unlock Placable Objects", value))
				{
					ini_write_real("Unlock Placable Objects", value, true);
					ini_write_real("Player", "placable_object_unlock_notify", true);
				}
			}

			/* Close the INI file */
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		ds_list_destroy(placed_objects_list);
		#endregion /* Save unlockable objects END */

	}
}
#endregion /* THIS IS LOADING JSON FILE END */

#region /* THIS IS SAVING .JSON FILE */
function scr_save_custom_level_json()
{
	global.create_level_from_template = false; /* Set this variable to false, so that the level can properly save and load after you have loaded a template level */

	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
	{

		/* The path I actually want to create. Can't create this directory on Switch because there are a directory inside the directory */
		var custom_levels_path = game_save_id + "custom_levels/" + string(global.level_name);

		if (!global.automatically_play_downloaded_level
		&& string(global.level_name) != ""
		&& !file_exists(custom_levels_path + "/data/object_placement_all.json"))
		{
			directory_create(custom_levels_path); /* Create directory for saving custom levels */
		}

		if (directory_exists(custom_levels_path))
		{
			show_debug_message(string(custom_levels_path) + " Directory Exists");
		}
		else
		{
			show_debug_message(string(custom_levels_path) + " Directory Missing");
		}

		#region /* Save object placement */
		var file

		if (string(global.level_name) != "")
		{
			file = file_text_open_write(custom_levels_path + "/data/object_placement_all.json"); /* Open file for writing */
		}

		var online_content_metadata = [];

		if (global.can_save_length_variable && instance_exists(obj_level_width))
		{
			global.max_length_iterations = obj_level_width.x div 32;
		}

		#region /* Write all objects to file */
		with(obj_leveleditor_placed_object)
		{
			scr_set_length_variable();

			if (repeat_length >= 0) /* Only save object if length variable is 0 or above */
			{
				var obj_data =
				{
					X: string(x),
					Y: string(y),
					O: string(object),
				};

				if (!easy){obj_data.E = string(easy);} /* Only add the "E" variable if easy is not true */
				if (!normal){obj_data.N = string(normal);} /* Only add the "N" variable if normal is not true */
				if (!hard){obj_data.H = string(hard);} /* Only add the "H" variable if hard is not true */

				#region /* Save second x and second y variables */
				var obj_ids = ds_list_create();
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_DOOR);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_DOOR_LOCKED);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ARROW_SIGN);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_WATER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_LAVA);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BREATHABLE_WATER);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_SIGN_READABLE);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_CHECKPOINT);

				if (ds_list_find_index(obj_ids, object) != -1)
				{
					/* Always save second x AND y for these objects no matter what, even if they are on coordinate 0 */
					obj_data.Q = string(second_x);
					obj_data.W = string(second_y);
				}
				ds_list_destroy(obj_ids);
				#endregion /* Save second x and second y variables END */

				#region /* Save item inside variables */
				var obj_ids = ds_list_create();
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_QUESTION_BLOCK);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BRICK_BLOCK);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_MELON_BLOCK);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BUCKET);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_CHECKPOINT);

				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BASIC_ENEMY);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_ENEMY_VENGEFUL_SPIRIT);
				ds_list_add(obj_ids, LEVEL_OBJECT_ID.ID_BOSS);

				if (ds_list_find_index(obj_ids, object) != -1)
				{
					obj_data.I = string(item_inside);
				}

				ds_list_destroy(obj_ids);
				#endregion /* Save item inside variables END */

				if (repeat_length >= 1) /* Only save "L" if length variable is 1 or above */
				{
					obj_data.L = string(repeat_length);
				}

				online_content_metadata[array_length(online_content_metadata)] = obj_data;
			}
		}
		#endregion /* Write all objects to file END */

		var json_string = json_stringify(online_content_metadata);
		show_debug_message("SAVE OBJECT PLACEMENT");
		file_text_write_string(file, json_string); /* Write string with wall information to file and start a new line */
		file_text_close(file); /* Don't commit the save data on Switch, this is only temporary! The commit happens in "scr save level information" */
		#endregion /* Save object placement END */

		scr_save_level_information(); /* At the very end when saving a custom level, save the level information */
	}
	#endregion /* Save Custom Level END */

}
#endregion /* THIS IS SAVING .JSON FILE END */

#region /* THIS IS SAVING ADDITIONAL LEVEL INFORMATION IN A .INI FILE */
function scr_save_level_information()
{

	#region /* Save Level Information */
	if (string(global.level_name) != "")
	&& (!global.create_level_from_template) /* Don't save when you are creating a level from template, as it will incorrectly create a "levels" folder in Local AppData */
	{
		show_debug_message("SAVE LEVEL INFORMATION");
		ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");

		ini_write_real("info", "part_limit_entity", global.part_limit_entity); /* Save how many entity objects have been placed in the level, so you can't lag the game with too many objects with lots of code */

		#region /* Save what selected object you were using most recent in the specific level */
		ini_write_real("info", "place_object", place_object);
		ini_write_real("info", "selected_object", selected_object);
		ini_write_real("info", "select_object_menu_actual_x", select_object_menu_actual_x);
		ini_write_string("info", "current_object_category", current_object_category); /* Seperate objects into different categories, to make objects easier to find */
		ini_write_real("info", "selected_object_sprite", sprite_index);
		#endregion /* Save what selected object you were using most recent in the specific level END */

		if (!ini_key_exists("info", "first_created_on_version"))
		{
			ini_write_string("info", "first_created_on_version", "v" + scr_get_build_date());
		}

		#region /* Save what date this level was first created in */
		if (!ini_key_exists("info", "first_created_on_date_year")) /* Save what year this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_year", date_get_year(date_current_datetime()));
		}
		if (!ini_key_exists("info", "first_created_on_date_month")) /* Save what month this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_month", date_get_month(date_current_datetime()));
		}
		if (!ini_key_exists("info", "first_created_on_date_day")) /* Save what day this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_day", date_get_day(date_current_datetime()));
		}
		if (!ini_key_exists("info", "first_created_on_date_hour")) /* Save what hour this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_hour", date_get_hour(date_current_datetime()));
		}
		if (!ini_key_exists("info", "first_created_on_date_minute")) /* Save what minute this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_minute", date_get_minute(date_current_datetime()));
		}
		if (!ini_key_exists("info", "first_created_on_date_second")) /* Save what second this level was first created in */
		{
			ini_write_real("info", "first_created_on_date_second", date_get_second(date_current_datetime()));
		}
		#endregion /* Save what date this level was first created in END */

		if (!ini_key_exists("info", "first_created_on_os_type"))
		{
			ini_write_real("info", "first_created_on_os_type", os_type);
		}

		if (!ini_key_exists("info", "level_name"))
		{
			show_debug_message("[scr_save_level_information] No level name was found in 'level information'! Save level name to custom level as: " + string(global.level_name));
			ini_write_string("info", "level_name", string(global.level_name));
		}
		ini_write_string("info", "username", string(global.username));
		ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);

		var player_starts = [        [obj_level_player1_start, "level_player1_start"],
			[obj_level_player2_start, "level_player2_start"],
			[obj_level_player3_start, "level_player3_start"],
			[obj_level_player4_start, "level_player4_start"]
		];
		for(var i = 0; i < array_length(player_starts); i++)
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
		ini_write_real("info", "rain", global.effect_rain);
		ini_write_real("info", "snow", global.effect_snow);
		ini_write_real("info", "wind", global.effect_wind);
		ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
		ini_write_real("info", "time_countdown", global.time_countdown);
		ini_write_real("info", "autoscroll_speed_x", autoscroll_speed_x);
		ini_write_real("info", "autoscroll_speed_y", autoscroll_speed_y);

		#region /* Reset Fastest Time and Score */
		ini_key_delete("rank", "rank_timeattack_millisecond");
		ini_key_delete("rank", "rank_timeattack_second");
		ini_key_delete("rank", "rank_timeattack_minute");
		ini_key_delete("rank", "rank_timeattack_realmillisecond");
		ini_key_delete("rank", "rank_level_score");
		ini_key_delete("rank", "rank_current_attempt_minute");
		#endregion /* Reset Fastest Time and Score END */

		#region /* Save Custom Background Settings */

		#region /* Save if any custom background exist at all */
		if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.jpeg"))

		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.png"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.gif"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.jpg"))
		|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.jpeg"))
		{
			ini_write_real("info", "level_has_custom_background", true);
		}
		else
		{
			ini_write_real("info", "level_has_custom_background", false);
		}
		#endregion /* Save if any custom background exist at all END */

		#region /* Save Custom Backgrounds Offset */
		ini_write_real("Custom Backgrounds", "custom_background1_x_offset", custom_background_x_offset[1]);
		ini_write_real("Custom Backgrounds", "custom_background1_y_offset", custom_background_y_offset[1]);
		ini_write_real("Custom Backgrounds", "custom_background2_x_offset", custom_background_x_offset[2]);
		ini_write_real("Custom Backgrounds", "custom_background2_y_offset", custom_background_y_offset[2]);
		ini_write_real("Custom Backgrounds", "custom_background3_x_offset", custom_background_x_offset[3]);
		ini_write_real("Custom Backgrounds", "custom_background3_y_offset", custom_background_y_offset[3]);
		ini_write_real("Custom Backgrounds", "custom_background_x_offset[4]", custom_background_x_offset[4]);
		ini_write_real("Custom Backgrounds", "custom_background4_y_offset", custom_background_y_offset[4]);
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
		for (var i = 1; i <= 4; i++)
		{
			ini_write_real("Custom Backgrounds", "custom_background" + string(i) + "_x_parallax", custom_background_x_parallax[i]);
			ini_write_real("Custom Backgrounds", "custom_background" + string(i) + "_y_parallax", custom_background_y_parallax[i]);
		}
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
		ini_open(game_save_id + "save_file/custom_level_save.ini");
		ini_key_delete(string(global.level_name), "checkpoint_x");
		ini_key_delete(string(global.level_name), "checkpoint_y");
		ini_key_delete(string(global.level_name), "checkpoint_millisecond");
		ini_key_delete(string(global.level_name), "checkpoint_second");
		ini_key_delete(string(global.level_name), "checkpoint_minute");
		ini_key_delete(string(global.level_name), "checkpoint_realmillisecond");
		ini_key_delete(string(global.level_name), "checkpoint_direction");
		ini_close();

		#region /* Unlocked objects should be set as not recently unlocked anymore */
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini"); /* Open the INI file */

		/* Iterate over the ds_list and write each element to the INI file */
		for(var i = 0; i < ds_list_size(placed_objects_list); i++)
		{
			var value = ds_list_find_value(placed_objects_list, i);
			ini_write_real("Unlock Placable Objects", value, 2);
			ini_write_real("Player", "placable_object_unlock_notify", false);
		}

		/* Close the INI file */
		ini_close();
		ds_list_destroy(placed_objects_list);
		placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
		#endregion /* Unlocked objects should be set as not recently unlocked anymore END */

		switch_save_data_commit(); /* Remember to commit the save data! */
	}
	#endregion /* Save Level Information END */

}
#endregion /* THIS IS SAVING ADDITIONAL LEVEL INFORMATION IN A .INI FILE END */
