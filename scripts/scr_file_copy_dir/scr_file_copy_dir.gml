function scr_file_copy_dir(source, target)
{
	show_debug_message("[scr_file_copy_dir] Called with source: " + string(source) + ", target: " + string(target));
	
	/* Create target directory if it doesn't exist */
	if (!directory_exists(target))
	{
		directory_create(target);
		show_debug_message("[scr_file_copy_dir] Target directory did not exist. Created: " + string(target));
	}
	else
	{
		show_debug_message("[scr_file_copy_dir] Target directory already exists: " + string(target));
	}
	
	var file_count = 0;
	show_debug_message("[scr_file_copy_dir] Beginning file iteration in source directory: " + source + "/*.*");
	
	/* Begin file iteration */
	var fname = file_find_first(source + "/*.*", 0);
	
	if (fname == "")
	{
		show_debug_message("[scr_file_copy_dir] No files found in source directory: " + string(source));
	}
	
	for (; fname != ""; fname = file_find_next())
	{
		show_debug_message("[scr_file_copy_dir] Found file entry: " + string(fname));
		
		/* Skip the current and parent directory symbols */
		if (fname == "."
		|| fname == "..")
		{
			show_debug_message("[scr_file_copy_dir] Skipping special directory entry: " + string(fname));
			continue;
		}
		
		var from = source + "/" + fname;
		var to = target + "/" + fname;
		
		show_debug_message("[scr_file_copy_dir] Attempting to copy file from: " + string(from) + " to: " + string(to));
		
		/* Check if the source file exists before attempting to copy */
		if (!file_exists(from))
		{
			show_debug_message("[scr_file_copy_dir] ERROR: Source file does not exist: " + string(from));
			continue; /* Skip this file if it doesn't exist */
		}
		else
		{
			show_debug_message("[scr_file_copy_dir] Source file exists: " + string(from));
		}
		
		/* Copy the file */
		file_copy(from, to);
		
		/* Verify that the file was copied successfully */
		if (file_exists(to))
		{
			show_debug_message("[scr_file_copy_dir] Successfully copied file to: " + string(to));
			file_count++;
		}
		else
		{
			show_debug_message("[scr_file_copy_dir] ERROR: File copy failed for: " + string(from) + " -> " + string(to));
		}
	}
	
	show_debug_message("[scr_file_copy_dir] File iteration complete. Total files copied: " + string(file_count));
	
	file_find_close();
	show_debug_message("[scr_file_copy_dir] Closed file search handle.");
}