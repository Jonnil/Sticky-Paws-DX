if (stomped_delay > 0)
{
    stomped_delay--;
}

var wall_below = place_meeting(x, y + 1, obj_wall);
var semisolid_platform_below = position_meeting(x, bbox_bottom + 1, obj_semisolid_platform)
    || position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform)
    || position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform);

on_ground = wall_below || semisolid_platform_below;

if (global.assist_enable && !global.assist_enable_enemies)
{
    instance_destroy();
}

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

if (!blind && !coil_spring && on_ground)
{
    var wall_right = !place_meeting(x + 5, y + 1, obj_wall) && !position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform);
    var wall_left = !place_meeting(x - 5, y + 1, obj_wall) && !position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform);
    if (wall_right)
    {
        image_xscale = -1;
    }
    else if (wall_left)
    {
        image_xscale = 1;
    }
}

if (coil_spring && !die && on_ground)
{
    if (instance_exists(obj_camera) && obj_camera.iris_xscale > 1)
    {
        for (var i = 0; i < 3; i++)
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

//if (stomped_delay > 0)
//{
//	stomped_delay --;
//}

//if (place_meeting(x, y + 1, obj_wall))
//|| (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
//|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
//|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
//{
//	on_ground = true;
//}
//else
//{
//	on_ground = false;
//}

//#region /* If enemies are disabled, destroy this object */
//if (global.assist_enable)
//&& (global.assist_enable_enemies == false)
//{
//	instance_destroy();
//}
//#endregion /* If enemies are disabled, destroy this object END */

//if (die_volting = -1)
//|| (die_volting = +1)
//{
//	depth = -900;
//	if (die_volting = -1)
//	{
//		image_angle -= 20;
//		hspeed = +4;
//	}
//	else
//	{
//		image_angle += 20;
//		hspeed = -4;
//	}
	
//	gravity_direction = 270; /* Direction of the gravity */
//	gravity = 0.5; /* The gravity */
	
//}
//else
//{
	
//	#region /* Set the gravity */
//	gravity_direction = 270; /* Direction of the gravity */
//	if (!on_ground)
//	&& (x - 32 < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
//	&& (x + 32 > camera_get_view_x(view_camera[view_current]))
//	{
//		gravity = 0.5; /* The gravity */
//	}
//	else
//	{
//		gravity = 0;
//	}
//	#endregion /* Set the gravity END */
	
//	if (image_xscale < 0)
//	{
//		hspeed = - 1;
//	}
//	else
//	{
//		hspeed = +1;
//	}
//	if (flat)
//	{
//		speed = 0;
//		image_speed = 0.5;
//		sprite_used = "flattened";
//		if (global.resource_pack_sprite_basic_enemy_flattened > noone){sprite_index = global.resource_pack_sprite_basic_enemy_flattened;}
//		if (image_index > image_number - 1)
//		{
//		effect_create_above(ef_smoke, x, y, 2, c_white);
//		instance_destroy();
//		}
//	}
//}
//if (flat == false)
//{
//	if (distance_to_object(obj_player) < 256)
//	{
//		sprite_used = "angry";
//		sprite_index = global.resource_pack_sprite_basic_enemy_angry;
//		if (blind)
//		{
//			if (global.resource_pack_sprite_basic_enemy_blind > noone){sprite_index = global.resource_pack_sprite_basic_enemy_blind;}else
//			if (global.resource_pack_sprite_basic_enemy_angry > noone){sprite_index = global.resource_pack_sprite_basic_enemy_angry;}
//		}
//		else
//		{
//			if (global.resource_pack_sprite_basic_enemy_angry > noone){sprite_index = global.resource_pack_sprite_basic_enemy_angry;}else
//			if (global.resource_pack_sprite_basic_enemy_blind > noone){sprite_index = global.resource_pack_sprite_basic_enemy_blind;}
//		}
//	}
//	else
//	{
//		sprite_used = "stand";
//		if (blind)
//		{
//			if (global.resource_pack_sprite_basic_enemy_blind > noone){sprite_index = global.resource_pack_sprite_basic_enemy_blind;}else
//			if (global.resource_pack_sprite_basic_enemy > noone){sprite_index = global.resource_pack_sprite_basic_enemy;}
//		}
//		else
//		{
//			if (global.resource_pack_sprite_basic_enemy > noone){sprite_index = global.resource_pack_sprite_basic_enemy;}else
//			if (global.resource_pack_sprite_basic_enemy_blind > noone){sprite_index = global.resource_pack_sprite_basic_enemy_blind;}
//		}
//	}
//}

//#region /* Turn around at pit */
//if (blind == false)
//&& (coil_spring == false)
//&& (on_ground)
//{
//	if (!place_meeting(x + 5, y + 1, obj_wall))
//	&& (!position_meeting(x + 5, bbox_bottom + 1, obj_semisolid_platform))
//	{
//		image_xscale = -1;
//	}
//	else
//	if (!place_meeting(x - 5, y + 1, obj_wall))
//	&& (!position_meeting(x - 5, bbox_bottom + 1, obj_semisolid_platform))
//	{
//		image_xscale = +1;
//	}
//}
//#endregion /* Turn around at pit END */

//#region /* Coil spring bouncing code */
//if (coil_spring)
//&& (die == false)
//&& (on_ground)
//{
//	if (instance_exists(obj_camera))
//	&& (obj_camera.iris_xscale > 1)
//	{
//		effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
//		effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
//		effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
//		effect_create_above(ef_smoke, x - 16 - 8, bbox_bottom- 8, 0, c_white);
//		effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
//		effect_create_above(ef_smoke, x + 16 + 8, bbox_bottom- 8, 0, c_white);
//	}
//	scr_audio_play(snd_spring, volume_source.sound, 0.1);
//	vspeed = -15;
//	gravity = 0;
//	draw_xscale = 1.25;
//	draw_yscale = 0.75;
//}
//#endregion /* Coil spring bouncing code END */