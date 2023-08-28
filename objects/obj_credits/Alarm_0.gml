if (room == rm_leveleditor)
{
	ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
	ini_write_real("Player", "beat_last_level", true);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}