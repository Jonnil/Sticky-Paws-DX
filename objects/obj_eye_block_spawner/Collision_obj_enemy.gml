if (!other.die)
{
	if (!position_meeting(x, y, obj_eye_block))
	&& (sprite_index == global.resource_pack_sprite_eye_block_enemy)
	|| (!position_meeting(x, y, obj_eye_block))
	&& (sprite_index == global.resource_pack_sprite_eye_block_enemy_player)
	{
		var obj = instance_create_depth(x, y, 0, obj_eye_block);
		obj.sprite_index = sprite_index;
	}
}