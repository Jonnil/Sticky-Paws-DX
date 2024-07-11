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
		scr_delete_sprite_properly(global.sprite_select_player[fixed_player]);
		global.sprite_select_player[fixed_player] = spr_noone;
		scr_set_character_folder(fixed_player, global.skin_for_player[fixed_player]);
		ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
		global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("idle", global.sprite_select_player[fixed_player]);
		global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("stand", global.sprite_select_player[fixed_player]);
		global.sprite_select_player[fixed_player] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[fixed_player]);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	select_custom_level_menu_open = false;
	
	ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1])) + "/data/character_config.ini");
	visibility_index = ini_read_real("info", "visibility_index", 0);
	ini_close();
	
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
	directory_destroy(temp_directory + "custom_levels/" + global.level_name); /* Delete the temporary downloaded level */
	global.use_temp_or_working = game_save_id; /* When downloading levels from online and temporarily playing the level, you have to use the "temp directory", but normally you need to use the "working directory" */
	select_custom_level_menu_open = false;
	menu = "online_download_list_load";
	global.go_to_menu_when_going_back_to_title = "";
	global.automatically_play_downloaded_level = false;
}

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
{
	scr_load_rest_of_characters();
}

scr_load_custom_levels();

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
&& (!can_navigate)
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
			ini_open(game_save_id + "save_file/config.ini");
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
		ini_open(game_save_id + "save_file/config.ini");
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
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		lives = ini_read_real("Player", "lives", 5);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
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