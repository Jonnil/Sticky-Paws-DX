scr_set_controls_used_to_navigate();
scr_set_screen_size();
scr_character_select_menu_step();
scr_set_menu_font_color();
scr_toggle_fullscreen();

var fixed_player = 1;

if (global.go_to_menu_when_going_back_to_title == "upload_yes_character")
&& (menu_delay == 0)
{
	if (global.sprite_select_player[fixed_player] < 0)
	|| (global.sprite_select_player[fixed_player] == spr_noone)
	{
		global.sprite_select_player[fixed_player] = spr_noone;
		global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
		global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
	}
	select_custom_level_menu_open = false;
	menu = "upload_yes_character";
	global.go_to_menu_when_going_back_to_title = "";
	global.doing_clear_check_character = false;
}
else
if (global.go_to_menu_when_going_back_to_title == "online_download_list_load")
&& (menu_delay == 0)
|| (global.automatically_play_downloaded_level)
&& (menu_delay == 0)
{
	directory_destroy(cache_directory + "custom_levels/" + global.level_name + "/background");
	directory_destroy(cache_directory + "custom_levels/" + global.level_name + "/data");
	directory_destroy(cache_directory + "custom_levels/" + global.level_name + "/sound");
	directory_destroy(cache_directory + "custom_levels/" + global.level_name + "/tilesets");
	directory_destroy(cache_directory + "custom_levels/" + global.level_name);
	global.use_cache_or_working = working_directory; /* When downloading levels from online and temporarily playing the level, you have to use the "cache directory", but normally you need to use the "working directory" */
	select_custom_level_menu_open = false;
	menu = "online_download_list_load";
	global.go_to_menu_when_going_back_to_title = "";
	global.automatically_play_downloaded_level = false;
}

global.keyboard_virtual_timer = clamp(global.keyboard_virtual_timer - 0.5, 0, 4);

scr_menu_navigation_initialization(0, true); /* Keyboard Controls */

#region /* Play title screen music */
if (title_music > noone)
{
	audio_sound_gain(title_music, global.volume_music * global.volume_main * title_music_lerp, 0);
	title_music_lerp = lerp(title_music_lerp, 1, 0.01);
}
#endregion /* Play title screen music END */

#region /* Set Title Background Settings */
background_layer_x[1] += global.background_layer_x_scroll[1];
background_layer_x[2] += global.background_layer_x_scroll[2];
background_layer_x[3] += global.background_layer_x_scroll[3];

background_layer_y[1] += global.background_layer_y_scroll[1];
background_layer_y[2] += global.background_layer_y_scroll[2];
background_layer_y[3] += global.background_layer_y_scroll[3];

layer_x(layer_get_id("Background1"), background_layer_x[1]);
layer_x(layer_get_id("Background2"), background_layer_x[2]);
layer_x(layer_get_id("Background3"), background_layer_x[3]);

layer_y(layer_get_id("Background1"), background_layer_y[1]);
layer_y(layer_get_id("Background2"), background_layer_y[2]);
layer_y(layer_get_id("Background3"), background_layer_y[3]);

title_background_scale_lerp[1] = lerp(title_background_scale_lerp[1], global.title_background_scale[1], 0.1);
title_background_scale_lerp[2] = lerp(title_background_scale_lerp[2], global.title_background_scale[2], 0.1);
title_background_scale_lerp[3] = lerp(title_background_scale_lerp[3], global.title_background_scale[3], 0.1);

layer_background_xscale(layer_background_get_id(layer_get_id("Background1")), title_background_scale_lerp[1]);
layer_background_xscale(layer_background_get_id(layer_get_id("Background2")), title_background_scale_lerp[2]);
layer_background_xscale(layer_background_get_id(layer_get_id("Background3")), title_background_scale_lerp[3]);

layer_background_yscale(layer_background_get_id(layer_get_id("Background1")), title_background_scale_lerp[1]);
layer_background_yscale(layer_background_get_id(layer_get_id("Background2")), title_background_scale_lerp[2]);
layer_background_yscale(layer_background_get_id(layer_get_id("Background3")), title_background_scale_lerp[3]);

layer_background_alpha(layer_background_get_id(layer_get_id("Background1")), title_background_blink[1]);
layer_background_alpha(layer_background_get_id(layer_get_id("Background2")), title_background_blink[2]);
layer_background_alpha(layer_background_get_id(layer_get_id("Background3")), title_background_blink[3]);
#endregion /* Set Title Background Settings END */

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

if (menu == "load_characters")
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	
	#region /* Player Automatically Join */
	/* When going to the character select menu, game should remember what player entered the menu, and therefore should automatically join the game, as the game should already know for certain that player is already joining the game */
	for (var p = 1; p <= global.max_players; p += 1)
	{
		/* Player Key Accept Hold */ player_key_a_hold[p] = (gamepad_button_check(global.player_slot[p], global.player_[inp.gp][p][1][action.accept])) || (gamepad_button_check(global.player_slot[p], global.player_[inp.gp][p][2][action.accept])) || (keyboard_check(global.player_[inp.key][p][1][action.accept])) || (keyboard_check(global.player_[inp.key][p][2][action.accept]));
		if (player_key_a_hold[p])
		{
			player_automatically_join[p] = true;
		}
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
			
			if (player_menu[fixed_player] == "click_copy_character")
			{
				
				#region /* After copying character, show the copied character */
				global.character_index[fixed_player - 1] = ds_list_find_index(global.all_loaded_characters, copied_character_name);
				global.character_for_player[fixed_player] = ds_list_find_index(global.all_loaded_characters, global.character_index[fixed_player - 1]);
				#endregion /* After copying character, show the copied character END */
				
				#region /* Player 1 character select portrait sprite */
				global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
				global.sprite_select_player[fixed_player] = spr_noone;
				global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player], copied_character_name);
				global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player], copied_character_name);
				#endregion /* Player 1 character select portrait sprite END */
				
				menu = "click_copy_character";
				player_menu[fixed_player] = "click_copy_character";
			}
			else
			if (player_menu[fixed_player] == "click_delete_character")
			{
				menu = "click_delete_character";
			}
			else
			{
				if (player_menu[fixed_player] == "load_downloaded_character")
				{
					/* When you have downloaded a custom character, player 1 should be set to the downloaded custom character so that the player can play with them immediately */
					if (downloaded_character_name != "")
					{
						global.character_index[fixed_player - 1] = ds_list_find_index(global.all_loaded_characters, string(downloaded_character_name));
					}
					global.character_for_player[fixed_player] = ds_list_find_index(global.all_loaded_characters, global.character_index[0]);
					
					#region /* Player 1 character select portrait sprite */
					global.skin_for_player[fixed_player] = global.actual_skin_for_player[fixed_player]; /* Update "skin for player" to what it should actually be when selecting a new character before setting a sprite */
					global.sprite_select_player[fixed_player] = spr_noone;
					global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
					global.sprite_select_player[fixed_player] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[fixed_player], 0, global.skin_for_player[fixed_player]);
					#endregion /* Player 1 character select portrait sprite END */
					
				}
				
				menu = "select_character"; /* Default menu to go to after loading all characters */
				player_menu[fixed_player] = "select_character"; /* Set this to be "select character" so it's not on wrong menu unintentionally */
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
	file_found = file_find_next()
	
	if (file_found == "")
	{
		file_find_close();
		
		#region /* Get clear check and level ID information */
		if (variable_instance_exists(self, "thumbnail_level_name"))
		&& (variable_instance_exists(self, "thumbnail_level_description"))
		&& (variable_instance_exists(self, "thumbnail_clear_check"))
		&& (variable_instance_exists(self, "thumbnail_level_id"))
		&& (is_array(thumbnail_level_name))
		&& (array_length(thumbnail_level_name) > 0)
		&& (is_array(thumbnail_level_description))
		&& (array_length(thumbnail_level_description) > 0)
		&& (is_array(thumbnail_clear_check))
		&& (array_length(thumbnail_clear_check) > 0)
		&& (is_array(thumbnail_level_id))
		&& (array_length(thumbnail_level_id) > 0)
		&& (i >= 0)
		&& (i < array_length(thumbnail_level_name))
		&& (i < array_length(thumbnail_level_description))
		&& (i < array_length(thumbnail_clear_check))
		&& (i < array_length(thumbnail_level_id))
		{
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
		}
		else
		{
			show_level_editor_corner_menu = true;
			select_custom_level_menu_open = false;
			menu = "load_custom_level"; /* If all custom levels are not loaded, then reload all custom levels before going to the level select menu */
		}
		#endregion /* Get clear check and level ID information END */
		
		if (global.level_name != "")
		{
			global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, global.level_name); /* "Select level index" should be set to where the new custom level is saved */
		}
		if (global.go_to_menu_when_going_back_to_title != "online_download_list_load")
		&& (!global.automatically_play_downloaded_level)
		{
			select_custom_level_menu_open = true;
		}
		if (global.go_to_menu_when_going_back_to_title != "")
		{
			menu = global.go_to_menu_when_going_back_to_title; /* Go to specific menu if this is assigned to something */
			global.go_to_menu_when_going_back_to_title = "";
		}
		else
		{
			/* Go to the custom level select menu */
			can_navigate = true;
			file_load_timer = 0;
			menu = "level_editor_play";
			menu_delay = 3;
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
	&& (!loading_assets)
	|| (global.doing_clear_check_character)
	{
		if (global.create_level_from_template)
		&& (allowed_to_load_template_level)
		|| (!global.create_level_from_template)
		{
			/* Save what characters are selected */
			ini_open(working_directory + "save_file/config.ini");
			for (var p = 1; p <= global.max_players; p += 1)
			{
				ini_write_real("config", "character_index_player" + string(p), global.character_index[p - 1]);
			}
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			
			if (title_music > noone)
			{
				if (audio_is_playing(title_music))
				{
					audio_stop_sound(title_music);
				}
			}
			scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
			if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
			&& (!global.create_level_from_template)
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
	if (menu == "select_character" || menu == "back_from_character_select")
	{
		/* Save what characters are selected */
		ini_open(working_directory + "save_file/config.ini");
		for(var p = 1; p <= global.max_players; p += 1)
		{
			ini_write_real("config", "character_index_player" + string(p), global.character_index[p - 1]);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		
		if (title_music > noone)
		{
			if (audio_is_playing(title_music))
			{
				audio_stop_sound(title_music);
			}
		}
		scr_delete_sprite_properly(title_screen_background[title_bg_layer]);
		scr_config_save();
		ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
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