scr_set_controls_used_to_navigate();
scr_set_screen_size();
scr_character_select_menu_step();

#region /* Keyboard Controls */
if (global.every_player_can_navigate_menu == true)
{
	key_up = (keyboard_check_pressed(vk_up))
	or (keyboard_check_pressed(ord("W")))
	or (gamepad_button_check_pressed(global.player1_slot, gp_padu))
	or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player2_slot, gp_padu))
	or (gamepad_axis_value(global.player2_slot, gp_axislv) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player3_slot, gp_padu))
	or (gamepad_axis_value(global.player3_slot, gp_axislv) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player4_slot, gp_padu))
	or (gamepad_axis_value(global.player4_slot, gp_axislv) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(4, gp_padu))
	or (gamepad_axis_value(4, gp_axislv) < 0)
	and (menu_joystick_delay <= 0)
	or mouse_wheel_up();
	
	key_left = (keyboard_check_pressed(vk_left))
	or (keyboard_check_pressed(ord("A")))
	or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
	or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player2_slot, gp_padl))
	or (gamepad_axis_value(global.player2_slot, gp_axislh) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player3_slot, gp_padl))
	or (gamepad_axis_value(global.player3_slot, gp_axislh) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player4_slot, gp_padl))
	or (gamepad_axis_value(global.player4_slot, gp_axislh) < 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(4, gp_padl))
	or (gamepad_axis_value(4, gp_axislh) < 0)
	and (menu_joystick_delay <= 0);
	
	key_right = (keyboard_check_pressed(vk_right))
	or (keyboard_check_pressed(ord("D")))
	or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
	or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player2_slot, gp_padr))
	or (gamepad_axis_value(global.player2_slot, gp_axislh) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player3_slot, gp_padr))
	or (gamepad_axis_value(global.player3_slot, gp_axislh) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player4_slot, gp_padr))
	or (gamepad_axis_value(global.player4_slot, gp_axislh) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(4, gp_padr))
	or (gamepad_axis_value(4, gp_axislh) > 0)
	and (menu_joystick_delay <= 0);
	
	key_down = (keyboard_check_pressed(vk_down))
	or (keyboard_check_pressed(ord("S")))
	or (gamepad_button_check_pressed(global.player1_slot, gp_padd))
	or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player2_slot, gp_padd))
	or (gamepad_axis_value(global.player2_slot, gp_axislv) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player3_slot, gp_padd))
	or (gamepad_axis_value(global.player3_slot, gp_axislv) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(global.player4_slot, gp_padd))
	or (gamepad_axis_value(global.player4_slot, gp_axislv) > 0)
	and (menu_joystick_delay <= 0)
	or (gamepad_button_check_pressed(4, gp_padd))
	or (gamepad_axis_value(4, gp_axislv) > 0)
	and (menu_joystick_delay <= 0)
	or mouse_wheel_down();
	
	/* Player All Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept))
	or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept))
	or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_accept))
	or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_accept))
	or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_accept))
	or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_accept))
	or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_accept))
	or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_accept))
	or (keyboard_check_pressed(global.player1_key_accept))
	or (keyboard_check_pressed(global.player1_key2_accept))
	or (keyboard_check_pressed(vk_space));
	
	/* Player All Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept))
	or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept))
	or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button_accept))
	or (gamepad_button_check_released(global.player2_slot, global.player2_gamepad_button2_accept))
	or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button_accept))
	or (gamepad_button_check_released(global.player3_slot, global.player3_gamepad_button2_accept))
	or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button_accept))
	or (gamepad_button_check_released(global.player4_slot, global.player4_gamepad_button2_accept))
	or (keyboard_check_released(global.player1_key_accept))
	or (keyboard_check_released(global.player1_key2_accept))
	or (keyboard_check_released(vk_space));
	
	/* Player All Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back))
	or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back))
	or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button_back))
	or (gamepad_button_check_pressed(global.player2_slot, global.player2_gamepad_button2_back))
	or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button_back))
	or (gamepad_button_check_pressed(global.player3_slot, global.player3_gamepad_button2_back))
	or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button_back))
	or (gamepad_button_check_pressed(global.player4_slot, global.player4_gamepad_button2_back))
	or (keyboard_check_pressed(global.player1_key_back))
	or (keyboard_check_pressed(global.player1_key2_back))
	or (keyboard_check_pressed(vk_escape))
	or (mouse_check_button_pressed(mb_right));
}
else
{
	key_up = (keyboard_check_pressed(vk_up)) or (keyboard_check_pressed(ord("W"))) or (gamepad_button_check_pressed(global.player1_slot, gp_padu)) or (gamepad_axis_value(global.player1_slot, gp_axislv) < 0) and (menu_joystick_delay <= 0) or mouse_wheel_up();
	key_left = (keyboard_check_pressed(vk_left)) or (keyboard_check_pressed(ord("A"))) or (gamepad_button_check_pressed(global.player1_slot, gp_padl)) or (gamepad_axis_value(global.player1_slot, gp_axislh) < 0) and (menu_joystick_delay <= 0);
	key_right = (keyboard_check_pressed(vk_right)) or (keyboard_check_pressed(ord("D"))) or (gamepad_button_check_pressed(global.player1_slot, gp_padr)) or (gamepad_axis_value(global.player1_slot, gp_axislh) > 0) and (menu_joystick_delay <= 0);
	key_down = (keyboard_check_pressed(vk_down)) or (keyboard_check_pressed(ord("S"))) or (gamepad_button_check_pressed(global.player1_slot, gp_padd)) or (gamepad_axis_value(global.player1_slot, gp_axislv) > 0) and (menu_joystick_delay <= 0) or mouse_wheel_down();
	/* Player 1 Key Accept Pressed */ key_a_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_accept)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_accept)) or (keyboard_check_pressed(global.player1_key_accept)) or (keyboard_check_pressed(global.player1_key2_accept)) or (keyboard_check_pressed(vk_space));
	/* Player 1 Key Accept Released */ key_a_released = (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button_accept)) or (gamepad_button_check_released(global.player1_slot, global.player1_gamepad_button2_accept)) or (keyboard_check_released(global.player1_key_accept)) or (keyboard_check_released(global.player1_key2_accept)) or (keyboard_check_released(vk_space));
	/* Player 1 Key Back Pressed */ key_b_pressed = (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button_back)) or (gamepad_button_check_pressed(global.player1_slot, global.player1_gamepad_button2_back)) or (keyboard_check_pressed(global.player1_key_back)) or (keyboard_check_pressed(global.player1_key2_back)) or (keyboard_check_pressed(vk_escape));
}
#endregion /* Keyboard Controls END */

#region /* Play title screen music */
if (title_music > noone)
{
	audio_sound_gain(title_music, global.volume_music * global.volume_main * title_music_lerp, 0);
	if (global.play_attract_demo >= true)
	{
		title_music_lerp = lerp(title_music_lerp, 0, 0.01);
	}
	else
	{
		title_music_lerp = lerp(title_music_lerp, 1, 0.01);
	}
}
#endregion /* Play title screen music END */

background_layer_x += global.background_layer_x_scroll;
background_layer_y += global.background_layer_y_scroll;
layer_x(layer_get_id("Background"),background_layer_x);
layer_y(layer_get_id("Background"),background_layer_y);
title_background_scale_lerp = lerp(title_background_scale_lerp, global.title_background_scale, 0.1);
layer_background_xscale(layer_background_get_id(layer_get_id("Background")), title_background_scale_lerp);
layer_background_yscale(layer_background_get_id(layer_get_id("Background")), title_background_scale_lerp);

if (global.file < 1)
{
	global.file = 1; /* Don't let file go less than 1 */
}

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

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

if (menu == "load_characters")
{
	/* Load custom character data */
	
	file_load_timer += 1;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next()
	
		if (file_found == "")
		{
			file_find_close();
			scr_load_all_character_portraits();
			menu = "select_character";
		}
		else
		{
			if (file_exists(working_directory + "custom_characters/" + file_found + "/data/character_config.ini"))
			{
				ds_list_add(global.all_loaded_characters, file_found);
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
		}
	}
}

#region /* Load Custom Level */
if (menu == "load_custom_level")
{
	/* Load custom level data */
	
	file_load_timer += 1;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next()
		
		if (file_found == "")
		{
			file_find_close();
			if (global.level_name != "")
			{
				global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, string(global.level_name)); /* "Select level index" should be set to where the new custom level is saved */
			}
			select_custom_level_menu_open = true;
			if (global.go_to_menu_after_loading_custom_levels != "")
			{
				menu = global.go_to_menu_after_loading_custom_levels; /* Go to specific menu if this is assigned to something */
				global.go_to_menu_after_loading_custom_levels = "";
			}
			else
			{
				can_navigate = true;
				file_load_timer = 0;
				menu = "level_editor_play";
				menu_delay = 3;
			}
		}
		else
		{
			if (directory_exists(working_directory + "/custom_levels/" + file_found))
			and (file_exists(working_directory + "/custom_levels/" + file_found + "/data/level_information.ini"))
			{
				ds_list_add(global.all_loaded_custom_levels, file_found)
				
				#region /* Update Thumbnail */
				/* BMP Custom Thumbnail */if (file_exists(working_directory + "/custom_levels/" + file_found + "/Thumbnail.bmp"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/Thumbnail.bmp", 0, false, true, 0, 0));
				}
				else
				/* PNG Custom Thumbnail */if (file_exists(working_directory + "/custom_levels/" + file_found + "/Thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/Thumbnail.png", 0, false, true, 0, 0));
				}
				else
				/* GIF Custom Thumbnail */if (file_exists(working_directory + "/custom_levels/" + file_found + "/Thumbnail.gif"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/Thumbnail.gif", 0, false, true, 0, 0));
				}
				else
				/* JPG Custom Thumbnail */if (file_exists(working_directory + "/custom_levels/" + file_found + "/Thumbnail.jpg"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/Thumbnail.jpg", 0, false, true, 0, 0));
				}
				else
				/* PNG Automatic Thumbnail */
				if (file_exists(working_directory + "/custom_levels/" + file_found + "/automatic_thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/automatic_thumbnail.png", 0, false, true, 0, 0));
				}
				else
				if (file_exists(working_directory + "/custom_levels/" + file_found + "/Automatic Thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "/custom_levels/" + file_found + "/Automatic Thumbnail.png", 0, false, true, 0, 0));
				}
				else
				{
					ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
				}
				#endregion /* Update Thumbnail END */
				
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
		}
	}
}
#endregion /* Load Custom Level END */

#region /* Load Official Level Template */
if (menu == "load_official_level_template")
{
	/* Load official level data */
	
	file_load_timer += 1;
	
	if (file_load_timer > 1)
	{
		file_found = ds_list_find_value(global.all_loaded_main_levels, level_find_pos)
		level_find_pos += 1;
		
		if (file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1))
		{
			file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1)
			
			#region /* Update Thumbnail */
			
			/* BMP Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.bmp", 0, false, true, 0, 0));
			}
			else
			/* PNG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.png", 0, false, true, 0, 0));
			}
			else
			/* GIF Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.gif", 0, false, true, 0, 0));
			}
			else
			/* JPG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.jpg", 0, false, true, 0, 0));
			}
			else
			/* PNG Automatic Thumbnail */
			if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, true, 0, 0));
			}
			else
			if (file_exists("levels/" + file_found + "/Automatic Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Automatic Thumbnail.png", 0, false, true, 0, 0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /* Update Thumbnail END */
			
			select_custom_level_menu_open = false;
			level_editor_template_select = true;
			menu = "level_editor_play";
		}
		else
		{
			
			#region /* Update Thumbnail */
			/* BMP Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.bmp"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.bmp", 0, false, true, 0, 0));
			}
			else
			/* PNG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.png", 0, false, true, 0, 0));
			}
			else
			/* GIF Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.gif"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.gif", 0, false, true, 0, 0));
			}
			else
			/* JPG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/Thumbnail.jpg"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Thumbnail.jpg", 0, false, true, 0, 0));
			}
			else
			/* PNG Automatic Thumbnail */
			if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, true, 0, 0));
			}
			else
			if (file_exists("levels/" + file_found + "/Automatic Thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/Automatic Thumbnail.png", 0, false, true, 0, 0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /* Update Thumbnail END */
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the file_find_first code which it does at 1 */
		}
	}
}
#endregion /* Load Official Level Template END */
