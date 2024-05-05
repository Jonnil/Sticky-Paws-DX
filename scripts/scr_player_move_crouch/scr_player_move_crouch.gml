function scr_player_move_crouch()
{
	
	#region /* Crouch */
	if (key_crouch_hold) /* Holding the crouch button */
	&& (allow_crouch) /* Can crouch */
	&& (!crouch) /* Not currently crouching */
	&& (can_move)
	&& (!ground_pound)
	&& (!dive)
	&& (on_ground)
	{
		crouch = true;
		draw_xscale = 1.5;
		draw_yscale = 0.5;
		if (sprite_crouch > noone){sprite_index = sprite_crouch;}else
		if (sprite_idle > noone) && (typeof(sprite_idle) != "undefined"){sprite_index = sprite_idle;}else
		if (sprite_walk > noone){sprite_index = sprite_walk;}
		scr_audio_play(snd_squat, volume_source.sound);
		
		#region /* Get the nearest surface object before changing mask */
		var nearest_surface_object = self;
		if (global.assist_floor_over_bottomless_pit && bbox_bottom >= room_height)
		{
			/* Teleport the player to the nearest ground surface at the end of the "start crouching" code */
			y = room_height - sprite_get_height(mask_index) * 0.5 + 15;
		}
		else
		if (instance_exists(obj_wall))
		&& (instance_exists(obj_semisolid_platform))
		{
			var distance_to_nearest_wall = distance_to_object(instance_nearest(x, bbox_bottom, obj_wall));
			var distance_to_nearest_semisolid = distance_to_object(instance_nearest(x, bbox_bottom, obj_semisolid_platform));
			
			if (distance_to_nearest_wall < distance_to_nearest_semisolid)
			{
				var nearest_surface_object = instance_nearest(x, bbox_bottom, obj_wall);
			}
			else
			{
				var nearest_surface_object = instance_nearest(x, bbox_bottom, obj_semisolid_platform);
			}
		}
		else
		if (instance_exists(obj_wall))
		{
			var nearest_surface_object = instance_nearest(x, bbox_bottom, obj_wall);
		}
		else
		if (instance_exists(obj_semisolid_platform))
		{
			var nearest_surface_object = instance_nearest(x, bbox_bottom, obj_semisolid_platform);
		}
		#endregion /* Get the nearest surface object before changing mask END */
		
		/* After getting the nearest surface object, change to the crouch mask */
		if (sprite_mask_crouch >= 0)
		{
			mask_index = sprite_mask_crouch;
		}
		
		/* Teleport the player to the nearest ground surface at the end of the "start crouching" code */
		if (nearest_surface_object != self)
		{
			y = nearest_surface_object.y - sprite_get_height(mask_index) * 0.5 - 15;
		}
	}
	#endregion /* Crouch END */
	
	else
	
	#region /* Don't crouch */
	if (!key_crouch_hold)
	&& (crouch)
	{
		if (sprite_mask >= 0)
		&& (!collision_rectangle(bbox_left, bbox_bottom - sprite_get_height(sprite_mask), bbox_right, bbox_bottom, obj_wall, false, true))
		{
			/* Player should be able to stop crouching at any point in mid-air, even when traveling upwards */
			draw_xscale = 0.75;
			draw_yscale = 1.25;
			scr_audio_play(snd_rise, volume_source.sound);
			
			if (on_ground)
			{
				y -= (sprite_get_height(sprite_mask) * 0.5) - 1;
			}
			
			/* Change to the normal mask at the end of the "end crouching" code */
			mask_index = sprite_mask;
			crouch = false;
		}
	}
	#endregion /* Don't crouch END */
	
}