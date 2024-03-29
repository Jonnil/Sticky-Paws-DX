function scr_sync_saving_create()
{
	if (os_type == os_switch)
	{
		switch_save_data_unmount();
		switch_save_data_mount(0); /* Don't forget to set accountId when using "switch save data mount" */
		
		show_debug_message("Creating second Id's save file");
		var file = file_text_open_write("test");show_debug_message("1 BRUH: var file = file_text_open_write(test);");
		file_text_write_string(file, "bob");show_debug_message("2 BRUH: file_text_write_string(file, bob);");
		file_text_close(file); switch_save_data_commit(); show_debug_message("3 BRUH: file_text_close(file); switch_save_data_commit();");/* Remember to commit the save data! */
		
		/* We don't necessarily need to commit and unmount in two steps, as unmount will commit anyway, */
		/* but if you want to keep the save data mounted for a while - as you should - you should commit after each save. */
		switch_save_data_commit(); show_debug_message("4 BRUH: switch_save_data_commit();");
		switch_save_data_unmount(); show_debug_message("5 BRUH: switch_save_data_unmount();");
		
		if (!file_exists("test")) /* The file does not exist at this point, so this block will be entered */
		{
			show_debug_message("Creating main Id's save file");
			file = file_text_open_write("test");show_debug_message("6 BRUH: file = file_text_open_write(test);");
			file_text_write_string(file, "bob");show_debug_message("7 BRUH: file_text_write_string(file, bob);");
			file_text_close(file); switch_save_data_commit(); show_debug_message("8 BRUH: file_text_close(file); switch_save_data_commit();");/* Remember to commit the save data! */
		}
		
		file = file_text_open_read("test");show_debug_message("10 BRUH: file = file_text_open_read(test);");
		show_debug_message(file_text_read_string(file)); show_debug_message("11 BRUH: show_debug_message(file_text_read_string(file));");/* You should now see that "bob" is showing in your compiler log just after "Run_Start" */
		file_text_close(file); switch_save_data_commit(); show_debug_message("12 BRUH: file_text_close(file); switch_save_data_commit();");/* Remember to commit the save data! */
		
		switch_save_data_mount(0); /* Don't forget to set accountId when using "switch save data mount" */
	}
}