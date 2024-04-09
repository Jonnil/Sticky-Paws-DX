function scr_copy_move_files(source, target, delete_original_folder = false)
{
	/* Copies and moves all files and folders, which means copy files and folders, paste files and folders into new path, then delete original files and folders */
	
	if (directory_exists(source)) /* Only perform operations if source directory exists */
	{
		show_debug_message("scr_copy_move_files directory_exists(" + string(source) + ") OK");
		
		/* Manually specify directories and copy files */
		if (content_type == "level")
		{
			scr_file_copy_dir(source, target);
			scr_file_copy_dir(source + "/background", target + "/background");
			scr_file_copy_dir(source + "/data", target + "/data");
			scr_file_copy_dir(source + "/sound", target + "/sound");
		}
		else
		if (content_type == "character")
		{
			scr_file_copy_dir(source, target);
			scr_file_copy_dir(source + "/data", target + "/data");
			scr_file_copy_dir(source + "/sound", target + "/sound");
			scr_file_copy_dir(source + "/sprites", target + "/sprites");
		}
		/* Add more directories as needed... */
		
		if (delete_original_folder) /* If this is set to true, then also delete the original folder */
		{
			directory_destroy(source);
		}
	}
	else
	{
		show_debug_message("scr_copy_move_files directory_exists(" + string(source) + ") FAILED");
	}
}