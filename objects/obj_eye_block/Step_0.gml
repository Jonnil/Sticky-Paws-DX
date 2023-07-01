if (instance_exists(obj_player))
&& (distance_to_object(instance_nearest(x, y, obj_player)) < 32)
{
	image_alpha_lerp = 1;
}
else
{
	image_alpha_lerp = 0;
}

image_alpha = lerp(image_alpha, image_alpha_lerp, 0.3);

if (image_alpha <= 0)
{
	instance_destroy();
}