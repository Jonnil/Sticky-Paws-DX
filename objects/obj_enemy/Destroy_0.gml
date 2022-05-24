if (instance_exists(obj_foreground_secret))
and (position_meeting(x, y, obj_foreground_secret))
and (obj_foreground_secret.image_alpha < 0.5)
or (instance_exists(obj_foreground_secret))
and (!position_meeting(x, y, obj_foreground_secret))
{
	effect_create_above(ef_smoke, x, y, 2, c_white);
}
