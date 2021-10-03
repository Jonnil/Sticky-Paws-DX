///Post-Draw Event

#region /*End Game*/
if (quit_level_editor=true)
{
	if (quit_level_editor=0)
	{
		instance_activate_all();
		quit_level_editor=1;
	}
}
if (quit_level_editor>0)
{
	quit_level_editor+=1;
	instance_activate_all();

#region /*Save Thumbnail*/

#region /*Center screenshot on weighted_x and weighted_y*/
//var weighted_x = 0;
//var weighted_y = 0;

//with (all)
//{
//	if (x > camera_get_view_x(view_camera[view_current]))
//	and(x < camera_get_view_x(view_camera[view_current])+
//	camera_get_view_width(view_camera[view_current]))
//	and(y > camera_get_view_y(view_camera[view_current]))
//	and(y < camera_get_view_y(view_camera[view_current])+
//	camera_get_view_height(view_camera[view_current]))
//	{
//		obj_leveleditor.total_objects++;
//		weighted_x += x;
//		weighted_y += y;
//	}
//}
//weighted_x = weighted_x / total_objects;
//weighted_y = weighted_y / total_objects;




//with (all) global.spot_x += x;
//with (all) global.spot_y += y;
//global.spot_x/instance_count = screenie_x;
//screenie_x -= 512;
//global.spot_y/instance_count = screenie_y;
//screenie_y -= 384;


#endregion /*Center screenshot on weighted_x and weighted_y END*/

if (quit_level_editor=3)
{
	if (global.select_level_index >= 1)
	{
		file_delete(working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Automatic_Thumbnail.png")
	}
	else
	if (global.select_level_index <= 0)
	{
		file_delete(working_directory+"/custom_levels/"+string(global.level_name)+"/Automatic_Thumbnail.png")
	}
	var thumbnail_sprite;
	thumbnail_sprite = sprite_create_from_surface(application_surface,
	//screenie_x,
	//weighted_x+100,
	//screenie_y,
	//weighted_y+100,
	camera_get_view_x(view_camera[view_current]),
	camera_get_view_y(view_camera[view_current]),
	camera_get_view_width(view_camera[view_current]),
	camera_get_view_height(view_camera[view_current]),
	false,true,0,0);
	if (global.select_level_index >= 1)
	{
		sprite_save(thumbnail_sprite,0,working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Automatic_Thumbnail.png");
	}
	else
	if (global.select_level_index <= 0)
	{
		sprite_save(thumbnail_sprite,0,working_directory+"/custom_levels/"+string(global.level_name)+"/Automatic_Thumbnail.png");
	}
	sprite_delete(thumbnail_sprite);
}
#endregion /*Save Thumbnail End*/

#region /*Save Level*/
if (quit_level_editor=4)
and(global.character_select_in_this_menu = "level_editor")
{
	
	#region /*Create directory for saving custom levels*/
	if (global.select_level_index >= 1)
	and (!directory_exists(working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))))
	{
		directory_create(working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)));
	}
	else
	if (global.select_level_index <= 0)
	and (!directory_exists(working_directory+"/custom_levels/"+string(global.level_name)))
	{
		directory_create(working_directory+"/custom_levels/"+string(global.level_name));
	}
	#endregion /*Create directory for saving custom levels END*/
	
	#region /*Save object placement*/
	instance_activate_all();
	var file,str;
	if (global.select_level_index >= 1)
	{
		file=file_text_open_write(working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/Object_Placement.txt"); /*Open file for writing*/
	}
	else
	if (global.select_level_index <= 0)
	{
		file=file_text_open_write(working_directory+"/custom_levels/"+string(global.level_name)+"/data/Object_Placement.txt"); /*Open file for writing*/
	}
	str=""; /*Reset string var*/
	
	#region /*Write all objects to file*/
	with(obj_leveleditor_placed_object)
	{
		if (object != 62)
		and(object != 64)
		and(object != 65)
		and(object != 732)
		and(object != 733)
		and(object != 734)
		{
			str+=string(x)+"|"+string(y)+"|"+string(object)+"|"+string(easy)+"|"+string(normal)+"|"+string(hard)+"|";
		}
	}
	#endregion /*Write all objects to file END*/
	
	file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
	file_text_close(file);
	
	#endregion /*Save object placement END*/
	
	scr_save_objects_with_rotation_placement();
	
	#region /*Save Level Information*/
	if (global.character_select_in_this_menu = "level_editor") /*Only save this if you're in the level editor, otherwise level folders for main game will be created in AppData*/
	{
		if (global.select_level_index >= 1)
		{
			ini_open(working_directory+"/custom_levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/data/level_information.ini");
		}
		else
		if (global.select_level_index <= 0)
		{
			ini_open(working_directory+"/custom_levels/"+string(global.level_name)+"/data/level_information.ini");
		}
		ini_write_string("Info","level_name",level_name);
		if (instance_exists(obj_level_player_1_start))
		{
			ini_write_real("Info","level_player_1_start_x",obj_level_player_1_start.x);
		}
		if (instance_exists(obj_level_player_1_start))
		{
			ini_write_real("Info","level_player_1_start_y",obj_level_player_1_start.y);
		}
		if (instance_exists(obj_level_player_2_start))
		{
			ini_write_real("Info","level_player_2_start_x",obj_level_player_2_start.x);
		}
		if (instance_exists(obj_level_player_2_start))
		{
			ini_write_real("Info","level_player_2_start_y",obj_level_player_2_start.y);
		}
		if (instance_exists(obj_level_player_3_start))
		{
			ini_write_real("Info","level_player_3_start_x",obj_level_player_3_start.x);
		}
		if (instance_exists(obj_level_player_3_start))
		{
			ini_write_real("Info","level_player_3_start_y",obj_level_player_3_start.y);
		}
		if (instance_exists(obj_level_player_4_start))
		{
			ini_write_real("Info","level_player_4_start_x",obj_level_player_4_start.x);
		}
		if (instance_exists(obj_level_player_4_start))
		{
			ini_write_real("Info","level_player_4_start_y",obj_level_player_4_start.y);
		}
		if (instance_exists(obj_level_end))
		{
			ini_write_real("Info","level_end_x",obj_level_end.x);
		}
		if (instance_exists(obj_level_end))
		{
			ini_write_real("Info","level_end_y",obj_level_end.y);
		}
		if (instance_exists(obj_level_height))
		{
			ini_write_real("Info","level_height",obj_level_height.y);
		}
		ini_write_real("Info","view_xview",camera_get_view_x(view_camera[view_current]));
		ini_write_real("Info","view_yview",camera_get_view_y(view_camera[view_current]));
		ini_close();
	}
	#endregion /*Save Level Information END*/
	
}

#endregion /*Save Level END*/

}

if (quit_level_editor>5)
{
	room_goto(room_title);
}
#endregion /*End Game End*/

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_foreground1")==asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground2")==asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_level_player_1_start")==asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start")==asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start")==asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start")==asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_level_end")==asset_object)
{
	instance_activate_object(obj_level_end);
}
#endregion /*Activate objects that always should be active END*/