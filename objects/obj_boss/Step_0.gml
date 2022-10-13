if (y > room_height + sprite_height)
{
	instance_destroy();
}
if (asset_get_type("obj_water") == asset_object)
{
	if (place_meeting(x, y, obj_water))
	{
		if (vspeed > +1)
		{
			vspeed = +1;
		}
	}
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

if (asset_get_type("obj_camera") == asset_object)
and (instance_exists(obj_camera))
and (distance_to_object(obj_camera) < 500)
and (asset_get_type("snd_music_boss") == asset_sound)
and (global.music != snd_music_boss)
and (has_seen_player == true)
{
	audio_stop_sound(global.music);
	audio_stop_sound(global.music_underwater);
	global.music = snd_music_boss;
}

if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (distance_to_object(obj_player) < 500)
and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, true, true))
and (has_seen_player == false)
{
	has_seen_player = true; /* Only see player if player is close and in line of sight */
}

#region /* If enemies are disabled, destroy this object */
if (global.assist_enable == true)
and (global.assist_enable_enemies == false)
{
	instance_destroy();
}
#endregion /* If enemies are disabled, destroy this object END */

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
{
	if (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	and (x > camera_get_view_x(view_camera[view_current]))
	and (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	and (y > camera_get_view_y(view_camera[view_current]))
	{
		gravity = 0.5; /* The gravity */
	}
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

/* Put at right angle */
if (angle < -360)
{
	angle += 16;
}
else
if (angle > +360)
{
	angle -= 16;
}
else
{
	angle = lerp(angle, 0, 0.1);
}

if (has_seen_player == true)
{
	time += 1;
}

if (takendamage > 0)
{
	takendamage -= 1;
}
if (time == room_speed * 3)
{
	if (can_jump_on_head == true)
	{
		can_jump_on_head = false;
		scr_audio_play(snd_boss_invulnerable, volume_source.sound);
	}
	image_speed = 0.3;
	mask_index = spr_boss_stand;
	sprite_index = spr_boss_stand;
}

#region /* Phase 1 */
if (hp >= 3)
and (has_seen_player == true)
{
	if (time < room_speed * 7)
	and (instance_exists(obj_player))
	{
		if (instance_nearest(x, y, obj_player).x < x)
		{
			image_xscale = -1;
		}
		else
		if (instance_nearest(x, y, obj_player).x > x)
		{
			image_xscale = +1;
		}
	}
	if (time == room_speed * 1)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == room_speed * 2)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == room_speed * 3)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == room_speed * 4)
	or (time == room_speed * 5)
	or (time == room_speed * 6)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
		}
	}
	if (time == room_speed * 7)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time == room_speed * 8)
	{
		if (image_xscale == -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale == +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and (time > room_speed * 8)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		hspeed = 0;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 8, y, obj_wall))
	and (time > room_speed * 8)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		hspeed = 0;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 1 END */

else

#region /* Phase 2 */
if (hp >= 2)
and (has_seen_player == true)
{
	if (time < room_speed * 8)
	and (instance_exists(obj_player))
	{
		if (instance_nearest(x, y, obj_player).x < x)
		{
			image_xscale = -1;
		}
		else
		if (instance_nearest(x, y, obj_player).x > x)
		{
			image_xscale = +1;
		}
	}
	if (time == room_speed * 1)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		{
			mask_index = spr_boss_stand;
			sprite_index = spr_boss_stand;
		}
	}
	if (time == room_speed * 2)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == room_speed * 3)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == room_speed * 4)
	or (time == room_speed * 5)
	or (time == room_speed * 6)
	or (time == room_speed * 7)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
		}
	}
	if (time == room_speed * 8)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time == room_speed * 9)
	{
		if (image_xscale == -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale == +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and (time > room_speed * 9)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		hspeed = 0;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 8, y, obj_wall))
	and (time > room_speed * 9)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		hspeed = 0;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 2 END */

else

#region /* Phase 3 */
if (has_seen_player == true)
{
	if (time < room_speed * 9)
	{
		if (instance_exists(obj_player))
		{
			if (instance_nearest(x, y, obj_player).x < x)
			{
				image_xscale = -1;
			}
			else
			if (instance_nearest(x, y, obj_player).x > x)
			{
				image_xscale = +1;
			}
		}
	}
	if (time == room_speed * 1)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		{
			mask_index = spr_boss_stand;
			sprite_index = spr_boss_stand;
		}
	}
	if (time == room_speed * 2)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == room_speed * 3)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == room_speed * 4)
	or (time == room_speed * 5)
	or (time == room_speed * 6)
	or (time == room_speed * 7)
	or (time == room_speed * 8)
	{
		if (can_jump_on_head == true)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
		}
	}
	if (time == room_speed * 9)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time == room_speed * 10)
	{
		if (image_xscale == -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale == +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and (time > room_speed * 10)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		hspeed = 0;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 8, y, obj_wall))
	and (time > room_speed * 10)
	and (can_jump_on_head == false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = true;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		hspeed = 0;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 3 END */

if (place_meeting(x, y + 1, obj_wall))
and (vspeed >= 0)
and (flying_back == true)
{
	hspeed = 0;
	vspeed = 0;
	mask_index = spr_boss_vulnerable;
	sprite_index = spr_boss_vulnerable;
	time = -100;
	image_speed = 0.5;
	flying_back = false;
}

if (sprite_index == spr_boss_throw)
and (image_index > image_number - 1)
{
	mask_index = spr_boss_stand;
	sprite_index = spr_boss_stand;
	image_index = 0;
}

if (hp <= 0)
{
	if (time == room_speed * 3 - 1)
	or (takendamage == 0)
	{
		effect_create_above(ef_smoke, x - 32, y, 2, c_white);
		effect_create_above(ef_smoke, x - 42, y + 32, 2, c_white);
		effect_create_above(ef_smoke, x - 32, y + 64, 2, c_white);

		effect_create_above(ef_smoke, x, y, 2, c_white);
		effect_create_above(ef_smoke, x, y + 32, 2, c_white);
		effect_create_above(ef_smoke, x, y + 64, 2, c_white);

		effect_create_above(ef_smoke, x + 32, y, 2, c_white);
		effect_create_above(ef_smoke, x + 42, y + 32, 2, c_white);
		effect_create_above(ef_smoke, x + 32, y + 64, 2, c_white);

		/* 1 Coin */
		if asset_get_type("obj_basic_collectible") == asset_object
		{
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
		}
		/* 200 Score */
		score += 200;
		if (asset_get_type("obj_score_up") == asset_object)
		{
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 200;
			}
		}
		scr_audio_play(snd_boss_defeated, volume_source.sound);
		instance_destroy();
	}
}

if (takendamage == 50)
{
	scr_audio_play(snd_boss_invulnerable, volume_source.sound);
}

#region /* Kill enemy if it's inside the wall */
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
if (stuck_in_wall_counter > 0)
{
	stuck_in_wall_counter -= 1;
}
#endregion /* Kill enemy if it's inside the wall END */