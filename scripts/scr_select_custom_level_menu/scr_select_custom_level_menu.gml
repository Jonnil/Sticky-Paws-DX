function scr_select_custom_level_menu()
{
	R=4
	ds_list_add(global.all_loaded_custom_levels, "Level1")
	
	draw_text_outlined(100, 100, string(ds_list_find_value(global.all_loaded_custom_levels,0)), global.default_text_size, c_white, c_black, 1);
	
	C=floor(select_level_index/R)
	
	if (key_up)
	{
		if (select_level_index-R < 0)
		{
			select_level_index = ds_list_size(global.thumbnail_sprite)-1;
		}
		else
		{
			select_level_index -= R;
		}
	}
	else
	if (key_down)
	{
		if (select_level_index+R > ds_list_size(global.thumbnail_sprite)-1)
		{
			select_level_index = 0;
		}
		else
		{
			select_level_index += R;
		}
	}
	else
	if (key_left)
	{
		if (select_level_index-1 < 0)
		{
			select_level_index = ds_list_size(global.thumbnail_sprite)-1;
		}
		else
		{
			select_level_index -= 1;
		}
	}
	else
	if (key_right)
	{
		if (select_level_index+1 > ds_list_size(global.thumbnail_sprite)-1)
		{
			select_level_index = 0;
		}
		else
		{
			select_level_index += 1;
		}
	}
	else
	if (key_a_pressed)
	{
		
		#region /*Create New Level*/
		if (select_level_index = 0)
		{
			can_navigate=false;
			menu_delay=999;
			if (asset_get_type("obj_camera")==asset_object)
			and(instance_exists(obj_camera))
			{
				with(obj_camera)
				{
					iris_zoom=0;
				}
			}
		}
		#endregion /*Create New Level END*/
		
	}
	
	draw_rectangle_color(394*(select_level_index-C*R)+300-3, 226*C+250-3, 394*(select_level_index-C*R)+300+384+3, 226*C+250+216+3, c_red, c_red, c_red, c_red, false);
	
	for (i=0;i<ds_list_size(global.thumbnail_sprite);i+=1)
	{
		C=floor(i/R)
		draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394*(i-C*R)+300, 226*C+250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
	}
	
	#region /*Make Level Editor*/
	if (iris_xscale<=0.001)
	and (global.character_select_in_this_menu="level_editor")
	{
		if (asset_get_type("snd_music_titlescreen")==asset_sound)
		{
			if (audio_is_playing(snd_music_titlescreen))
			{
				audio_stop_sound(snd_music_titlescreen);
			}
		}
		if (asset_get_type("room_leveleditor")==asset_room)
		{
			sprite_delete(title_screen_background);
			
			#region /*Update All Backgrounds*/
			
			sprite_delete(global.custom_background1);
			sprite_delete(global.custom_background2);
			sprite_delete(global.custom_background3);
			sprite_delete(global.custom_background4);
			sprite_delete(global.custom_foreground1);
			sprite_delete(global.custom_foreground2);
			
			#region /*Update Background1*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background1=noone;
			}
			#endregion /*Update Background1 END*/
			
			#region /*Update Background2*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background2=noone;
			}
			#endregion /*Update Background2 END*/
			
			#region /*Update Background3*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background3=noone;
			}
			#endregion /*Update Background3 END*/
			
			#region /*Update Background4*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background4=noone;
			}
			#endregion /*Update Background4 END*/
						
			#region /*Update Foreground1*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /*Update Foreround1 END*/
			
			#region /*Update Foreground2*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/Level" + string(global.level_editor_level) + "/Backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground2 = noone;
			}
			
			#endregion /*Update Foreround2 END*/
			
			#endregion /*Update All Backgrounds END*/
			
			room_goto(room_leveleditor);
		}
		global.actually_play_edited_level=false;
		global.play_edited_level=false;
	}
	#endregion /*Make Level Editor END*/
	
}