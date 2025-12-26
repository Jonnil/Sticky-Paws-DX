function scr_upload_zip_add_files(what_kind_of_file = "level")
{
	/* Set an initial description for the operation */
	global.creating_zip_file_description = "Starting ZIP creation for " + what_kind_of_file;

	#region /* Level */
	if (what_kind_of_file == "level")
	{
		/* Use the actual folder name for filesystem paths; display name is only for UI */
		var level_name_display = global.level_name;
		var level_folder = scr_get_custom_level_folder_name(); /* Actual folder name on disk */
		var base_root = (variable_global_exists("use_temp_or_working") ? string(global.use_temp_or_working) : string(game_save_id));
		if (string(base_root) == "") base_root = string(game_save_id);
		var base_level_path = base_root + "custom_levels/" + string(level_folder) + "/";
		var zip_folder = game_save_id + "uploads/";
		if (!directory_exists(zip_folder)) directory_create(zip_folder);

		var zip_handle = zip_create();

		/* Helper to add all files matching a pattern */
		var _add_all = function(_zip, _search_glob, _dest_prefix)
		{
			var fname = file_find_first(_search_glob, 0);
			var any = false;
			while (fname != "")
			{
				any = true;
				/* Rebuild src path from glob */
				var src = string_replace(_search_glob, "*.*", fname);
				src = string_replace(src, "*.png", fname);
				src = string_replace(src, "*.ogg", fname);
				src = string_replace(src, "*.ini", fname);
				src = string_replace(src, "*.txt", fname);
				src = string_replace(src, "*.json", fname);
				var dest = _dest_prefix + fname;

				if (file_exists(src))
				{
					zip_add_file(_zip, dest, src);
				}

				fname = file_find_next();
			}
			file_find_close();
			return any;
		};

		global.creating_zip_file_description = "Creating ZIP for level: " + string(level_name_display);

		var file_name = ""; /* In case there is no file found, set the "file name" to nothing here */

		#region /* Add all the level files to a new zip file */
		/* Process Background files */
		global.creating_zip_file_description = "Adding background files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Background */
		var upload_folder_name = "background";
		var file_type = "png";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Background END */

		/* Process Data INI files */
		global.creating_zip_file_description = "Adding Data INI files to ZIP";

		#region /* Data INI */
		upload_folder_name = "data";
		file_type = "ini";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Data INI END */

		/* Process Data TXT files */
		global.creating_zip_file_description = "Adding Data TXT files to ZIP";

		#region /* Data TXT */
		upload_folder_name = "data";
		file_type = "txt";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Data TXT END */

		/* Process Data JSON files */
		global.creating_zip_file_description = "Adding Data JSON files to ZIP";

		#region /* Data JSON */
		upload_folder_name = "data";
		file_type = "json";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Data JSON END */

		/* Process Sound files */
		global.creating_zip_file_description = "Adding Sound files to ZIP";

		#region /* Sound */
		upload_folder_name = "sound";
		file_type = "ogg";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Sound END */

		/* Process Tileset files */
		global.creating_zip_file_description = "Adding Tileset files to ZIP";

		#region /* Tilesets */
		upload_folder_name = "tilesets";
		file_type = "png";
		_add_all(zip_handle, base_level_path + upload_folder_name + "/*." + file_type,
			string(level_folder) + "/" + upload_folder_name + "/");
		#endregion /* Tilesets END */

		/* Process Other png files */
		global.creating_zip_file_description = "Adding other PNG files to ZIP";

		#region /* Other png files */
		file_type = "png";
		_add_all(zip_handle, base_level_path + "*." + file_type,
			string(level_folder) + "/");
		#endregion /* Other png END */

		#endregion /* Add all the level files to a new zip file END */

		#region /* Finally save the zip file */
		global.creating_zip_file_description = "Saving ZIP file";

		if (level_id != undefined) /* Don't save zip file if it's undefined */
		{
			file = string(level_id) + ".zip";
			var zip_path = zip_folder + file;
			zip_save(zip_handle, zip_path); /* Save it */
			global.last_zip_path_level = zip_path; /* track for menus */
		}

		return file;
		#endregion /* Finally save the zip file END */

	}
	#endregion /* Level END */

	else

	#region /* Character */
	if (what_kind_of_file == "character")
	{
		var z = zip_create();
		var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[0]));
		var zip_folder = game_save_id + "uploads/";
		show_debug_message("[scr_upload_zip_add_files] (character) game_save_id=" + string(game_save_id));
		show_debug_message("[scr_upload_zip_add_files] (character) zip_folder before create exists=" + string(directory_exists(zip_folder)));
		if (!directory_exists(zip_folder)) directory_create(zip_folder);
		show_debug_message("[scr_upload_zip_add_files] (character) zip_folder after create exists=" + string(directory_exists(zip_folder)));
		var test_path_char = zip_folder + "write_test_char.txt";
		var test_file_char = file_text_open_write(test_path_char);
		if (test_file_char >= 0)
		{
			file_text_write_string(test_file_char, "zip_test_char");
			file_text_close(test_file_char);
			show_debug_message("[scr_upload_zip_add_files] (character) write_test created: " + test_path_char + " exists=" + string(file_exists(test_path_char)));
		}
		else
		{
			show_debug_message("[scr_upload_zip_add_files] (character) write_test FAILED to open: " + test_path_char);
		}
		show_debug_message("[scr_upload_zip_add_files] Character name found: " + string(character_name));
		
		global.creating_zip_file_description = "Creating ZIP for character: " + string(character_name);

		var file_name = ""; /* In case there is no file found */

		#region /* Add all the character files to a new zip file */
		/* Process Data folder */
		global.creating_zip_file_description = "Adding character data files (INI) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Data */
		var files = [];
		var upload_folder_name = "data";
		var file_type = "ini";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Data] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Data] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Data END */

		/* Process Sound (Ogg) files */
		global.creating_zip_file_description = "Adding character sound files (OGG) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Ogg files in sound folder */
		files = [];
		upload_folder_name = "sound";
		file_type = "ogg";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Sound] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();

			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Sound] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Ogg files in sound folder END */

		/* Process Sprite (Png) files */
		global.creating_zip_file_description = "Adding character sprite files (PNG) to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Png files in sprites folder */
		files = [];
		upload_folder_name = "sprites";
		file_type = "png";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/*." + file_type, 0);

		if (file_name != "")
		{
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
				game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
			show_debug_message("[scr_upload_zip_add_files - Character Sprites] Added file: " + file_name);
		}

		while (file_name != "")
		{
			array_push(files, file_name);
			file_name = file_find_next();
			if (file_name != "")
			{
				zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/" + file_name,
					game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/" + file_name);
				show_debug_message("[scr_upload_zip_add_files - Character Sprites] Added file: " + file_name);
			}
		}
		file_find_close();
		#endregion /* Png files in sprites folder END */

		/* Process Voicepack folders */
		global.creating_zip_file_description = "Adding character voicepack files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Voicepack folders in sound folder */
		files = [];
		upload_folder_name = "sound";
		var voicepack_folder_number = 0;
		var voicepack_folder_path = "";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/*", 0);

		while (file_name != "")
		{
			voicepack_folder_path = game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/";
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/" + file_name, voicepack_folder_path + file_name);
			array_push(files, file_name);
			show_debug_message("[scr_upload_zip_add_files - Voicepack] Added file: " + file_name + " from voicepack" + string(voicepack_folder_number));

			file_name = file_find_next();

			if (file_name == "")
			{
				voicepack_folder_number++;
				file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/voicepack" + string(voicepack_folder_number) + "/*", 0);
			}
		}
		file_find_close();
		#endregion /* Voicepack folders in sound folder END */

		/* Process Skin folders */
		global.creating_zip_file_description = "Adding character skin files to ZIP";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		#region /* Skin folders in sprites folder */
		files = [];
		upload_folder_name = "sprites";
		var skin_folder_number = 0;
		var skin_folder_path = "";
		file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/*", 0);

		while (file_name != "")
		{
			skin_folder_path = game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/";
			zip_add_file(z, string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/" + file_name, skin_folder_path + file_name);
			array_push(files, file_name);
			show_debug_message("[scr_upload_zip_add_files - Skin] Added file: " + file_name + " from skin" + string(skin_folder_number));

			file_name = file_find_next();

			if (file_name == "")
			{
				skin_folder_number++;
				file_name = file_find_first(game_save_id + "custom_characters/" + string(character_name) + "/" + string(upload_folder_name) + "/skin" + string(skin_folder_number) + "/*", 0);
			}
		}
		file_find_close();
		#endregion /* Skin folders in sprites folder END */

		#endregion /* Add all the character files to a new zip file END */

		#region /* Finally save the zip file */
		global.creating_zip_file_description = "Saving ZIP file for character";
		show_debug_message("[scr_upload_zip_add_files] " + global.creating_zip_file_description);

		if (character_id != undefined)
		{
			file = string(character_id) + ".zip";
			var zip_path = zip_folder + file;
			show_debug_message("[scr_upload_zip_add_files] ZIP file name set to: " + file);
			var save_ok = zip_save(z, zip_path);
			show_debug_message("[scr_upload_zip_add_files] ZIP file saved to: " + zip_path + " (ok=" + string(save_ok) + ")");
			show_debug_message("[scr_upload_zip_add_files] file_exists after save (character): " + string(file_exists(zip_path)));
			show_debug_message("[scr_upload_zip_add_files] file_exists fallback (character, root): " + string(file_exists(game_save_id + file)));
			var dbg_name_char = file_find_first(zip_folder + "*", 0);
			if (dbg_name_char != "") show_debug_message("[scr_upload_zip_add_files] first file in uploads: " + dbg_name_char);
			file_find_close();
			global.last_zip_path_character = zip_path;
		}

		return file;
		#endregion /* Finally save the zip file END */

	}
	#endregion /* Character END */

}
