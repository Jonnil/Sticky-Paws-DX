background_layer_x += 1;
background_layer_y += 1;
layer_x(layer_get_id("Background"),background_layer_x);
layer_y(layer_get_id("Background"),background_layer_y);

if (menu = "load_custom_level")
{
	/*Load custom level data*/
	
	file_load_timer+=1
	
	if (file_load_timer>global.custom_level_load_delay)
	{
		file_found=file_find_next()
	
		if file_found==""
		{
			file_find_close()
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
		}
		else
		{
			directory_exists(working_directory+"/Custom Levels/"+file_found)
			ds_list_add(global.all_loaded_custom_levels, file_found)
			
			#region /*Update Thumbnail*/
			/*BMP Custom Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.bmp",0,false,true,0,0));
			}
			else
			/*PNG Custom Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.png",0,false,true,0,0));
			}
			else
			/*GIF Custom Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.gif",0,false,true,0,0));
			}
			else
			/*JPG Custom Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Thumbnail.jpg",0,false,true,0,0));
			}
			else	
			/*BMP Automatic Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.bmp",0,false,true,0,0));
			}
			else
			/*PNG Automatic Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.png",0,false,true,0,0));
			}
			else
			/*GIF Automatic Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.gif",0,false,true,0,0));
			}
			else
			/*JPG Automatic Thumbnail*/if (file_exists(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/Custom Levels/"+file_found+"/Automatic Thumbnail.jpg",0,false,true,0,0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /*Update Thumbnail END*/
			
			file_load_timer = 0;
		}
	}
}