function scr_save_custom_level()
{
	deactivate_timer = -60;
	instance_activate_all(); /* Make sure all objects are activated before saving */
	
	with(obj_leveleditor_placed_object)
	{
		scr_set_length_variable();
	}
	
	#region /* Save Custom Level */
	if (global.character_select_in_this_menu == "level_editor") /* Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData */
	{
		
		#region /* Create directory for saving custom levels */
		if (global.level_name != "")
		and (!directory_exists(working_directory + "/custom_levels/" + string(global.level_name)))
		{
			directory_create(working_directory + "/custom_levels/" + string(global.level_name));
		}
		#endregion /* Create directory for saving custom levels END */
		
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
			if (easy == false)
			and (normal == false)
			and (hard == false)
			{
				instance_destroy();
			}
			
			if (repeat_length >= 0) /* Only save object if length variable is 0 or above */
			{
				str += string(x) + "X" + string(y) + "Y" + string(object) + "O";
				
				if (easy == false)
				{
					str += string(easy) + "E";
				}
				if (normal == false)
				{
					str += string(normal) + "N";
				}
				if (hard == false)
				{
					str += string(hard) + "H";
				}
				
				if (object == level_object_id.id_spring)
				or (object == level_object_id.id_door)
				or (object == level_object_id.id_water_level_change_slow)
				or (object == level_object_id.id_water_level_change_fast)
				or (object == level_object_id.id_water_level_change_faster)
				or (object == level_object_id.id_arrow_sign)
				or (object == level_object_id.id_arrow_sign_small)
				or (object == level_object_id.id_water)
				{
					/* Always save second x AND y for these objects no matter what, even if they are on coordinate 0 */
					str += string(second_x) + "Q";
					str += string(second_y) + "W";
				}
				
				if (repeat_length >= 1) /* Only save "L" if length variable is 1 or above */
				{
					str += string(repeat_length) + "L";
				}
				
				/* | = chr("124") */
				str += "|";
			}
		}
		#endregion /* Write all objects to file END */
		
		file_text_write_string(file, str); /* Write string with wall information to file and start a new line */
		file_text_close(file);
		#endregion /* Save object placement END */
		
		#region /* Save Level Information */
		if (global.level_name != "")
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		}
		if (!ini_key_exists("info", "first_created_on_version")) /* Check if there isn't already a version number saved. Only save this information once, so the number never changes */
		{
			ini_write_string("info", "first_created_on_version", "v" + string(scr_get_build_date()));
		}
		ini_write_string("info", "account_name", global.account_name);
		ini_write_real("info", "clear_check", false); /* When saving custom level, then the player has to do a clear check all over again, to ensure you can't just do a clear check and edit the level afterwards */
		ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
		if (instance_exists(obj_level_player_1_start))
		{
			ini_write_real("info", "level_player_1_start_x", obj_level_player_1_start.x);
		}
		if (instance_exists(obj_level_player_1_start))
		{
			ini_write_real("info", "level_player_1_start_y", obj_level_player_1_start.y);
		}
		if (instance_exists(obj_level_player_2_start))
		{
			ini_write_real("info", "level_player_2_start_x", obj_level_player_2_start.x);
		}
		if (instance_exists(obj_level_player_2_start))
		{
			ini_write_real("info", "level_player_2_start_y", obj_level_player_2_start.y);
		}
		if (instance_exists(obj_level_player_3_start))
		{
			ini_write_real("info", "level_player_3_start_x", obj_level_player_3_start.x);
		}
		if (instance_exists(obj_level_player_3_start))
		{
			ini_write_real("info", "level_player_3_start_y", obj_level_player_3_start.y);
		}
		if (instance_exists(obj_level_player_4_start))
		{
			ini_write_real("info", "level_player_4_start_x", obj_level_player_4_start.x);
		}
		if (instance_exists(obj_level_player_4_start))
		{
			ini_write_real("info", "level_player_4_start_y", obj_level_player_4_start.y);
		}
		if (instance_exists(obj_level_end))
		{
			ini_write_real("info", "level_end_x", obj_level_end.x);
		}
		if (instance_exists(obj_level_end))
		{
			ini_write_real("info", "level_end_y", obj_level_end.y);
		}
		if (instance_exists(obj_level_height))
		{
			ini_write_real("info", "level_height", obj_level_height.y);
		}
		if (instance_exists(obj_level_width))
		{
			ini_write_real("info", "level_width", obj_level_width.x);
		}
		if (instance_exists(obj_water_level_height))
		{
			ini_write_real("info", "water_level_height", obj_water_level_height.y);
		}
		ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
		ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
		
		ini_write_real("info", "default_view_height", global.default_view_height);
		ini_write_real("info", "default_view_width", global.default_view_width);
		ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
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
		if (instance_exists(obj_foreground1))
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_1_x_offset", obj_foreground1.x_offset);
			ini_write_real("Custom Backgrounds", "custom_foreground_1_y_offset", obj_foreground1.y_offset);
		}
		if (instance_exists(obj_foreground_above_static_objects))
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_x_offset", obj_foreground_above_static_objects.x_offset);
			ini_write_real("Custom Backgrounds", "custom_foreground_above_static_objects_y_offset", obj_foreground_above_static_objects.y_offset);
		}
		if (instance_exists(obj_foreground2))
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_2_x_offset", obj_foreground2.x_offset);
			ini_write_real("Custom Backgrounds", "custom_foreground_2_y_offset", obj_foreground2.y_offset);
		}
		if (instance_exists(obj_foreground_secret))
		{
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_x_offset", obj_foreground_secret.x);
			ini_write_real("Custom Backgrounds", "custom_foreground_secret_y_offset", obj_foreground_secret.y);
		}
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
		#endregion /* Save Level Information END */
		
	}
	#endregion /* Save Custom Level END */
	
}