/*Collision Event with a solid object*/
#region /*Push out of the solid object*/
while (place_meeting(x, y, other))
{
	x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /*Push out of the solid object END*/

#region /*Landing on solid object*/
if (place_meeting(x, y + 1, other))
and (vspeed >= 0)
and (stick_to_wall = false)
{
	
	#region /*Smoke Landing Effect*/
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	and (obj_camera.iris_xscale > 1)
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
	#endregion /*Smoke Landing Effect END*/
	
	vspeed = 0;
	gravity = 0;
	last_standing_x = x;
	last_standing_y = y + sprite_height / 2;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
	can_ground_pound = true;
	can_dive = true;
	spring = false;
	ledge_grab_jump = false;
	wall_jump = 0;
}
#endregion /*Landing on solid object END*/

#region /*Hitting your head on ceiling*/
if (position_meeting(x, bbox_top - 1, other))
and (stick_to_wall = false)
{
	scr_gamepad_vibration(player, 0.1, 10);
	vspeed += 4;
	can_ground_pound = false;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
	if (abs(hspeed) < 1)
	{
		hspeed = 0;
	}
}
#endregion /*Hitting your head on ceiling END*/

#region /*Hitting wall to your left*/
if (position_meeting(bbox_left - 1, bbox_bottom - 8, other))
or(position_meeting(bbox_left - 1, bbox_top + 8, other))
or(position_meeting(bbox_left - 1, y, other))
//or(place_meeting(x - 1, y, other))
{
	if (hspeed <= 0)
	{
		hspeed = 0;
	}
}
#endregion /*Hitting wall to your left END*/

#region /*Hitting wall to your right*/
if (position_meeting(bbox_right + 1, bbox_bottom - 8, other))
or(position_meeting(bbox_right + 1, bbox_top + 8, other))
or(position_meeting(bbox_right + 1, y, other))
//or(place_meeting(x + 1, y, other))
{
	if (hspeed >= 0)
	{
		hspeed = 0;
	}
}
#endregion /*Hitting wall to your right END*/

#region /*Sound Effect Handeling*/

#region /*Landing on different surfaces sound effects*/
if (place_meeting(x, y + 1, other))
{
	if (asset_get_type("obj_ground") == asset_object)
	and (place_meeting(x, y + 1, obj_ground))
	{
		scr_audio_play(snd_land_dirt, volume_source.footstep);
	}
	else
	{
		scr_audio_play(snd_land_rock, volume_source.footstep);
	}
}
#endregion /*Landing on different surfaces sound effects END*/

#region /*Hitting ceiling sound effect*/
if (position_meeting(x, bbox_top - 1, other))
{
	scr_audio_play(snd_hitblockbound, volume_source.sound);
}
#endregion /*Hitting ceiling sound effect END*/

#region /*Footstep Land sounds*/

#region /*Dirt Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 1)
{
	if (!audio_is_playing(snd_footstep_dirt_right))
	{
		scr_audio_play(snd_footstep_dirt_right, volume_source.footstep);
	}
}
#endregion /*Dirt Footstep Right END*/

else

#region /*Glass Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 2)
{
	if (!audio_is_playing(snd_footstep_glass_right))
	{
		scr_audio_play(snd_footstep_glass_right, volume_source.footstep);
	}
}
#endregion /*Glass Footstep Right END*/

else

#region /*Grass Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 3)
{
	if (!audio_is_playing(snd_footstep_grass_right))
	{
		scr_audio_play(snd_footstep_grass_right, volume_source.footstep);
	}
}
#endregion /*Grass Footstep Right END*/

else

#region /*Gravel Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 4)
{
	if (!audio_is_playing(snd_footstep_gravel_right))
	{
		scr_audio_play(snd_footstep_gravel_right, volume_source.footstep);
	}
}
#endregion /*Gravel Footstep Right END*/

else

#region /*Metal Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 5)
{
	if (!audio_is_playing(snd_footstep_metal_right))
	{
		scr_audio_play(snd_footstep_metal_right, volume_source.footstep);
	}
}
#endregion /*Metal Footstep Right END*/

else

#region /*Stone Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 6)
{
	if (!audio_is_playing(snd_footstep_stone_right))
	{
		scr_audio_play(snd_footstep_stone_right, volume_source.footstep);
	}
}
#endregion /*Stone Footstep Right END*/

else

#region /*Wood Footstep Right*/
if (asset_get_type("obj_ground") == asset_object)
and (place_meeting(x, y + 1, obj_ground))
and (instance_nearest(x, bbox_bottom, obj_ground).ground_surface = 7)
{
	if (!audio_is_playing(snd_footstep_wood_right))
	{
		scr_audio_play(snd_footstep_wood_right, volume_source.footstep);
	}
}
#endregion /*Wood Footstep Right END*/

else

#region /*Default Footstep Right*/
if (asset_get_type("snd_footstep_default_right") == asset_sound)
{
	if (!audio_is_playing(snd_footstep_default_right))
	{
		scr_audio_play(snd_footstep_default_right, volume_source.footstep);
	}
}
#endregion /*Default Footstep Right END*/

#endregion /*Footstep Land sounds END*/

#endregion /*Sound Effect Handeling END*/