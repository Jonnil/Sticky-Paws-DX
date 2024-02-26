var level_name = string(ds_list_find_value(global.all_loaded_main_levels, other.level));

if (distance_to_point(other.x, other.y) < 3)
&& (other.clear_rate != "clear")
&& (other.level != come_from_level)
&& (delay == 0)
{
	other.clear_rate = "enter";
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_string(level_name, "clear_rate", "enter");
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}