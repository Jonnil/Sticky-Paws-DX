if (instance_exists(obj_player)
&& obj_player.intro_animation != "cake_stolen")
{
	with(instance_create_depth(x, y, 0, obj_cake))
	{
		cutscene = instance_nearest(x, y, obj_cake_stealing_enemy).cutscene;
	}
}
if (cutscene == 1) /* When placed in level, use this cutscene value */
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		if (ini_read_real("Player", "beat_last_level", false))
		{
			if (instance_exists(obj_cake))
			{
				with(instance_nearest(x, y, obj_cake))
				{
					instance_destroy();
				}
			}
			instance_destroy();
		}
		ini_close();
	}
}