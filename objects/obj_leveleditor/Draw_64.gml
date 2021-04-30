scr_set_screen_size();

if (quit_level_editor = false)
{
	
	#region /*Pause Menu*/
	if (pause=false)
	{
		if (keyboard_check_pressed(vk_escape))
		or(gamepad_button_check_pressed(0,gp_start))
		{
			quit_level_editor=false;
			can_input_level_name=false;
			pause=true;
			menu="continue";
		}
	}
	else
	if (pause=true)
	and(quit_level_editor<=0)
	{
		
		#region /*Make Background Darker*/
		draw_set_alpha(0.9);
		draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
		#endregion /*Make Background Darker END*/
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if (keyboard_check_pressed(vk_escape))
		or(gamepad_button_check_pressed(0,gp_start))
		{
			quit_level_editor=false;
			can_input_level_name=false;
			pause=false;
			can_navigate=false;
		}
	
		#region /*Make the menu invisible when entering the options menu*/
		if (menu="continue")
		or(menu="options")
		or(menu="quit")
		{
			
			#region /*If menu is on continue*/
			draw_menu_button(
			window_get_width()/2-185,
			window_get_height()/2-84,
			"Continue","continue",noone);
		
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2-185,
			window_get_height()/2-84,
			window_get_width()/2+185,
			window_get_height()/2-42))
			and(mouse_check_button_pressed(mb_left))
			{
				menu_delay=10;
				quit_level_editor=false;
				can_input_level_name=false;
				pause=false;
			}
		
			if (menu="continue")
			and(can_input_level_name=false)
			{
				if (key_up)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="quit";
				}
				else
				if (key_down)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="options";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay=0)
					{
						menu_delay=10;
						quit_level_editor=false;
						can_input_level_name=false;
						pause=false;
					}
				}
				if (key_b_pressed)
				and(menu_delay=0)
				{
					menu_delay=10;
					quit_level_editor=false;
					can_input_level_name=false;
					pause=false;
					can_navigate=false;
				}
			}
			#endregion /*If menu is on continue END*/
			
			#region /*If menu is on options*/
			draw_menu_button(
			window_get_width()/2-185,
			window_get_height()/2-42,
			"Settings","options",noone);
			
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2-185,
			window_get_height()/2-42,
			window_get_width()/2+185,
			window_get_height()/2))
			and(mouse_check_button_pressed(mb_left))
			{
				quit_level_editor=false;
				can_input_level_name=false;
				pause=true;
				can_navigate=true;
				in_settings=true;
				can_navigate_settings_sidebar=true;
				global.settings_sidebar_menu="game_settings";
				menu=noone;
				menu_delay=10;
			}
			
			if (menu="options")
			and(can_input_level_name=false)
			{
				if (key_up)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="continue";
				}
				else
				if (key_down)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="quit";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay=0)
					{
						quit_level_editor=false;
						can_input_level_name=false;
						pause=true;
						can_navigate=true;
						in_settings=true;
						can_navigate_settings_sidebar=true;
						global.settings_sidebar_menu="game_settings";
						menu=noone;
						menu_delay=10;
					}
				}
				if (key_b_pressed)
				and(menu_delay=0)
				{
					menu_delay=10;
					quit_level_editor=false;
					can_input_level_name=false;
					pause=false;
					can_navigate=false;
				}
			}
			#endregion /*If menu is on options END*/
		
			#region /*If menu is on quit*/
			draw_menu_button(
			window_get_width()/2-185,
			window_get_height()/2,
			"Save and Quit","quit",noone);
			
			if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),
			window_get_width()/2-185,
			window_get_height()/2,
			window_get_width()/2+185,
			window_get_height()/2+42))
			and(mouse_check_button_pressed(mb_left))
			{
				menu_delay=10;
				quit_level_editor=true;
				can_input_level_name=false;
				pause=false;
			}
			
			if (menu="quit")
			and(can_input_level_name=false)
			{
				if (key_up)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="options";
				}
				else
				if (key_down)
				and(menu_joystick_delay=0)
				and(menu_delay=0)
				{
					menu_delay=1;
					menu="continue";
				}
				if (key_a_pressed)
				or(keyboard_check_pressed(vk_enter))
				{
					if (menu_delay=0)
					{
						menu_delay=10;
						quit_level_editor=true;
						can_input_level_name=false;
						pause=false;
					}
				}
				if (key_b_pressed)
				and(menu_delay=0)
				{
					menu_delay=10;
					quit_level_editor=false;
					can_input_level_name=false;
					pause=false;
					can_navigate=false;
				}
			}
			#endregion /*If menu is on quit END*/
			
		}
		#endregion /*Make the menu invisible when entering the options menu END*/
	
	#region /*PLAYER 1 INPUT LEVEL NAME NOW*/
	if (menu="input_level_name")
	and(can_input_level_name=true)
	{
		
		#region /*Press enter when done typing*/
		if (keyboard_check_pressed(vk_enter))
		or(gamepad_button_check_pressed(0,gp_start))
		{
			if (menu_delay=0)
			{
				menu_delay=10;
				can_input_level_name=false;
				quit_level_editor=false;
				pause=true;
				menu="enter_level_name";
			}
		}
		#endregion /*Press enter when done typing END*/
		
		#region /*Make Background Darker*/
		draw_set_alpha(0.9);
		draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1);
		#endregion /*Make Background Darker END*/
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		
		#region /*Inputed Name Text*/
		if (name_enter_blink<1)
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-400-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2,"Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: "+string(level_name)+"|",global.default_text_size,c_black,c_white,1);
		}
		else
		{
			draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-400-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2,"Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: "+string(level_name),global.default_text_size,c_black,c_white,1);
		}
		#endregion /*Inputed Name Text END*/
		
		#region /*Limit Name Input Length for Level Name*/
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_outlined(camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2-2,camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])/2+100,"Limit: "+string(string_length(level_name))+"/32",global.default_text_size,c_black,c_white,1);
		level_name=keyboard_string;
		if (string_length(level_name)>32)
		{
			keyboard_string=string_copy(level_name,1,32);
		}
		#endregion /*Limit Name Input Length for Level Name END*/
		
		name_enter_blink+=0.05;
		if (name_enter_blink>1.5)
		{
			name_enter_blink=0;
		}
	}
	#endregion /*PLAYER 1 INPUT LEVEL NAME NOW END*/
	
	}
	#endregion /*Pause Menu END*/
	
	#region /*Options*/
	if (pause=true)
	and(menu!="continue")
	and(menu!="options")
	and(menu!="quit")
	{
		scr_options_menu();
	}
	#endregion /*Options END*/
	
	#region /*Make bottom row of icons appear if mouse is hovering at bottom screen*/
	if (drag_object = false)
	and(asset_get_type("obj_level_start") == asset_object)
	and(instance_exists(obj_level_start))
	and(obj_level_start.drag_object = false)
	and(asset_get_type("obj_level_end") == asset_object)
	and(instance_exists(obj_level_end))
	and(obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
		and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		or(global.always_show_level_editor_buttons = true)
		{
			if (show_icons_at_bottom = false)
			{
				show_icons_at_bottom = true;
			}
		}
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
		and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and(global.always_show_level_editor_buttons = false)
		{
			if (show_icons_at_bottom = true)
			{
				show_icons_at_bottom = false;
			}
		}
	}
	#endregion /*Make bottom row of icons appear if mouse is hovering at bottom screen END*/
	
	#region /*Make undo and redo icons appear if mouse is hovering at right screen*/
	if (undo_and_redo_buttons_enabled = true)
	and(drag_object = false)
	and(asset_get_type("obj_level_start") == asset_object)
	and(instance_exists(obj_level_start))
	and(obj_level_start.drag_object = false)
	and(asset_get_type("obj_level_end") == asset_object)
	and(instance_exists(obj_level_end))
	and(obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 8, 0, room_width * 2, display_get_gui_height()))
		{
			if (show_undo_redo_icons = false)
			{
				show_undo_redo_icons = true;
			}
		}
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, 0, display_get_gui_width() - 128, display_get_gui_height()))
		{
			if (show_undo_redo_icons = true)
			{
				show_undo_redo_icons = false;
			}
		}
	}
	#endregion /*Make undo and redo icons appear if mouse is hovering at right screen END*/
	
	#region /*Make top row of icons appear if mouse is hovering at top screen*/
	if (drag_object = false)
	and(asset_get_type("obj_level_start") == asset_object)
	and(instance_exists(obj_level_start))
	and(obj_level_start.drag_object = false)
	and(asset_get_type("obj_level_end") == asset_object)
	and(instance_exists(obj_level_end))
	and(obj_level_end.drag_object = false)
	{
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), -32, -32, display_get_gui_width() + 32, +8))
		or(global.always_show_level_editor_buttons = true)
		{
			if (show_icons_at_top = false)
			{
				show_icons_at_top = true;
			}
		}
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), -32, +64, display_get_gui_width() + 32, display_get_gui_height() + 32))
		{
			if (show_icons_at_top = true)
			{
				show_icons_at_top = false;
			}
		}
	}
	#endregion /*Make top row of icons appear if mouse is hovering at top screen END*/
	
	#region /*Show icons at bottom of screen*/
	if (show_icons_at_bottom = true)
	and(drag_object = false)
	and(pause = false)
	or(global.always_show_level_editor_buttons=true)
	and(drag_object = false)
	and(pause = false)
	{
		if(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
		and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
		and(asset_get_type("spr_cursor") == asset_sprite)
		{
			mouse_sprite = spr_cursor;
		}
		icons_at_bottom_y = lerp(icons_at_bottom_y, 0, 0.1);
	}
	else
	{
		icons_at_bottom_y = lerp(icons_at_bottom_y, +100, 0.1);
	}
	#endregion /*Show icons at bottom of screen END*/
	
	#region /*Show undo and redo icons to the right of screen*/
	if (show_undo_redo_icons = true)
	{
		if (asset_get_type("spr_cursor") == asset_sprite)
		{
			mouse_sprite = spr_cursor;
		}
		undo_redo_icons_y = lerp(undo_redo_icons_y, 0, 0.1);
	}
	else
	{
		undo_redo_icons_y = lerp(undo_redo_icons_y, +200, 0.1);
	}
	#endregion /*Show undo and redo icons to the right of screen END*/
	
	#region /*Level Editor Icons*/
	if (asset_get_type("spr_leveleditor_icons") == asset_sprite)
	{
		#region /*Place brush icons*/
		if (place_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size = 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size = 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size = 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size = 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size >= 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		
		if (place_brush_size = 0)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 1)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 2)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 3)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 4)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size = 5)
		and(erase_mode = false)
		and(fill_mode = false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Place brush icons END*/
		
		#region /*Erase icons*/
		if (erase_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size = 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (erase_brush_size = 0)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 1)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 2)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 3)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 4)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size = 5)
		and(erase_mode = true)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Erase icons END*/
		
		#region /*Fill icon*/
		if (fill_mode = true)
		and(erase_mode = false)
		and(difficulty_layer = 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /*Fill icon END*/
		
		#region /*Show Undo icon*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		and(mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /*Show Undo icon END*/
		
		#region /*Show Redo icon*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		and(mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /*Show Redo icon*/
		
		#region /*Set difficulty layer*/
		if (set_difficulty_mode = true)
		{
			#region /*Easy*/
			if (difficulty_layer = 1)
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Easy END*/
		
			#region /*Normal*/
			if (difficulty_layer = 2)
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Normal END*/
		
			#region /*Hard*/
			if (difficulty_layer = 3)
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Hard END*/
		
			#region /*Set Difficulty Mode / Back*/
			draw_sprite_ext(spr_leveleditor_icons, 24, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			#endregion /*Set Difficulty Mode / Back END*/
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 19, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		#endregion /*Set difficulty layer END*/
		
		#region /*Show icons at top of screen*/
		if (erase_mode = true)
		and(pause = false)
		{
			erase_icons_at_top_y = lerp(erase_icons_at_top_y, -1, 0.1);
		}
		else
		{
			erase_icons_at_top_y = lerp(erase_icons_at_top_y, -100, 0.1);
		}
		if (erase_brush_size = 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, +32, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, +32, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (erase_brush_size = 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, +96, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, +96, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (erase_brush_size = 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, +160, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, +160, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (erase_brush_size = 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, +224, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, +224, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (erase_brush_size = 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, +288, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, +288, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (erase_brush_size = 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, +352, +32 + erase_icons_at_top_y, 1, 1, 0, c_white, icons_at_top_alpha);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, +352, +32 + erase_icons_at_top_y, 1, 1, 0, c_dkgray, icons_at_top_alpha);
		}
		if (show_icons_at_top = true)
		{
			if (asset_get_type("spr_cursor") == asset_sprite)
			{
				mouse_sprite = spr_cursor;
			}
			icons_at_top_y = lerp(icons_at_top_y, -1, 0.1);
		}
		else
		{
			icons_at_top_y = lerp(icons_at_top_y, -100, 0.1);
		}
		
		if (pause = false)
		{
			
			if (can_put_objects_above_other_objects = true)
			{
				draw_set_halign(fa_left);
				draw_set_valign(fa_center);
				draw_text_outlined(200, 100, "Can put objects above other objects: True", global.default_text_size, c_black, c_white, 1);
			}
			
			#region /*Show Grid*/
			if (show_grid = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 13, display_get_gui_width() - 224, +32 + icons_at_top_y, 1, 1, 0, c_white, 1);
				draw_set_halign(fa_left);
				draw_set_valign(fa_center);
				draw_text_outlined(display_get_gui_width() - 300, 80 + icons_at_top_y, "Grid X: "+string(global.grid_hsnap)+" Grid Y: "+string(global.grid_vsnap),global.default_text_size,c_black,c_white,1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 13, display_get_gui_width() - 224, +32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Show Grid END*/
			
			#region /*Zoom Out*/
			if (zoom_out = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 14, display_get_gui_width() - 160, +32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 14, display_get_gui_width() - 160, +32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom Out END*/
			
			#region /*Zoom Reset*/
			if (zoom_reset = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 15, display_get_gui_width() - 96, +32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 15, display_get_gui_width() - 96, +32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom Reset END*/
			
			#region /*Zoom In*/
			if (zoom_in = true)
			{
				draw_sprite_ext(spr_leveleditor_icons, 16, display_get_gui_width() - 32, +32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 16, display_get_gui_width() - 32, +32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /*Zoom In END*/
			
		}
		
		#endregion /*Show icons at top of screen END*/
		
	}
	#endregion /*Level Editor Icons*/
	
	#region /*Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons*/
	if (show_tooltip >= 100)
	//and(!tooltip = "")
	{
		draw_rectangle_color(window_mouse_get_x() + 16, window_mouse_get_y() - 16, window_mouse_get_x() + 240, window_mouse_get_y() + 16, c_white, c_white, c_white, c_white, false);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_text_transformed_color(window_mouse_get_x() + 24 - 2, window_mouse_get_y(), string(tooltip), global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(window_mouse_get_x() + 24 + 2, window_mouse_get_y(), string(tooltip), global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(window_mouse_get_x() + 24, window_mouse_get_y() - 2, string(tooltip), global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(window_mouse_get_x() + 24, window_mouse_get_y() + 2, string(tooltip), global.default_text_size, global.default_text_size, 0, c_white, c_white, c_white, c_white, 1);
		draw_text_transformed_color(window_mouse_get_x() + 24, window_mouse_get_y(), string(tooltip), global.default_text_size, global.default_text_size, 0, c_black, c_black, c_black, c_black, 1);
	}
	if (show_tooltip > 100)
	{
		show_tooltip = 100;
	}
	if (show_icons_at_bottom = false)
	or(mouse_check_button(mb_any))
	or(keyboard_check(vk_anykey))
	{
		show_tooltip = 0;
	}
	#endregion /*Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons END*/
	
	#region /*Change mouse cursor*/
	
	#region /*Grab mouse cursor*/
	if (asset_get_type("spr_cursor_grab") == asset_sprite)
	and(position_meeting(mouse_x,mouse_y,obj_leveleditor_placed_object))
	and(!mouse_check_button(mb_left))
	and(!mouse_check_button(mb_right))
	and(drag_object = false)
	and(asset_get_type("obj_level_start") == asset_object)
	and(instance_exists(obj_level_start))
	and(obj_level_start.drag_object = false)
	and(asset_get_type("obj_level_end") == asset_object)
	and(instance_exists(obj_level_end))
	and(obj_level_end.drag_object = false)
	and(erase_mode = false)
	and(set_difficulty_mode = false)
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	else
	if (position_meeting(mouse_x,mouse_y,obj_leveleditor_placed_object))
	and(drag_object = true)
	and(set_difficulty_mode = false)
	and(pause=false)
	or(asset_get_type("obj_level_start") == asset_object)
	and(instance_exists(obj_level_start))
	and(obj_level_start.drag_object = true)
	and(pause=false)
	or(asset_get_type("obj_level_end") == asset_object)
	and(instance_exists(obj_level_end))
	and(obj_level_end.drag_object = true)
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Grab mouse cursor END*/
	
	#region /*Default mouse cursor*/
	else
	if(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, +192, room_height * 2))
	and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width()-64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and(asset_get_type("spr_cursor") == asset_sprite)
	or(pause=true)
	{
		draw_sprite_ext(spr_cursor, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Default mouse cursor END*/

	#region /*Erase mouse cursor*/
	else
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	and(erase_mode = true)
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Erase mouse cursor END*/

	#region /*Fill mouse cursor*/
	else
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and(fill_mode = true)
	and(drag_object = false)
	and(erase_mode = false)
	and(set_difficulty_mode = false)
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Fill mouse cursor END*/

	#region /*Scroll mouse cursor*/
	else
	if (keyboard_check(vk_space))
	and(mouse_check_button(mb_left))
	and(pause=false)
	or(mouse_check_button(mb_middle))
	and(pause=false)
	{
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
		}
	}
	else
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	and(keyboard_check(vk_space))
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Scroll mouse cursor END*/

	#region /*Brush mouse cursor*/
	else
	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	and(pause=false)
	{
		draw_sprite_ext(spr_cursor_brush, place_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /*Brush mouse cursor END*/

	#endregion /*Change mouse cursor END*/

	#region /*Undo and Redo icons*/
	if (show_undo_redo_icons = true)
	{
		
		#region /*Click Undo icon*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		{
			tooltip = "Undo (CTRL+Z)";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				current_undo_value -= 1;
			}
		}
		#endregion /*Click Undo icon END*/
	
		#region /*Click Redo icon*/
		else
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		{
			tooltip = "Redo (CTRL+Y)";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				current_undo_value += 1;
			}
		}
		#endregion /*Click Redo icon END*/
		
	}
	#endregion /*Undo and Redo icons END*/

	#region /*Click icons at bottom of screen*/
	if (show_icons_at_bottom = true)
	and(pause = false)
	{
	
		#region /*Pen*/
		if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), place_brush_icon_x-32, display_get_gui_height() - 64, place_brush_icon_x+32, display_get_gui_height() + 64))
		{
			tooltip = "Paintbrush tool (D)";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (place_brush_size = 0)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 1;
				}
				else
				if (place_brush_size = 1)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 2;
				}
				else
				if (place_brush_size = 2)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 3;
				}
				else
				if (place_brush_size = 3)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 4;
				}
				else
				if (place_brush_size = 4)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 5;
				}
				else
				if (place_brush_size = 5)
				and(fill_mode = false)
				and(erase_mode = false)
				{
					place_brush_size = 0;
				}
				else
				if (place_brush_size = 0)
				{
					place_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 1)
				{
					place_brush_size = 1;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 2)
				{
					place_brush_size = 2;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 3)
				{
					place_brush_size = 3;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 4)
				{
					place_brush_size = 4;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size = 5)
				{
					place_brush_size = 5;
					fill_mode = false;
					erase_mode = false;
				}
				else
				{
					place_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
			}
		}
		#endregion /*Pen END*/
	
		else

	#region /*Erase (and more)*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), erase_icon_x-32, display_get_gui_height() - 64, erase_icon_x+32, display_get_gui_height() + 64))
	{
		tooltip = "Erase tool (E)";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			if (erase_mode = false)
			{
				erase_mode = true;
				fill_mode = false;
			}
			else
			if (erase_brush_size = 0)
			{
				erase_brush_size = 1;
				fill_mode = false;
				erase_mode = true;
			}
			else
			if (erase_brush_size = 1)
			{
				erase_brush_size = 2;
				fill_mode = false;
				erase_mode = true;
			}
			else
			if (erase_brush_size = 2)
			{
				erase_brush_size = 3;
				fill_mode = false;
				erase_mode = true;
			}
			else
			if (erase_brush_size = 3)
			{
				erase_brush_size = 4;
				fill_mode = false;
				erase_mode = true;
			}
			else
			if (erase_brush_size = 4)
			{
				erase_brush_size = 5;
				fill_mode = false;
				erase_mode = true;
			}
			else
			if (erase_brush_size = 5)
			{
				erase_brush_size = 0;
				fill_mode = false;
				erase_mode = true;
			}
		}
	}
	#endregion /*Erase (and more) END*/

	#region /*Fill*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), fill_icon_x-32, display_get_gui_height() - 64, fill_icon_x+32, display_get_gui_height() + 64))
	{
		tooltip = "Fill tool (F)";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			fill_mode = true;
			erase_mode = false;
		}
	}
	#endregion /*Fill END*/
	
	else
	{
		show_tooltip = 0;
	}
	
	#region /*Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard*/
	
	#region /*Easy*/
	if (set_difficulty_mode = true)
	and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width() - 192, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in easy";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 1;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Easy END*/
	
	#region /*Normal*/
	if (set_difficulty_mode = true)
	and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 192, display_get_gui_height() - 64, display_get_gui_width() - 128, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in normal";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 2;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Normal END*/
	
	#region /*Hard*/
	if (set_difficulty_mode = true)
	and(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 128, display_get_gui_height() - 64, display_get_gui_width() - 64, display_get_gui_height() + 64))
	{
		tooltip = "Show only objects in hard";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			difficulty_layer = 3;
			fill_mode = false;
			erase_mode = false;
			set_difficulty_mode = true;
		}
	}
	#endregion /*Hard END*/
	
	#region /*Set Difficulty Mode / Back*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
	{
		tooltip = "Set what objects should appear on what difficulty";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			fill_mode = false;
			erase_mode = false;
			if (set_difficulty_mode = true)
			{
				set_difficulty_mode = false;
				difficulty_layer = 0;
			}
			else
			{
				set_difficulty_mode = true;
			}
		}
	}
	#endregion /*Set Difficulty Mode / Back*/

	#endregion /*Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard END*/

	}
	#endregion /*Click icons at bottom of screen END*/

	#region /*Click icons at top of screen*/

	#region /*Erase 6*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, -64, +64, +64))
	and(erase_mode = true)
	and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 5;
	}
	#endregion /*Erase 6 END*/

	#region /*Erase 5*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), +64, -64, +128, +64))
	and(erase_mode = true)
	and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 4;
	}
	#endregion /*Erase 6 END*/

	#region /*Erase 4*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), +128, -64, +192, +64))
	and(erase_mode = true)
	and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 3;
	}
	#endregion /*Erase 4 END*/

	#region /*Erase 3*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), +192, -64, +256, +64))
	and(erase_mode = true)
	and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 2;
	}
	#endregion /*Erase 3 END*/

	#region /*Erase 2*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), +256, -64, +320, +64))
	and(erase_mode = true)
	and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 1;
	}
	#endregion /*Erase 2 END*/

	#region /*Erase 1*/
	else
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), +320, -64, +384, +64)) and(erase_mode = true) and(mouse_check_button_pressed(mb_left))
	{
		erase_brush_size = 0;
	}
	#endregion /*Erase 1 END*/

	#region /*Toggle Grid*/
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, -64, display_get_gui_width() - 192, +64))
	and(show_icons_at_top = true)
	and(pause = false)
	{
		tooltip = "Toggle Grid (G)";
		show_tooltip += 2;
		if (mouse_check_button_pressed(mb_left))
		{
			if (show_grid = false)
			{
				show_grid = true;
			}
			else
			{
				show_grid = false;
			}
		}
	}
	#endregion /*Toggle Grid END*/

	#region /*Zoom Out*/
	if (keyboard_check(vk_control))
	and(keyboard_check(189))
	and(!keyboard_check(187))
	and(!keyboard_check(vk_enter))
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 192, -64, display_get_gui_width() - 128, +64))
	and(show_icons_at_top = true)
	and(mouse_check_button(mb_left))
	{
		tooltip = "Zoom Out (CTRL -)";
		show_tooltip += 2;
		zoom_out = true;
	}
	else
	{
		zoom_out = false;
	}
	#endregion /*Zoom Out END*/

	#region /*Reset Zoom*/
	if (keyboard_check(vk_control))
	and(keyboard_check(vk_enter))
	and(!keyboard_check(187))
	and(!keyboard_check(189))
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 128, -64, display_get_gui_width() - 64, +64))
	and(show_icons_at_top = true)
	and(mouse_check_button(mb_left))
	{
		tooltip = "Reset Zoom (CTRL+Enter)";
		show_tooltip += 2;
		zoom_reset = true
	}
	else
	{
		zoom_reset = false;
	}
	#endregion /*Reset Zoom END*/

	#region /*Zoom In*/
	if (keyboard_check(vk_control))
	and(keyboard_check(187))
	and(!keyboard_check(189))
	and(!keyboard_check(vk_enter))
	or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, -64, display_get_gui_width(), +64))
	and(show_icons_at_top = true)
	and(mouse_check_button(mb_left))
	{
		tooltip = "Zoom In (CTRL +)";
		show_tooltip += 2;
		zoom_in = true;
	}
	else
	{
		zoom_in = false;
	}
	#endregion /*Zoom In END*/

	#endregion /*Click icons at top of screen END*/
	
	scr_show_fps();
	
}