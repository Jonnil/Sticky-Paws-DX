function scr_save_objects_with_rotation_placement()
{

#region /*Save objects with rotation placement*/
instance_activate_all();
var file,str;
file=file_text_open_write(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Data/Object_Rotation_Placement.txt"); /*Open file for writing*/
str=""; /*Reset string var*/
	
#region /*Write all objects to file*/
with(obj_leveleditor_placed_object)
{
	if (object = 62)
	or(object = 64)
	or(object = 65)
	or(object = 732)
	or(object = 733)
	or(object = 734)
	{
		str+=string(x)+"|"+string(y)+"|"+string(object)+"|"+string(easy)+"|"+string(normal)+"|"+string(hard)+"|"+string(angle_x)+"|"+string(angle_y)+"|";
	}
}
#endregion /*Write all objects to file END*/
	
file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
file_text_close(file);
	
#endregion /*Save object with rotation placement END*/

}