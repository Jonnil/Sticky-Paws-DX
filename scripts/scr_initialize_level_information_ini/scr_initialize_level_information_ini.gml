function scr_initialize_level_information_ini()
{
	
	#region /* Initialize level_information.ini */
	var main_level_index = ds_list_find_value(global.all_loaded_main_levels, global.select_level_index);
	if ((global.character_select_in_this_menu == "main_game" and file_exists("levels/" + string(main_level_index) + "/data/level_information.ini")) or 
	(global.character_select_in_this_menu == "level_editor" and file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini")))
	{
		can_save_to_level_information = false;
		if (global.create_level_from_template == true)
		or (global.character_select_in_this_menu == "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else if (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			can_save_to_level_information = true;
		}
	
		custom_background_4_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		custom_background_4_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		custom_background_3_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		custom_background_3_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		custom_background_2_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		custom_background_2_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		custom_background_1_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		custom_background_1_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
	
		custom_background_4_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		custom_background_4_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		custom_background_3_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		custom_background_3_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		custom_background_2_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		custom_background_2_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		custom_background_1_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		custom_background_1_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
	
		custom_background_4_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_y_scale", 1);
		custom_background_4_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_x_scale", 1);
		custom_background_3_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_y_scale", 1);
		custom_background_3_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_x_scale", 1);
		custom_background_2_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_y_scale", 1);
		custom_background_2_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_x_scale", 1);
		custom_background_1_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_y_scale", 1);
		custom_background_1_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_x_scale", 1);
	
		custom_background_4_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_vtiled", 1);
		custom_background_4_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_4_htiled", 1);
		custom_background_3_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_vtiled", 1);
		custom_background_3_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_3_htiled", 1);
		custom_background_2_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_vtiled", 1);
		custom_background_2_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_2_htiled", 1);
		custom_background_1_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_vtiled", 1);
		custom_background_1_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background_1_htiled", 1);
	
		global.make_every_tileset_into_default_tileset = get_custom_level_information_real("info", "make_every_tileset_into_default_tileset", false);
		global.enable_time_countdown = get_custom_level_information_real("info", "enable_time_countdown", false);
		global.time_countdown = get_custom_level_information_real("info", "time_countdown", 500);
		global.rain = get_custom_level_information_real("info", "rain", false);
		global.deactivate_objects_from_most_zoomed_out = get_custom_level_information_real("info", "deactivate_objects_from_most_zoomed_out", false);
		
		intro_animation = get_custom_level_information_string("info", "intro_animation", "");
		intro_animation_play_only_once = get_custom_level_information_real("info", "intro_animation_play_only_once", false);
		after_goal_go_to_this_level = get_custom_level_information_real("info", "after_goal_go_to_this_level", noone);
		global.default_view_width = get_custom_level_information_real("info", "default_view_width", 1920);
		global.default_view_height = get_custom_level_information_real("info", "default_view_height", 1080);
		
		if (global.play_edited_level == false)
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
		intro_animation = "";
		intro_animation_play_only_once = false;
		after_goal_go_to_this_level = "";
	}
	#endregion /* Initialize level_information.ini END */
	
	//if (global.create_level_from_template == true)
	//{
	//	ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
	//	ini_write_string("info", "intro_animation", intro_animation);
	//	ini_write_string("info", "intro_animation_play_only_once", intro_animation_play_only_once);
	//	ini_write_string("info", "after_goal_go_to_this_level", after_goal_go_to_this_level);
	//	ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", custom_background_4_y_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", custom_background_4_x_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", custom_background_3_y_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", custom_background_3_x_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", custom_background_2_y_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", custom_background_2_x_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", custom_background_1_y_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", custom_background_1_x_parallax);
	//	ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", custom_background_4_y_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", custom_background_4_x_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", custom_background_3_y_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", custom_background_3_x_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", custom_background_2_y_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", custom_background_2_x_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", custom_background_1_y_offset);
	//	ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", custom_background_1_x_offset);
	//	ini_write_real("info", "default_view_width", global.default_view_width);
	//	ini_write_real("info", "default_view_height", global.default_view_height);
	//	ini_write_real("info", "rain", global.rain);
	//	ini_write_real("info", "time_countdown", global.time_countdown);
	//	ini_write_real("info", "enable_time_countdown", global.enable_time_countdown);
	//	ini_write_real("info", "make_every_tileset_into_default_tileset", global.make_every_tileset_into_default_tileset);
	//	ini_close();
	//}
}