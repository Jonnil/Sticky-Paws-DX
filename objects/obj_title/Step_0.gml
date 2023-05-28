scr_set_controls_used_to_navigate();
scr_set_screen_size();
scr_character_select_menu_step();
scr_set_menu_font_color();

scr_menu_navigation_initialization(1, true); /* Keyboard Controls END */

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

if (lerp_on)
{
	scroll = lerp(scroll, scroll_to, 0.15)
	if (scroll == scroll_to)
	{
		lerp_on = false;
	}
}

if (menu == "load_characters")
{
	
	#region /* Player Automatically Join */
	/* When going to the character select menu, game should remember what player entered the menu, and therefore should automatically join the game, as the game should already know for certain that player is already joining the game */
	/* Player 1 Key Accept Hold */ player1_key_a_hold = (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check(global.player1_slot, global.player_[inp.gp][1][2][action.accept])) || (keyboard_check(global.player_[inp.key][1][1][action.accept])) || (keyboard_check(global.player_[inp.key][1][2][action.accept])) || (keyboard_check(vk_space));
	/* Player 2 Key Accept Hold */ player2_key_a_hold = (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check(global.player2_slot, global.player_[inp.gp][2][2][action.accept])) || (keyboard_check(global.player_[inp.key][2][1][action.accept])) || (keyboard_check(global.player_[inp.key][2][2][action.accept]));
	/* Player 3 Key Accept Hold */ player3_key_a_hold = (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check(global.player3_slot, global.player_[inp.gp][3][2][action.accept])) || (keyboard_check(global.player_[inp.key][3][1][action.accept])) || (keyboard_check(global.player_[inp.key][3][2][action.accept]));
	/* Player 4 Key Accept Hold */ player4_key_a_hold = (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check(global.player4_slot, global.player_[inp.gp][4][2][action.accept])) || (keyboard_check(global.player_[inp.key][4][1][action.accept])) || (keyboard_check(global.player_[inp.key][4][2][action.accept]));
	if (player1_key_a_hold)
	{
		player1_automatically_join = true;
	}
	else
	if (player2_key_a_hold)
	{
		player2_automatically_join = true;
	}
	else
	if (player3_key_a_hold)
	{
		player3_automatically_join = true;
	}
	else
	if (player4_key_a_hold)
	{
		player4_automatically_join = true;
	}
	#endregion /* Player Automatically Join END */
	
	/* Load custom character data */
	
	file_load_timer += 1;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next()
	
		if (file_found == "")
		{
			file_find_close();
			scr_load_all_character_portraits();
			if (player_menu[1] == "click_copy_character")
			{
				with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
				{
					score_up = "Copied"; /* Show that you have copied the character */
				}
				
				#region /* After copying character, show the copied character */
				global.character_index[0] = ds_list_find_index(global.all_loaded_characters, ds_list_find_value(global.all_loaded_characters, global.character_index[0]) + " - Copy");
				global.character_for_player[1] = ds_list_find_value(global.all_loaded_characters, global.character_index[0]);
				xx[1] = player1_display_x + 32;
				#endregion /* After copying character, show the copied character END */
				
				menu = "click_copy_character";
			}
			else
			if (player_menu[1] == "click_delete_character")
			{
				menu = "click_delete_character";
			}
			else
			{
				if (player_menu[1] == "load_downloaded_character")
				{
					/* When you have downloaded a custom character, player 1 should be set to the downloaded custom character so that the player can play with them immediately */
					if (downloaded_character_name != "")
					{
						global.character_index[0] = ds_list_find_index(global.all_loaded_characters, string(downloaded_character_name));
					}
					global.character_for_player[1] = ds_list_find_index(global.all_loaded_characters, global.character_index[0]);
					
					#region /* Player 1 character select portrait sprite */
					global.skin_for_player[1] = global.actual_skin_for_player[1]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					global.sprite_select_player[1] = spr_noone;
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					#endregion /* Player 1 character select portrait sprite END */
					
				}
				
				character_portrait_for_player_update_directory[1] = true;
				character_portrait_for_player_update_directory[2] = true;
				character_portrait_for_player_update_directory[3] = true;
				character_portrait_for_player_update_directory[4] = true;
				alarm[0] = 1;
				
				menu = "select_character"; /* Default menu to go to after loading all characters */
				player_menu[1] = "select_character"; /* Set this to be "select character" so it's not on wrong menu unintentionally */
			}
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
			if (file_exists(working_directory + "/custom_levels/" + file_found + "/data/level_information.ini"))
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
