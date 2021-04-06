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
var weighted_x = 0;
var weighted_y = 0;

with (all)
{
	if (x > camera_get_view_x(view_camera[view_current]))
	and(x < camera_get_view_x(view_camera[view_current])+
	camera_get_view_width(view_camera[view_current]))
	and(y > camera_get_view_y(view_camera[view_current]))
	and(y < camera_get_view_y(view_camera[view_current])+
	camera_get_view_height(view_camera[view_current]))
	{
		obj_leveleditor.total_objects++;
		weighted_x += x;
		weighted_y += y;
	}
}
weighted_x = weighted_x / total_objects;
weighted_y = weighted_y / total_objects;




//with (all) global.spot_x += x;
//with (all) global.spot_y += y;
//global.spot_x/instance_count = screenie_x;
//screenie_x -= 512;
//global.spot_y/instance_count = screenie_y;
//screenie_y -= 384;


#endregion /*Center screenshot on weighted_x and weighted_y END*/

if (quit_level_editor=3)
{
	file_delete(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Automatic Thumbnail.png")
	var thumbnail_sprite;
	thumbnail_sprite = sprite_create_from_surface(application_surface,
	//screenie_x,
	weighted_x+100,
	//screenie_y,
	weighted_y+100,
	camera_get_view_width(view_camera[view_current]),
	camera_get_view_height(view_camera[view_current]),
	false,true,0,0);
	sprite_save(thumbnail_sprite,0,working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Automatic Thumbnail.png");
	sprite_delete(thumbnail_sprite);
}
#endregion /*Save Thumbnail End*/

#region /*Save Level*/
if (quit_level_editor=4)
and(global.character_select_in_this_menu="level_editor")
{
	
	#region /*Create directory for saving custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level));
	}
	#endregion /*Create directory for saving custom levels END*/
	
	#region /*Save object placement*/
	instance_activate_all();
	var file,str;
	file=file_text_open_write(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Placement.txt"); /*Open file for writing*/
	str=""; /*Reset string var*/
	
	#region /*Write all objects to file*/
	with(obj_leveleditor_placed_object)
	{
		if (object != 62)
		and(object != 64)
		and(object != 65)
		{
			str+=string(x)+"|"+string(y)+"|"+string(object)+"|"+string(easy)+"|"+string(normal)+"|"+string(hard)+"|";
		}
	}
	#endregion /*Write all objects to file END*/
	
	file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
	file_text_close(file);
	
	#endregion /*Save object placement END*/
	
	#region /*Save objects with rotation placement*/
	instance_activate_all();
	var file,str;
	file=file_text_open_write(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Rotation_Placement.txt"); /*Open file for writing*/
	str=""; /*Reset string var*/
	
	#region /*Write all objects to file*/
	with(obj_leveleditor_placed_object)
	{
		if (object = 62)
		or(object = 64)
		or(object = 65)
		{
			str+=string(x)+"|"+string(y)+"|"+string(object)+"|"+string(easy)+"|"+string(normal)+"|"+string(hard)+"|"+string(angle_x)+"|"+string(angle_y)+"|";
		}
	}
	#endregion /*Write all objects to file END*/
	
	file_text_write_string(file,str); /*Write string with wall information to file and start a new line*/
	file_text_close(file);
	
	#endregion /*Save object with rotation placement END*/
	
	#region /*Save Level Information*/
	ini_open(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini");
	ini_write_string("Info","level_name",level_name);
	if (instance_exists(obj_level_start))
	{
		ini_write_real("Info","level_start_x",obj_level_start.x);
	}
	if (instance_exists(obj_level_start))
	{
		ini_write_real("Info","level_start_y",obj_level_start.y);
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
	#endregion /*Save Level Information END*/
	
}

#endregion /*Save Level END*/

}

if (quit_level_editor>5)
{

	/*Save whole level as png file*/
	//global.show_tutorial_signs=false;
	//if asset_get_type("obj_camera")==asset_object and instance_number(obj_camera)>0{instance_destroy(obj_camera)}
	//var custom_level_map_sprite;
	//camera_get_view_x(view_camera[view_current])[0]=0;
	//camera_get_view_y(view_camera[view_current])[0]=0;
	//camera_get_view_width(view_camera[view_current])[0]=room_width;
	//camera_get_view_height(view_camera[view_current])[0]=room_height;
	//window_set_rectangle(0,0,room_width,room_height);
	//surface_resize(application_surface,room_width,room_height);
	//custom_level_map_sprite=sprite_create_from_surface(application_surface,0,0,room_width,room_height,false,false,0,0);
	//sprite_save(custom_level_map_sprite,0,working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Level Map.png");
	//sprite_delete(custom_level_map_sprite);/*Save whole level as png file END*/
	
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
if (asset_get_type("obj_level_start")==asset_object)
{
	instance_activate_object(obj_level_start);
}
if (asset_get_type("obj_level_end")==asset_object)
{
	instance_activate_object(obj_level_end);
}
#endregion /*Activate objects that always should be active END*/