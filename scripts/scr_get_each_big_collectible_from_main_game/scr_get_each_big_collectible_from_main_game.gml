function scr_get_each_big_collectible_from_main_game()
{
	if (file_exists(game_save_id + "save_file/file" + string(global.file) + ".ini"))
	{
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");

		var level_number = 1;
		var level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level1_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level1_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level1_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level1_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level1_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 2;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level2_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level2_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level2_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level2_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level2_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 3;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level3_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level3_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level3_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level3_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level3_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 4;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level4_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level4_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level4_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level4_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level4_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 5;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level5_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level5_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level5_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level5_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level5_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 6;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level6_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level6_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level6_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level6_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level6_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 7;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level7_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level7_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level7_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level7_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level7_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 8;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level8_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level8_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level8_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level8_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level8_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 10;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		level9_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		level9_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		level9_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		level9_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		level9_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		level_number = 11;
		level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));

		levela_big_collectible1 = ini_read_real(level_name, "big_collectible1", 0);
		levela_big_collectible2 = ini_read_real(level_name, "big_collectible2", 0);
		levela_big_collectible3 = ini_read_real(level_name, "big_collectible3", 0);
		levela_big_collectible4 = ini_read_real(level_name, "big_collectible4", 0);
		levela_big_collectible5 = ini_read_real(level_name, "big_collectible5", 0);

		ini_close();

		#region /* Count every individual big collectible */
		total_big_collectibles_add = 0; /* Initialize this variable */

		total_big_collectibles_add =
		level1_big_collectible1 +
		level1_big_collectible2 +
		level1_big_collectible3 +
		level1_big_collectible4 +
		level1_big_collectible5 +

		level2_big_collectible1 +
		level2_big_collectible2 +
		level2_big_collectible3 +
		level2_big_collectible4 +
		level2_big_collectible5 +

		level3_big_collectible1 +
		level3_big_collectible2 +
		level3_big_collectible3 +
		level3_big_collectible4 +
		level3_big_collectible5 +

		level4_big_collectible1 +
		level4_big_collectible2 +
		level4_big_collectible3 +
		level4_big_collectible4 +
		level4_big_collectible5 +

		level5_big_collectible1 +
		level5_big_collectible2 +
		level5_big_collectible3 +
		level5_big_collectible4 +
		level5_big_collectible5 +

		level6_big_collectible1 +
		level6_big_collectible2 +
		level6_big_collectible3 +
		level6_big_collectible4 +
		level6_big_collectible5 +

		level7_big_collectible1 +
		level7_big_collectible2 +
		level7_big_collectible3 +
		level7_big_collectible4 +
		level7_big_collectible5 +

		level8_big_collectible1 +
		level8_big_collectible2 +
		level8_big_collectible3 +
		level8_big_collectible4 +
		level8_big_collectible5 +

		level9_big_collectible1 +
		level9_big_collectible2 +
		level9_big_collectible3 +
		level9_big_collectible4 +
		level9_big_collectible5 +

		levela_big_collectible1 +
		levela_big_collectible2 +
		levela_big_collectible3 +
		levela_big_collectible4 +
		levela_big_collectible5;
		#endregion /* Count every individual big collectible END */

	}
	else
	{
		total_big_collectibles_add = 0; /* Initialize this variable */

		level1_big_collectible1 = false;
		level1_big_collectible2 = false;
		level1_big_collectible3 = false;
		level1_big_collectible4 = false;
		level1_big_collectible5 = false;

		level2_big_collectible1 = false;
		level2_big_collectible2 = false;
		level2_big_collectible3 = false;
		level2_big_collectible4 = false;
		level2_big_collectible5 = false;

		level3_big_collectible1 = false;
		level3_big_collectible2 = false;
		level3_big_collectible3 = false;
		level3_big_collectible4 = false;
		level3_big_collectible5 = false;

		level4_big_collectible1 = false;
		level4_big_collectible2 = false;
		level4_big_collectible3 = false;
		level4_big_collectible4 = false;
		level4_big_collectible5 = false;

		level5_big_collectible1 = false;
		level5_big_collectible2 = false;
		level5_big_collectible3 = false;
		level5_big_collectible4 = false;
		level5_big_collectible5 = false;

		level6_big_collectible1 = false;
		level6_big_collectible2 = false;
		level6_big_collectible3 = false;
		level6_big_collectible4 = false;
		level6_big_collectible5 = false;

		level7_big_collectible1 = false;
		level7_big_collectible2 = false;
		level7_big_collectible3 = false;
		level7_big_collectible4 = false;
		level7_big_collectible5 = false;

		level8_big_collectible1 = false;
		level8_big_collectible2 = false;
		level8_big_collectible3 = false;
		level8_big_collectible4 = false;
		level8_big_collectible5 = false;

		level9_big_collectible1 = false;
		level9_big_collectible2 = false;
		level9_big_collectible3 = false;
		level9_big_collectible4 = false;
		level9_big_collectible5 = false;

		levela_big_collectible1 = false;
		levela_big_collectible2 = false;
		levela_big_collectible3 = false;
		levela_big_collectible4 = false;
		levela_big_collectible5 = false;
	}
}
