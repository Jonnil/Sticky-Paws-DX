function scr_player_move_crouch() {
	
	#region /* Crouch */
	if (key_crouch_hold) /* Holding the crouch button */
	&& (allow_crouch) /* Can crouch */
	&& (!crouch) /* Not currently crouching */
	&& (can_move)
	&& (!ground_pound)
	&& (!dive)
	&& (on_ground) {
		crouch = true;
		draw_xscale = 1.5;
		draw_yscale = 0.5;
		if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
		if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
		
		if (sprite_mask_crouch >= 0) {
			mask_index = sprite_mask_crouch;
		}
		if (!place_meeting(x, y + 16, obj_wall) || !collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_semisolid_platform, false, true)) {
			y += 32;
		}
		scr_audio_play(snd_squat, volume_source.sound);
	}
	#endregion /* Crouch END */
	
	else
	
	#region /* Don't crouch */
	if (!key_crouch_hold)
	&& (crouch)
	&& (!place_meeting(x, y - 8, obj_wall)) {
		/* Player should be able to stop crouching at any point in mid-air, even when traveling upwards */
		crouch = false;
		y -= 16;
		draw_xscale = 0.75;
		draw_yscale = 1.25;
		if (sprite_mask >= 0) {
			mask_index = sprite_mask;
		}
		scr_audio_play(snd_rise, volume_source.sound);
	}
	#endregion /* Don't crouch END */
	
}