if (image_alpha > 0)
{
	#region /* Draw things underneath the player */
	
	#region /* Heart above head */
	if (have_heart_balloon)
	{
		if (horizontal_rope_climb)
		&& (key_up)
		&& (!key_down)
		{
			xx_heart = lerp(xx_heart, x, 0.1);
			yy_heart = lerp(yy_heart, y + 32, 0.1);
		}
		draw_set_alpha(image_alpha);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 6, c_black, c_black);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 3, c_white, c_white);
		if (taken_damage % 2 == 0)
		{
		    draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, point_direction(xx_heart, yy_heart, xx, yy) + 90, c_white, image_alpha);
		}
		else
		{
		    draw_set_alpha(image_alpha * 0.3);
		    draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, point_direction(xx_heart, yy_heart, xx, yy) + 90, c_white, image_alpha * 0.3);
		}
	}
	
	if (!have_heart_balloon)
	{
		if (instance_exists(obj_heart_balloon))
		{
			xx_heart = instance_nearest(x, y, obj_heart_balloon).x;
			yy_heart = instance_nearest(x, y, obj_heart_balloon).y;
		}
	}
	else
	{
		xx_heart = lerp(xx_heart, x, 0.1);
		yy_heart = lerp(yy_heart, y - 64, 0.1);
	}
	#endregion /* Heart above head END */
	
	#region /* Draw holding items in hands underneath the player sprite */
	if (hold_item_in_hands = "enemy_bowlingball")
	{
		draw_sprite_ext(global.resource_pack_sprite_bowlingball, 0, xx + hold_item_in_hands_x, yy, draw_xscale * 1 * sign(image_xscale), draw_yscale * 1, 0, c_white, image_alpha * collision_mask_alpha);
		draw_sprite_ext(global.resource_pack_sprite_bowlingball_shine, 0, xx + hold_item_in_hands_x, yy, draw_xscale * 1, draw_yscale * 1, 0, c_white, image_alpha * collision_mask_alpha);
		draw_sprite_ext(global.resource_pack_sprite_enemy_bowlingball_stomped, 0, xx + hold_item_in_hands_x, yy, draw_xscale * 1 * sign(image_xscale), draw_yscale * 1, 0, c_white, image_alpha * collision_mask_alpha);
		if (image_xscale < 0)
		{
			angle = 0;
			if (sprite_index != sprite_vine_climb)
			&& (sprite_index != sprite_vine_stay)
			{
				hold_item_in_hands_x = - 32;
			}
			else
			{
				hold_item_in_hands_x = 0;
			}
		}
		else
		if (image_xscale > 0)
		{
			angle = 0;
			if (sprite_index != sprite_vine_climb)
			&& (sprite_index != sprite_vine_stay)
			{
				hold_item_in_hands_x = +32;
			}
			else
			{
				hold_item_in_hands_x = 0;
			}
		}
	}
	#endregion /* Draw holding items in hands underneath the player sprite END */
	
	#region /* Draw arrow when player is outside top view */
	if (y < camera_get_view_y(view_camera[view_current]))
	{
		draw_arrow_outside_view_up_alpha = lerp(draw_arrow_outside_view_up_alpha, 1, 0.3);
	}
	else
	{
		draw_arrow_outside_view_up_alpha = lerp(draw_arrow_outside_view_up_alpha, 0, 0.3);
	}
	
	if (draw_arrow_outside_view_up_alpha > 0.01)
	{
		draw_set_alpha(draw_arrow_outside_view_up_alpha);
		draw_set_color(c_black);
		draw_arrow(x, camera_get_view_y(view_camera[view_current]) + 16, x, camera_get_view_y(view_camera[view_current]) - 2, 30);
		draw_set_color(c_white);
		draw_arrow(x, camera_get_view_y(view_camera[view_current]) + 16, x, camera_get_view_y(view_camera[view_current]), 20);
		draw_circle_color(x, camera_get_view_y(view_camera[view_current]) + 32, 24, c_black, c_black, true);
		draw_circle_color(x, camera_get_view_y(view_camera[view_current]) + 32, 22, c_white, c_white, true);
		draw_set_alpha(1);
		
		if (!assist_invincible)
		&& (invincible_timer >= true)
		{
			if (invincible_blinking%20 == 0)
			&& (sprite_exists(sprite_index))
			{
				draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, c_black, draw_arrow_outside_view_up_alpha);
			}
			else
			if (sprite_exists(sprite_index))
			{
				draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, image_blend, draw_arrow_outside_view_up_alpha);
			}
		}
		else
		if (sprite_exists(sprite_index))
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, image_blend, draw_arrow_outside_view_up_alpha);
		}
	}
	#endregion /* Draw arrow when player is outside top view END */
	
	#region /* Draw arrow when player is outside bottom view */
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	&& (y < room_height)
	{
		draw_arrow_outside_view_down_alpha = lerp(draw_arrow_outside_view_down_alpha, 1, 0.3);
	}
	else
	{
		draw_arrow_outside_view_down_alpha = lerp(draw_arrow_outside_view_down_alpha, 0, 0.3);
	}
	
	if (draw_arrow_outside_view_down_alpha > 0.01)
	{
		draw_set_alpha(draw_arrow_outside_view_down_alpha);
		draw_set_color(c_black);
		draw_arrow(x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 16, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 2, 30);
		draw_set_color(c_white);
		draw_arrow(x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 16, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]), 20);
		draw_circle_color(x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, 24, c_black, c_black, true);
		draw_circle_color(x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, 22, c_white, c_white, true);
		draw_set_alpha(1);
		
		if (!assist_invincible)
		&& (invincible_timer >= true)
		{
			if (invincible_blinking%20 == 0)
			&& (sprite_exists(sprite_index))
			{
				draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, c_black, draw_arrow_outside_view_down_alpha);
			}
			else
			if (sprite_exists(sprite_index))
			{
				draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, image_blend, draw_arrow_outside_view_down_alpha);
			}
		}
		else
		if (sprite_exists(sprite_index))
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale * 0.5 * sign(image_xscale), draw_yscale * default_yscale * 0.5, angle, image_blend, draw_arrow_outside_view_down_alpha);
		}
	}
	#endregion /* Draw arrow when player is outside bottom view END */
	
	#endregion /* Draw things underneath the player END */
	
	#region /* Draw Self */
	
	#region /* Draw intro animation sprites (cutscene) if intro is playing */
	if (intro_animation != "")
	&& (intro_animation_sprite > 0)
	{
		draw_sprite_ext(intro_animation_sprite, intro_animation_image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, 1);
	}
	#endregion /* Draw intro animation sprites (cutscene) if intro is playing END */
	
	#region /* Make it obvious if you take damage */
	if (taken_damage == 99)
	&& (!die)
	&& (hp >= 1)
	{
		scr_audio_play(snd_lose, volume_source.sound); /* Play a sound effect when you get hit */
		scr_audio_play(voice_damage, volume_source.voice); /* Play a voice effect when you get hit */
	}
	if (taken_damage >= taken_damage_freezetime)
	{
		dive = false;
		gravity = 0;
		hspeed = 0;
		vspeed = 0;
		speed = 0;
		if (sprite_die > noone)
		&& (intro_animation == "")
		{
			sprite_index = sprite_die;
		}
		else
		if (intro_animation == "")
		{
			if (sprite_stand > noone){sprite_index = sprite_stand;}else
			if (sprite_walk > noone){sprite_index = sprite_walk;}
		}
		if (image_index > image_number - 1)
		{
			image_speed = 0;
		}
		else
		{
			image_speed = 0.5;
		}
	}
	#endregion /* Make it obvious if you take damage END */
	
	#region /* Red blink timer */
	red_blink_timer ++;
	if (red_blink_timer > 30)
	{
		red_blink_timer = 0;
	}
	if (midair_jumps_left == 0)
	&& (number_of_jumps > 1)
	{
		double_jump_depleted_blink ++;
		if (double_jump_depleted_blink > 20)
		{
			double_jump_depleted_blink = 0;
		}
	}
	else
	{
		double_jump_depleted_blink = 0;
	}
	#endregion /* Red blink timer END */
	
	#region /* Blink red when only having 1 HP left and no heart balloon */
	if (red_blink_timer > 25)
	&& (!have_heart_balloon)
	&& (hp <= 1)
	&& (max_hp >= 2)
	&& (sprite_exists(sprite_index))
	&& (intro_animation == "")
	&& (invincible_timer == 0)
	{
		draw_sprite_ext(sprite_index, image_index, xx + random_range(- 8, + 8), yy + random_range(- 8, + 8), draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, c_red, image_alpha * collision_mask_alpha);
	}
	else
	if (taken_damage%2 == 0)
	&& (sprite_exists(sprite_index))
	&& (intro_animation == "")
	{
		draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, image_alpha * collision_mask_alpha);
		if (hp <= 1)
		&& (max_hp >= 2)
		&& (invincible_timer == 0)
		{
			draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, c_red, 0.1);
		}
	}
	else
	if (sprite_exists(sprite_index))
	&& (intro_animation == "")
	{
		draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, 0.5);
	}
	#endregion /* Blink red when only having 1 HP left and no heart balloon END */
	
	#endregion /* Draw Self END */
	
	#region /* Draw things on top of the player */
	
	#region /* Draw Collision Mask */
	if (global.show_collision_mask)
	{
		if (crouch)
		&& (sprite_mask_crouch > 0)
		{
			draw_sprite_ext(sprite_mask_crouch, 0, x, y, image_xscale, 1, 0, c_white, 1);
		}
		else
		if (sprite_mask > 0)
		{
			draw_sprite_ext(sprite_mask, 0, x, y, image_xscale, 1, 0, c_white, 1);
		}
		draw_rectangle_color(x - 2, y, x + 2, y, c_red, c_red, c_red, c_red, false);
		draw_rectangle_color(x, y - 2, x, y + 2, c_red, c_red, c_red, c_red, false);
		collision_mask_alpha = lerp(collision_mask_alpha, 0.5, 0.01);
	}
	else
	{
		collision_mask_alpha = lerp(collision_mask_alpha, 1, 0.01);
	}
	#endregion /* Draw Collision Mask END */
	
	#region /* Turnaround Effect */
	if (effect_turnaround_subimg < 10)
	{
		if (!climb)
		&& (!horizontal_rope_climb)
		{
			draw_sprite_ext(spr_effect_turnaround, effect_turnaround_subimg, xx, yy, image_xscale, 1, angle, c_white, 0.5);
		}
		effect_turnaround_subimg ++;
	}
	#endregion /* Turnaround Effect END */
	
	#region /* Running Sparks Effect */
	if (effect_speedspark_subimg < 4)
	&& (hold_item_in_hands == "")
	{
		if (on_ground)
		&& (!climb)
		&& (!horizontal_rope_climb)
		{
			draw_sprite_ext(spr_speedspark, effect_speedspark_subimg, xx, bbox_bottom, image_xscale, 1, 0, c_white, 0.5);
		}
		effect_speedspark_subimg += 0.5;
	}
	#endregion /* Running Sparks Effect END */
	
	#region /* Invincible */
	if (!assist_invincible)
	{
		if (invincible_timer >= true)
		&& (sprite_exists(sprite_index))
		{
			invincible_blinking ++;
			if (invincible_blinking > 21)
			{
				invincible_blinking = 0;
			}
			if (invincible_blinking%20 == 0)
			{
				draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, c_black, image_alpha * collision_mask_alpha);
			}
			else
			{
				if (invincible_timer > 80)
				{
					invincible_blend = make_color_hsv((current_time * 0.1) mod 255, 127, 255);
				}
				else
				{
					invincible_blend = image_blend;
				}
				draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, invincible_blend, image_alpha * collision_mask_alpha);
			}
		}
	}
	
	if (invincible_timer >= true)
	{
		if (floor(random(10)) == 0)
		{
			effect_create_above(ef_star, x + random_range(- 50, + 50), y+ random_range(- 50, + 50), 0, c_white);
		}
	}
	#endregion /* Invincible END */
	
	#region /* Don't make it look like the player is teleporting when the player teleports */
	if (smooth_teleport < 1)
	{
		xx = lerp(xx, x, smooth_teleport);
		yy = lerp(yy, y, smooth_teleport);
		smooth_teleport += 0.1;
	}
	else
	if (stomp_spin)
	|| (spring)
	{
		xx = lerp(xx, x, 0.4);
		yy = lerp(yy, y, 0.4);
	}
	else
	{
		xx = lerp(xx, x, 1);
		yy = lerp(yy, y, 1);
	}
	#endregion /* Don't make it look like the player is teleporting when the player teleports END */
	
	#region /* Homing Attack */
	if (allow_homing_attack)
	{
		
		#region /* Homing Enemy */
		if (!on_ground)
		&& (!stick_to_wall)
		&& (!climb)
		&& (!horizontal_rope_climb)
		&& (instance_exists(obj_enemy))
		&& (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
		&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_enemy).x + 1, instance_nearest(x, y, obj_enemy).y + 1, obj_wall, false, true))
		&& (distance_to_object(obj_enemy) < homing_attack_distance)
		&& (instance_nearest(x, y, obj_enemy).bbox_bottom > y)
		&& (!instance_nearest(x, y, obj_enemy).die)
		{
			aim_image_index ++;
			draw_sprite_ext(spr_aim, aim_image_index, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, 1, 1, 0, c_white, 1);
		}
		#endregion /* Homing Enemy END */
		
		else
		
		#region /* Homing Spring */
		if (!on_ground)
		&& (!stick_to_wall)
		&& (!climb)
		&& (!horizontal_rope_climb)
		&& (instance_exists(obj_spring))
		&& (!collision_line(x, y, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, obj_wall, false, true))
		&& (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_spring).x + 1, instance_nearest(x, y, obj_spring).y + 1, obj_wall, false, true))
		&& (distance_to_object(obj_spring) < homing_attack_distance)
		&& (instance_nearest(x, y, obj_spring).bbox_bottom > y)
		{
			aim_image_index ++;
			draw_sprite_ext(spr_aim, aim_image_index, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, 1, 1, 0, c_white, 1);
		}
		#endregion /* Homing Spring END */
		
		else
		{
			aim_image_index = 0;
		}
	}
	#endregion /* Homing Attack END */
	
	#region /* Display Player Number and Name */
	if (global.playergame >= 2)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (global.player_name[player] = "")
		{
			var player_name_text = "P" + string(player);
		}
		else
		{
			var player_name_text = string(global.player_name[player]);
		}
		scr_draw_text_outlined(x, y - 64, string(player_name_text), global.default_text_size, c_black, global.player_color[player], 1);
	}
	#endregion /* Display Player Number and Name END */
	
	#region /* If player has more hp, show that */
	if (hp > 0)
	&& (global.assist_enable)
	&& (!global.assist_invincible)
	|| (hp > 0)
	&& (!global.assist_enable)
	{
		if (max_hp = 2) /* If there is only max 2 hp and there is no panting sprite, display HP */
		&& (sprite_panting == noone)
		|| (max_hp >= 3) /* If there is more than max 3 hp, always display HP */
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(x, bbox_top - 32, "HP: " + string(hp) + "/" + string(max_hp), global.default_text_size, c_white, c_black, 1);
		}
	}
	#endregion /* If player has more hp, show that END */
	
	#endregion /* Draw things on top of the player END */
	
}