if (!horizontal_rope_climb)
{
	var nearest_horizontal_rope = instance_nearest(x, y, obj_horizontal_rope);
	if (!on_ground)
	&& (!in_water)
	&& (hold_item_in_hands == "")
	&& (place_meeting(x, y, obj_horizontal_rope))
	&& (!collision_rectangle(nearest_horizontal_rope.x, nearest_horizontal_rope.y, nearest_horizontal_rope.x, nearest_horizontal_rope.y + 64, obj_wall, false, true)) /*If there is no wall underneath the horizontal rope, then it's safe to grab onto the horizontal rope*/
	{
		if (can_climb_horizontal_rope_cooldown == 0)
		&& (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + abs(vspeed), obj_horizontal_rope, false, true))
		{

			#region /* Set a bunch of variables only once to specific values when you are climbing on horizontal ropes */
			angle = 0;
			midair_jumps_left = number_of_jumps;
			can_ground_pound = false;
			can_dive = true;
			chain_reaction = 0;
			dive = false;
			gravity = 0;
			ground_pound = false;
			last_standing_x = x;
			last_standing_y = y;
			ledge_grab_jump = false;
			speed_max = 4;
			spring = false;
			stick_to_wall = false;
			crouch = false;
			vspeed = 0;
			scr_audio_play(snd_catch_ivy, volume_source.sound); /* Make a sound effect that you have started cimbing */
			scr_audio_play(voice_rope_catch, volume_source.voice);
			#endregion /* Set a bunch of variables only once to specific values when you are climbing on horizontal ropes END */

			horizontal_rope_climb = true; /* Make player climb horizontal rope */
		}
	}
}
if (horizontal_rope_climb)
{
	y = instance_nearest(x, y, obj_horizontal_rope).y + climb_under_y_offset; /* Set the y position so player is underneath the horizontal rope */
}
