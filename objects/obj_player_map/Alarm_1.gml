/* Spawn cake stealing enemy in the world map if you haven't beat the game yet */
if (instance_nearest(x, y, obj_level).clear_rate == "clear")
{
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	if (!ini_read_real("Player", "beat_last_level", false))
	{
		instance_create_depth(x, y, 0, obj_map_cake_stealing_enemy);
	}
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}