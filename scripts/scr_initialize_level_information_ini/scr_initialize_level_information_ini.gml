function scr_initialize_level_information_ini()
{
	
	#region /* Initialize level_information.ini */
	var main_level_index = ds_list_find_value(global.all_loaded_main_levels, global.select_level_index);
	
	if (global.character_select_in_this_menu == "main_game")
	&& (file_exists("levels/" + string(main_level_index) + "/data/level_information.ini"))
	|| (global.character_select_in_this_menu == "level_editor")
	&& (file_exists(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
	{
		can_save_to_level_information = false;
		if (global.create_level_from_template)
		|| (global.character_select_in_this_menu == "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else if (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
			can_save_to_level_information = true;
		}
		
		custom_background4_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background4_y_offset", 0);
		custom_background4_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background4_x_offset", 0);
		custom_background3_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background3_y_offset", 0);
		custom_background3_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background3_x_offset", 0);
		custom_background2_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background2_y_offset", 0);
		custom_background2_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background2_x_offset", 0);
		custom_background1_y_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background1_y_offset", 0);
		custom_background1_x_offset = get_custom_level_information_real("Custom Backgrounds", "custom_background1_x_offset", 0);
		
		custom_background4_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background4_y_parallax", 9);
		custom_background4_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background4_x_parallax", 9);
		custom_background3_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background3_y_parallax", 7);
		custom_background3_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background3_x_parallax", 7);
		custom_background2_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background2_y_parallax", 5);
		custom_background2_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background2_x_parallax", 5);
		custom_background1_y_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background1_y_parallax", 3);
		custom_background1_x_parallax = get_custom_level_information_real("Custom Backgrounds", "custom_background1_x_parallax", 3);
		
		custom_background4_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background4_y_scale", 1);
		custom_background4_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background4_x_scale", 1);
		custom_background3_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background3_y_scale", 1);
		custom_background3_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background3_x_scale", 1);
		custom_background2_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background2_y_scale", 1);
		custom_background2_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background2_x_scale", 1);
		custom_background1_y_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background1_y_scale", 1);
		custom_background1_x_scale = get_custom_level_information_real("Custom Backgrounds", "custom_background1_x_scale", 1);
		
		custom_background4_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background4_vtiled", 1);
		custom_background4_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background4_htiled", 1);
		custom_background3_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background3_vtiled", 1);
		custom_background3_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background3_htiled", 1);
		custom_background2_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background2_vtiled", 1);
		custom_background2_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background2_htiled", 1);
		custom_background1_vtiled = get_custom_level_information_real("Custom Backgrounds", "custom_background1_vtiled", 1);
		custom_background1_htiled = get_custom_level_information_real("Custom Backgrounds", "custom_background1_htiled", 1);
		
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
		&& (global.actually_play_edited_level == false)
		&& (object_index == obj_leveleditor)
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("info", "view_xview", 0), ini_read_real("info", "view_yview", 0)); /* Set camera position on the last positions you had the camera when doing level editing */
			x = ini_read_real("info", "view_xview", 0);
			y = ini_read_real("info", "view_yview", 0);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	else
	{
		custom_background1_x_offset = 0;
		custom_background1_y_offset = 0;
		custom_background2_x_offset = 0;
		custom_background2_y_offset = 0;
		custom_background3_x_offset = 0;
		custom_background3_y_offset = 0;
		custom_background4_x_offset = 0;
		custom_background4_y_offset = 0;
		custom_background1_x_parallax = 3;
		custom_background1_y_parallax = 3;
		custom_background2_x_parallax = 5;
		custom_background2_y_parallax = 5;
		custom_background3_x_parallax = 7;
		custom_background3_y_parallax = 7;
		custom_background4_x_parallax = 9;
		custom_background4_y_parallax = 9;
		custom_background1_x_scale = 1;
		custom_background1_y_scale = 1;
		custom_background2_x_scale = 1;
		custom_background2_y_scale = 1;
		custom_background3_x_scale = 1;
		custom_background3_y_scale = 1;
		custom_background4_x_scale = 1;
		custom_background4_y_scale = 1;
		custom_background1_htiled = 1;
		custom_background1_vtiled = 1;
		custom_background2_htiled = 1;
		custom_background2_vtiled = 1;
		custom_background3_htiled = 1;
		custom_background3_vtiled = 1;
		custom_background4_htiled = 1;
		custom_background4_vtiled = 1;
		global.enable_time_countdown = false;
		global.time_countdown = 500;
		global.make_every_tileset_into_default_tileset = false;
		global.rain = false;
		intro_animation = "";
		intro_animation_play_only_once = false;
		after_goal_go_to_this_level = "";
	}
	#endregion /* Initialize level_information.ini END */
	
	#region /* Set if background is horizontally or vertically tiled */
	layer_background_htiled(layer_background_get_id(layer_get_id("Background")), custom_background1_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background")), custom_background1_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_vtiled);
	#endregion /* Set if background is horizontally or vertically tiled END */
	
	scr_scale_background();
	
}