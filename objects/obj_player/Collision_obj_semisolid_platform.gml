/*Collision Event with a solid object*/

if (position_meeting(x, bbox_bottom + 1, other))
or(position_meeting(x, bbox_bottom + 2, other))
or(position_meeting(x, bbox_bottom + 3, other))
or(position_meeting(x, bbox_bottom + 4, other))
or(position_meeting(bbox_left, bbox_bottom + 1, other))
or(position_meeting(bbox_left, bbox_bottom + 2, other))
or(position_meeting(bbox_left, bbox_bottom + 3, other))
or(position_meeting(bbox_left, bbox_bottom + 4, other))
or(position_meeting(bbox_right, bbox_bottom + 1, other))
or(position_meeting(bbox_right, bbox_bottom + 2, other))
or(position_meeting(bbox_right, bbox_bottom + 3, other))
or(position_meeting(bbox_right, bbox_bottom + 4, other))
{
	if (vspeed >= 0)
	{
		y -= 1;
	}
}

#region /*Landing on solid object*/
if (position_meeting(x, bbox_bottom + 1, other))
and (stick_to_wall = false)
or(position_meeting(bbox_left, bbox_bottom + 1, other))
and (stick_to_wall = false)
or(position_meeting(bbox_right, bbox_bottom + 1, other))
and (stick_to_wall = false)
{
	
	#region /*Smoke Landing Effect*/
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	and (obj_camera.iris_xscale > 1)
	{
		if (instance_exists(obj_foreground_secret))
		and (place_meeting(x, y, obj_foreground_secret))
		and (obj_foreground_secret.image_alpha < 0.5)
		or (instance_exists(obj_foreground_secret))
		and (!place_meeting(x, y, obj_foreground_secret))
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
	#endregion /*Smoke Landing Effect END*/
	
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
		last_standing_y = y + sprite_height / 2;
		can_ground_pound = true;
		can_dive = true;
		spring = false;
		ledge_grab_jump = false;
		wall_jump = 0;
	}
}
#endregion /*Landing on solid object END*/

#region /*Sound Effect Handeling*/

#region /*Landing on different surfaces sound effects*/
if (position_meeting(x, bbox_bottom + 1, other))
and (vspeed >= 0)
{
	if (asset_get_type("obj_ground") == asset_object)
	and (place_meeting(x, y + 1, obj_ground))
	and (asset_get_type("snd_land_dirt") == asset_sound)
	{
		audio_play_sound(snd_land_dirt, 0, 0);
		audio_sound_gain(snd_land_dirt, global.sound_volume * global.main_volume, 0);
	}
	else
	if (asset_get_type("snd_land_rock") == asset_sound)
	{
		audio_play_sound(snd_land_rock, 0, 0);
		audio_sound_gain(snd_land_rock, global.sound_volume * global.main_volume, 0);
	}
}
#endregion /*Landing on different surfaces sound effects END*/

#region /*Footstep Land sounds*/

#region /*Dirt Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_dirt_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_dirt_right))
	{
		audio_play_sound(snd_footstep_dirt_right, 0, 0);
		audio_sound_gain(snd_footstep_dirt_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Dirt Footstep Right END*/

else

#region /*Glass Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_glass_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_glass_right))
	{
		audio_play_sound(snd_footstep_glass_right, 0, 0);
		audio_sound_gain(snd_footstep_glass_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Glass Footstep Right END*/

else

#region /*Grass Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_grass_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_grass_right))
	{
		audio_play_sound(snd_footstep_grass_right, 0, 0);
		audio_sound_gain(snd_footstep_grass_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Grass Footstep Right END*/

else

#region /*Gravel Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_gravel_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_gravel_right))
	{
		audio_play_sound(snd_footstep_gravel_right, 0, 0);
		audio_sound_gain(snd_footstep_gravel_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Gravel Footstep Right END*/

else

#region /*Metal Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_metal_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_metal_right))
	{
		audio_play_sound(snd_footstep_metal_right, 0, 0);
		audio_sound_gain(snd_footstep_metal_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Metal Footstep Right END*/

else

#region /*Stone Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_stone_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_stone_right))
	{
		audio_play_sound(snd_footstep_stone_right, 0, 0);
		audio_sound_gain(snd_footstep_stone_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Stone Footstep Right END*/

else

#region /*Wood Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
and (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_wood_right") == asset_sound)
	and (!audio_is_playing(snd_footstep_wood_right))
	{
		audio_play_sound(snd_footstep_wood_right, 0, 0);
		audio_sound_gain(snd_footstep_wood_right, global.footstep_volume * global.main_volume, 0);
	}
}
#endregion /*Wood Footstep Right END*/

else

#region /*Default Footstep Right*/
if (music_fade_in > 0.3)
{
	if (asset_get_type("snd_footstep_default_right") == asset_sound)
	{
		if (!audio_is_playing(snd_footstep_default_right))
		{
			audio_play_sound(snd_footstep_default_right, 0, 0);
			audio_sound_gain(snd_footstep_default_right, global.footstep_volume * global.main_volume, 0);
		}
	}
}
#endregion /*Default Footstep Right END*/

#endregion /*Footstep Land sounds END*/

#endregion /*Sound Effect Handeling END*/