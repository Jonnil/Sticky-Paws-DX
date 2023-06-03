function scr_buffer_async_load(save_folder_name = "save_folder_name", save_file_name = "my_save_file.ini")
{
	global.loadbuff = buffer_create(1, buffer_grow, 1);
	buffer_async_group_begin(save_folder_name); /* save folder */
	buffer_async_group_option("savepadindex", 0);
	buffer_async_group_option("showdialog", 0);
	buffer_async_group_option("slottitle", "SaveForMyGame"); /* don't show any dialogues, load from slot 0 */
	buffer_load_async(global.loadbuff, save_file_name, 0, -1); /* Say what we want to load and into which buffer */
	global.loadid = buffer_async_group_end(); /* Actually start loading now please */
}