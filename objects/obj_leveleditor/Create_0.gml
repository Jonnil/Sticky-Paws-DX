depth = -300;

#region /*Mouse x and mouse y initializing*/
mx = mouse_x;
my = mouse_y;
#endregion /*Mouse x and mouse y initializing END*/

sprite_enemy1 = spr_mouse;
sprite_enemy2 = spr_big_rat;

#region /*Create Foreground*/
if (asset_get_type("obj_foreground1")==asset_object)
and(!instance_exists(obj_foreground1))
{
	instance_create_depth(0,0,0,obj_foreground1);
}
if (asset_get_type("obj_foreground2")==asset_object)
and(!instance_exists(obj_foreground2))
{
	instance_create_depth(0,0,0,obj_foreground2);
}
#endregion /*Create Foreground END*/

#region /*Create level height and level width objects*/
if (asset_get_type("obj_level_height")==asset_object)
and(!instance_exists(obj_level_height))
{
	instance_create_depth(0,0,0,obj_level_height);
}
if (asset_get_type("obj_level_width")==asset_object)
and(!instance_exists(obj_level_width))
{
	instance_create_depth(2720,0,0,obj_level_width);
}
#endregion /*Create level height and level width objects END*/


audio_stop_all();
if (global.actually_play_edited_level = true)
{
	instance_destroy();
}
room_speed = global.max_fps; /*Set correct fps*/
x=mouse_x;
y=mouse_y;
controller_x=mouse_x;
controller_y=mouse_y;
drag_x=mouse_x;
drag_y=mouse_y;
cursor_x=x;
cursor_y=y;
place_brush_size=0;/*The size of the brush when placeing objects*/
erase_brush_size=0;/*The size of the brush when erasing*/
can_make_place_brush_size_bigger=true;/*If you can make the brush size bigger for certain objects*/
can_put_objects_above_other_objects = false; /*If you can put objects above other objects*/
mouse_sprite=spr_cursor;/*Sets what cursor sprite to use*/
undo_and_redo_buttons_enabled = false;/*If undo and redo buttons should appear or not*/
tooltip="";
show_tooltip=0;
show_grid=false;/*Grid should be false when you start level editor*/
grid_alpha=0;
zoom_in=false;/*When this is true, zoom in*/
zoom_reset=false;/*When this is true, reset zoom*/
zoom_out=false;/*When this is true, zoom out*/
difficulty_layer=0;/*0 = All, 1 = Easy, 2 = Normal, 3 = Hard*/
set_difficulty_mode=false;/*Toggle so you get a pen that can select what object appear in what difficulty*/
place_object=noone;
wall_surface_selected = 0; /*What kind of wall you're putting down*/
show_icons_at_bottom=false;
show_icons_at_top=false;
icons_at_bottom_y=+100;
erase_icons_at_top_y=-100;
show_undo_redo_icons=false;/*If the undo and redo buttons should show*/
undo_redo_icons_y=+200;/*Undo and redo buttons y postition*/
current_undo_value=0;/*Every time you place down items, this value increases. When you undo, this value decreases.*/
icons_at_top_y=-100;
icons_at_top_alpha=1;
icons_at_left_x=-64;
selected_object=0;
selected_object_menu_x=0;
selected_menu_alpha=0;
total_number_of_objects=0;
quit_level_editor=0;
use_controller=false;
drag_object=false;
erase_mode=false;/*When erasing, this turns true*/
fill_mode=false;/*When filling, this turns true*/
can_input_level_name=false;
quit_level_editor=false;
menu_joystick_delay=0;
pause=false;
menu_cursor_index=0;
in_settings=false;
can_navigate_settings_sidebar=true;
navigate_slider=false;
menu="continue"
name_enter_blink=0;
menu_delay=0;
startup_loading_timer=0;
background_brightness_lerp = 0;
background_brightness_menu_lerp = 0;

darken_settings_alpha = 0;
darken_settings_sidebar_alpha = 0;
accessibility_settings_y = 40;
game_text_y = 40*2;
game_settings_y = 40*3;
multiplayer_settings_y = 40*4;
controls_text_y = 40*5;
keyboard_and_mouse_settings_y = 40*6;
controller_settings_y = 40*7;
touch_settings_y = 40*8;
general_text_y = 40*9;
profile_settings_y = 40*10;
video_settings_y = 40*11;
audio_settings_y = 40*12;
global_resources_settings_y = 40*13;
storage_settings_y = 40*14;
language_settings_y = 40*15;
broadcast_settings_y = 40*16;
how_to_play_y = 40*17;
left_sidebar_x=-400;

place_brush_icon_x = 32;
erase_icon_x = 96;
fill_icon_x = 160;

screenie_x=0;
screenie_y=0;
total_objects=0;

#region /*Options*/
remapping_player = 1;
input_key = false;
can_remap_key = false;
can_navigate = false;
menu_y_offset_real = 0;
menu_cursor_y_position = 0;
menu_remap_key_number = 0;
#endregion /*Options END*/
/*Customize look of Options Menu*/
menu_y_offset=-100;
c_menu_outline=c_black;
c_menu_fill=c_white;
/*Customize look of Options Menu END*/
#region /*Room Speed*/
room_speed = global.max_fps;
#endregion /*Room Speed END*/
image_speed=0;
image_index=0;


#region /*Load Level Information*/
if (global.character_select_in_this_menu="game")
and(file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/level_information.ini"))
or(global.character_select_in_this_menu="level_editor")
and(file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini"))
{
	if (global.character_select_in_this_menu="game")
	{
		ini_open("Levels/Level" +string(global.level_editor_level)+"/Data/level_information.ini");
	}
	else
	if (global.character_select_in_this_menu="level_editor")
	{
		ini_open(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/level_information.ini");
	}
	if (ini_key_exists("Info","level_name"))
	{
		level_name = ini_read_string("Info","level_name",0);
	}
	else
	{
		ini_write_string("Info","level_name",0);
		level_name = "";
	}
	if (ini_key_exists("Info","time_countdown"))
	{
		global.time_countdown = ini_read_real("Info", "time_countdown", noone); /*Set the countdown to whatever is stored in the level_information.ini file*/
	}
	else
	{
		//ini_write_real("Info", "time_countdown", noone);
		global.time_countdown = noone;
	}
	if(global.play_edited_level=false)
	and(global.actually_play_edited_level=false)
	{
		if (ini_key_exists("Info","view_xview"))
		and(ini_key_exists("Info","view_yview"))
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("Info", "view_xview", 0), ini_read_real("Info", "view_yview", 0));
			x = ini_read_real("Info", "view_xview", 0);
			y = ini_read_real("Info", "view_yview", 0);
		}
		else
		if (ini_key_exists("Info","view_xview"))
		{
			camera_set_view_pos(view_camera[view_current], ini_read_real("Info", "view_xview", 0), 0);
			x = ini_read_real("Info", "view_xview", 0);
		}
		else
		if (ini_key_exists("Info","view_yview"))
		{
			camera_set_view_pos(view_camera[view_current], 0, ini_read_real("Info", "view_yview", 0));
			y = ini_read_real("Info", "view_yview", 0);
		}
	}
	ini_close();
}
else
{
	level_name="";
	global.time_countdown = noone;
}
#endregion /*Load Level Information END*/

#region /*Create Ground Tileset PNG if there is none*/
if (!file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png"))
{
	#region /*Save sprite in directory*/
	sprite_variable = sprite_duplicate(spr_ground_tileset);
	sprite_save(sprite_variable, 0, working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets/ground_tileset.png");
	#endregion /*Save sprite in directory END*/
}
#endregion /*Create Ground Tileset PNG if there is none END*/

lives=5;
#region /*View Size*/
view_wview = 1392;
view_hview = 736;
#endregion /*View Size End*/
/*Default Views:   set_view_wview = 1024+400-32   set_view_hview = 768-32   */
set_view_wview=1392;
set_view_hview=736;

#region /*Initialize Background*/
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
background_x_offset[0]=0;background_x[0]=0;background_y_offset[0]=0;background_y[0]=0;
#endregion /*Initialize Background End*/

/*HUD Show Controls keys that have been pressed*/
player1_show_controls_timer=0;
player1_show_controls_alpha=0;

///Load Level

#region /*Load Main Game Level*/
if (global.character_select_in_this_menu="game")
{
	
	#region /*Object Placement*/
	var file, str, str_pos, str_temp, val, num;
	if file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/Object_Placement.txt")
	{
		file = file_text_open_read("Levels/Level" +string(global.level_editor_level)+"/Data/Object_Placement.txt");
	}
	else
	if file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/Object Placement.txt")
	{
		file = file_text_open_read("Levels/Level" +string(global.level_editor_level)+"/Data/Object Placement.txt");
	}
	else
	{
		file = -1;
	}
	
	if (file != -1)
	{
		/*Next objects*/
		str = file_text_read_string(file);
		//file_text_readln(file);
		str_temp = "";
		num = 0;
		str_pos = 1;
		while(str_pos < string_length(str))
		{
			while (string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			val[num] = string(str_temp);
			str_temp = "";
			str_pos += 1;
			num += 1;
			if (num = 6) /*Number of variables to check for.
			val[0] = object,
			val[1] = x position,
			val[2] = y position,
			val[3] = easy,
			val[4] = normal,
			val[5] = hard*/
			{
				num = 0;
				with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
				{
					object=val[2];
					easy=val[3];
					normal=val[4];
					hard=val[5];
				}
			}
		}
		file_text_close(file);
	}
	#endregion /*Object Placement END*/
	
	#region /*Object With Rotation Placement*/
	var file, str, str_pos, str_temp, val, num;
	if file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/Object_Rotation_Placement.txt")
	{
		file = file_text_open_read("Levels/Level" +string(global.level_editor_level)+"/Data/Object_Rotation_Placement.txt");
	}
	else
	if file_exists("Levels/Level" +string(global.level_editor_level)+"/Data/Object Rotation Placement.txt")
	{
		file = file_text_open_read("Levels/Level" +string(global.level_editor_level)+"/Data/Object Rotation Placement.txt");
	}
	else
	{
		file = -1;
	}
	
	if (file != -1)
	{
		/*Next objects*/
		str = file_text_read_string(file);
		//file_text_readln(file);
		str_temp = "";
		num = 0;
		str_pos = 1;
		while(str_pos < string_length(str))
		{
			while (string_char_at(str, str_pos) != "|")
			{
				str_temp += string_char_at(str, str_pos);
				str_pos += 1;
			}
			val[num] = string(str_temp);
			str_temp = "";
			str_pos += 1;
			num += 1;
			if (num = 8) /*Number of variables to check for.
			val[0] = object,
			val[1] = x position,
			val[2] = y position,
			val[3] = easy,
			val[4] = normal,
			val[5] = hard,
			val[6] = angle_x,
			val[7] = angle_y*/
			{
				num = 0;
				with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
				{
					object=val[2];
					easy=val[3];
					normal=val[4];
					hard=val[5];
					angle_x=val[6];
					angle_y=val[7];
				}
			}
		}
		file_text_close(file);
	}
	#endregion /*Object With Rotation Placement END*/
	
}
#endregion /*Load Main Game Level END*/

else
if (global.character_select_in_this_menu="level_editor")
{
	
	#region /*Create directories*/

	#region /*Create directory for saving custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level));
	}
	#endregion /*Create directory for saving custom levels END*/

	#region /*Create directory for backgrouns in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Backgrounds");
	}
	#endregion /*Create directory for backgrounds in custom levels END*/

	#region /*Create directory for data in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data");
	}
	#endregion /*Create directory for data in custom levels END*/

	#region /*Create directory for sounds in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds");
	}
	#endregion /*Create directory for sounds in custom levels END*/

	#region /*Create directory for melody in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Melody"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Melody");
	}
	#endregion /*Create directory for melody in custom levels END*/

	#region /*Create directory for music in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Music"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Music");
	}
	#endregion /*Create directory for music in custom levels END*/

	#region /*Create directory for sound effects in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Sound Effect"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Sounds/Sound Effect");
	}
	#endregion /*Create directory for sound effects in custom levels END*/

	#region /*Create directory for tilesets in custom levels*/
	if (!directory_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets"))
	{
		directory_create(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Tilesets");
	}
	#endregion /*Create directory for tilesets in custom levels END*/

	#endregion /*Create directories END*/
	
	else
	{
		
		#region /*Object Placement*/
		var file, str, str_pos, str_temp, val, num;
		if file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Placement.txt")
		{
			file = file_text_open_read(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Placement.txt");
		}
		else
		if file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object Placement.txt")
		{
			file = file_text_open_read(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object Placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/*Next objects*/
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num = 6) /*Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard*/
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object=val[2];
						easy=val[3];
						normal=val[4];
						hard=val[5];
					}
				}
			}
			file_text_close(file);
		}
		#endregion /*Object Placement END*/
		
		#region /*Object With Rotation Placement*/
		var file, str, str_pos, str_temp, val, num;
		if file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Rotation_Placement.txt")
		{
			file = file_text_open_read(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object_Rotation_Placement.txt");
		}
		else
		if file_exists(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object Rotation Placement.txt")
		{
			file = file_text_open_read(working_directory+"/Custom Levels/Level"+string(global.level_editor_level)+"/Data/Object Rotation Placement.txt");
		}
		else
		{
			file = -1;
		}
	
		if (file != -1)
		{
			/*Next objects*/
			str = file_text_read_string(file);
			//file_text_readln(file);
			str_temp = "";
			num = 0;
			str_pos = 1;
			while(str_pos < string_length(str))
			{
				while (string_char_at(str, str_pos) != "|")
				{
					str_temp += string_char_at(str, str_pos);
					str_pos += 1;
				}
				val[num] = string(str_temp);
				str_temp = "";
				str_pos += 1;
				num += 1;
				if (num = 8) /*Number of variables to check for.
				val[0] = object,
				val[1] = x position,
				val[2] = y position,
				val[3] = easy,
				val[4] = normal,
				val[5] = hard,
				val[6] = angle_x,
				val[7] = angle_y*/
				{
					num = 0;
					with(instance_create_depth(val[0], val[1], 0, obj_leveleditor_placed_object))
					{
						object=val[2];
						easy=val[3];
						normal=val[4];
						hard=val[5];
						angle_x=val[6];
						angle_y=val[7];
					}
				}
			}
			file_text_close(file);
		}
		#endregion /*Object With Rotation Placement END*/
		
	}
}