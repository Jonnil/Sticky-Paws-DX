function scr_initialize_level_information_ini()
{
	
	#region /*Initialize level_information.ini*/
	if (global.character_select_in_this_menu = "main_game")
	and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

	or(global.character_select_in_this_menu = "level_editor")
	and (global.create_level_from_template = true)
	and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))

	or(global.character_select_in_this_menu = "level_editor")
	and (global.select_level_index <= 0)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

	or(global.character_select_in_this_menu = "level_editor")
	and (global.create_level_from_template >= 2)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))

	or(global.character_select_in_this_menu = "level_editor")
	and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
	{
		if (global.character_select_in_this_menu = "main_game")
		or(global.create_level_from_template = true)
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu = "level_editor")
		and (global.select_level_index <= 0)
		or(global.character_select_in_this_menu = "level_editor")
		and (global.create_level_from_template >= 2)
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu = "level_editor")
		{
			ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		
		#region /*Intro Animation*/
		if (ini_key_exists("info", "intro_animation"))
		{
			intro_animation = ini_read_string("info", "intro_animation", "");
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_string("info", "intro_animation", "");
			}
			intro_animation = "";
		}
		#endregion /*Intro Animation END*/
	
		#region /*Intro Animation Play Only Once*/
		if (ini_key_exists("info", "intro_animation_play_only_once"))
		{
			intro_animation_play_only_once = ini_read_string("info", "intro_animation_play_only_once", false);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_string("info", "intro_animation_play_only_once", false);
			}
			intro_animation_play_only_once = false;
		}
		#endregion /*Intro Animation Play Only Once END*/
	
		#region /*After goal go to this level*/
		if (ini_key_exists("info", "after_goal_go_to_this_level"))
		{
			after_goal_go_to_this_level = ini_read_string("info", "after_goal_go_to_this_level", noone);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_string("info", "after_goal_go_to_this_level", noone);
			}
			after_goal_go_to_this_level = noone;
		}
		#endregion /*After goal go to this level END*/
		
		#region /*Custom Backgrounds*/
		
		#region /*Custom Background 4 x and y parallax points*/
		#region /*Custom Background 4 y parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_parallax"))
		{
			custom_background_4_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", 9);
			}
			custom_background_4_y_parallax = 9;
		}
		#endregion /*Custom Background 4 y parallax point END*/
	
		#region /*Custom Background 4 x parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_parallax"))
		{
			custom_background_4_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", 9);
			}
			custom_background_4_x_parallax = 9;
		}
		#endregion /*Custom Background 4 x parallax point END*/
		#endregion /*Custom Background 4 x and y parallax points END*/
		
		#region /*Custom Background 3 x and y parallax points*/
		#region /*Custom Background 3 y parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_parallax"))
		{
			custom_background_3_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", 7);
			}
			custom_background_3_y_parallax = 7;
		}
		#endregion /*Custom Background 3 y parallax point END*/
	
		#region /*Custom Background 3 x parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_parallax"))
		{
			custom_background_3_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", 7);
			}
			custom_background_3_x_parallax = 7;
		}
		#endregion /*Custom Background 3 x parallax point END*/
		#endregion /*Custom Background 3 x and y parallax points END*/
		
		#region /*Custom Background 2 x and y parallax points*/
		#region /*Custom Background 2 y parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_parallax"))
		{
			custom_background_2_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", 5);
			}
			custom_background_2_y_parallax = 5;
		}
		#endregion /*Custom Background 2 y parallax point END*/
	
		#region /*Custom Background 2 x parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_parallax"))
		{
			custom_background_2_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", 5);
			}
			custom_background_2_x_parallax = 5;
		}
		#endregion /*Custom Background 2 x parallax point END*/
		#endregion /*Custom Background 2 x and y parallax points END*/
		
		#region /*Custom Background 1 x and y parallax points*/
		#region /*Custom Background 1 y parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_parallax"))
		{
			custom_background_1_y_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", 3);
			}
			custom_background_1_y_parallax = 3;
		}
		#endregion /*Custom Background 1 y parallax point END*/
	
		#region /*Custom Background 1 x parallax point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_parallax"))
		{
			custom_background_1_x_parallax = ini_read_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", 3);
			}
			custom_background_1_x_parallax = 3;
		}
		#endregion /*Custom Background 1 x parallax point END*/
		#endregion /*Custom Background 1 x and y parallax points END*/
		
		#region /*Custom Background 4 x and y offset points*/
		#region /*Custom Background 4 y offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_4_y_offset"))
		{
			custom_background_4_y_offset = ini_read_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", 0);
			}
			custom_background_4_y_offset = 0;
		}
		#endregion /*Custom Background 4 y offset point END*/
	
		#region /*Custom Background 4 x offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_4_x_offset"))
		{
			custom_background_4_x_offset = ini_read_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", 0);
			}
			custom_background_4_x_offset = 0;
		}
		#endregion /*Custom Background 4 x offset point END*/
		#endregion /*Custom Background 4 x and y offset points END*/
		
		#region /*Custom Background 3 x and y offset points*/
		#region /*Custom Background 3 y offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_3_y_offset"))
		{
			custom_background_3_y_offset = ini_read_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", 0);
			}
			custom_background_3_y_offset = 0;
		}
		#endregion /*Custom Background 3 y offset point END*/
	
		#region /*Custom Background 3 x offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_3_x_offset"))
		{
			custom_background_3_x_offset = ini_read_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", 0);
			}
			custom_background_3_x_offset = 0;
		}
		#endregion /*Custom Background 3 x offset point END*/
		#endregion /*Custom Background 3 x and y offset points END*/
		
		#region /*Custom Background 2 x and y offset points*/
		#region /*Custom Background 2 y offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_2_y_offset"))
		{
			custom_background_2_y_offset = ini_read_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", 0);
			}
			custom_background_2_y_offset = 0;
		}
		#endregion /*Custom Background 2 y offset point END*/
	
		#region /*Custom Background 2 x offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_2_x_offset"))
		{
			custom_background_2_x_offset = ini_read_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", 0);
			}
			custom_background_2_x_offset = 0;
		}
		#endregion /*Custom Background 2 x offset point END*/
		#endregion /*Custom Background 2 x and y offset points END*/
		
		#region /*Custom Background 1 x and y offset points*/
		#region /*Custom Background 1 y offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_1_y_offset"))
		{
			custom_background_1_y_offset = ini_read_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", 0);
			}
			custom_background_1_y_offset = 0;
		}
		#endregion /*Custom Background 1 y offset point END*/
	
		#region /*Custom Background 1 x offset point*/
		if (ini_key_exists("Custom Backgrounds", "custom_background_1_x_offset"))
		{
			custom_background_1_x_offset = ini_read_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", 0);
			}
			custom_background_1_x_offset = 0;
		}
		#endregion /*Custom Background 1 x offset point END*/
		#endregion /*Custom Background 1 x and y offset points END*/
		
		#endregion /*Custom Backgrounds END*/
		
		#region /*Default View Width*/
		if (ini_key_exists("info", "default_view_width"))
		{
			global.default_view_width = ini_read_real("info", "default_view_width", 1920);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("info", "default_view_width", 1920);
			}
			global.default_view_width = 1920;
		}
		#endregion /*Default View Width END*/
		
		#region /*Default View Height*/
		if (ini_key_exists("info", "default_view_height"))
		{
			global.default_view_height = ini_read_real("info", "default_view_height", 1080);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("info", "default_view_height", 1080);
			}
			global.default_view_height = 1080;
		}
		#endregion /*Default View Height END*/
		
		#region /*Initialize Weather*/
		
		#region /*Rain*/
		if (ini_key_exists("info", "rain"))
		{
			rain = ini_read_real("info", "rain", false);
		}
		else
		{
			if (global.character_select_in_this_menu = "level_editor")
			and (global.create_level_from_template = false)
			{
				ini_write_real("info", "rain", false);
			}
			rain = false;
		}
		#endregion /*Rain END*/
		
		#endregion /*Initialize Weather END*/
		
		ini_close();
	}
	else
	{
		intro_animation = "";
		intro_animation_play_only_once = false;
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
		rain = false;
		global.default_view_height = 1080;
		global.default_view_width = 1920;
	}
	#endregion /*Initialize level_information.ini END*/
	
	if (global.create_level_from_template = true)
	{
		ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		ini_write_string("info", "intro_animation", intro_animation);
		ini_write_string("info", "intro_animation_play_only_once", intro_animation_play_only_once);
		ini_write_string("info", "after_goal_go_to_this_level", after_goal_go_to_this_level);
		ini_write_real("Custom Backgrounds", "custom_background_4_y_parallax", custom_background_4_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_4_x_parallax", custom_background_4_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_3_y_parallax", custom_background_3_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_3_x_parallax", custom_background_3_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_2_y_parallax", custom_background_2_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_2_x_parallax", custom_background_2_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_1_y_parallax", custom_background_1_y_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_1_x_parallax", custom_background_1_x_parallax);
		ini_write_real("Custom Backgrounds", "custom_background_4_y_offset", custom_background_4_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_4_x_offset", custom_background_4_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_3_y_offset", custom_background_3_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_3_x_offset", custom_background_3_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_2_y_offset", custom_background_2_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_2_x_offset", custom_background_2_x_offset);
		ini_write_real("Custom Backgrounds", "custom_background_1_y_offset", custom_background_1_y_offset);
		ini_write_real("Custom Backgrounds", "custom_background_1_x_offset", custom_background_1_x_offset);
		ini_write_real("info", "default_view_width", global.default_view_width);
		ini_write_real("info", "default_view_height", global.default_view_height);
		ini_write_real("info", "rain", rain);
		ini_close();
	}
}