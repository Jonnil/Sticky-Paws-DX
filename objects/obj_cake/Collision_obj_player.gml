if (visible)
and (other.intro_animation = "")
and (instance_exists(obj_cake_stealing_enemy))
and (instance_nearest(x, y, obj_cake_stealing_enemy).cutscene != 1)
and (instance_exists(obj_player))
and (obj_player.intro_animation != "ending_chair")
{
	attach_player = true;
	global.win = true;
}