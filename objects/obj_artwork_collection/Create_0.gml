artwork = 1;
max_artwork = 46; /*The number of artworks corresponds with the total amount of big collectibles in the game*/
can_navigate = false;
show_comments = true;
current_comment = "Test";
xx = view_xview + view_wview / 2;
if (global.demo = true)
{
	instance_destroy();
}
gamepad_stick = false;

if (file_exists("file" + string(global.file) + ".ini"))
{
	ini_open("file" + string(global.file) + ".ini");
	
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
	level1_big_collectible1 = noone;
	level1_big_collectible2 = noone;
	level1_big_collectible3 = noone;
	level1_big_collectible4 = noone;
	level1_big_collectible5 = noone;
	
	level2_big_collectible1 = noone;
	level2_big_collectible2 = noone;
	level2_big_collectible3 = noone;
	level2_big_collectible4 = noone;
	level2_big_collectible5 = noone;
	
	level3_big_collectible1 = noone;
	level3_big_collectible2 = noone;
	level3_big_collectible3 = noone;
	level3_big_collectible4 = noone;
	level3_big_collectible5 = noone;
	
	level4_big_collectible1 = noone;
	level4_big_collectible2 = noone;
	level4_big_collectible3 = noone;
	level4_big_collectible4 = noone;
	level4_big_collectible5 = noone;
	
	level5_big_collectible1 = noone;
	level5_big_collectible2 = noone;
	level5_big_collectible3 = noone;
	level5_big_collectible4 = noone;
	level5_big_collectible5 = noone;
	
	level6_big_collectible1 = noone;
	level6_big_collectible2 = noone;
	level6_big_collectible3 = noone;
	level6_big_collectible4 = noone;
	level6_big_collectible5 = noone;
	
	level7_big_collectible1 = noone;
	level7_big_collectible2 = noone;
	level7_big_collectible3 = noone;
	level7_big_collectible4 = noone;
	level7_big_collectible5 = noone;
	
	level8_big_collectible1 = noone;
	level8_big_collectible2 = noone;
	level8_big_collectible3 = noone;
	level8_big_collectible4 = noone;
	level8_big_collectible5 = noone;
	
	level9_big_collectible1 = noone;
	level9_big_collectible2 = noone;
	level9_big_collectible3 = noone;
	level9_big_collectible4 = noone;
	level9_big_collectible5 = noone;
}