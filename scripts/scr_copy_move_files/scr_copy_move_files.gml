function scr_copy_move_files(source, target, delete_original_folder = false)
{
	/* Copies and moves all files and folders, which means copy files and folders, paste files and folders into new path, then delete original files and folders */

	show_debug_message("[scr_copy_move_files] Called with source: " + string(source) + ", target: " + string(target) + ", delete_original_folder: " + string(delete_original_folder));

	if (directory_exists(source)) /* Only perform operations if source directory exists */
	{
		show_debug_message("[scr_copy_move_files] directory_exists(" + string(source) + ") OK");

		/* Make sure the target folder exists or create it */
		if (!directory_exists(target))
		{
			show_debug_message("[scr_copy_move_files] Target directory does not exist. Creating: " + string(target));
			directory_create(target);
		}
		else
		{
			show_debug_message("[scr_copy_move_files] Target directory already exists: " + string(target));
		}

		/* Manually specify directories and copy files */
		if (content_type == "level")
		{
			show_debug_message("[scr_copy_move_files] Content type is 'level'\n");

			scr_file_copy_dir(source, target);
			show_debug_message("[scr_copy_move_files] Copied base folder\n");

			scr_file_copy_dir(source + "/background", target + "/background");
			show_debug_message("[scr_copy_move_files] Copied 'background' folder\n");

			scr_file_copy_dir(source + "/data", target + "/data");
			show_debug_message("[scr_copy_move_files] Copied 'data' folder\n");

			scr_file_copy_dir(source + "/sound", target + "/sound");
			show_debug_message("[scr_copy_move_files] Copied 'sound' folder\n");
		}
		else
		if (content_type == "character")
		{
			show_debug_message("[scr_copy_move_files] Content type is 'character'\n");

			scr_file_copy_dir(source, target);
			show_debug_message("[scr_copy_move_files] Copied base folder\n");

			scr_file_copy_dir(source + "/data", target + "/data");
			show_debug_message("[scr_copy_move_files] Copied 'data' folder\n");

			scr_file_copy_dir(source + "/sound", target + "/sound");
			show_debug_message("[scr_copy_move_files] Copied 'sound' folder\n");

			scr_file_copy_dir(source + "/sprites", target + "/sprites");
			show_debug_message("[scr_copy_move_files] Copied 'sprites' folder\n");
		}
		else
		{
			show_debug_message("[scr_copy_move_files] Unknown content_type: " + string(content_type));
		}

		if (delete_original_folder)
		{
			show_debug_message("[scr_copy_move_files] Deleting original source folder: " + string(source));
			directory_destroy(source);
		}
		else
		{
			show_debug_message("[scr_copy_move_files] Keeping original source folder: " + string(source));
		}
	}
	else
	{
		show_debug_message("[scr_copy_move_files] directory_exists(" + string(source) + ") FAILED");
	}
}
