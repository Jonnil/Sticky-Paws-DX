background_layer_x += 1;
background_layer_y += 1;
layer_x(layer_get_id("Background"),background_layer_x);
layer_y(layer_get_id("Background"),background_layer_y);

if (global.file < 1)
{
	global.file = 1; /*Don't let file go less than 1*/
}

#region /*Menu cursor image speed*/
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /*Menu cursor image speed END*/

if (menu_delay > 0)
{
	menu_delay -= 1;
}

if (lerp_on == true)
{
	scroll = lerp(scroll, scroll_to, 0.15)
	if (scroll == scroll_to)
	{
		lerp_on = false;
	}
}

if (menu = "load_characters")
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
		file_found = file_find_next()
	
		if (file_found=="")
		{
			file_find_close();
			scr_load_all_character_portraits();
			menu = "select_character";
		}
		else
		{
			file_exists(working_directory+"custom_characters/"+file_found+"/data/character_config.ini")
			ds_list_add(global.all_loaded_characters, file_found)
			
			file_load_timer = 0; /*1 not 0. So it doesn't do the file_find_first code which it does at 0*/
		}
	}
}

#region /*Load Custom Level*/
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
		file_found = file_find_next()
		
		if (file_found=="")
		{
			file_find_close();
			select_custom_level_menu_open = true;
			menu = "level_editor_play";
		}
		else
		{
			if (directory_exists(working_directory+"/custom_levels/"+file_found))
			{
				ds_list_add(global.all_loaded_custom_levels, file_found)
			}
			
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
			if (file_exists(working_directory+"/custom_levels/"+file_found+"/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add(working_directory+"/custom_levels/"+file_found+"/automatic_thumbnail.png",0,false,true,0,0));
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
#endregion /*Load Custom Level END*/

#region /*Load Official Level Template*/
if (menu = "load_official_level_template")
{
	/*Load official level data*/
	
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
		file_found = ds_list_find_value(global.all_loaded_main_levels, level_find_pos)
		level_find_pos += 1;
		
		if (file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1))
		{
			file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1)
			
			#region /*Update Thumbnail*/
			
			/*BMP Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.bmp",0,false,true,0,0));
			}
			else
			/*PNG Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.png",0,false,true,0,0));
			}
			else
			/*GIF Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.gif",0,false,true,0,0));
			}
			else
			/*JPG Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.jpg",0,false,true,0,0));
			}
			else
			/*PNG Automatic Thumbnail*/
			if (file_exists("levels/"+file_found+"/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/automatic_thumbnail.png",0,false,true,0,0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /*Update Thumbnail END*/
			
			select_custom_level_menu_open = false;
			level_editor_template_select = true;
			menu = "level_editor_play";
		}
		else
		{
			
			#region /*Update Thumbnail*/
			/*BMP Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.bmp",0,false,true,0,0));
			}
			else
			/*PNG Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.png",0,false,true,0,0));
			}
			else
			/*GIF Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.gif",0,false,true,0,0));
			}
			else
			/*JPG Official Thumbnail*/
			if (file_exists("levels/"+file_found+"/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/Thumbnail.jpg",0,false,true,0,0));
			}
			else
			/*PNG Automatic Thumbnail*/
			if (file_exists("levels/"+file_found+"/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/"+file_found+"/automatic_thumbnail.png",0,false,true,0,0));
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
#endregion /*Load Official Level Template END*/

#region /*Play Title Screen Music*/
if (title_music > noone)
{
	audio_sound_gain(title_music, global.music_volume, 0);
}
#endregion /*Play Title Screen Music END*/