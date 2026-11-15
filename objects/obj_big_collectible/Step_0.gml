if (big_collectible <= 0 && instance_exists(big_collectible_marker))
{
	big_collectible = big_collectible_marker.big_collectible;
	big_collectible_legacy_slot = big_collectible_marker.big_collectible_legacy_slot;
}

/* Indicate when you have already collected this big collectible */
if (global.big_collectible[big_collectible])
{
	image_alpha = 0.5;
	image_blend = c_gray;
}

image_index = global.collectible_index;

if (follow_player)
&& (place_meeting(x, y + 16, obj_wall))
|| (follow_player)
&& (place_meeting(x, y + 16, obj_semisolid_platform))
{
	collect_big_collectible = true;
}

#region /* Follow Player */
if (follow_player)
{
	if (instance_exists(obj_player)
	&& distance_to_object(obj_player) < sprite_height + sprite_width)
	{

		#region /* Show Big Collectible HUD */
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		}
		#endregion /* Show Big Collectible HUD END */

		x = lerp(x, instance_nearest(x, y, obj_player).x, 0.5);
		y = lerp(y, instance_nearest(x, y, obj_player).y, 0.5);
	}
	else
	{
		x = lerp(x, xstart, 0.5);
		y = lerp(y, ystart, 0.5);
		if (x == xstart && y == ystart)
		{
			follow_player = false;
		}
	}
}
#endregion /* Follow Player END */

if (bounce_up)
{

	#region /* Show Big Collectible HUD */
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	}
	#endregion /* Show Big Collectible HUD END */

	if (delay >= delay_time)
	{
		visible = true;
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		if (vspeed > 0 && y > ystart - 32)
		{
			collect_big_collectible = true;
		}
	}
	else
	{
		visible = false;
		y = ystart;
	}
	delay++;
}

#region /* Expanding Ring Effect */
effect_time++;
if (effect_time > 60)
{
	effect_time = 0;
	effect_create_depth(depth + 1, ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */

#region /* Actually collect big collectible */
if (collect_big_collectible && big_collectible > 0 && big_collectible <= global.max_big_collectible)
{

	#region /* Show Big Collectible HUD */
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_big_collectibles_timer = global.hud_hide_time * 60;
	}
	#endregion /* Show Big Collectible HUD END */

	effect_create_depth(depth - 1, ef_ring, x, y, 2, c_white);

	#region /* 1000 Score */
	global.level_score += 1000;
	with(instance_create_depth(x, y, 0, obj_score_up))
	{
		score_up = 1000;
	}
	#endregion /* 1000 Score END */

	#region /* What Big Collectible is this? */
	var slot = big_collectible;
	global.big_collectible[slot] = true;
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_big_collectible_blink[slot] = 120;
		if (!global.big_collectible_already_collected[slot])
		{
			global.how_many_big_collectible_collected++;
			global.big_collectible_already_collected[slot] = true;
		}
	}
	scr_big_collectible_record_run_pickup(big_collectible_tier, big_collectible_id, big_collectible_legacy_slot);
	scr_big_collectible_record_pickup(slot, big_collectible_tier, big_collectible_id, big_collectible_legacy_slot);
	#endregion /* What Big Collectible is this? END */
	
	var big_collectible_sound_index = snd_big_collectible;
	
	if (global.how_many_big_collectible_collected >= global.max_big_collectible)
	{
		big_collectible_sound_index = snd_big_collectible_all;
	}
	
	audio_sound_pitch(big_collectible_sound_index, 0.9 + (0.1 * global.how_many_big_collectible_collected));
	scr_audio_play(big_collectible_sound_index, volume_source.sound);

	var outline = instance_create_depth(xstart, ystart, 0, obj_big_collectible_outline);
	outline.big_collectible_tier = big_collectible_tier;
	outline.image_blend = image_blend;
	instance_destroy();
}
#endregion /* Actually collect big collectible END */
