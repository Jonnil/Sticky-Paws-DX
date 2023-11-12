scr_set_controls_used_to_navigate();
scr_set_screen_size();
scr_character_select_menu_step();
scr_set_menu_font_color();
scr_toggle_fullscreen();

if (global.go_to_menu_when_going_back_to_title == "upload_yes_character")
{
	if (global.sprite_select_player[1] < 0)
	|| (global.sprite_select_player[1] == spr_noone)
	{
		global.sprite_select_player[1] = spr_noone;
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
	}
	menu = "upload_yes_character";
	global.go_to_menu_when_going_back_to_title = "";
	global.doing_clear_check_character = false;
}

global.keyboard_virtual_timer = clamp(global.keyboard_virtual_timer - 0.5, 0, 4);

scr_menu_navigation_initialization(1, true); /* Keyboard Controls END */

#region /* Play title screen music */
if (title_music > noone)
{
	audio_sound_gain(title_music, global.volume_music * global.volume_main * title_music_lerp, 0);
	title_music_lerp = lerp(title_music_lerp, 1, 0.01);
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
	menu_delay --;
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
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	
	#region /* Player Automatically Join */
	/* When going to the character select menu, game should remember what player entered the menu, and therefore should automatically join the game, as the game should already know for certain that player is already joining the game */
	/* Player 1 Key Accept Hold */ player1_key_a_hold = (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][1][action.accept])) || (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][2][action.accept])) || (keyboard_check(global.player_[inp.key][1][1][action.accept])) || (keyboard_check(global.player_[inp.key][1][2][action.accept])) || (keyboard_check(vk_space));
	/* Player 2 Key Accept Hold */ player2_key_a_hold = (gamepad_button_check(global.player_slot[2], global.player_[inp.gp][2][1][action.accept])) || (gamepad_button_check(global.player_slot[2], global.player_[inp.gp][2][2][action.accept])) || (keyboard_check(global.player_[inp.key][2][1][action.accept])) || (keyboard_check(global.player_[inp.key][2][2][action.accept]));
	/* Player 3 Key Accept Hold */ player3_key_a_hold = (gamepad_button_check(global.player_slot[3], global.player_[inp.gp][3][1][action.accept])) || (gamepad_button_check(global.player_slot[3], global.player_[inp.gp][3][2][action.accept])) || (keyboard_check(global.player_[inp.key][3][1][action.accept])) || (keyboard_check(global.player_[inp.key][3][2][action.accept]));
	/* Player 4 Key Accept Hold */ player4_key_a_hold = (gamepad_button_check(global.player_slot[4], global.player_[inp.gp][4][1][action.accept])) || (gamepad_button_check(global.player_slot[4], global.player_[inp.gp][4][2][action.accept])) || (keyboard_check(global.player_[inp.key][4][1][action.accept])) || (keyboard_check(global.player_[inp.key][4][2][action.accept]));
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
	file_load_timer ++;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next();
		
		if (file_found == "")
		{
			file_find_close();
			
			if (player_menu[1] == "click_copy_character")
			{
				
				#region /* After copying character, show the copied character */
				global.character_index[0] = ds_list_find_index(global.all_loaded_characters, copied_character_name);
				global.character_for_player[1] = ds_list_find_index(global.all_loaded_characters, global.character_index[0]);
				#endregion /* After copying character, show the copied character END */
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player[1] = global.actual_skin_for_player[1]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				global.sprite_select_player[1] = spr_noone;
				global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1], copied_character_name);
				global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1], copied_character_name);
				#endregion /* Player 1 character select portrait sprite END */
				
				menu = "click_copy_character";
				player_menu[1] = "click_copy_character";
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
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
					#endregion /* Player 1 character select portrait sprite END */
					
				}
				
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
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
		}
	}
}

#region /* Load Custom Level */
if (menu == "load_custom_level")
{
	/* Load custom level data */
	
	file_load_timer ++;
	
	if (file_load_timer > 1)
	{
		file_found = file_find_next()
		
		if (file_found == "")
		{
			file_find_close();
			
			#region /* If you don't have any unlocked placable objects at all, then you can't create a custom level from scratch */
			/* Check this before going to create level from scratch */
			if (file_exists(working_directory + "save_files/file" + string(global.file) + ".ini"))
			{
				ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
				if (ini_section_exists("Unlock Placable Objects"))
				{
					can_create_level_from_scratch = true;
				}
				else
				{
					can_create_level_from_scratch = false;
				}
				ini_close();
			}
			else
			{
				can_create_level_from_scratch = false;
			}
			#endregion /* If you don't have any unlocked placable objects at all, then you can't create a custom level from scratch END */
			
			#region /* Get clear check and level ID information */
			for(i = 1; i < ds_list_size(global.thumbnail_sprite); i += 1)
			{
				ini_open(working_directory + "custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, i)) + "/data/level_information.ini");
				thumbnail_clear_check[i] = ini_read_string("info", "clear_check", false);
				thumbnail_level_id[i] = string(ini_read_string("info", "level_id", ""));
				if (switch_check_profanity(string(ini_read_string("info", "level_name", ""))))
				{
					thumbnail_level_name[i] = string(switch_mask_profanity(ini_read_string("info", "level_name", "")));
				}
				else
				{
					thumbnail_level_name[i] = string(ini_read_string("info", "level_name", ""));
				}
				if (switch_check_profanity(string(ini_read_string("info", "level_description", ""))))
				{
					thumbnail_level_description[i] = string(switch_mask_profanity(ini_read_string("info", "level_description", "")));
				}
				else
				{
					thumbnail_level_description[i] = string(ini_read_string("info", "level_description", ""));
				}
				if (switch_check_profanity(string(ini_read_string("info", "username", ""))))
				{
					thumbnail_level_username[i] = string(switch_mask_profanity(ini_read_string("info", "username", "")));
				}
				else
				{
					thumbnail_level_username[i] = string(ini_read_string("info", "username", ""));
				}
				ini_close();
			}
			#endregion /* Get clear check and level ID information END */
			
			if (global.level_name != "")
			{
				global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, string(global.level_name)); /* "Select level index" should be set to where the new custom level is saved */
			}
			select_custom_level_menu_open = true;
			if (global.go_to_menu_when_going_back_to_title != "")
			{
				menu = global.go_to_menu_when_going_back_to_title; /* Go to specific menu if this is assigned to something */
				global.go_to_menu_when_going_back_to_title = "";
			}
			else
			{
				
				#region /* Go to the custom level select menu */
				can_navigate = true;
				file_load_timer = 0;
				menu = "level_editor_play";
				menu_delay = 3;
				#endregion /* Go to the custom level select menu END */
				
			}
		}
		else
		{
			if (file_exists(working_directory + "custom_levels/" + file_found + "/data/level_information.ini"))
			{
				ds_list_add(global.all_loaded_custom_levels, file_found)
				
				#region /* Update Thumbnail */
				/* PNG Custom Thumbnail */if (file_exists(working_directory + "custom_levels/" + file_found + "/thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "custom_levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
				}
				else
				/* PNG Automatic Thumbnail */
				if (file_exists(working_directory + "custom_levels/" + file_found + "/automatic_thumbnail.png"))
				{
					ds_list_add(global.thumbnail_sprite, sprite_add(working_directory + "custom_levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
				}
				else
				{
					ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
				}
				#endregion /* Update Thumbnail END */
				
			}
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
		}
	}
}
#endregion /* Load Custom Level END */

#region /* Load Official Level Template */
if (menu == "load_official_level_template")
{
	/* Load official level data */
	
	file_load_timer ++;
	
	if (file_load_timer > 1)
	{
		file_found = ds_list_find_value(global.all_loaded_main_levels, level_find_pos)
		level_find_pos ++;
		
		if (file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1))
		{
			file_found = ds_list_find_value(global.all_loaded_main_levels, ds_list_size(global.all_loaded_main_levels) - 1)
			
			#region /* Update Thumbnail */
			
			/* PNG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
			}
			else
			/* PNG Automatic Thumbnail */
			if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /* Update Thumbnail END */
			
			select_custom_level_menu_open = false;
			level_editor_template_select = true;
			file_load_timer = 0; /* Important that you reset this value back to 0, otherwise the menu will not work properly as it still thinks game is loading levels */
			open_sub_menu = false; /* Return this variable to false */
			menu = "level_editor_play";
		}
		else
		{
			
			#region /* Update Thumbnail */
			/* PNG Official Thumbnail */
			if (file_exists("levels/" + file_found + "/thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/thumbnail.png", 0, false, false, 0, 0));
			}
			else
			/* PNG Automatic Thumbnail */
			if (file_exists("levels/" + file_found + "/automatic_thumbnail.png"))
			{
				ds_list_add(global.thumbnail_sprite, sprite_add("levels/" + file_found + "/automatic_thumbnail.png", 0, false, false, 0, 0));
			}
			else
			{
				ds_list_add(global.thumbnail_sprite, spr_thumbnail_missing)
			}
			#endregion /* Update Thumbnail END */
			
			file_load_timer = 0; /* 0 not 1. So it doesn't do the "file find first" code which it does at 1 */
		}
	}
}
#endregion /* Load Official Level Template END */

#region /* Start Game */
if (iris_xscale <= 0.01)
&& (menu_delay > 999) /* Make sure you can only start the game when the menu delay is set to over 999, as that's when the iris xscale is set to zoom in */
{
	
	#region /* Play or Make Level Editor */
	if (menu != "select_character")
	&& (menu != "back_from_character_select")
	&& (global.character_select_in_this_menu == "level_editor")
	&& (loading_assets == false)
	|| (global.doing_clear_check_character == true)
	{
		if (global.create_level_from_template)
		&& (allowed_to_load_template_level)
		|| (global.create_level_from_template == false)
		{
			/* Save what characters are selected */
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "character_index_player1", global.character_index[0]);
			ini_write_real("config", "character_index_player2", global.character_index[1]);
			ini_write_real("config", "character_index_player3", global.character_index[2]);
			ini_write_real("config", "character_index_player4", global.character_index[3]);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			
			if (title_music > noone)
			{
				if (audio_is_playing(title_music))
				{
					audio_stop_sound(title_music);
				}
			}
			scr_delete_sprite_properly(title_screen_background);
			if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
			&& (global.create_level_from_template == false)
			&& (global.select_level_index > 0) /* Don't update if you're selecting "create from scratch" */
			{
				/* Update the "global level name" before updating all backgrounds and going to the level editor */
				global.level_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)); /* Set the "level name" to the selected level, so when you exit the level editor, the cursor will remember to appear on the level you selected */
			}
			scr_update_all_backgrounds();
			global.part_limit = 0; /* How many objects are currently placed in the level editor */
			global.part_limit_entity = 0; /* How many entities are currently placed in the level editor */
			
			var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
				room_goto(rm_leveleditor); /* Go to level editor, either in editing mode or to play normally */
			}, [], 1);
			time_source_start(time_source);
			
			/* The variables "doing clear check", "actually play edited level", and "play edited level" should be set before doing "menu delay = 9999" to zoom the iris xscale */
			
			loading_assets = true;
		}
	}
	#endregion /* Play or Make Level Editor END */
	
	else
	
	#region /* Load File */
	if (menu == "select_character")
	|| (menu == "back_from_character_select")
	{
		/* Save what characters are selected */
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "character_index_player1", global.character_index[0]);
		ini_write_real("config", "character_index_player2", global.character_index[1]);
		ini_write_real("config", "character_index_player3", global.character_index[2]);
		ini_write_real("config", "character_index_player4", global.character_index[3]);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		scr_delete_sprite_properly(title_screen_background);
		scr_config_save();
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		lives = ini_read_real("Player", "lives", 5);
		ini_close();
		room_goto(rm_world_map);
	}
	#endregion /* Load File END */

}
#endregion /* Start Game END */

#region /* Menu Navigation Delay */
if (menu_delay > 0)
{
	menu_delay --;
}
#endregion /* Menu Navigation Delay END */