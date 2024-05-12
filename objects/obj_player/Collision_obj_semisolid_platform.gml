/* Collision Event with a solid object */

if (collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 4, other, false, true))
{
	if (dive)
	&& (vspeed >= -5)
	{
		dive = false;
		dive_on_ground = 10;
		can_attack_after_dive_on_ground = can_attack_after_dive_on_ground_max_value;
		ground_pound = false;
		can_ground_pound = false;
	}
	if (vspeed >= 0)
	{
		y --;
	}
}

#region /* Landing on solid object */
if (collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, other, false, true))
&& (!stick_to_wall)
{
	
	#region /* Smoke Landing Effect */
	if (instance_exists(obj_camera))
	&& (obj_camera.iris_xscale > 1)
	{
		if (instance_exists(obj_foreground_secret))
		&& (place_meeting(x, y, obj_foreground_secret))
		&& (obj_foreground_secret.image_alpha < 0.5)
		|| (instance_exists(obj_foreground_secret))
		&& (!place_meeting(x, y, obj_foreground_secret))
		{
			if (vspeed > 2)
			{
				if (position_meeting(x - 24, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x - 24, bbox_bottom - 8, 0, c_white);
				}
				if (position_meeting(x - 16, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
				}
				if (position_meeting(x, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
					effect_create_above(ef_smoke, x, bbox_bottom - 8, 0, c_white);
				}
				if (position_meeting(x + 16, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
				}
				if (position_meeting(x + 24, bbox_bottom + 2, other))
				{
					effect_create_above(ef_smoke, x + 24, bbox_bottom - 8, 0, c_white);	
				}
			}
		}
	}
	#endregion /* Smoke Landing Effect END */
	
	if (vspeed > 2)
	{
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
	
	if (vspeed >= 0)
	{
		vspeed = 0;
		gravity = 0;
		last_standing_x = x;
		last_standing_y = y + sprite_height * 0.5;
		can_ground_pound = true;
		can_dive = true;
		spring = false;
		ledge_grab_jump = false;
		wall_jump = 0;
	}
}
#endregion /* Landing on solid object END */

#region /* Sound Effect Handeling */
if (speed != 0)
{
	
	#region /* Landing on different surfaces sound effects */
	if (position_meeting(x, bbox_bottom + 1, other))
	&& (vspeed >= 0)
	{
		if (place_meeting(x, y + 1, obj_ground))
		{
			scr_audio_play(snd_land_dirt, volume_source.footstep);
		}
		else
		{
			scr_audio_play(snd_land_rock, volume_source.footstep);
		}
	}
	#endregion /* Landing on different surfaces sound effects END */
	
	#region /* Footstep Land sounds */
	
	#region /* Dirt Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 1)
	{
		if (!audio_is_playing(snd_footstep_dirt_right))
		{
			scr_audio_play(snd_footstep_dirt_right, volume_source.footstep);
		}
	}
	#endregion /* Dirt Footstep Right END */
	
	else
	
	#region /* Glass Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 2)
	{
		if (!audio_is_playing(snd_footstep_glass_right))
		{
			scr_audio_play(snd_footstep_glass_right, volume_source.footstep);
		}
	}
	#endregion /* Glass Footstep Right END */
	
	else
	
	#region /* Grass Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 3)
	{
		if (!audio_is_playing(snd_footstep_grass_right))
		{
			scr_audio_play(snd_footstep_grass_right, volume_source.footstep);
		}
	}
	#endregion /* Grass Footstep Right END */
	
	else
	
	#region /* Gravel Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 4)
	{
		if (!audio_is_playing(snd_footstep_gravel_right))
		{
			scr_audio_play(snd_footstep_gravel_right, volume_source.footstep);
		}
	}
	#endregion /* Gravel Footstep Right END */
	
	else
	
	#region /* Metal Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 5)
	{
		if (!audio_is_playing(snd_footstep_metal_right))
		{
			scr_audio_play(snd_footstep_metal_right, volume_source.footstep);
		}
	}
	#endregion /* Metal Footstep Right END */
	
	else
	
	#region /* Stone Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 6)
	{
		if (!audio_is_playing(snd_footstep_stone_right))
		{
			scr_audio_play(snd_footstep_stone_right, volume_source.footstep);
		}
	}
	#endregion /* Stone Footstep Right END */
	
	else
	
	#region /* Wood Footstep Right */
	if (place_meeting(x, y + 1, obj_ground))
	&& (instance_nearest(x, bbox_bottom, obj_ground).ground_surface == 7)
	{
		if (!audio_is_playing(snd_footstep_wood_right))
		{
			scr_audio_play(snd_footstep_wood_right, volume_source.footstep);
		}
	}
	#endregion /* Wood Footstep Right END */
	
	else
	
	#region /* Default Footstep Right */
	if (!audio_is_playing(snd_footstep_default_right))
	{
		scr_audio_play(snd_footstep_default_right, volume_source.footstep);
	}
	#endregion /* Default Footstep Right END */
	
	#endregion /* Footstep Land sounds END */
	
}
#endregion /* Sound Effect Handeling END */