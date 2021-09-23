background_layer_x += 1;
background_layer_y += 1;
layer_x(layer_get_id("Background"),background_layer_x);
layer_y(layer_get_id("Background"),background_layer_y);

if (menu = "load_custom_level")
{
	/*Load custom level data*/
	
	file_load_timer += 1;
	
	if (global.custom_level_load_delay = 0)
	and (file_load_timer>1)
	or (global.custom_level_load_delay = 1)
	and (file_load_timer>2)
	or (global.custom_level_load_delay = 2)
	and (file_load_timer>4)
	or (global.custom_level_load_delay = 3)
	and (file_load_timer>8)
	or (global.custom_level_load_delay = 4)
	and (file_load_timer>16)
	or (global.custom_level_load_delay = 5)
	and (file_load_timer>32)
	or (global.custom_level_load_delay = 6)
	and (file_load_timer>64)
	or (global.custom_level_load_delay = 7)
	and (file_load_timer>128)
	or (global.custom_level_load_delay = 8)
	and (file_load_timer>256)
	or (global.custom_level_load_delay = 9)
	and (file_load_timer>512)
	{
		file_found=file_find_next()
	
		if (file_found=="")
		{
			file_find_close();
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
		}
		else
		{
			directory_exists(working_directory+"/custom_levels/"+file_found)
			ds_list_add(global.all_loaded_custom_levels, file_found)
			
			#region /*Update Thumbnail*/
			/*BMP Custom Thumbnail*/if (file_exists(working_directory+"/custom_levels/"+file_found+"/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/Thumbnail.bmp",0,false,true,0,0));
			}
			else
			/*PNG Custom Thumbnail*/if (file_exists(working_directory+"/custom_levels/"+file_found+"/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/Thumbnail.png",0,false,true,0,0));
			}
			else
			/*GIF Custom Thumbnail*/if (file_exists(working_directory+"/custom_levels/"+file_found+"/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/Thumbnail.gif",0,false,true,0,0));
			}
			else
			/*JPG Custom Thumbnail*/if (file_exists(working_directory+"/custom_levels/"+file_found+"/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/Thumbnail.jpg",0,false,true,0,0));
			}
			else
			/*PNG Automatic Thumbnail*/
			if (file_exists(working_directory+"/custom_levels/"+file_found+"/Automatic_Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/Automatic_Thumbnail.png",0,false,true,0,0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /*Update Thumbnail END*/
			
			file_load_timer = 0; /*1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
}