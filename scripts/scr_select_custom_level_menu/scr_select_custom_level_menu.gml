function scr_select_custom_level_menu()
{
	R = 4;
	
	C = floor(global.select_level_index/R)
	
	#region /*Navigate Menu*/
	
	#region /*Key Up*/
	if (key_up)
	and (open_sub_menu = false)
	{
		if (global.select_level_index-R < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite)-1;
		}
		else
		{
			global.select_level_index -= R;
		}
	}
	#endregion /*Key Up END*/
	
	else
	
	#region /*Key Down*/
	if (key_down)
	and (open_sub_menu = false)
	{
		if (global.select_level_index+R > ds_list_size(global.thumbnail_sprite)-1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index += R;
		}
	}
	#endregion /*Key Down END*/
	
	else
	
	#region /*Key Left*/
	if (key_left)
	and (open_sub_menu = false)
	{
		if (global.select_level_index-1 < 0)
		{
			global.select_level_index = ds_list_size(global.thumbnail_sprite)-1;
		}
		else
		{
			global.select_level_index -= 1;
		}
	}
	#endregion /*Key Left END*/
	
	else
	
	#region /*Key Right*/
	if (key_right)
	and (open_sub_menu = false)
	{
		if (global.select_level_index+1 > ds_list_size(global.thumbnail_sprite)-1)
		{
			global.select_level_index = 0;
		}
		else
		{
			global.select_level_index += 1;
		}
	}
	#endregion /*Key Right END*/
	
	else
	
	#region /*Key A Pressed*/
	if (key_a_pressed)
	and (open_sub_menu = false)
	and (menu_delay = 0)
	{
		
		#region /*Create New Level*/
		if (global.select_level_index = 0)
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
		
		else
		
		#region /*Open sub menu for levels*/
		if (global.select_level_index >= 1)
		{
			menu_delay=3;
			open_sub_menu = true;
		}
		#endregion /*Open sub menu for levels END*/
		
	}
	#endregion /*Key A Pressed END*/
	
	else
	
	#region /*Key B Pressed*/
	if (key_b_pressed)
	and (menu_delay = 0)
	{
		if (open_sub_menu = true)
		{
			menu_delay = 3;
			open_sub_menu = false;
		}
	}
	#endregion /*Key B Pressed END*/
	
	#endregion /*Navigate Menu END*/
	
	#region /*Back Button*/
	draw_menu_button(0,0,"Back","back_from_level_editor","leveleditor");
	
	if (menu="back_from_level_editor")
	and(key_a_pressed)
	and(menu_delay=0)
	and(open_sub_menu = false)
	or(key_b_pressed)
	and(menu_delay=0)
	and(open_sub_menu = false)
	{
		menu_delay = 3;
		can_navigate = true;
		select_custom_level_menu_open = false;
		menu = "leveleditor";
	}
	if (menu="back_from_level_editor")
	{
		if (global.controls_used_for_menu_navigation="keyboard")
		or(global.controls_used_for_menu_navigation="controller")
		{
			draw_sprite_ext(spr_menu_cursor,menu_cursor_index,400,20,1,1,180,c_white,1);
		}
	}
	#endregion /*Back Button END*/
	
	draw_rectangle_color(394*(global.select_level_index-C*R)+300-3, 226*C+250-3, 394*(global.select_level_index-C*R)+300+384+3, 226*C+250+216+3, c_red, c_red, c_red, c_red, false);
	
	#region /*Draw Thumbnail*/
	for (i=0;i<ds_list_size(global.thumbnail_sprite);i+=1)
	{
		C=floor(i/R)
		draw_sprite_ext(ds_list_find_value(global.thumbnail_sprite, i), 0, 394*(i-C*R)+300, 226*C+250, 384/sprite_get_width(ds_list_find_value(global.thumbnail_sprite, i)), 216/sprite_get_height(ds_list_find_value(global.thumbnail_sprite, i)), 0, c_white, 1);
	}
	#endregion /*Draw Thumbnail END*/
	
	C=floor(global.select_level_index/R)
	
	#region /*Draw sub menu (code must be here to be above everything else)*/
	if (open_sub_menu = true)
	{
		
		#region /*Navigate Sub Menu*/
		if (key_up)
		{
			if (menu = "level_editor_play")
			{
				menu = "level_editor_delete"
			}
			else
			if (menu = "level_editor_make")
			{
				menu = "level_editor_play"
			}
			else
			if (menu = "level_editor_delete")
			{
				menu = "level_editor_make"
			}
		}
		else
		if (key_down)
		{
			if (menu = "level_editor_play")
			{
				menu = "level_editor_make"
			}
			else
			if (menu = "level_editor_make")
			{
				menu = "level_editor_delete"
			}
			else
			if (menu = "level_editor_delete")
			{
				menu = "level_editor_play"
			}
		}
		
		#region /*Key A Pressed*/
		if (key_a_pressed)
		and (menu_delay = 0)
		{
			
			#region /*Pressing the Play button*/
			if (menu = "level_editor_play")
			{
				global.actually_play_edited_level = true;
				global.play_edited_level = true;
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
			#endregion /*Pressing the Play button END*/
			
			else
			
			#region /*Pressing the Make button*/
			if (menu = "level_editor_make")
			{
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
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
			#endregion /*Pressing the make button END*/
			
			else
			
			#region /*Pressing the Delete button*/
			if (menu = "level_editor_play")
			{
				menu_delay=3;
			}
			#endregion /*Pressing the Delete button END*/
			
		}
		#endregion /*Key A Pressed END*/
		
		#region /*Navigate Sub Menu*/
		
		draw_rectangle_color(394*(global.select_level_index-C*R)+300-3, 226*C+455-3, 394*(global.select_level_index-C*R)+300+384+3, 226*C+408+216+3, c_white, c_white, c_white, c_white, false);
		draw_menu_button(394*(global.select_level_index-C*R)+310-3, 226*C+475-3, "Play", "level_editor_play", "level_editor_play");
		draw_menu_button(394*(global.select_level_index-C*R)+310-3, 226*C+522-3, "Make", "level_editor_make", "level_editor_make"); /*+47 on y*/
		draw_menu_button(394*(global.select_level_index-C*R)+310-3, 226*C+569-3, "Delete", "level_editor_delete", "level_editor_delete");
	}
	#endregion /*Draw sub menu END*/
	
	#region /*Enter Level*/
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
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.bmp")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.png")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.gif")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.jpg")){global.custom_background1=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background1.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background1=noone;
			}
			#endregion /*Update Background1 END*/
			
			#region /*Update Background2*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.bmp")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.png")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.gif")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.jpg")){global.custom_background2=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background2.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background2=noone;
			}
			#endregion /*Update Background2 END*/
			
			#region /*Update Background3*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.bmp")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.png")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.gif")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.jpg")){global.custom_background3=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background3.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background3=noone;
			}
			#endregion /*Update Background3 END*/
			
			#region /*Update Background4*/
			/*BMP small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_vtiled[0]=true;}else
			/*BMP big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.bmp")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.bmp",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*PNG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.png")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.png",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*Gif (big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.gif")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.gif",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG small letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			/*JPG big letter File*/if (file_exists(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.jpg")){global.custom_background4=sprite_add(working_directory+"/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Background4.jpg",0,false,false,0,0);layer_background_htiled[0]=true;layer_background_htiled[0]=true;}else
			{
				global.custom_background4=noone;
			}
			#endregion /*Update Background4 END*/
						
			#region /*Update Foreground1*/
			
			#region /*BMP small letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.bmp"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.png"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.gif"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if (file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.jpg"))
			{
				global.custom_foreground1 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground1.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG big letter File END*/
			
			{
				global.custom_foreground1 = noone;
			}
			
			#endregion /*Update Foreround1 END*/
			
			#region /*Update Foreground2*/
			
			#region /*BMP small letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP small letter File END*/
			
			#region /*BMP big letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.bmp")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.bmp", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*BMP big letter File END*/
			
			#region /*PNG small letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG small letter File END*/
			
			#region /*PNG big letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.png")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.png", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*PNG big letter File END*/
			
			#region /*GIF small letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF small letter File END*/
			
			#region /*GIF big letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.gif")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.gif", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*GIF big letter File END*/
			
			#region /*JPG small letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/foreground2.jpg", image_speed, false, false, 0, 0);
			}
			else
			#endregion /*JPG small letter File END*/
			
			#region /*JPG big letter File*/
			if file_exists(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.jpg")
			{
				global.custom_foreground2 = sprite_add(working_directory + "/Custom Levels/"+string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index))+"/Backgrounds/Foreground2.jpg", image_speed, false, false, 0, 0);
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
	#endregion /*Enter Level END*/
	
}