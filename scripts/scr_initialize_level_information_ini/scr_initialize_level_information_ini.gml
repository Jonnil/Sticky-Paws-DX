function scr_initialize_level_information_ini()
{
	
	#region /* Initialize level_information.ini */
	if (global.character_select_in_this_menu == "main_game")
	&& (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
	|| (global.character_select_in_this_menu == "level_editor")
	&& (file_exists(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini"))
	{
		can_save_to_level_information = false;
		if (global.create_level_from_template)
		|| (global.character_select_in_this_menu == "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else if (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(global.use_cache_or_working + "custom_levels/" + global.level_name + "/data/level_information.ini");
			can_save_to_level_information = true;
		}
		for (var i = 1; i <= 4; i++) {
			custom_background_y_offset[i] = get_custom_level_information_real("Custom Backgrounds", "custom_background" + string(i) + "_y_offset", 0);
			custom_background_x_offset[i] = get_custom_level_information_real("Custom Backgrounds", "custom_background" + string(i) + "_x_offset", 0);
		}
		
		custom_background_y_parallax[4] = get_custom_level_information_real("Custom Backgrounds", "custom_background4_y_parallax", 9);
		custom_background_x_parallax[4] = get_custom_level_information_real("Custom Backgrounds", "custom_background4_x_parallax", 9);
		custom_background_y_parallax[3] = get_custom_level_information_real("Custom Backgrounds", "custom_background3_y_parallax", 7);
		custom_background_x_parallax[3] = get_custom_level_information_real("Custom Backgrounds", "custom_background3_x_parallax", 7);
		custom_background_y_parallax[2] = get_custom_level_information_real("Custom Backgrounds", "custom_background2_y_parallax", 5);
		custom_background_x_parallax[2] = get_custom_level_information_real("Custom Backgrounds", "custom_background2_x_parallax", 5);
		custom_background_y_parallax[1] = get_custom_level_information_real("Custom Backgrounds", "custom_background1_y_parallax", 3);
		custom_background_x_parallax[1] = get_custom_level_information_real("Custom Backgrounds", "custom_background1_x_parallax", 3);
		
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
		global.effect_rain = get_custom_level_information_real("info", "rain", false);
		global.effect_snow = get_custom_level_information_real("info", "snow", false);
		global.effect_wind = get_custom_level_information_real("info", "wind", false);
		
		intro_animation_play_only_once = get_custom_level_information_real("info", "intro_animation_play_only_once", false);
		if (intro_animation_play_only_once && global.current_level_clear_rate == "clear") {
			intro_animation = "";
		}
		else {
			intro_animation = get_custom_level_information_string("info", "intro_animation", "");
		}
		after_goal_go_to_this_level = get_custom_level_information_real("info", "after_goal_go_to_this_level", noone);
		
		if (object_index == obj_leveleditor && !global.actually_play_edited_level)
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("info", "view_xview", 0), ini_read_real("info", "view_yview", 0)); /* Set camera position on the last positions you had the camera when doing level editing */
			x = ini_read_real("info", "view_xview", 0);
			y = ini_read_real("info", "view_yview", 0);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	else
	{
		for (var i = 1; i <= 4; i++) {
			custom_background_x_offset[i] = 0;
			custom_background_y_offset[i] = 0;
		}
		custom_background_x_parallax[1] = 3;
		custom_background_y_parallax[1] = 3;
		custom_background_x_parallax[2] = 5;
		custom_background_y_parallax[2] = 5;
		custom_background_x_parallax[3] = 7;
		custom_background_y_parallax[3] = 7;
		custom_background_x_parallax[4] = 9;
		custom_background_y_parallax[4] = 9;
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
		global.effect_rain = false;
		global.effect_snow = false;
		global.effect_wind = false;
		intro_animation_play_only_once = false;
		intro_animation = "";
		after_goal_go_to_this_level = "";
	}
	#endregion /* Initialize level_information.ini END */
	
	#region /* Set if background is horizontally or vertically tiled */
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_1")), custom_background1_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_1")), custom_background1_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_2")), custom_background2_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_3")), custom_background3_vtiled);
	layer_background_htiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_htiled);
	layer_background_vtiled(layer_background_get_id(layer_get_id("Background_4")), custom_background4_vtiled);
	#endregion /* Set if background is horizontally or vertically tiled END */
	
	scr_scale_background();
	
}