if (instance_exists(obj_player) && distance_to_object(instance_nearest(x, y, obj_player)) < 32 && sprite_index == global.resource_pack_sprite_eye_block)
|| (instance_exists(obj_enemy) && distance_to_object(instance_nearest(x, y, obj_enemy)) < 32 && sprite_index == global.resource_pack_sprite_eye_block_enemy)
|| (instance_exists(obj_player) && distance_to_object(instance_nearest(x, y, obj_player)) < 32 && sprite_index == global.resource_pack_sprite_eye_block_enemy_player)
|| (instance_exists(obj_enemy) && distance_to_object(instance_nearest(x, y, obj_enemy)) < 32 && sprite_index == global.resource_pack_sprite_eye_block_enemy_player)
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