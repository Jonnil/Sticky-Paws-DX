if (visible)
&& (other.intro_animation == "")
&& (other.intro_animation != "ending_chair")
{
	if (instance_exists(obj_cake_stealing_enemy))
	&& (instance_nearest(x, y, obj_cake_stealing_enemy).cutscene != 1)
	|| (!instance_exists(obj_cake_stealing_enemy))
	{
		attach_player = true;
		global.win = true;
	}
}