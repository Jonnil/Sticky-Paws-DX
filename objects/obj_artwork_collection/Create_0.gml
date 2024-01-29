what_player_navigate = 1;
menu = "";
open_dropdown = false;
menu_cursor_index = 0;
menu_delay = 3;
image_alpha = 0;
sprite_index = global.resource_pack_sprite_artwork_collection;
max_artwork = 50; /* The number of artworks corresponds with the total amount of big collectibles in the game */
can_navigate = false;
current_comment = "";
xx = window_get_width() * 0.5;
yy = y;
gamepad_stick = false;

if (file_exists(working_directory + "save_file/file" + string(global.file) + ".ini"))
{
	ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
	
	level_number = 1;
	level_name = string(ds_list_find_value(global.all_loaded_main_levels, level_number));
	
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
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
{
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