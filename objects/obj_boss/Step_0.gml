var boss_speed = 60;

if (place_meeting(x, y, obj_water))
{
	if (vspeed > 1)
	{
		vspeed = 1;
	}
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);

var nearest_player = instance_nearest(x, y, obj_player);

if (has_seen_player
&& global.music_boss == noone
&& instance_exists(obj_camera)
&& distance_to_object(obj_camera) < 500)
{
	audio_stop_sound(global.music);
	audio_stop_sound(global.music_underwater);
	global.music_boss = snd_music_boss;
}

if (!has_seen_player
&& instance_exists(obj_player)
&& distance_to_object(obj_player) < 500
&& !collision_line(x, y, nearest_player.x, nearest_player.y, obj_wall, true, true))
{
	has_seen_player = true; /* Only see player if player is close and in line of sight */
}

#region /* Set the gravity */
var view_x = camera_get_view_x(view_get_camera(view_current));
var view_y = camera_get_view_y(view_get_camera(view_current));
var view_width = camera_get_view_width(view_get_camera(view_current));
var view_height = camera_get_view_height(view_get_camera(view_current));

if (!place_meeting(x, y + 1, obj_wall) &&
	!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform) &&
	!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform) &&
	!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform) &&
	x < view_x + view_width && x > view_x && y < view_y + view_height && y > view_y)
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

/* Put at right angle */
if (angle < -360 || angle > 360)
{
	angle += 16 * sign(angle);
}
else
{
	angle = lerp(angle, 0, 0.1);
}

if (has_seen_player)
&& (hp > 0)
{
	time++;
}

taken_damage = max(0, taken_damage - 1);

if (time == boss_speed * 3)
{
	if (can_jump_on_head)
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
&& (has_seen_player)
&& (flying_back == 0)
{
	if (time < boss_speed * 7)
	&& (instance_exists(obj_player))
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
	if (time == boss_speed)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == boss_speed * 2)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == boss_speed * 3)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == boss_speed * 4)
	|| (time == boss_speed * 5)
	|| (time == boss_speed * 6)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
	}
	if (time == boss_speed * 7)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time >= boss_speed * 8)
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
	if (place_meeting(x - 16, y, obj_wall))
	&& (time > boss_speed * 8)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 16, y, obj_wall))
	&& (time > boss_speed * 8)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 1 END */

else

#region /* Phase 2 */
if (hp >= 2)
&& (has_seen_player)
&& (flying_back == 0)
{
	if (time < boss_speed * 8)
	&& (instance_exists(obj_player))
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
	if (time == boss_speed)
	{
		if (can_jump_on_head)
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
	if (time == boss_speed * 2)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == boss_speed * 3)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == boss_speed * 4)
	|| (time == boss_speed * 5)
	|| (time == boss_speed * 6)
	|| (time == boss_speed * 7)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
	}
	if (time == boss_speed * 8)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time == boss_speed * 9)
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
	if (place_meeting(x - 16, y, obj_wall))
	&& (time > boss_speed * 9)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 16, y, obj_wall))
	&& (time > boss_speed * 9)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 2 END */

else

#region /* Phase 3 */
if (has_seen_player)
&& (flying_back == 0)
{
	if (time < boss_speed * 9)
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
	if (time == boss_speed)
	{
		if (can_jump_on_head)
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
	if (time == boss_speed * 2)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		scr_audio_play(snd_boss_voice_laugh, volume_source.voice);
	}
	if (time == boss_speed * 3)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time == boss_speed * 4)
	|| (time == boss_speed * 5)
	|| (time == boss_speed * 6)
	|| (time == boss_speed * 7)
	|| (time == boss_speed * 8)
	{
		if (can_jump_on_head)
		{
			can_jump_on_head = false;
			scr_audio_play(snd_boss_invulnerable, volume_source.sound);
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		instance_create_depth(x, y + random_range(0, + 8), 0, obj_arrow);
	}
	if (time == boss_speed * 9)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time == boss_speed * 10)
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
	if (place_meeting(x - 16, y, obj_wall))
	&& (time > boss_speed * 10)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = +90;
		vspeed = -10;
		hspeed = +5;
	}
	else
	if (place_meeting(x + 16, y, obj_wall))
	&& (time > boss_speed * 10)
	&& (!can_jump_on_head)
	{
		if (instance_exists(obj_camera))
		{
			obj_camera.shake = 10;
		}
		flying_back = 10;
		can_jump_on_head = true;
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_vulnerable;
		angle = -90;
		vspeed = -10;
		hspeed = -5;
	}
}
#endregion /* Phase 3 END */

if (sprite_index == spr_boss_throw)
&& (image_index > image_number - 1)
{
	mask_index = spr_boss_stand;
	sprite_index = spr_boss_stand;
	image_index = 0;
}

if (hp <= 0)
{
	if (time == boss_speed * 3 - 1)
	|| (taken_damage == 0)
	{
		effect_create_depth(depth - 1, ef_smoke, x - 32, y, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x - 42, y + 32, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x - 32, y + 64, 2, c_white);

		effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x, y + 32, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x, y + 64, 2, c_white);

		effect_create_depth(depth - 1, ef_smoke, x + 32, y, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x + 42, y + 32, 2, c_white);
		effect_create_depth(depth - 1, ef_smoke, x + 32, y + 64, 2, c_white);

		scr_different_items_inside(bbox_top);

		if (!empty)
		{
			/* 1 Coin */
			with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
			}
			/* 200 Score */
			score += 200;
			with(instance_create_depth(x, y, 0, obj_score_up))
			{
				score_up = 200;
			}
		}
		scr_audio_play(snd_boss_defeated, volume_source.sound);
		instance_destroy();
	}
}

if (taken_damage == 50)
{
	scr_audio_play(snd_boss_invulnerable, volume_source.sound);
}

if (flying_back > 2)
{
	if (hspeed < 0)
	{
		hspeed = -5;
		vspeed = -10;
	}
	else
	{
		hspeed = +5;
		vspeed = -10;
	}
}
if (flying_back > 1)
{
	flying_back--;
}
