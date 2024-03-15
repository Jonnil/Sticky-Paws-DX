function scr_player_move_spring()
{
	
	#region /* Spring */
	if (move_towards_spring_endpoint) {
		move_towards_point(spring_endpoint_x, spring_endpoint_y, 20);
		
		if (instance_exists(obj_spring))
		&& (point_distance(
		spring_endpoint_x,
		spring_endpoint_y,
		instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).x,
		instance_nearest(spring_endpoint_x, spring_endpoint_y, obj_spring).y) < 32) {
			move_towards_spring_endpoint = true;
		}
		else if (point_distance(x, y, spring_endpoint_x, spring_endpoint_y) < 340) {
			move_towards_spring_endpoint = false;
			spring_endpoint_x = 0;
			spring_endpoint_y = 0;
		}
		if (instance_exists(obj_wall)) {
			if (place_meeting(x - 4, y, obj_wall))
			&& (hspeed < 0)
			|| (place_meeting(x + 4, y, obj_wall))
			&& (hspeed > 0)
			|| (place_meeting(x, y - 4, obj_wall))
			&& (vspeed < 0)
			|| (place_meeting(x, y + 4, obj_wall))
			&& (vspeed > 0) {
				move_towards_spring_endpoint = false;
				spring_endpoint_x = 0;
				spring_endpoint_y = 0;
			}
		}
		
		if (speed <= 1) /* If player isn't moving when bouncing on spring, something wrong probably happened, cancel moving towards spring endpoint */
		|| (y <= camera_get_view_y(view_camera[view_current]) - 64) /* If you are being sprung outside the view, cancel moving towards spring endpoint*/
		|| (hspeed < 0 && x <= camera_get_view_x(view_camera[view_current]))
		|| (hspeed > 0 && x >= camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])) {
			move_towards_spring_endpoint = false;
			spring_endpoint_x = 0;
			spring_endpoint_y = 0;
		}
	}
	
	if (spring) {
		if (spring_animation == 0) {
			if (image_index > image_number - 1 && vspeed >= 0) {
				if (sprite_spring_transition > noone || sprite_jump_transition_to_fall > noone) {
					image_index = 0;
					spring_animation = 1;
				}
				else {
					image_index = 0;
					spring_animation = 3;
				}
			}
			if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
			if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
			if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
			if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_idle > noone){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		else if (spring_animation == 1) {
			image_index = 0;
			if (sprite_spring_transition > noone){sprite_index = sprite_spring_transition;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}
			spring_animation = 2;
		}
		else if (spring_animation == 2) {
			if (image_index > image_number - 1) {
				spring_animation = 3;
			}
			if (sprite_spring_transition > noone){sprite_index = sprite_spring_transition;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall;}
			else {
				spring_animation = 3;
			}
		}
		else if (spring_animation == 3) {
			if (sprite_spring_down > noone){sprite_index = sprite_spring_down;}else
			if (sprite_spring_up > noone){sprite_index = sprite_spring_up;}else
			if (key_jump_hold) && (sprite_fall_slower > noone){sprite_index = sprite_fall_slower;}else
			if (sprite_fall > noone){sprite_index = sprite_fall; image_speed = 0.5;}else
			if (sprite_jump_transition_to_fall > noone){sprite_index = sprite_jump_transition_to_fall; if (image_index > image_number - 1){image_index = image_number - 1;}}else
			if (sprite_double_jump > noone){sprite_index = sprite_double_jump;}else
			if (sprite_jump > noone){sprite_index = sprite_jump; image_index = image_number - 1;}else
			if (sprite_idle > noone){sprite_index = sprite_idle;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
			if (vspeed <= 0) {
				spring_animation = 0;
			}
		}
		
		#region /* Make the cahracter face wherever you're going */
		if (spring_twist_sprite) {
			if (hold_item_in_hands == "") {
				angle = direction - 90;
			}
			if (speed < 6 || direction >= 90 - 10 && direction <= 90 + 10) {
				spring_twist_sprite = false;
			}
		}
		#endregion /* Make the cahracter face wherever you're going END */
		
		star_image_index ++;
		if (star_image_index == 5) {
			effect_create_above(ef_star, x + random_range(-32, +32), y + random_range(-32, +32), 0, c_white);
			star_image_index = 0;
		}
		image_speed = 0.5;
	}
	#endregion /* Spring END */
	
}