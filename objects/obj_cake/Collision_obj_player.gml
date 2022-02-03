if (visible = true)
and (other.intro_animation = "")
and (instance_nearest(x, y, obj_cake_stealing_enemy).cutscene != 1)
{
	x = other.x;
	y = other.bbox_top - 32;
	attatch_player = true;
	global.win = true;
}