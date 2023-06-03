function scr_sync_saving_create()
{
	switch_save_data_unmount();
	
	show_debug_message("Creating secondId's save file");
	var file = file_text_open_write("test");
	file_text_write_string(file, "bob");
	file_text_close(file);
	
	/* We don't necessarily need to commit and unmount in two steps, as unmount will commit anyway, */
	/* but if you want to keep the save data mounted for a while - as you should - you should commit after each save. */
	switch_save_data_commit(); 
	switch_save_data_unmount();
	
	if (!file_exists("test")) /* The file does not exist at this point, so this block will be entered */
	{
		show_debug_message("Creating mainId's save file");
		file = file_text_open_write("test");
		file_text_write_string(file, "bob");
		file_text_close(file);
	}
	
	file = file_text_open_read("test");
	show_debug_message(file_text_read_string(file)); /* You should now see that "bob" is showing in your compiler log just after "Run_Start" */
	file_text_close(file);
	
}