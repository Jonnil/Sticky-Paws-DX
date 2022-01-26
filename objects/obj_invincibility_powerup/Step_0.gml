sprite_index = global.resourcepack_sprite_invincibility_powerup;

image_speed = 0.1;
gravity_direction = 270;
gravity = 0.5;

#region /*If inside wall, destroy yourself*/
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /*If inside wall, destroy yourself END*/

#region /*When falling, it's not bouncing up anymore*/
if (vspeed >= 0)
{
	bounceup = false;
}
#endregion /*When falling, it's not bouncing up anymore END*/

if (hspeed < 0)
{
	hspeed = -2;
}
else
{
	hspeed = +2;
}

if (asset_get_type("obj_wall") == asset_object)
{
	
	if (place_meeting(x - 1, y, obj_wall))
	{
		hspeed = +2;
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		hspeed = -2;
	}
	
	if (place_meeting(x, y + 1, obj_wall))
	or (asset_get_type("obj_semisolid_platforms") == asset_object)
	and (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (asset_get_type("snd_star_bound") == asset_sound)
		{
			audio_play_sound(snd_star_bound, 0, 0);
			audio_sound_gain(snd_star_bound, global.sfx_volume, 0);
		}
		vspeed = -10;
	}
	if (place_meeting(x, y - 1, obj_wall))
	{
		vspeed = +1;
	}
}
if (floor(random(10 - 1)) = 0)
{
	effect_create_below(ef_star, x + random_range(- 16, + 16), y + random_range(- 16, + 16), 0, c_white);
}

#region /*Expanding Ring Effect*/
effect_time += 1;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /*Expanding Ring Effect END*/