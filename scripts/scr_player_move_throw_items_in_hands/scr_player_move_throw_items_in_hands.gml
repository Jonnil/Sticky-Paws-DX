function scr_player_move_throw_items_in_hands()
{

	if (hold_item_in_hands != "")
	{

		#region /* Holding items in hands x position */
		angle = 0;
		if (sprite_index != sprite_vine_climb && sprite_index != sprite_vine_stay) {
			if (image_xscale < 0) {
				hold_item_in_hands_x = -32;
			}
			else
			{
				hold_item_in_hands_x = +32;
			}
		}
		else {
			hold_item_in_hands_x = 0;
		}
		#endregion /* Holding items in hands x position END */

		#region /* Throw items in hands */
		if (key_dive_pressed)
		{
			if (key_up)
			{
				if (image_xscale < 0)
				{
					if (hold_item_in_hands = "enemy_bowlingball")
					{
						if (y + 16 < camera_get_view_y(view_camera[view_current]))
						&& (!place_meeting(x, y + 1, obj_wall))
						&& (!place_meeting(x, y + 1, obj_semisolid_platform))
						{
							with(instance_create_depth(x, camera_get_view_y(view_camera[view_current]) + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = -1;
							}
						}
						else
						if (!position_meeting(bbox_left - 32, y, obj_wall))
						&& (!collision_line(x, y, bbox_left - 16, bbox_top + 16, obj_wall, false, true))
						{
							with(instance_create_depth(bbox_left - 16, bbox_top + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = -1;
							}
						}
						else
						{
							with(instance_create_depth(x, bbox_top + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = -1;
							}
						}
					}
				}
				else
				if (image_xscale > 0)
				{
					if (hold_item_in_hands = "enemy_bowlingball")
					{
						if (y + 16 < camera_get_view_y(view_camera[view_current]))
						&& (!place_meeting(x, y + 1, obj_wall))
						&& (!place_meeting(x, y + 1, obj_semisolid_platform))
						{
							with(instance_create_depth(x, camera_get_view_y(view_camera[view_current]) + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = -1;
							}
						}
						else
						if (!position_meeting(bbox_right + 32, y, obj_wall))
						&& (!collision_line(x, y, bbox_right + 16, bbox_top + 16, obj_wall, false, true))
						{
							with(instance_create_depth(bbox_right + 16, bbox_top + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = +1;
							}
						}
						else
						{
							with(instance_create_depth(x, bbox_top + 16, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								vspeed = -20;
								image_xscale = +1;
							}
						}
					}
				}
			}
			else
			if (key_down)
			{
				if (image_xscale < 0)
				{
					if (hold_item_in_hands = "enemy_bowlingball")
					{
						if (!position_meeting(bbox_left - 32, y, obj_wall))
						&& (!collision_line(x, y, bbox_left - 32, y, obj_wall, false, true))
						{
							with(instance_create_depth(bbox_left - 32, y, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								hspeed = -1;
								vspeed = 0;
								image_xscale = -1;
							}
						}
						else
						{
							with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								hspeed = -1;
								vspeed = 0;
								image_xscale = -1;
							}
						}
					}
				}
				else
				if (image_xscale > 0)
				{
					if (hold_item_in_hands = "enemy_bowlingball")
					{
						if (!position_meeting(bbox_right + 32, y, obj_wall))
						&& (!collision_line(x, y, bbox_right + 32, y, obj_wall, false, true))
						{
							with(instance_create_depth(bbox_right + 32, y, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								hspeed = +1;
								vspeed = 0;
								image_xscale = +1;
							}
						}
						else
						{
							with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
							{
								flat = true;
								sliding_along_ground = 0;
								stomped_delay = 20;
								number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
								hspeed = +1;
								vspeed = 0;
								image_xscale = +1;
							}
						}
					}
				}
			}
			else
			if (key_left_hold)
			|| (image_xscale < 0)
			{
				if (hold_item_in_hands = "enemy_bowlingball")
				&& (!collision_line(x, y, bbox_left - 32, y, obj_wall, false, true))
				{
					with(instance_create_depth(bbox_left - 32, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = -1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = -1;
					}
				}
				else
				if (hold_item_in_hands = "enemy_bowlingball")
				{
					with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = -1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = -1;
					}
				}
			}
			else
			if (key_right_hold)
			|| (image_xscale > 0)
			{
				if (hold_item_in_hands = "enemy_bowlingball")
				&& (!collision_line(x, y, bbox_right + 32, y, obj_wall, false, true))
				{
					with(instance_create_depth(bbox_right + 32, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = +1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = +1;
					}
				}
				else
				if (hold_item_in_hands = "enemy_bowlingball")
				{
					with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = +1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = +1;
					}
				}
			}
			hold_item_in_hands = "";
			dive = false;
		}

		if (key_left_hold)
		|| (image_xscale < 0)
		{
			if (hold_item_in_hands = "enemy_bowlingball")
			&& (place_meeting(x - 16, y, obj_enemy))
			&& (!place_meeting(x, y + 8, obj_enemy))
			&& (!instance_nearest(x + 1, y, obj_enemy).die)
			{
				with(instance_nearest(x - 1, y, obj_enemy))
				{
					flat = true;
					sliding_along_ground = -1;
					stomped_delay = 20;
					vspeed = -8;
					die_volting = +1;
					die = true;
				}
				if (!collision_line(x, y, bbox_left - 32, y, obj_wall, false, true))
				{
					with(instance_create_depth(bbox_left - 32, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = +1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = +1;
						vspeed = -8;
						die_volting = -1;
						die = true;
					}
				}
				else
				{
					with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = +1;
						stomped_delay = 20;
						number_of_times_stomped = instance_nearest(x, y, obj_player).hold_item_number_of_times_stomped;
						image_xscale = +1;
						vspeed = -8;
						die_volting = -1;
						die = true;
					}
				}
				hold_item_in_hands = "";
			}
		}

		else

		if (key_right_hold)
		|| (image_xscale > 0)
		{
			if (hold_item_in_hands = "enemy_bowlingball")
			&& (place_meeting(x + 16, y, obj_enemy))
			&& (!place_meeting(x, y + 8, obj_enemy))
			&& (!instance_nearest(x + 1, y, obj_enemy).die)
			{
				with(instance_nearest(x + 1, y, obj_enemy))
				{
					flat = true;
					sliding_along_ground = +1;
					stomped_delay = 20;
					vspeed = -8;
					die_volting = -1;
					die = true;
				}
				if (!collision_line(x, y, bbox_right + 32, y, obj_wall, false, true))
				{
					with(instance_create_depth(bbox_right + 32, y, 0, obj_enemy_bowlingball))
					{
						flat = true;
						sliding_along_ground = -1;
						stomped_delay = 20;
						image_xscale = -1;
						vspeed = -8;
						die_volting = +1;
						die = true;
					}
				}
				else
				with(instance_create_depth(x, y, 0, obj_enemy_bowlingball))
				{
					flat = true;
					sliding_along_ground = -1;
					stomped_delay = 20;
					image_xscale = -1;
					vspeed = -8;
					die_volting = +1;
					die = true;
				}
				hold_item_in_hands = "";
			}
		}
		#endregion /* Throw items in hands END */

	}

}
