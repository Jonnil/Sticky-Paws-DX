if (die_volting == -1 || die_volting == 1)
{
    depth = -900;
    if (die_volting == -1)
    {
        image_angle -= 20;
        hspeed = 4;
    }
    else
    {
        image_angle += 20;
        hspeed = -4;
    }

    gravity_direction = 270; /* Direction of the gravity */
    gravity = 0.5; /* The gravity */
}
else
{
    gravity_direction = 270; /* Direction of the gravity */
    if (!on_ground && x - 32 < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) && x + 32 > camera_get_view_x(view_camera[view_current]))
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
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
    }
    else
    {
        if (distance_to_object(obj_player) < 256)
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

if (coil_spring && !die && on_ground)
{
    if (instance_exists(obj_camera) && obj_camera.iris_xscale > 1)
    {
        for(var i = 0; i < 3; i++)
        {
            effect_create_above(ef_smoke, x + random_range(-16, 16), bbox_bottom + random_range(-8, 0), 0, c_white);
        }
    }

    scr_audio_play(snd_spring, volume_source.sound, 0.1);
    vspeed = -15;
    gravity = 0;
    draw_xscale = 1.25;
    draw_yscale = 0.75;
}