depth = +9;

if (stomped_delay > 0)
{
	stomped_delay --;
}

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable)
&& (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

if (die_volting = -1)
|| (die_volting = +1)
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
	if (!place_meeting(x, y + 1, obj_wall))
	&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	&& (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		&& (x > camera_get_view_x(view_camera[view_current]))
		&& (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		&& (y > camera_get_view_y(view_camera[view_current]))
		{
			gravity = 0.5; /* The gravity */
		}
	}
	else
	{
		gravity = 0;
	}
	#endregion /* Set the gravity END */
	
	if (flat)
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
if (coil_spring)
&& (die == false)
&& (place_meeting(x, y + 1, obj_wall))
|| (coil_spring)
&& (die == false)
&& (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	if (instance_exists(obj_foreground_secret))
	&& (place_meeting(x, y, obj_foreground_secret))
	&& (obj_foreground_secret.image_alpha < 0.5)
	|| (instance_exists(obj_foreground_secret))
	&& (!place_meeting(x, y, obj_foreground_secret))
	{
		if (instance_exists(obj_camera))
		&& (obj_camera.iris_xscale > 1)
		{
			effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x - 16 - 8, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
			effect_create_above(ef_smoke, x + 16 + 8, bbox_bottom- 8, 0, c_white);
		}
		scr_audio_play(snd_spring, volume_source.sound, 0.1);
	}
	vspeed = -15;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}
#endregion /* Coil spring bouncing code END */

if (instance_number(obj_player) > 0)
{
	if (die == false)
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

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
&& (die == false)
&& (draw_xscale >= 0.8)
{
	stuck_in_wall_counter ++;
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
		stuck_in_wall_counter --;
	}
}
#endregion /* Kill enemy if it's inside the wall END */