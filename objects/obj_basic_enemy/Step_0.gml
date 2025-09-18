if (die_volting == 0)
{
	gravity_direction = 270; /* Direction of the gravity */
	if (!on_ground)
	{
		gravity = 0.5; /* The gravity */
	}
	else
	{
		gravity = 0;
	}

	if (image_xscale < 0)
	{
		hspeed = -1;
	}
	else
	{
		hspeed = 1;
	}

	if (flat)
	{
		speed = 0;
		image_speed = 0.5;
		sprite_used = "flattened";
		sprite_index = global.resource_pack_sprite_basic_enemy_flattened;
		if (image_index > image_number - 1)
		{
			effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
	else
	{
		if (instance_exists(obj_player) && distance_to_object(obj_player) < 256)
		{
			sprite_used = "angry";
			sprite_index = blind ? global.resource_pack_sprite_basic_enemy_blind : global.resource_pack_sprite_basic_enemy_angry;
		}
		else
		{
			sprite_used = "stand";
			sprite_index = blind ? global.resource_pack_sprite_basic_enemy_blind : global.resource_pack_sprite_basic_enemy;
		}
	}
}
