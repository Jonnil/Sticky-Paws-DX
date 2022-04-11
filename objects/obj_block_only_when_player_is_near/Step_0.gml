if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).mask_index >= 0)
and (distance_to_object(instance_nearest(x, y, obj_player)) < sprite_get_width(instance_nearest(x, y, obj_player).mask_index))
and (distance_to_object(instance_nearest(x, y, obj_player)) < sprite_get_height(instance_nearest(x, y, obj_player).mask_index))
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
