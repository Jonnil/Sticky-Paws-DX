function scr_set_character_folder(what_player = player, what_selected_skin = selected_skin, what_character_name = ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]), allow_save_to_character_config = true)
{
	/* Initialize default values for character, skin, and sound folders */
	/* These variables will hold the paths to the character's assets and are used to determine what data to load */
	var base_character_path = "characters\\" + string(what_character_name); /* Path for built-in characters */
	var custom_character_path = game_save_id + "custom_characters\\" + string(what_character_name); /* Path for custom characters */
	character_folder = ""; /* Final path for the character folder */
	skin_folder = "\\"; /* Default skin folder path */
	voicepack_folder = "\\"; /* Default voicepack folder path */

	/* Determine Character Folder: */
	/* Check if the character is an included (built-in) character or a custom character */
	/* Set the "can_save_to_character_config" variable based on whether the file is writable */
	if (file_exists(base_character_path + "\\data\\character_config.ini"))
	{
		/* If the character is built-in (included with the game files), use the base path */
		character_folder = base_character_path;
		can_save_to_character_config = false; /* Built-in files cannot be modified or saved */
	}
	else
	{
		/* If the character is custom, use the custom character path */
		character_folder = custom_character_path;
		can_save_to_character_config = allow_save_to_character_config; /* Custom characters can be modified if allowed */
	}

	/* Determine Skin Folder: */
	/* Check if the selected skin exists by verifying the presence of its mask.png file */
	/* If the skin is valid, set the "skin_folder" path accordingly */
	var skin_path = character_folder + "\\sprites\\skin" + string(what_selected_skin) + "\\mask.png";
	if (file_exists(skin_path))
	{
		skin_folder = "\\skin" + string(what_selected_skin) + "\\"; /* Use the specific skin folder */
	}

	/* Determine Sound Folder: */
	/* Identify which folder contains the sound files for the character */
	/* Allows flexibility for variations in directory naming conventions (e.g., "sound" vs. "sounds") */
	if (!variable_instance_exists(self, "selected_voicepack"))
	{
		/* Assign the selected voicepack for the player if it hasn't been initialized */
		selected_voicepack = global.voicepack_for_player[what_player];
	}

	/* Array of possible sound folder paths, prioritized from specific voicepacks to generic sound folders */
	/* The order of the array ensures that the most specific folder is checked first */
	var sound_folders = [
		"\\sound\\voicepack" + string(selected_voicepack) + "\\", // Specific voicepack folder (singular "sound") */
		"\\sounds\\voicepack" + string(selected_voicepack) + "\\", // Specific voicepack folder (plural "sounds") */
		"\\sound\\", /* Generic sound folder (singular "sound") */
		"\\sounds\\" /* Generic sound folder (plural "sounds") */
	];

	/* Iterate through the "sound_folders" array to find the first valid folder that exists */
	/* Once found, set "voicepack_folder" to the matching path and exit the loop */
	for (var i = 0; i < array_length(sound_folders); i++)
	{
		var folder = sound_folders[i];
		if (directory_exists(character_folder + folder))
		{
			voicepack_folder = folder; /* Assign the valid folder path */
			break; /* Exit the loop once a valid folder is found */
		}
	}

	/* Note: */
	/* - This function is modular and accommodates both built-in and custom characters */
	/* - It ensures compatibility with variations in folder structures, making it robust for different use cases */
	/* - If no valid sound folder is found, "voicepack_folder" defaults to "\\" */
}
