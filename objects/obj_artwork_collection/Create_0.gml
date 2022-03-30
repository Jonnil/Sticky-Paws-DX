menu = "";
menu_cursor_index = 0;
menu_delay = 0;
image_alpha = 0;
sprite_index = global.resource_pack_sprite_artwork_collection;
max_artwork = 45; /*The number of artworks corresponds with the total amount of big collectibles in the game*/
can_navigate = false;
current_comment = "";
xx = window_get_width() / 2;
yy = y;
if (global.demo = true)
{
	instance_destroy();
}
gamepad_stick = false;

if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
{
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	
	level1_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 1), "big_collectible1", 0);
	level1_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 1), "big_collectible2", 0);
	level1_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 1), "big_collectible3", 0);
	level1_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 1), "big_collectible4", 0);
	level1_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 1), "big_collectible5", 0);
	
	level2_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 2), "big_collectible1", 0);
	level2_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 2), "big_collectible2", 0);
	level2_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 2), "big_collectible3", 0);
	level2_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 2), "big_collectible4", 0);
	level2_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 2), "big_collectible5", 0);
	
	level3_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 3), "big_collectible1", 0);
	level3_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 3), "big_collectible2", 0);
	level3_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 3), "big_collectible3", 0);
	level3_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 3), "big_collectible4", 0);
	level3_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 3), "big_collectible5", 0);
	
	level4_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 4), "big_collectible1", 0);
	level4_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 4), "big_collectible2", 0);
	level4_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 4), "big_collectible3", 0);
	level4_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 4), "big_collectible4", 0);
	level4_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 4), "big_collectible5", 0);
	
	level5_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 5), "big_collectible1", 0);
	level5_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 5), "big_collectible2", 0);
	level5_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 5), "big_collectible3", 0);
	level5_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 5), "big_collectible4", 0);
	level5_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 5), "big_collectible5", 0);
	
	level6_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 6), "big_collectible1", 0);
	level6_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 6), "big_collectible2", 0);
	level6_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 6), "big_collectible3", 0);
	level6_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 6), "big_collectible4", 0);
	level6_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 6), "big_collectible5", 0);
	
	level7_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 7), "big_collectible1", 0);
	level7_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 7), "big_collectible2", 0);
	level7_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 7), "big_collectible3", 0);
	level7_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 7), "big_collectible4", 0);
	level7_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 7), "big_collectible5", 0);
	
	level8_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 8), "big_collectible1", 0);
	level8_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 8), "big_collectible2", 0);
	level8_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 8), "big_collectible3", 0);
	level8_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 8), "big_collectible4", 0);
	level8_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 8), "big_collectible5", 0);
	
	level9_big_collectible1 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 10), "big_collectible1", 0);
	level9_big_collectible2 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 10), "big_collectible2", 0);
	level9_big_collectible3 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 10), "big_collectible3", 0);
	level9_big_collectible4 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 10), "big_collectible4", 0);
	level9_big_collectible5 = ini_read_real(ds_list_find_value(global.all_loaded_main_levels, 10), "big_collectible5", 0);
	
	ini_close();
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
}