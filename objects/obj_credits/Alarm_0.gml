if (room == rm_leveleditor)
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_real("Player", "beat_last_level", true);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}