function scr_player_move_ledge_grab()
{
	
	#region /* Ledge Grab */
	if (allow_ledge_grab)
	{
		if (in_water)
		|| (ground_pound >= true)
		|| (x < camera_get_view_x(view_camera[view_current]) + 25)
		|| (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 25)
		{
			can_ledge_grab = false; /* You are not able to grab a ledge in certain situations, so set this variable to false */
		}
		else
		{
			can_ledge_grab = true;
		}
		if (can_ledge_grab)
		{
			if (hspeed != 0)
			{
				hspeed_dir = sign(hspeed);
			}
			if (ground_pound <= false)
			&& (burnt <= false)
			{
				if (!position_meeting(x + 37 * hspeed_dir, bbox_top - 16, obj_wall))
				&& (position_meeting(x + 37 * hspeed_dir, bbox_top, obj_wall))
				&& (vspeed > 0) /* Only grab the ledge if you are falling */
				&& (!place_meeting(x, y + 1, obj_wall)) /* If there is no ground underneath you, then you can grab the ledge */
				&& (!key_down) /* If you hold down while approaching a ledge, then you don't grab it */
				{
					if (asset_get_type("snd_grab_ledge") == asset_sound)
					{
						scr_audio_play(snd_grab_ledge, volume_source.sound);
					}
					gravity = 0;
					hspeed = 0;
					vspeed = 0;
				
					#region /* Move against the ledge */
					while(!place_meeting(x + hspeed_dir, y, obj_wall))
					{
						x += hspeed_dir;
					}
					#endregion /* Move against the ledge END */
				
					#region /* Make sure we are the right height */
					while(position_meeting(x + (17 * hspeed_dir), bbox_top + 1, obj_wall))
					{
						y --;
					}
					#endregion /* Make sure we are the right height END */
				
					ledge_grab_jump = false; /* Make sure player doesn't move forward when first grabbing a ledge */
					ledge_grab = true; /* Set this variable to true so the game knows you are currently grabbing a ledge*/
					ledge_grab_delay = 0; /* Reset the grabbing ledge delay */
					stick_to_wall = false;
					wall_jump = false;
					jump = false;
					ground_pound = false;
					spring = false;
					can_ground_pound = false;
					dive = false;
					glide = false;
				}
			}
			if (ledge_grab) /* If you are currently grabbing a ledge, then run this code */
			&& (ledge_grab_delay <= 10) /* Don't actually grab ledge if the variable is above 10, because variable above 10 is for delay when releasing ledge*/
			{
				if (ledge_grab_delay < 10) /* If variable is below 10, then increase it, so that there is a delay before you can climb up or jump off */
				{
					ledge_grab_delay ++;
				}
				gravity = 0;
				hspeed = 0;
				vspeed = 0;
				if (place_meeting(x - 1, y, obj_wall))
				{
					image_xscale = -1;
				}
				else
				if (place_meeting(x + 1, y, obj_wall))
				{
					image_xscale = +1;
				}
				if (sprite_ledge_grab > noone)
				{
					sprite_index = sprite_ledge_grab;
				}
				else
				if (sprite_wall_slide > noone)
				{
					sprite_index = sprite_wall_slide;
				}
				else
				if (sprite_stand > noone)
				{
					sprite_index = sprite_stand;
				}
				if (key_left_hold)
				&& (image_xscale = -1)
				|| (key_right_hold)
				&& (image_xscale = +1)
				{
					if (ledge_grab_delay == 10) /* Can only climb up ledge after grabbing ledge for 10 frames */
					{
						if (image_xscale > 0)
						{
							angle = +360;
						}
						else
						{
							angle = -360;
						}
						if (asset_get_type("snd_pull_up") == asset_sound)
						{
							scr_audio_play(snd_pull_up, volume_source.sound);
						}
						vspeed = - 8;
						ledge_grab_delay = 11; /* Start ledge grab delay so you can't immediately grab another ledge by accident */
						ledge_grab_jump = true; /* Make the player move forward when climbing up from a ledge grab */
						stick_to_wall = false;
						wall_jump = 0;
					}
				}
				else
				if (key_jump) /* If you press jump or up when grabbing a ledge, then you can immediately climb up, so you don't have to wait for the ledge grab delay */
				|| (key_up_pressed) /* The player have to intentionally PRESS up if they want to climb up, so you don't climb up by mistake when you hold up */
				{
					if (image_xscale > 0)
					{
						angle = +360;
					}
					else
					{
						angle = -360;
					}
					if (asset_get_type("snd_pull_up_fast") == asset_sound)
					{
						scr_audio_play(snd_pull_up_fast, volume_source.sound);
					}
					vspeed = -normal_jump_height;
					ledge_grab_delay = 11; /* Start ledge grab delay so you can't immediately grab another ledge by accident */
					ledge_grab_jump = true; /* Make the player move forward when jumping up from a ledge grab */
					stick_to_wall = false;
					wall_jump = 0;
				}
				if (key_left_hold) /* If you press left while looking right, then drop down from ledge */
				&& (image_xscale = +1)
				|| (key_right_hold) /* If you press right while looking left, then drop down from ledge */
				&& (image_xscale = -1)
				|| (key_down)
				{
					if (ledge_grab_delay >= 10) /* Can only drop down from ledge after grabbing ledge for 10 frames */
					{
						if (key_down)
						&& (key_crouch_pressed)
						{
							can_ground_pound = false; /* If down key uses the same input as ground pound key, you can't ground pound immediately, so you don't accidentally ground pound */
						}
						hspeed = +0.1 * -hspeed_dir;
						ledge_grab_delay = 11; /* Start ledge grab delay so you can't immediately grab another ledge by accident */
						ledge_grab_jump = false; /* Make sure player doesn't move forward when dropping down from a ledge grab */
						stick_to_wall = false;
						wall_jump = 0;
					}
				}
			}
		}
	}

	#region /* Delay before you can do another ledge grab */
	if (ledge_grab_delay >= 11)
	{
		ledge_grab_delay ++;
		if (ledge_grab_delay >= 13)
		{
			ledge_grab = false; /* The game recognizes that you are no longer grabbing a ledge after 1 frame when jumping up or down from ledge, so you don't accidentally do another action you didn't mean to do */
		}
		if (ledge_grab_delay >= 30)
		{
			ledge_grab_jump = false; /* Stop moving forward when jumping up from ledge grab */
			ledge_grab_delay = 0; /* You can now do another ledge grab */
		}
	}
	#endregion /* Delay before you can do another ledge grab END */

	if (on_ground)
	{
		ledge_grab_jump = false; /* Stop moving forward when landing on ground */
	}

	#endregion /* Ledge Grab END */

	#region /* Ledge grab jump / Get up over ledge */
	if (ledge_grab_jump)
	&& (stick_to_wall == false)
	{
		if (image_xscale == -1)
		&& (!place_meeting(x, y - 1, obj_wall))
		{
			hspeed -= 0.1;
		}
		else
		if (image_xscale == +1)
		&& (!place_meeting(x, y + 1, obj_wall))
		{
			hspeed += 0.1;
		}
	}
	#endregion /* Ledge grab jump / Get up over ledge END */
	
}