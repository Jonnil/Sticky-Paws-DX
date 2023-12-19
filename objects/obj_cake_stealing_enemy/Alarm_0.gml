if (instance_exists(obj_player))
{
	if (obj_player.intro_animation != "cake_stolen")
	{
		with(instance_create_depth(x, y, 0, obj_cake))
		{
			cutscene = instance_nearest(x, y, obj_cake_stealing_enemy).cutscene;
		}
	}
}