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
	if (asset_get_type("obj_wall") == asset_object)
	and (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	and (obj_camera.iris_xscale > 1)
	{
		if (position_meeting(x - 24, bbox_bottom + 2, obj_wall))
		{
			effect_create_above(ef_smoke, x - 24, bbox_bottom - 8, 0, c_white);
		}
		if (position_meeting(x - 16, bbox_bottom + 2, obj_wall))
		{
			effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
		}
		if (position_meeting(x, bbox_bottom + 2, obj_wall))
		{
			effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
			effect_create_above(ef_smoke, x, bbox_bottom - 8, 0, c_white);
		}
		if (position_meeting(x + 16, bbox_bottom + 2, obj_wall))
		{
			effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
		}
		if (position_meeting(x + 24, bbox_bottom + 2, obj_wall))
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
and (music_fade_in > 0.3)
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

#region /*Hitting ceiling sound effect*/
if (position_meeting(x, bbox_top - 1, other))
and (asset_get_type("snd_hitblockbound") == asset_sound)
and (music_fade_in > 0.3)
{
	audio_stop_sound(snd_hitblockbound);
	audio_play_sound(snd_hitblockbound, 0, 0);
	audio_sound_gain(snd_hitblockbound, global.sound_volume * global.main_volume, 0);
}
#endregion /*Hitting ceiling sound effect END*/

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