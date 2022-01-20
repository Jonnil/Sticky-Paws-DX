image_alpha= 0.3;

if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).invincible >60)
and (instance_nearest(x, y, obj_player).assist_invincible = false)
{
	image_angle =instance_nearest(x, y, obj_player).angle;
	image_blend =instance_nearest(x, y, obj_player).image_blend;
	image_index = instance_nearest(x, y, obj_player).image_index;
	image_speed =instance_nearest(x, y, obj_player).image_speed;
	sprite_index = instance_nearest(x, y, obj_player).sprite_index;
	image_xscale =instance_nearest(x, y, obj_player).image_xscale;
}