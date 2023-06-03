function scr_copy_move_files(source, target, delete_original_folder = false)
{
	/* Copies and moves all files and folders, which means copy files and folders, paste files and folders into new path, then delete original files and folders */
	
	scr_file_copy_dir(source, target, fa_directory); /* Have to copy all directories first */
	scr_file_copy_dir(source, target, fa_readonly); /* Then copy all files */
	scr_file_copy_dir(source, target, fa_hidden); /* And finally copy all hidden files, if there are any */
	
	if (delete_original_folder) /* If this is set to true, then also delete the original folder */
	&& (directory_exists(source)) /* Only delete folder if it exists */
	{
		directory_destroy(source);
	}
}