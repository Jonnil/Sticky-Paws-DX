var uppercase_level_name;
uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, other.level)), 1));
uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, other.level)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, other.level))) - 1);
var level_name = string(uppercase_level_name);

if (other.clear_rate != "clear")
and (other.level != come_from_level)
and (delay == 0)
{
	other.clear_rate = "enter";
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	ini_write_string(level_name, "clear_rate", "enter");
	ini_close();
}
instance_destroy();
