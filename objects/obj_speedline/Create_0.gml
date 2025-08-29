///@description obj_speedline Create Event
depth = +10;
image_alpha = 0.3;
image_speed = 0;

if (instance_exists(obj_player))
{
	var nearest_player = instance_nearest(x, y, obj_player);
	image_alpha = nearest_player.image_alpha * 0.3;

	if (nearest_player.invincible_timer >= 2)
	{
		image_angle = nearest_player.angle;
		image_blend = nearest_player.invincible_blend;
		image_index = nearest_player.image_index;
		sprite_index = nearest_player.sprite_index;
		image_xscale = nearest_player.image_xscale * nearest_player.default_xscale;
		image_yscale = nearest_player.image_yscale * nearest_player.default_yscale;
	}
}
