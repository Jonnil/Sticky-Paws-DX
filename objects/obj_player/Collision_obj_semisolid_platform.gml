/*Collision Event with a solid object*/

if (position_meeting(x,bbox_bottom+1,other))
or(position_meeting(x,bbox_bottom+2,other))
or(position_meeting(x,bbox_bottom+3,other))
or(position_meeting(x,bbox_bottom+4,other))

or(position_meeting(bbox_left,bbox_bottom+1,other))
or(position_meeting(bbox_left,bbox_bottom+2,other))
or(position_meeting(bbox_left,bbox_bottom+3,other))
or(position_meeting(bbox_left,bbox_bottom+4,other))

or(position_meeting(bbox_right,bbox_bottom+1,other))
or(position_meeting(bbox_right,bbox_bottom+2,other))
or(position_meeting(bbox_right,bbox_bottom+3,other))
or(position_meeting(bbox_right,bbox_bottom+4,other))
{
	y-=1;
}

#region /*Landing on solid object*/
if (position_meeting(x, bbox_bottom + 1, other))
and(vspeed > 0)
and(stick_to_wall = false)
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
	laststandingx = x;
	laststandingy = y + sprite_height / 2;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
	can_ground_pound = true;
	can_dive = true;
	spring = false;
	ledge_grab_jump = false;
}
#endregion /*Landing on solid object END*/

#region /*Sound Effect Handeling*/

#region /*Stop the jumping voice clips when landing on ground*/
if (position_meeting(x, bbox_bottom + 1, other))
{
	audio_stop_sound(voice_jump);
	audio_stop_sound(voice_jump2nd);
	audio_stop_sound(voice_jump3rd);
	audio_stop_sound(voice_jump_rope);
	audio_stop_sound(voice_jump_spring);
}
#endregion /*Stop the jumping voice clips when landing on ground END*/

#region /*Landing on different surfaces sound effects*/
if (position_meeting(x, bbox_bottom + 1, other))
{
	if (asset_get_type("obj_ground") == asset_object)
	and(place_meeting(x, y + 1, obj_ground))
	and(asset_get_type("snd_land_dirt") == asset_sound)
	{
		audio_play_sound(snd_land_dirt, 0, 0);
		audio_sound_gain(snd_land_dirt, global.sfx_volume, 0);
	}
	else
	if (asset_get_type("snd_land_rock") == asset_sound)
	{
		audio_play_sound(snd_land_rock, 0, 0);
		audio_sound_gain(snd_land_rock, global.sfx_volume, 0);
	}
}
#endregion /*Landing on different surfaces sound effects END*/

#region /*Footstep Land sounds*/

#region /*Metal Footstep Right*/
if (asset_get_type("obj_ground_metal") == asset_object)
and(place_meeting(x, y + 1, obj_ground_metal))
{
	if (asset_get_type("snd_footstep_metal_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_metal_right))
	{
		audio_play_sound(snd_footstep_metal_right, 0, 0);
		audio_sound_gain(snd_footstep_metal_right, global.sfx_volume, 0);
	}
}
#endregion /*Metal Footstep Right END*/

#region /*Stone Footstep Right*/
else
if (asset_get_type("obj_ground_stone") == asset_object)
and(place_meeting(x, y + 1, obj_ground_stone))
{
	if (asset_get_type("snd_footstep_stone_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_stone_right))
	{
		audio_play_sound(snd_footstep_stone_right, 0, 0);
		audio_sound_gain(snd_footstep_stone_right, global.sfx_volume, 0);
	}
}
else #endregion /*Stone Footstep Right END*/

#region /*Wood Footstep Right*/
if (asset_get_type("obj_ground_wood") == asset_object)
and(place_meeting(x, y + 1, obj_ground_wood))
{
	if (asset_get_type("snd_footstep_wood_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_wood_right))
	{
		audio_play_sound(snd_footstep_wood_right, 0, 0);
		audio_sound_gain(snd_footstep_wood_right, global.sfx_volume, 0);
	}
}
#endregion /*Wood Footstep Right END*/

#region /*Dirt Footstep Right*/
else
if (asset_get_type("obj_ground_dirt") == asset_object)
and(place_meeting(x, y + 1, obj_ground_dirt))
{
	if (asset_get_type("snd_footstep_dirt_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_dirt_right))
	{
		audio_play_sound(snd_footstep_dirt_right, 0, 0);
		audio_sound_gain(snd_footstep_dirt_right, global.sfx_volume, 0);
	}
}
else #endregion /*Dirt Footstep Right END*/

#region /*Gravel Footstep Right*/
if (asset_get_type("obj_ground_gravel") == asset_object)
and(place_meeting(x, y + 1, obj_ground_gravel))
{
	if (asset_get_type("snd_footstep_gravel_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_gravel_right))
	{
		audio_play_sound(snd_footstep_gravel_right, 0, 0);
		audio_sound_gain(snd_footstep_gravel_right, global.sfx_volume, 0);
	}
}
#endregion /*Gravel Footstep Right END*/

#region /*Grass Footstep Right*/
else
if (asset_get_type("obj_ground_grass") == asset_object)
and(place_meeting(x, y + 1, obj_ground_grass))
{
	if (asset_get_type("snd_footstep_grass_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_grass_right))
	{
		audio_play_sound(snd_footstep_grass_right, 0, 0);
		audio_sound_gain(snd_footstep_grass_right, global.sfx_volume, 0);
	}
}
#endregion /*Grass Footstep Right END*/

#region /*Glass Footstep Right*/
else
if (asset_get_type("obj_ground_glass") == asset_object)
and(place_meeting(x, y + 1, obj_ground_glass))
{
	if (asset_get_type("snd_footstep_glass_right") == asset_sound)
	and(!audio_is_playing(snd_footstep_glass_right))
	{
		audio_play_sound(snd_footstep_glass_right, 0, 0);
		audio_sound_gain(snd_footstep_glass_right, global.sfx_volume, 0);
	}
}
#endregion /*Glass Footstep Right END*/

#region /*Default Footstep Right*/
else
{
	if (asset_get_type("snd_footstep_default_right") == asset_sound)
	{
		if (!audio_is_playing(snd_footstep_default_right))
		{
			audio_play_sound(snd_footstep_default_right, 0, 0);
			audio_sound_gain(snd_footstep_default_right, global.sfx_volume, 0);
		}
	}
}
#endregion /*Default Footstep Right END*/

#endregion /*Footstep Land sounds END*/

#endregion /*Sound Effect Handeling END*/