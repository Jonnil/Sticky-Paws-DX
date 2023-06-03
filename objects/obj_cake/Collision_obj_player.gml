if (visible)
&& (other.intro_animation = "")
&& (instance_exists(obj_cake_stealing_enemy))
&& (instance_nearest(x, y, obj_cake_stealing_enemy).cutscene != 1)
&& (instance_exists(obj_player))
&& (obj_player.intro_animation != "ending_chair")
{
	attach_player = true;
	global.win = true;
}