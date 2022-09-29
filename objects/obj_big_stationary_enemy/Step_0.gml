depth = +9;

if (stomped_delay > 0)
{
	stomped_delay -= 1;
}

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable == true)
and (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

if (die_volting = -1)
or(die_volting = +1)
{
	depth = -900;
	if (die_volting = -1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	
	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	gravity = 0.5; /* The gravity */
	#endregion /* Set the gravity END */
	
	sprite_used = "stand";
	sprite_index = global.resource_pack_sprite_big_stationary_enemy;
}
else
{

	#region /* Set the gravity */
	gravity_direction = 270; /* Direction of the gravity */
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		and (x > camera_get_view_x(view_camera[view_current]))
		and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		and (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /* The gravity */
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /* Set the gravity END */
	
	if (flat = true)
	{
		speed = 0;
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
		sprite_used = "flattened";
		sprite_index = global.resource_pack_sprite_big_stationary_enemy_flattened;
		if (image_index > image_number - 1)
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
	else
	{
		sprite_used = "stand";
		sprite_index = global.resource_pack_sprite_big_stationary_enemy;
	}
}
mask_index = mask;

#region /* Coil spring bouncing code */
if (coil_spring = true)
and (die = false)
and (place_meeting(x, y + 1, obj_wall))
or (coil_spring = true)
and (die = false)
and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (instance_exists(obj_foreground_secret))
	and (place_meeting(x, y, obj_foreground_secret))
	and (obj_foreground_secret.image_alpha < 0.5)
	or (instance_exists(obj_foreground_secret))
	and (!place_meeting(x, y, obj_foreground_secret))
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		and (obj_camera.iris_xscale > 1)
		{
			effect_create_above(ef_smoke, x - 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16,bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x - 16 - 8,bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x + 16 +8,bbox_bottom- 8, 0, c_white);
		}
		scr_audio_play(snd_spring, volume_source.sound);
	}
	vspeed = -15;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}
#endregion /* Coil spring bouncing code END */

if (asset_get_type("obj_player") == asset_object)
{
	if (instance_number(obj_player) > 0)
	{
		if (die = false)
		{
			if (instance_nearest(x, y, obj_player).x < x)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = +1;
			}
		}
	}
}

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /* Kill enemy if it's inside the wall END */