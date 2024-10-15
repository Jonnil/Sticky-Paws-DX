if (room == rm_leveleditor)
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	ini_write_real("Player", "beat_last_level", true);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}