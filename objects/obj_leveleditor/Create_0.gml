#region /* Essential code that needs to be initialized */

#region /* Debug toggles */
can_initialize_level_information = true;
can_set_background = true;
can_create_foreground = true;
can_create_water_level = true;
can_load_custom_sprites = true;
#endregion /* Debug toggles END */

#region /* Backgrounds */
if (can_set_background == true)
{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
}
#endregion /* Backgrounds END */

#region /* Essential variables */
global.time_countdown_bonus = 500;
pause = false;
if (global.player1_can_play == true)
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player_1;
}
else
if (global.player2_can_play == true)
{
	camera_player = 1;
	camera_selected_skin = global.skin_for_player_2;
}
else
if (global.player3_can_play == true)
{
	camera_player = 2;
	camera_selected_skin = global.skin_for_player_3;
}
else
if (global.player4_can_play == true)
{
	camera_player = 3;
	camera_selected_skin = global.skin_for_player_4;
}
else
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player_1;
}
#endregion /* Essential variables END */

#region /* Create essential objects so levels can function */

#region /* Create Foreground */
if (can_create_foreground == true)
{
	if (asset_get_type("obj_foreground1") == asset_object)
	and (!instance_exists(obj_foreground1))
	{
		instance_create_depth(0, 0, 0, obj_foreground1);
	}
	if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
	and (!instance_exists(obj_foreground_above_static_objects))
	{
		instance_create_depth(0, 0, 0, obj_foreground_above_static_objects);
	}
	if (asset_get_type("obj_foreground2") == asset_object)
	and (!instance_exists(obj_foreground2))
	{
		instance_create_depth(0, 0, 0, obj_foreground2);
	}
	if (asset_get_type("obj_foreground_secret") == asset_object)
	and (!instance_exists(obj_foreground_secret))
	{
		instance_create_depth(0, 0, 0, obj_foreground_secret);
	}
	
	#region /* Create Background Brightness in Gameplay */
	if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
	and (!instance_exists(obj_background_brightness_gameplay))
	{
		instance_create_depth(x, y, 0, obj_background_brightness_gameplay);
	}
	#endregion /* Create Background Brightness in Gameplay END */
	
}
#endregion /* Create Foreground END */

#region /* Create level height and level width objects */
if (asset_get_type("obj_level_height") == asset_object)
and (!instance_exists(obj_level_height))
{
	instance_create_depth(0, 1104, 0, obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
and (!instance_exists(obj_level_width))
{
	instance_create_depth(2720, 0, 0, obj_level_width);
}
if (can_create_water_level == true)
and (asset_get_type("obj_water_level_height") == asset_object)
and (instance_exists(obj_level_height))
and (!instance_exists(obj_water_level_height))
{
	instance_create_depth(0, obj_level_height.y + 32, 0, obj_water_level_height);
}
#endregion /* Create level height and level width objects END */

#endregion /* Create essential objects so levels can function END */

#region /* Initialize level_information.ini */
if (can_initialize_level_information == true)
and (global.character_select_in_this_menu == "main_game")
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or (can_initialize_level_information == true)
and (global.character_select_in_this_menu == "level_editor")
and (global.create_level_from_template == true)
and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

or (can_initialize_level_information == true)
and (global.character_select_in_this_menu == "level_editor")
and (global.select_level_index <= 0)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or (can_initialize_level_information == true)
and (global.character_select_in_this_menu == "level_editor")
and (global.create_level_from_template >= 2)
and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

or (can_initialize_level_information == true)
and (global.character_select_in_this_menu == "level_editor")
and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
{
	if (global.character_select_in_this_menu == "main_game")
	or (global.create_level_from_template == true)
	{
		ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		can_save_to_level_information = false;
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	and (global.select_level_index <= 0)
	or (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= 2)
	{
		ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		can_save_to_level_information = true;
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		can_save_to_level_information = true;
	}
	
	#region /* Custom Backgrounds */
	
	#region /* Custom Background All Offsets */
	
	#region /* Custom Background 4 x and y offset points */
	#region /* Custom Background 4 y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_offset"))
	{
		custom_background_4_y_offset = ini_read_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		}
		custom_background_4_y_offset = 0;
	}
	#endregion /* Custom Background 4 y offset point END */
	
	#region /* Custom Background 4 x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_offset"))
	{
		custom_background_4_x_offset = ini_read_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		}
		custom_background_4_x_offset = 0;
	}
	#endregion /* Custom Background 4 x offset point END */
	#endregion /* Custom Background 4 x and y offset points END */
	
	#region /* Custom Background 3 x and y offset points */
	#region /* Custom Background 3 y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_offset"))
	{
		custom_background_3_y_offset = ini_read_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		}
		custom_background_3_y_offset = 0;
	}
	#endregion /* Custom Background 3 y offset point END */
	
	#region /* Custom Background 3 x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_offset"))
	{
		custom_background_3_x_offset = ini_read_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		}
		custom_background_3_x_offset = 0;
	}
	#endregion /* Custom Background 3 x offset point END */
	#endregion /* Custom Background 3 x and y offset points END */
	
	#region /* Custom Background 2 x and y offset points */
	#region /* Custom Background 2 y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_offset"))
	{
		custom_background_2_y_offset = ini_read_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		}
		custom_background_2_y_offset = 0;
	}
	#endregion /* Custom Background 2 y offset point END */
	
	#region /* Custom Background 2 x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_offset"))
	{
		custom_background_2_x_offset = ini_read_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		}
		custom_background_2_x_offset = 0;
	}
	#endregion /* Custom Background 2 x offset point END */
	#endregion /* Custom Background 2 x and y offset points END */
	
	#region /* Custom Background 1 x and y offset points */
	#region /* Custom Background 1 y offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_offset"))
	{
		custom_background_1_y_offset = ini_read_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		}
		custom_background_1_y_offset = 0;
	}
	#endregion /* Custom Background 1 y offset point END */
	
	#region /* Custom Background 1 x offset point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_offset"))
	{
		custom_background_1_x_offset = ini_read_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
		}
		custom_background_1_x_offset = 0;
	}
	#endregion /* Custom Background 1 x offset point END */
	#endregion /* Custom Background 1 x and y offset points END */
	
	#endregion /* Custom Background All Offsets END */
	
	#region /* Custom Background All Parallaxs */
	
	#region /* Custom Background 4 x and y parallax points */
	#region /* Custom Background 4 y parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_parallax"))
	{
		custom_background_4_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		}
		custom_background_4_y_parallax = 9;
	}
	#endregion /* Custom Background 4 y parallax point END */
	
	#region /* Custom Background 4 x parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_parallax"))
	{
		custom_background_4_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		}
		custom_background_4_x_parallax = 9;
	}
	#endregion /* Custom Background 4 x parallax point END */
	#endregion /* Custom Background 4 x and y parallax points END */
	
	#region /* Custom Background 3 x and y parallax points */
	#region /* Custom Background 3 y parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_parallax"))
	{
		custom_background_3_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		}
		custom_background_3_y_parallax = 7;
	}
	#endregion /* Custom Background 3 y parallax point END */
	
	#region /* Custom Background 3 x parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_parallax"))
	{
		custom_background_3_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		}
		custom_background_3_x_parallax = 7;
	}
	#endregion /* Custom Background 3 x parallax point END */
	#endregion /* Custom Background 3 x and y parallax points END */
	
	#region /* Custom Background 2 x and y parallax points */
	#region /* Custom Background 2 y parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_parallax"))
	{
		custom_background_2_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		}
		custom_background_2_y_parallax = 5;
	}
	#endregion /* Custom Background 2 y parallax point END */
	
	#region /* Custom Background 2 x parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_parallax"))
	{
		custom_background_2_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		}
		custom_background_2_x_parallax = 5;
	}
	#endregion /* Custom Background 2 x parallax point END */
	#endregion /* Custom Background 2 x and y parallax points END */
	
	#region /* Custom Background 1 x and y parallax points */
	#region /* Custom Background 1 y parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_parallax"))
	{
		custom_background_1_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		}
		custom_background_1_y_parallax = 3;
	}
	#endregion /* Custom Background 1 y parallax point END */
	
	#region /* Custom Background 1 x parallax point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_parallax"))
	{
		custom_background_1_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
		}
		custom_background_1_x_parallax = 3;
	}
	#endregion /* Custom Background 1 x parallax point END */
	#endregion /* Custom Background 1 x and y parallax points END */
	
	#endregion /* Custom Background All Parallaxs END */
	
	#region /* Custom Background All Scales */
	
	#region /* Custom Background 4 x and y scale points */
	#region /* Custom Background 4 y scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_scale"))
	{
		custom_background_4_y_scale = ini_read_real("Custom Backgrounds", "custom_background_4_y_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_y_scale", 1);
		}
		custom_background_4_y_scale = 1;
	}
	#endregion /* Custom Background 4 y scale point END */
	
	#region /* Custom Background 4 x scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_scale"))
	{
		custom_background_4_x_scale = ini_read_real("Custom Backgrounds", "custom_background_4_x_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_x_scale", 1);
		}
		custom_background_4_x_scale = 1;
	}
	#endregion /* Custom Background 4 x scale point END */
	#endregion /* Custom Background 4 x and y scale points END */
	
	#region /* Custom Background 3 x and y scale points */
	#region /* Custom Background 3 y scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_scale"))
	{
		custom_background_3_y_scale = ini_read_real("Custom Backgrounds", "custom_background_3_y_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_y_scale", 1);
		}
		custom_background_3_y_scale = 1;
	}
	#endregion /* Custom Background 3 y scale point END */
	
	#region /* Custom Background 3 x scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_scale"))
	{
		custom_background_3_x_scale = ini_read_real("Custom Backgrounds", "custom_background_3_x_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_x_scale", 1);
		}
		custom_background_3_x_scale = 1;
	}
	#endregion /* Custom Background 3 x scale point END */
	#endregion /* Custom Background 3 x and y scale points END */
	
	#region /* Custom Background 2 x and y scale points */
	#region /* Custom Background 2 y scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_scale"))
	{
		custom_background_2_y_scale = ini_read_real("Custom Backgrounds", "custom_background_2_y_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_y_scale", 1);
		}
		custom_background_2_y_scale = 1;
	}
	#endregion /* Custom Background 2 y scale point END */
	
	#region /* Custom Background 2 x scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_scale"))
	{
		custom_background_2_x_scale = ini_read_real("Custom Backgrounds", "custom_background_2_x_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_x_scale", 1);
		}
		custom_background_2_x_scale = 1;
	}
	#endregion /* Custom Background 2 x scale point END */
	#endregion /* Custom Background 2 x and y scale points END */
	
	#region /* Custom Background 1 x and y scale points */
	#region /* Custom Background 1 y scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_scale"))
	{
		custom_background_1_y_scale = ini_read_real("Custom Backgrounds", "custom_background_1_y_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_y_scale", 1);
		}
		custom_background_1_y_scale = 1;
	}
	#endregion /* Custom Background 1 y scale point END */
	
	#region /* Custom Background 1 x scale point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_scale"))
	{
		custom_background_1_x_scale = ini_read_real("Custom Backgrounds", "custom_background_1_x_scale", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_x_scale", 1);
		}
		custom_background_1_x_scale = 1;
	}
	#endregion /* Custom Background 1 x scale point END */
	#endregion /* Custom Background 1 x and y scale points END */
	
	#endregion /* Custom Background All Scales END */
	
	#region /* Custom Background All Tiled */
	
	#region /* Custom Background 4 htiled and vtiled points */
	#region /* Custom Background 4 vtiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_vtiled"))
	{
		custom_background_4_vtiled = ini_read_real("Custom Backgrounds", "custom_background_4_vtiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_vtiled", 1);
		}
		custom_background_4_vtiled = 1;
	}
	#endregion /* Custom Background 4 vtiled point END */
	
	#region /* Custom Background 4 htiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_4_htiled"))
	{
		custom_background_4_htiled = ini_read_real("Custom Backgrounds", "custom_background_4_htiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_4_htiled", 1);
		}
		custom_background_4_htiled = 1;
	}
	#endregion /* Custom Background 4 htiled point END */
	#endregion /* Custom Background 4 htiled and vtiled points END */
	
	#region /* Custom Background 3 htiled and vtiled points */
	#region /* Custom Background 3 vtiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_vtiled"))
	{
		custom_background_3_vtiled = ini_read_real("Custom Backgrounds", "custom_background_3_vtiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_vtiled", 1);
		}
		custom_background_3_vtiled = 1;
	}
	#endregion /* Custom Background 3 vtiled point END */
	
	#region /* Custom Background 3 htiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_3_htiled"))
	{
		custom_background_3_htiled = ini_read_real("Custom Backgrounds", "custom_background_3_htiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_3_htiled", 1);
		}
		custom_background_3_htiled = 1;
	}
	#endregion /* Custom Background 3 htiled point END */
	#endregion /* Custom Background 3 htiled and vtiled points END */
	
	#region /* Custom Background 2 htiled and vtiled points */
	#region /* Custom Background 2 vtiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_vtiled"))
	{
		custom_background_2_vtiled = ini_read_real("Custom Backgrounds", "custom_background_2_vtiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_vtiled", 1);
		}
		custom_background_2_vtiled = 1;
	}
	#endregion /* Custom Background 2 vtiled point END */
	
	#region /* Custom Background 2 htiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_2_htiled"))
	{
		custom_background_2_htiled = ini_read_real("Custom Backgrounds", "custom_background_2_htiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_2_htiled", 1);
		}
		custom_background_2_htiled = 1;
	}
	#endregion /* Custom Background 2 htiled point END */
	#endregion /* Custom Background 2 htiled and vtiled points END */
	
	#region /* Custom Background 1 htiled and vtiled points */
	#region /* Custom Background 1 vtiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_vtiled"))
	{
		custom_background_1_vtiled = ini_read_real("Custom Backgrounds", "custom_background_1_vtiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_vtiled", 1);
		}
		custom_background_1_vtiled = 1;
	}
	#endregion /* Custom Background 1 vtiled point END */
	
	#region /* Custom Background 1 htiled point */
	if (ini_key_exists("Custom Backgrounds", "custom_background_1_htiled"))
	{
		custom_background_1_htiled = ini_read_real("Custom Backgrounds", "custom_background_1_htiled", 1);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_real("Custom Backgrounds", "custom_background_1_htiled", 1);
		}
		custom_background_1_htiled = 1;
	}
	#endregion /* Custom Background 1 htiled point END */
	#endregion /* Custom Background 1 htiled and vtiled points END */
	
	#endregion /* Custom Background All Tiled END */
	
	#endregion /* Custom Backgrounds END */
	
	#region /* Make every tileset into default tileset */
	if (ini_key_exists("info", "make_every_tileset_into_default_tileset"))
	{
		global.make_every_tileset_into_default_tileset = ini_read_real("info", "make_every_tileset_into_default_tileset", false);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_string("info", "make_every_tileset_into_default_tileset", false);
		}
		global.make_every_tileset_into_default_tileset = false;
	}
	#endregion /* Make every tileset into default tileset END */
	
	#region /* Enable time countdown */
	if (ini_key_exists("info", "enable_time_countdown"))
	{
		global.time_countdown = ini_read_real("info", "enable_time_countdown", false);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_string("info", "enable_time_countdown", false);
		}
		global.enable_time_countdown = false;
	}
	#endregion /* Enable time countdown END */
	
	#region /* Time countdown */
	if (ini_key_exists("info", "time_countdown"))
	{
		global.time_countdown = ini_read_real("info", "time_countdown", 500); /* Set the countdown to whatever is stored in the level_information.ini file */
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_string("info", "time_countdown", 500);
		}
		global.time_countdown = 500;
	}
	#endregion /* Time countdown END */
	
	#region /* Rain */
	if (ini_key_exists("info", "rain"))
	{
		global.rain = ini_read_real("info", "rain", false);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_string("info", "rain", false);
		}
		global.rain = false;
	}
	#endregion /* Rain END */
	
	#region /* Deactivate objects from center */
	if (ini_key_exists("info", "deactivate_objects_from_most_zoomed_out"))
	{
		global.deactivate_objects_from_most_zoomed_out = ini_read_real("info", "deactivate_objects_from_most_zoomed_out", false);
	}
	else
	{
		if (global.character_select_in_this_menu == "level_editor")
		and (can_save_to_level_information == true)
		{
			ini_write_string("info", "deactivate_objects_from_most_zoomed_out", false);
		}
		global.deactivate_objects_from_most_zoomed_out = false;
	}
	#endregion /* Deactivate objects from center END */
	
	if (global.play_edited_level = false)
	and (global.actually_play_edited_level == false)
	{
		camera_set_view_pos(view_camera[view_current], ini_read_real("info", "view_xview", 0), ini_read_real("info", "view_yview", 0)); /* Set camera position on the last positions you had the camera when doing level editing */
		x = ini_read_real("info", "view_xview", 0);
		y = ini_read_real("info", "view_yview", 0);
	}
	
	ini_close();
}
else
{
	custom_background_1_x_offset = 0;
	custom_background_1_y_offset = 0;
	custom_background_2_x_offset = 0;
	custom_background_2_y_offset = 0;
	custom_background_3_x_offset = 0;
	custom_background_3_y_offset = 0;
	custom_background_4_x_offset = 0;
	custom_background_4_y_offset = 0;
	custom_background_1_x_parallax = 3;
	custom_background_1_y_parallax = 3;
	custom_background_2_x_parallax = 5;
	custom_background_2_y_parallax = 5;
	custom_background_3_x_parallax = 7;
	custom_background_3_y_parallax = 7;
	custom_background_4_x_parallax = 9;
	custom_background_4_y_parallax = 9;
	custom_background_1_x_scale = 1;
	custom_background_1_y_scale = 1;
	custom_background_2_x_scale = 1;
	custom_background_2_y_scale = 1;
	custom_background_3_x_scale = 1;
	custom_background_3_y_scale = 1;
	custom_background_4_x_scale = 1;
	custom_background_4_y_scale = 1;
	custom_background_1_htiled = 1;
	custom_background_1_vtiled = 1;
	custom_background_2_htiled = 1;
	custom_background_2_vtiled = 1;
	custom_background_3_htiled = 1;
	custom_background_3_vtiled = 1;
	custom_background_4_htiled = 1;
	custom_background_4_vtiled = 1;
	global.enable_time_countdown = false;
	global.time_countdown = 500;
	global.make_every_tileset_into_default_tileset = false;
	global.rain = false;
}
#endregion /* Initialize level_information.ini END */

#region /* Set if background is horizontally or vertically tiled */
layer_background_htiled(layer_background_get_id(layer_get_id("Background")), custom_background_1_htiled);
layer_background_vtiled(layer_background_get_id(layer_get_id("Background")), custom_background_1_vtiled);
layer_background_htiled(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_htiled);
layer_background_vtiled(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_vtiled);
layer_background_htiled(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_htiled);
layer_background_vtiled(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_vtiled);
layer_background_htiled(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_htiled);
layer_background_vtiled(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_vtiled);
#endregion /* Set if background is horizontally or vertically tiled END */

scr_scale_background();

#region /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" */
if (global.doing_clear_check == true)
{
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	instance_destroy();
}
#endregion /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" END */

#region /* Load Level */
scr_load_object_placement_all();
//scr_load_object_placement_old();
#endregion /* Load Level END */

#region /* If actually playing level, set play_edited_level to true and delete itself. Have this code after the "doing clear check = true" */
if (global.actually_play_edited_level == true)
{
	global.play_edited_level = true;
	instance_destroy();
}
#endregion /* If actually playing level, set play_edited_level to true and delete itself. Have this code after the "doing clear check = true" END */

#endregion /* Essential code that needs to be initialized END */










#region /* If you're actually playing a level, then you don't need to run a lot of the code only relevant when making a level */
if (global.actually_play_edited_level == false)
{
	
	#region /* Load custom sprites */
	sprite_lives_icon = spr_1up;
	if (can_load_custom_sprites == true)
	{
		sprite_basic_enemy = global.resource_pack_sprite_basic_enemy;
		sprite_basic_enemy_blind = global.resource_pack_sprite_basic_enemy_blind;
		sprite_enemy_bowlingball = global.resource_pack_sprite_enemy_bowlingball_walk;
		sprite_enemy_bowlingball_blind = global.resource_pack_sprite_enemy_bowlingball_blind_walk;
		sprite_big_stationary_enemy = global.resource_pack_sprite_big_stationary_enemy;
		sprite_lives_icon = scr_initialize_custom_character_select_sprite("lives_icon", sprite_lives_icon, camera_player, camera_selected_skin);
	}
	#endregion /* Load custom sprites END */
	
	#region /* Grid Initialization */
	global.object_grid = ds_grid_create(12,0);
	add_object(level_object_id.id_wall, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_dirt, spr_wall_dirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_glass, spr_wall_glass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_grass, spr_wall_grass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_gravel, spr_wall_gravel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_metal, spr_wall_metal, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_stone, spr_wall_stone, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_wood, spr_wall_wood, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_jump_panel, spr_wall_jump_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_climb_panel, spr_wall_climb_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes, spr_spikes, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_semisolid_platform, spr_semisolid_platform, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Brick Block */
	add_object(level_object_id.id_brick_block, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_10_basic_collectibles, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_heart_balloon, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_one_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_two_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_three_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_invincibility_powerup, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_invincibility_powerup_coil_spring, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Brick Block END */
	
	#region /* Question Block */
	add_object(level_object_id.id_question_block, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_10_basic_collectibles, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_heart_balloon, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_one_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_two_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_three_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_invincibility_powerup, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_invincibility_powerup_coil_spring, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Question Block END */
	
	#region /* Melon Block */
	add_object(level_object_id.id_melon_block, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_10_basic_collectibles, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_heart_balloon, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_one_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_two_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_three_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_invincibility_powerup, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_invincibility_powerup_coil_spring, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Melon Block END */
	
	add_object(level_object_id.id_hard_block, spr_hard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hard_block_alternate, spr_hard_block_alternate, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hard_block_2x2, spr_hard_block_2x2, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Falling Block */
	add_object(level_object_id.id_falling_block, spr_falling_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_solid, spr_falling_block_solid, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_long, spr_falling_block_long, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_long_solid, spr_falling_block_long_solid, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Falling Block END */
	
	add_object(level_object_id.id_cloud_block, spr_cloud_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_ice_block, spr_ice_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard_block, spr_cardboard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard, spr_cardboard, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard_long, spr_cardboard_long, 0, spr_cardboard_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Bump in Ground */
	add_object(level_object_id.id_bump_in_ground, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_8_basic_collectibles, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_heart_balloon, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_one_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_two_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_three_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_big_collectible, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_invincibility_powerup, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Bump in Ground END */
	
	#region /* Invisible Bump in Ground */
	add_object(level_object_id.id_invisible_bump_in_ground, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_8_basic_collectibles, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_heart_balloon, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_one_up, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_two_up, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_three_up, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_big_collectible, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_invincibility_powerup, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring, noone, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	#endregion /* Invisible Bump in Ground END */
	
	#region /* Basic Collectible */
	add_object(level_object_id.id_basic_collectible, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_2, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 315, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_3, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_4, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 225, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_5, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_6, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 135, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_7, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_8, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 45, c_white, 1, "", noone, true, 0);
	#endregion /* Basic Collectible END */
	
	#region /* Big Collectible */
	add_object(level_object_id.id_big_collectible, global.resource_pack_sprite_big_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Big Collectible END */
	
	add_object(level_object_id.id_heart, spr_heart, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hp_pickup, global.resource_pack_sprite_hp_pickup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_invincibility_powerup, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_invincibility_powerup_coil_spring, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Extra Lives */
	add_object(level_object_id.id_one_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_two_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_lime, 1, "", noone, true, 0);
	add_object(level_object_id.id_three_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_blue, 1, "", noone, true, 0);
	#endregion /* Extra Lives END */
	
	add_object(level_object_id.id_basic_enemy, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_blind, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_coil_spring, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_blind_coil_spring, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_blind, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_coil_spring, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_blind_coil_spring, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_big_stationary_enemy, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_big_stationary_enemy_coil_spring, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_blaster, spr_blaster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_spring, spr_spring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_ladder, spr_ladder, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_arrow_sign, noone, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_arrow_sign_small, noone, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_checkpoint, spr_checkpoint, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	
	#region /* Spikes Emerge Block */
	add_object(level_object_id.id_spikes_emerge_block, spr_spikes_emerge_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_left, spr_spikes_emerge_block, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_down, spr_spikes_emerge_block, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_right, spr_spikes_emerge_block, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	
	add_object(level_object_id.id_spikes_emerge_block_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_left_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_down_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_right_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* Spikes Emerge Block END */
	
	#region /* One Way */
	add_object(level_object_id.id_oneway, spr_oneway, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway2, spr_oneway, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway3, spr_oneway, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway4, spr_oneway, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* One Way END */
	
	add_object(level_object_id.id_horizontal_rope, spr_horizontal_rope, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_water, spr_water, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_breathable_water, spr_water, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, false, 0);
	add_object(level_object_id.id_water_surface, spr_water_surface, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_air_bubbles_spawner, spr_air_bubbles_spawner, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_water_level_change_slow, spr_water_level_change_slow, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_water_level_change_fast, spr_water_level_change_fast, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_water_level_change_faster, spr_water_level_change_faster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_clipped_shirt, spr_clipped_shirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_clipped_pants, spr_clipped_pants, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_clipped_sock, spr_clipped_sock, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bucket, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bird, spr_bird, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Signs */
	add_object(level_object_id.id_sign_crouch, spr_sign_crouch, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_dive, spr_sign_dive, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_ground_pound, spr_sign_ground_pound, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_rope_spin, spr_sign_rope_spin, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_wall_jump, spr_sign_wall_jump, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Signs END */
	
	add_object(level_object_id.id_boss, spr_boss_stand, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_boss_barrier, spr_boss_barrier, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cake_stealing_enemy, sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_artwork_collection, spr_artwork_collection, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_block_only_when_player_is_near, global.resource_pack_sprite_block_only_when_player_is_near, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_door, spr_door, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_npc, spr_npc, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_black_wall, spr_black_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_ring, spr_ring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	/* This is a dummy object, to make sure every object gets added to the list */ add_object(level_object_id.id_last_object_dummy, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0); /* This dummy object is just here so the last object actually appears */
	#endregion /* Grid Initialization END */
	
	mouse_x_position = device_mouse_x_to_gui(0);
	mouse_y_position = device_mouse_y_to_gui(0);
	
	order_index = 0;
	
	#region /* Loading selected level editing music */
	if (file_exists("config.ini"))
	{
		ini_open(working_directory + "config.ini");
		if (ini_key_exists("config", "selected_level_editing_music"))
		{
			global.selected_level_editing_music = ini_read_real("config", "selected_level_editing_music", 1); /* The selected background music when editing in the level editor */
			previous_selected_level_editing_music = ini_read_real("config", "selected_level_editing_music", 1); /* When changing the editing music, you want to compare it to this variable */
		}
		else
		{
			global.selected_level_editing_music = 1;
			previous_selected_level_editing_music = 1;
		}
		ini_close();
	}
	else
	{
		global.selected_level_editing_music = 1;
		previous_selected_level_editing_music = 1;
	}

	if (global.selected_level_editing_music == 0)
	{
		level_editing_music = noone;
		previous_selected_level_editing_music = 0;
	}
	else
	if (global.selected_level_editing_music == 1)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
		previous_selected_level_editing_music = 1;
	}
	else
	if (global.selected_level_editing_music == 2)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
		previous_selected_level_editing_music = 2;
	}
	else
	if (global.selected_level_editing_music == 3)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
		previous_selected_level_editing_music = 3;
	}
	else
	{
		level_editing_music = noone;
	}
	#endregion /* Loading selected level editing music END */
	
	unused_x_origin_point = noone;
	unused_y_origin_point = noone;
	
	saved_file_exists = false;
	can_save_to_level_information = false;
	depth = -300;
	
	global.player_has_entered_goal = false;
	
	old_window_get_height = 0;
	old_window_get_width = 0;
	
	mx = mouse_x;
	my = mouse_y;
	
	selected_skin = global.skin_for_player_1;
	
	sprite_player1 = noone;
	sprite_player1 = scr_initialize_custom_character_select_sprite("idle", sprite_player1, 0, global.skin_for_player_1);
	sprite_player1 = scr_initialize_custom_character_select_sprite("stand", sprite_player1, 0, global.skin_for_player_1);
	sprite_player2 = noone;
	sprite_player2 = scr_initialize_custom_character_select_sprite("idle", sprite_player1, 1, global.skin_for_player_2);
	sprite_player2 = scr_initialize_custom_character_select_sprite("stand", sprite_player1, 1, global.skin_for_player_2);
	sprite_player3 = noone;
	sprite_player3 = scr_initialize_custom_character_select_sprite("idle", sprite_player1, 2, global.skin_for_player_3);
	sprite_player3 = scr_initialize_custom_character_select_sprite("stand", sprite_player1, 2, global.skin_for_player_3);
	sprite_player4 = noone;
	sprite_player4 = scr_initialize_custom_character_select_sprite("idle", sprite_player1, 3, global.skin_for_player_4);
	sprite_player4 = scr_initialize_custom_character_select_sprite("stand", sprite_player1, 3, global.skin_for_player_4);
	
	audio_stop_all();
	pressing_play_timer = 0; /* You have to hold down the play button for some time before you play the level from the beginning */
	room_speed = global.max_fps; /* Set correct fps */
	x = mouse_x;
	y = mouse_y;
	show_level_editor_corner_menu = true;
	view_hview_lerp = 0;
	view_wview_lerp = 0;
	controller_x = mouse_x;
	controller_y = mouse_y;
	controller_view_speed = 8;
	drag_x = mouse_x;
	drag_y = mouse_y;
	cursor_x = x;
	cursor_y = y;
	place_brush_size = 0; /* The size of the brush when placeing objects */
	erase_brush_size = 0; /* The size of the brush when erasing */
	can_make_place_brush_size_bigger = true; /* If you can make the brush size bigger for certain objects */
	mouse_sprite = spr_cursor; /* Sets what cursor sprite to use */
	undo_and_redo_buttons_enabled = false; /* If undo and redo buttons should appear or not */
	tooltip = "";
	show_tooltip = 0;
	show_grid = false; /* Grid should be false when you start level editor */
	grid_alpha = 0;
	zoom_in = false; /* When this is true, zoom in */
	zoom_reset = false; /* When this is true, reset zoom */
	zoom_out = false; /* When this is true, zoom out */
	difficulty_layer = 0; /* 0 = All, 1 = Easy, 2 = Normal, 3 = Hard */
	level_editor_edit_name = false;
	set_difficulty_mode = false; /* Toggle so you get a pen that can select what object appear in what difficulty */
	place_object = noone;
	placing_object = 0; /* If you are currently placing any object or not. This check is used for when modifying other objects, it shouldn't happen when currently placing any object */
	show_icons_at_bottom = false;
	show_icons_at_top = false;
	icons_at_bottom_y = +100;
	show_undo_redo_icons = false; /* If the undo and redo buttons should show */
	undo_redo_icons_y = +200; /* Undo and redo buttons y postition */
	current_undo_value = 0; /* Every time you place down items, this value increases. When you undo, this value decreases. */
	icons_at_top_y = - 100;
	selected_object = 0;
	selected_object_menu_x = 0;
	selected_menu_alpha = 0;
	total_number_of_objects = 0;
	drag_object = false;
	erase_mode = false; /* When erasing, this turns true */
	fill_mode = false; /* When filling, this turns true */
	fill_mode_type = "fill"; /* What type of filling you will do. Fill, Horizontal, Vertical */
	can_input_level_name = false;
	quit_level_editor = false;
	menu_joystick_delay = 0;
	menu_cursor_index = 0;
	in_settings = false;
	old_selected_resource_pack = global.selected_resource_pack;
	can_navigate_settings_sidebar = true;
	navigate_slider = false;
	menu = "continue";
	open_dropdown = false;
	name_enter_blink = 0;
	menu_delay = 10;
	startup_loading_timer = 0;
	deactivate_timer = 0; /* Don't deactivate all the objects every frame */
	background_brightness_lerp = 0;
	background_brightness_menu_lerp = 0;
	language_index = global.language_localization + 1;
	language_mouse_scroll = 0;
	scroll_view = false; /* If you can scroll the view or not */
	create_level_from_template_save_delay = 0; /* Save the level before starting to edit the template level */
	
	darken_settings_alpha = 0;
	darken_settings_sidebar_alpha = 0;
	accessibility_settings_y = 40;
	game_text_y = 40 * 2;
	game_settings_y = 40 * 3;
	multiplayer_settings_y = 40 * 4;
	controls_text_y = 40 * 5;
	keyboard_and_mouse_settings_y = 40 * 6;
	controller_settings_y = 40 * 7;
	touch_settings_y = 40 * 8;
	general_text_y = 40 * 9;
	profile_settings_y = 40 * 10;
	video_settings_y = 40 * 11;
	audio_settings_y = 40 * 12;
	global_resources_settings_y = 40 * 13;
	storage_settings_y = 40 * 14;
	language_settings_y = 40 * 15;
	broadcast_settings_y = 40 * 16;
	how_to_play_y = 40 * 17;
	left_sidebar_x = -400;
	
	play_level_icon_x = 32;
	place_brush_icon_x = 96;
	erase_icon_x = 160;
	fill_icon_x = 224;
	always_show_level_editor_buttons_x = 288;
	grid_button_x = display_get_gui_width() - 224;
	
	#region /* Options */
	can_navigate = false;
	menu_y_offset_real = 0;
	menu_cursor_y_position = 0;
	menu_remap_key_number = 0;
	menu_remap_gamepad_button_number = 0;
	
	#region /* Remapping options variables */
	remapping_player = 0; /* remapping_player 0 = player 1. remapping_player 1 = player 2. remapping_player 2 = player 3. remapping_player 3 = player 4 */
	input_key = false;
	can_remap_key = false;
	input_gamepad_button = false;
	can_remap_gamepad_button = false;
	allow_player1_tongue = scr_initialize_custom_character_abilities(0, "allow_tongue", false);
	allow_player2_tongue = scr_initialize_custom_character_abilities(1, "allow_tongue", false);
	allow_player3_tongue = scr_initialize_custom_character_abilities(2, "allow_tongue", false);
	allow_player4_tongue = scr_initialize_custom_character_abilities(3, "allow_tongue", false);
	
	allow_player1_dive = scr_initialize_custom_character_abilities(0, "allow_dive", false);
	allow_player2_dive = scr_initialize_custom_character_abilities(1, "allow_dive", false);
	allow_player3_dive = scr_initialize_custom_character_abilities(2, "allow_dive", false);
	allow_player4_dive = scr_initialize_custom_character_abilities(3, "allow_dive", false);
	#endregion /* Remapping options variables END */
	
	#region /* Character Name */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	or (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}
		
		#region /* Character Name */
		var uppercase_narrator_name;
		uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
		uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
		narrator_name = string(uppercase_narrator_name);
		#endregion /* Character Name END */
		
		ini_close();
	}
	else
	{
		narrator_name = string(global.narrator + 1);
	}
	#endregion /* Character Name END */
	
	#region /* Customize look of Options Menu */
	menu_y_offset = -100;
	c_menu_outline = c_black;
	c_menu_fill = c_white;
	#endregion /* Customize look of Options Menu END */
	
	#endregion /* Options END */
	
	image_speed = 0;
	image_index = 0;
	
	#region /* View Size */
	view_wview = 1392;
	view_hview = 736;
	/* Default Views:   set_view_wview = 1024 + 400 - 32   set_view_hview = 768 - 32  */
	#endregion /* View Size END */
	
	#region /* Initialize Background */
	background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
	background_x_offset[1] = 0;background_x[1] = 0;background_y_offset[1] = 0;background_y[1] = 0;
	background_x_offset[2] = 0;background_x[2] = 0;background_y_offset[2] = 0;background_y[2] = 0;
	background_x_offset[3] = 0;background_x[3] = 0;background_y_offset[3] = 0;background_y[3] = 0;
	background_x_offset[4] = 0;background_x[4] = 0;background_y_offset[4] = 0;background_y[4] = 0;
	background_x_offset[5] = 0;background_x[5] = 0;background_y_offset[5] = 0;background_y[5] = 0;
	background_x_offset[6] = 0;background_x[6] = 0;background_y_offset[6] = 0;background_y[6] = 0;
	background_x_offset[7] = 0;background_x[7] = 0;background_y_offset[7] = 0;background_y[7] = 0;
	#endregion /* Initialize Background END */
	
	/* HUD Show Controls keys that have been pressed */
	player1_show_controls_timer = 0;
	player1_show_controls_alpha = 0;
	
}
#endregion /* If you're actually playing a level, then you don't need to run a lot of the code only relevant when making a level END */