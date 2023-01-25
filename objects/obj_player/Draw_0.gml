/* ________________________________Draw Event________________________________ */

/* Don't remove this, please, it's for debug */
//draw_line_width_color(x, y, obj_follow_mouse.x, obj_follow_mouse.y, 2, c_blue, c_red);
//scr_draw_text_outlined(obj_follow_mouse.x, obj_follow_mouse.y, string(global.iris_zoom_in), global.default_text_size, c_white, c_red, 1);

#region /* Draw things underneath the player */

#region /* Draw Raycasts */
if (hold_item_in_hands != "")
and (key_up)
{
	if (instance_exists(obj_wall))
	{
		if (!position_meeting(xx + 32 * image_xscale, yy, obj_wall))
		{
			raycast_info = scr_raycast(xx + 32 * image_xscale, yy, 90, 380, 16, obj_wall);
		}
		else
		{
			raycast_info = scr_raycast(xx, yy, 90, 380, 16, obj_wall);
		}
	}
	if (raycast_info == noone)
	{
		return;
	}
	if (raycast_info.type != rc_type.nothing)
	{
		draw_set_color(c_red);
		draw_circle(raycast_info.x, raycast_info.y, 2, false);
		draw_set_color(c_green);
	}
	else
	{
		draw_set_color(c_yellow);
	}
	if (!position_meeting(xx + 32 * image_xscale, yy, obj_wall))
	{
		draw_line_width(xx + 32 * image_xscale, yy, raycast_info.x, raycast_info.y, 2);
	}
	else
	{
		draw_line_width(xx, yy, raycast_info.x, raycast_info.y, 2);
	}
}
#endregion /* Draw Raycasts END */

#region /* Heart above head */
if (asset_get_type("spr_heart") == asset_sprite)
and (have_heart_balloon == true)
{
	if (asset_get_type("obj_horizontal_rope") == asset_object)
	and (place_meeting(x, y - 1, obj_horizontal_rope))
	and (horizontal_rope_climb == true)
	and (key_up)
	and (!key_down)
	and (!place_meeting(x, y - 16, obj_wall))
	and (!place_meeting(x, y - 32, obj_wall))
	and (!place_meeting(x, y - 48, obj_wall))
	and (!place_meeting(x, y - 64, obj_wall))
	{
		xx_heart = lerp(xx_heart, x, 0.1);
		yy_heart = lerp(yy_heart, y + 32, 0.1);
	}
	if (takendamage %2 == 0)
	{
		draw_set_alpha(image_alpha);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 6, c_black, c_black);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 3, c_white, c_white);
		draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, 0, c_white, image_alpha);
	}
	else
	{
		draw_set_alpha(image_alpha * 0.3);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 6, c_black, c_black);
		draw_line_width_color(xx, yy, xx_heart, yy_heart, 3, c_white, c_white);
		draw_set_alpha(image_alpha);
		draw_sprite_ext(spr_heart, 0, xx_heart, yy_heart, 1, 1, 0, c_white, image_alpha * 0.3);
	}
}

if (have_heart_balloon == false)
and (asset_get_type("obj_heart_balloon") == asset_object)
and (instance_exists(obj_heart_balloon))
and (distance_to_object(obj_heart_balloon) < 32)
{
	xx_heart = lerp(xx_heart, instance_nearest(x, y, obj_heart_balloon).x, 1);
	yy_heart = lerp(yy_heart, instance_nearest(x, y, obj_heart_balloon).y, 1);
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
		and (sprite_index != sprite_vine_stay)
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
		and (sprite_index != sprite_vine_stay)
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
	
	if (assist_invincible == false)
	and (invincible_timer >= true)
	{
		if (invincible_blinking%20 == 0)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, c_black, draw_arrow_outside_view_up_alpha);
		}
		else
		if (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, image_blend, draw_arrow_outside_view_up_alpha);
		}
	}
	else
	if (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, image_blend, draw_arrow_outside_view_up_alpha);
	}
}
#endregion /* Draw arrow when player is outside top view END */

#region /* Draw arrow when player is outside bottom view */
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (y < room_height)
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
	
	if (assist_invincible == false)
	and (invincible_timer >= true)
	{
		if (invincible_blinking%20 == 0)
		and (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, c_black, draw_arrow_outside_view_down_alpha);
		}
		else
		if (sprite_index > 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, image_blend, draw_arrow_outside_view_down_alpha);
		}
	}
	else
	if (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32, draw_xscale * default_xscale / 2 * sign(image_xscale), draw_yscale * default_yscale / 2, angle, image_blend, draw_arrow_outside_view_down_alpha);
	}
}
#endregion /* Draw arrow when player is outside bottom view END */

#endregion /* Draw things underneath the player END */

#region /* Draw Self */

#region /* Draw intro animation sprites (cutscene) if intro is playing */
if (intro_animation != "")
and (intro_animation_sprite > 0)
{
	draw_sprite_ext(intro_animation_sprite, intro_animation_image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, 1);
}
#endregion /* Draw intro animation sprites (cutscene) if intro is playing END */

#region /* Make it obvious if you take damage */
if (takendamage >= takendamage_freezetime)
{
	dive = false;
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	if (sprite_die > noone)
	and (intro_animation = "")
	{
		sprite_index = sprite_die;
	}
	else
	if (intro_animation = "")
	{
		if (sprite_stand > noone){sprite_index = sprite_stand;}else
		{sprite_index = sprite_walk;}
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
if (takendamage >= 100)
and (die = false)
and (hp >= 1)
{
	audio_sound_pitch(voice_damage, default_voice_pitch);
	scr_audio_play(voice_damage, volume_source.voice);
}
#endregion /* Make it obvious if you take damage END */

#region /* Red blink timer */
redblinktimer += 1;
if (redblinktimer > 30)
{
	redblinktimer = 0;
}
if (midair_jumps_left == 0)
and (number_of_jumps > 1)
{
	double_jump_depleted_blink += 1;
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
if (redblinktimer > 25)
and (have_heart_balloon = false)
and (hp <= 1)
and (max_hp >= 2)
and (sprite_index > 0)
and (intro_animation = "")
and (invincible_timer <= false)
{
	draw_sprite_ext(sprite_index, image_index, xx + random_range(- 8, + 8), yy + random_range(- 8, + 8), draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, c_red, image_alpha * collision_mask_alpha);
}
else
if (takendamage%2 == 0)
and (sprite_index > 0)
and (intro_animation = "")
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, image_alpha * collision_mask_alpha);
	if (hp <= 1)
	and (max_hp >= 2)
	and (invincible_timer <= false)
	{
		draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, c_red, 0.1);
	}
}
else
if (sprite_index > 0)
and (intro_animation = "")
{
	draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, 0.5);
}
#endregion /* Blink red when only having 1 HP left and no heart balloon END */

#endregion /* Draw Self END */

#region /* Draw things on top of the player */

#region /* Draw Collision Mask */
if (global.show_collision_mask == true)
{
	if (crouch == true)
	and (sprite_mask_crouch > 0)
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
	draw_line_width_color( x, y, scr_line_trace( x, y, x + hspeed, y + vspeed, 1).x_hit, scr_line_trace( x, y, x + hspeed, y + vspeed, 1).y_hit, 5, c_aqua, c_red);
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
	if (climb == false)
	and (horizontal_rope_climb == false)
	and (asset_get_type("spr_effect_turnaround") == asset_sprite)
	{
		draw_sprite_ext(spr_effect_turnaround, effect_turnaround_subimg, xx, yy, image_xscale, 1, angle, c_white, 0.5);
	}
	effect_turnaround_subimg += 1;
}
#endregion /* Turnaround Effect END */

#region /* Running Sparks Effect */
if (effect_speedspark_subimg < 4)
and (hold_item_in_hands == "")
{
	if (place_meeting(x, y + 1, obj_wall))
	or (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	{
		if (climb == false)
		and (horizontal_rope_climb == false)
		and (asset_get_type("spr_speedspark") == asset_sprite)
		{
			draw_sprite_ext(spr_speedspark, effect_speedspark_subimg, xx, bbox_bottom, image_xscale, 1, 0, c_white, 0.5);
		}
	}
	effect_speedspark_subimg += 1;
}
#endregion /* Running Sparks Effect END */

#region /* Invinsible */
if (assist_invincible == false)
{
	if (invincible_timer >= true)
	and (sprite_index > 0)
	{
		invincible_blinking += 1;
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
			draw_sprite_ext(sprite_index, image_index, xx, yy, draw_xscale * default_xscale * sign(image_xscale), draw_yscale * default_yscale, angle, image_blend, image_alpha * collision_mask_alpha);
		}
	}
}

if (invincible_timer >= true)
{
	if (floor(random(10 - 1)) == 0)
	{
		effect_create_above(ef_star, x + random_range(- 50, + 50), y+ random_range(- 50, + 50), 0, c_white);
	}
}
#endregion /* Invinsible END */

#region /* Don't make it look like the player is teleporting when the player teleports */
if (smooth_teleport < 1)
{
	xx = lerp(xx, x, smooth_teleport);
	yy = lerp(yy, y, smooth_teleport);
	smooth_teleport += 0.1;
}
else
if (stomp_spin == true)
or (spring == true)
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
if (allow_homing_attack == true)
{
	
	#region /* Homing Enemy */
	if (asset_get_type("obj_wall") == asset_object)
	and (!place_meeting(x, y + 1, obj_wall))
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (stick_to_wall == false)
	and (climb == false)
	and (horizontal_rope_climb == false)
	and (asset_get_type("obj_enemy") == asset_object)
	and (instance_exists(obj_enemy))
	and (!collision_line(x, y, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, obj_wall, false, true))
	and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_enemy).x + 1, instance_nearest(x, y, obj_enemy).y + 1, obj_wall, false, true))
	and (distance_to_object(obj_enemy) < homing_attack_distance)
	and (instance_nearest(x, y, obj_enemy).bbox_bottom > y)
	and (instance_nearest(x, y, obj_enemy).die = false)
	{
		aim_image_index += 1;
		if (asset_get_type("spr_aim") == asset_sprite)
		{
			draw_sprite_ext(spr_aim, aim_image_index, instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_circle_color(instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).y, 32, c_lime, c_lime, true);
		}
	}
	#endregion /* Homing Enemy END */
	
	else
	
	#region /* Homing Spring */
	if (asset_get_type("obj_wall") == asset_object)
	and (asset_get_type("obj_semisolid_platform") == asset_object)
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	and (!place_meeting(x, y + 1, obj_wall))
	and (stick_to_wall == false)
	and (climb == false)
	and (horizontal_rope_climb == false)
	and (asset_get_type("obj_spring") == asset_object)
	and (instance_exists(obj_spring))
	and (!collision_line(x, y, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, obj_wall, false, true))
	and (!collision_line(x + 1, y + 1, instance_nearest(x, y, obj_spring).x + 1, instance_nearest(x, y, obj_spring).y + 1, obj_wall, false, true))
	and (distance_to_object(obj_spring) < homing_attack_distance)
	and (instance_nearest(x, y, obj_spring).bbox_bottom > y)
	{
		aim_image_index += 1;
		if (asset_get_type("spr_aim") == asset_sprite)
		{
			draw_sprite_ext(spr_aim, aim_image_index, instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_circle_color(instance_nearest(x, y, obj_spring).x, instance_nearest(x, y, obj_spring).y, 32, c_lime, c_lime, true);
		}
	}
	#endregion /* Homing Spring END */

	else
	{
		aim_image_index = 0;
	}
}
#endregion /* Homing Attack END */

#region /* Display Player Number and Name */
if (global.player1_can_play == true)
and (global.player2_can_play == true)
or (global.player1_can_play == true)
and (global.player3_can_play == true)
or (global.player1_can_play == true)
and (global.player4_can_play == true)
or (global.player2_can_play == true)
and (global.player3_can_play == true)
or (global.player2_can_play == true)
and (global.player4_can_play == true)
or (global.player3_can_play == true)
and (global.player4_can_play == true)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (player == 1)
	{
		if (global.player1_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P1", global.default_text_size, c_black, global.player1_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player1_name), global.default_text_size, c_black, global.player1_color, 1);
		}
	}
	if (player == 2)
	{
		if (global.player2_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P2", global.default_text_size, c_black, global.player2_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player2_name), global.default_text_size, c_black, global.player2_color, 1);
		}
	}
	if (player == 3)
	{
		if (global.player3_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P3", global.default_text_size, c_black, global.player3_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player3_name), global.default_text_size, c_black, global.player3_color, 1);
		}
	}
	if (player == 4)
	{
		if (global.player4_name = "")
		{
			scr_draw_text_outlined(x, y - 64, "P4", global.default_text_size, c_black, global.player4_color, 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player4_name), global.default_text_size, c_black, global.player4_color, 1);
		}
	}
}
#endregion /* Display Player Number and Name END */

#region /* If player has more hp, show that */
if (hp > 0)
and (global.assist_enable == true)
and (global.assist_invincible = false)
or (hp > 0)
and (global.assist_enable == false)
{
	if (max_hp = 2) /* If there is only max 2 hp and there is no panting sprite, display HP */
	and (sprite_panting == noone)
	or (max_hp >= 3) /* If there is more than max 3 hp, always display HP */
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x, bbox_top - 32, "HP: " + string(hp) + "/" + string(max_hp), global.default_text_size, c_white, c_black, 1);
	}
}
#endregion /* If player has more hp, show that END */

#endregion /* Draw things on top of the player END */