function scr_save_objects_with_rotation_placement()
{

#region /*Save objects with rotation placement*/
instance_activate_all();
var file,str;
if (global.select_level_index >= 1)
and (global.create_level_from_template = false)
{
	file = file_text_open_write(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/object_rotation_placement.txt"); /*Open file for writing*/
}
else
if (global.level_name != "")
{
	file = file_text_open_write(working_directory + "/custom_levels/" + string(global.level_name) + "/data/object_rotation_placement.txt"); /*Open file for writing*/
}
str=""; /*Reset string var*/
	
#region /*Write all objects to file*/
with(obj_leveleditor_placed_object)
{
	if (object = 62)
	or (object = 64)
	or (object = 65)
	or (object = 732)
	or (object = 733)
	or (object = 734)
	or (object = 73)
	{
		str+=string(x) + "|" + string(y) + "|" + string(object) + "|" + string(easy) + "|" + string(normal) + "|" + string(hard) + "|" + string(second_x) + "|" + string(second_y) + "|";
	}
}
#endregion /*Write all objects to file END*/
	
file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
file_text_close(file);
	
#endregion /*Save object with rotation placement END*/

}