if (instance_exists(obj_foreground_secret))
&& (position_meeting(x, y, obj_foreground_secret))
&& (obj_foreground_secret.image_alpha < 0.5)
|| (instance_exists(obj_foreground_secret))
&& (!position_meeting(x, y, obj_foreground_secret))
{
	effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
}
