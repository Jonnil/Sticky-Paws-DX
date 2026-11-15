function scr_rename_custom_level_name()
{

	#region /* Save the newly entered name */
	/* Preserve player history. Stable UID progress survives the authored folder rename. */
	var previous_folder = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
	var previous_info = game_save_id + "custom_levels/" + previous_folder + "/data/level_information.ini";
	var previous_context = scr_level_progress_from_info(previous_info, previous_folder);
	if (is_struct(previous_context))
	{
		if (previous_context.uid == "")
		{
			previous_context.uid = scr_big_collectible_new_id();
			ini_open(previous_info);
			ini_write_string("info", "big_collectible_level_id", previous_context.uid);
			ini_close();
		}
		global.big_collectible_level_id = previous_context.uid;
		previous_context = scr_level_progress_context(false, "", previous_context.online_id,
			previous_context.uid, previous_folder, previous_context.legacy_name, previous_context.fresh_identity);
		scr_level_progress_prepare(previous_context);
		global.level_progress_context = previous_context;
	}


	/* For actual folder name, replace illegal characters with underscore only for naming folder */
	var folder_name = scr_get_unique_folder_name(game_save_id + "custom_levels/", string(global.level_name));

	/* To rename the level, need to copy level files into new named folder */
	var old_folder_name = "";

	if (variable_instance_exists(self, "old_level_index"))
	{
		old_folder_name = string(old_level_index);
		show_debug_message("[scr_rename_custom_level_name] 'old level index' exists and is set to: " + string(old_level_index));
	}
	else
	{
		old_folder_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
		show_debug_message("[scr_rename_custom_level_name] 'old level index' does NOT exist! Set 'old folder name' and set it to: " + string(old_level_index));
	}

	scr_copy_move_files(
	game_save_id + "custom_levels/" + string(old_folder_name),
	game_save_id + "custom_levels/" + string(folder_name), true); /* Need to write the entire path here instead of using variable, because the level name changes mid-code */

	if (global.level_name != "")
	&& (file_exists(game_save_id + "custom_levels/" + string(folder_name) + "/data/level_information.ini"))
	{
		ini_open(game_save_id + "custom_levels/" + string(folder_name) + "/data/level_information.ini");

		/* Mask name if it includes profanity */
		if (switch_check_profanity(global.level_name))
		{
			global.level_name = switch_mask_profanity(global.level_name);
		}

		show_debug_message("[scr_rename_custom_level_name] Save level name to custom level as 'global level name' : " + string(global.level_name));
		masked_level_name = string(global.level_name);
		ini_write_string("info", "level_name", string(global.level_name)); /* Write the actual unfiltered level name you typed */

		if (variable_instance_exists(self, "creating_daily_build")
		&& creating_daily_build)
		{
			ini_write_real("info", "if_daily_build", true);
		}

		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

		if (variable_instance_exists(self, "thumbnail_level_name"))
		{
			thumbnail_level_name[global.select_level_index] = string(global.level_name);
		}
	}

	#region /* Update Thumbnail */
	if (room == rm_leveleditor)
	{
		/* Starting thumbnail update for level index and folder */
		show_debug_message("[scr_rename_custom_level_name] Updating thumbnail for index " + string(global.select_level_index)
			+ " (folder: " + string(folder_name) + ")");

		/* Delete any previously loaded thumbnail sprite */
		var old_spr = ds_list_find_value(global.thumbnail_sprite, global.select_level_index);
		scr_delete_sprite_properly(old_spr);

		/* Build the path prefix once */
		var base_path = game_save_id + "custom_levels/" + string(folder_name) + "/";

		/* Check for level info file first */
		var info_path = base_path + "data/level_information.ini";

		if (file_exists(info_path))
		{
			show_debug_message("[scr_rename_custom_level_name] Found level info: " + info_path);

			/* First choice: user-supplied PNG */
			var png_path = base_path + "thumbnail.png";

			if (file_exists(png_path))
			{
				show_debug_message("[scr_rename_custom_level_name] Found custom thumbnail: " + png_path);
				var new_spr = sprite_add(png_path, 0, false, false, 0, 0);
				ds_list_add(global.thumbnail_sprite, new_spr);

				show_debug_message(
					"[scr_rename_custom_level_name] Added sprite ID: "
					+ string(new_spr)
					+ "  |  To retrieve later: var spr = ds_list_find_value("
					+ "global.thumbnail_sprite, string(global.select_level_index)"
					+ ");  |  global.select_level_index: " + string(global.select_level_index) + "\n"
				);
			}
			else
			{
				/* Fallback to auto-generated PNG */
				var auto_path = base_path + "automatic_thumbnail.png";

				if (file_exists(auto_path))
				{
					show_debug_message("[scr_rename_custom_level_name] Custom thumbnail missing, using automatic: " + auto_path);
					var new_spr2 = sprite_add(auto_path, 0, false, false, 0, 0);
					ds_list_add(global.thumbnail_sprite, new_spr2);

					show_debug_message(
						"[scr_rename_custom_level_name] Added sprite ID: "
						+ string(new_spr2)
						+ "  |  To retrieve later: var spr = ds_list_find_value("
						+ "global.thumbnail_sprite, string(global.select_level_index)"
						+ ");  |  global.select_level_index: " + string(global.select_level_index) + "\n"
					);
				}
				else
				{
					show_debug_message("[scr_rename_custom_level_name] WARNING: No thumbnail PNG found at:\n   " + png_path + "\n   " + auto_path + "\n");
					/* Optionally: add a placeholder sprite or -1 */
					ds_list_add(global.thumbnail_sprite, -1);
				}
			}
		}
		else
		{
			show_debug_message("[scr_rename_custom_level_name] WARNING: Level info missing, skipping thumbnail. Expected: " + info_path + "\n");
			/* Ensure the list still stays in sync */
			ds_list_add(global.thumbnail_sprite, -1);
		}
	}
	#endregion /* Update Thumbnail END */

	global.select_level_index = ds_list_find_index(global.all_loaded_custom_levels, folder_name); /* After renaming a level, make sure "select level index" is updated before updating the thumbnail */
	global.level_folder_name = folder_name; /* Track the folder name separately so UI can keep the unsanitized display name */
	if (is_struct(previous_context)) global.level_progress_context = scr_level_progress_context(false, "", previous_context.online_id,
		previous_context.uid, folder_name, global.level_name, previous_context.fresh_identity);
	#endregion /* Save the newly entered name END */

	#region /* Properly reload all levels so the level with a new name can be initialized */
	scr_load_custom_level_initializing();

	if (variable_instance_exists(self, "can_input_player_name")
	&& variable_instance_exists(self, "player_accept_selection"))
	{
		for(var i = 1; i <= global.max_players; i ++)
		{
			can_input_player_name[i] = 2;
			player_accept_selection[i] = false;
		}
	}

	can_navigate = true;
	open_sub_menu = false;
	show_level_editor_corner_menu = true;
	file_found = "";
	level_editor_edit_name = false;

	menu = "load_custom_level";
	#endregion /* Properly reload all levels so the level with a new name can be initialized END */

	menu_delay = 3;
}
