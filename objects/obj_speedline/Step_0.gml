///@description obj_speedline Step Event
/// In obj_player Step Event, have this code:
/// if (image_alpha > 0)
/// {
/// 	if (invincible_timer >= 2)
/// 	|| (vspeed < 0)
/// 	|| (vspeed > 0)
/// 	{
/// 		instance_create_depth(xx, yy, 0, obj_speedline);
/// 	}
/// }
image_alpha -= 0.02;

if (sprite_index == spr_speedline)
{
	image_xscale -= 0.02;
	image_yscale -= 0.02;
}

if (image_alpha < 0)
{
	instance_destroy();
}