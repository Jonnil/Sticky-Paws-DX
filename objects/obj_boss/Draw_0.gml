if (distance_to_object(obj_camera)<500)
if (global.music != snd_music_boss)
{
	audio_stop_sound(global.music);
	audio_stop_sound(global.music_underwater);
	global.music = snd_music_boss;
}

depth = + 10;

#region /*If enemies are disabled, destroy this object*/
if (global.activate_cheats = true)
and (global.enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

#region /*Set the gravity*/
gravity_direction=270;/*Direction of the gravity*/
if (asset_get_type("obj_wall")==asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
and (!position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
{
	if (x < camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
	and (x > camera_get_view_x(view_camera[view_current]))
	and (y < camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
	and (y > camera_get_view_y(view_camera[view_current]))
	{
		gravity = 0.5; /*The gravity*/
	}
}
else
{
	gravity = 0;
}
#endregion /*Set the gravity END*/

/*Put at right angle*/
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
time += 1;

if (takendamage > 0)
{
	takendamage -= 1;
}
if (time = room_speed * 3)
{
	if (can_jump_on_head = true)
	{
		can_jump_on_head = false;
		if (asset_get_type("snd_boss_invulnerable") == asset_sound)
		{
			audio_play_sound(snd_boss_invulnerable, 0, 0);
			audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
		}
	}
	image_speed = 0.3;
	mask_index = spr_boss_stand;
	sprite_index = spr_boss_stand;
}

/*Phase 1*/
if (hp >= 3)
{
	if (time < room_speed * 7)
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
	if (time = room_speed * 1)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		{
			mask_index = spr_boss_stand;
			sprite_index = spr_boss_stand;
		}
	}
	if (time = room_speed * 2)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		if (asset_get_type("snd_boss_voice_laugh") == asset_sound)
		{
			audio_play_sound(snd_boss_voice_laugh, 0, 0);
			audio_sound_gain(snd_boss_voice_laugh, global.voices_volume, 0);
		}
	}
	if (time = room_speed * 3)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time = room_speed * 4)
	or(time = room_speed * 5)
	or(time = room_speed * 6)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, +64), 0, obj_arrow);
		}
	}
	if (time = room_speed * 7)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time = room_speed * 8)
	{
		if (image_xscale = -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale = +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and(time > room_speed * 8)
	and(can_jump_on_head = false)
	{
		if asset_get_type("obj_camera") == asset_object
		and(instance_exists(obj_camera))
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
	and(time > room_speed * 8)
	and(can_jump_on_head = false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		and(instance_exists(obj_camera))
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

/*Phase 2*/
else
if (hp >= 2)
{
	if (time < room_speed * 8)
	and(instance_exists(obj_player))
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
	if (time = room_speed * 1)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		{
			mask_index = spr_boss_stand;
			sprite_index = spr_boss_stand;
		}
	}
	if (time = room_speed * 2)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		if (asset_get_type("snd_boss_voice_laugh") == asset_sound)
		{
			audio_play_sound(snd_boss_voice_laugh, 0, 0);
			audio_sound_gain(snd_boss_voice_laugh, global.voices_volume, 0);
		}
	}
	if (time = room_speed * 3)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time = room_speed * 4)
	or(time = room_speed * 5)
	or(time = room_speed * 6)
	or(time = room_speed * 7)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, +64), 0, obj_arrow);
		}
	}
	if (time = room_speed * 8)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time = room_speed * 9)
	{
		if (image_xscale = -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale = +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and(time > room_speed * 9)
	and(can_jump_on_head = false)
	{
		if asset_get_type("obj_camera") == asset_object
		and(instance_exists(obj_camera))
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
	and(time > room_speed * 9)
	and(can_jump_on_head = false)
	{
		if asset_get_type("obj_camera") == asset_object
		and(instance_exists(obj_camera))
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

/*Phase 3*/
else
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
	if (time = room_speed * 1)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		{
			mask_index = spr_boss_stand;
			sprite_index = spr_boss_stand;
		}
	}
	if (time = room_speed * 2)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_laugh;
		if (asset_get_type("snd_boss_voice_laugh") == asset_sound)
		{
			audio_play_sound(snd_boss_voice_laugh, 0, 0);
			audio_sound_gain(snd_boss_voice_laugh, global.voices_volume, 0);
		}
	}
	if (time = room_speed * 3)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_stand;
	}
	if (time = room_speed * 4)
	or(time = room_speed * 5)
	or(time = room_speed * 6)
	or(time = room_speed * 7)
	or(time = room_speed * 8)
	{
		if (can_jump_on_head = true)
		{
			can_jump_on_head = false;
			if (asset_get_type("snd_boss_invulnerable") == asset_sound)
			{
				audio_play_sound(snd_boss_invulnerable, 0, 0);
				audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
			}
		}
		image_speed = 0.3;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_throw;
		if (asset_get_type("obj_arrow") == asset_object)
		{
			instance_create_depth(x, y + random_range(0, +64), 0, obj_arrow);
		}
	}
	if (time = room_speed * 9)
	{
		image_speed = 1;
		mask_index = spr_boss_stand;
		sprite_index = spr_boss_start_running;
	}
	if (time = room_speed * 10)
	{
		if (image_xscale = -1)
		{
			image_xscale = -1;
			hspeed = -16;
		}
		else
		if (image_xscale = +1)
		{
			image_xscale = +1;
			hspeed = +16;
		}
	}
	if (place_meeting(x - 8, y, obj_wall))
	and(time > room_speed * 10)
	and(can_jump_on_head = false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.shake = 10;
			}
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
	and(time > room_speed * 10)
	and(can_jump_on_head = false)
	{
		if (asset_get_type("obj_camera") == asset_object)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.shake = 10;
			}
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

if (place_meeting(x, y + 1, obj_wall))
and(vspeed >= 0)
and(flying_back = true)
{
	hspeed = 0;
	vspeed = 0;
	mask_index = spr_boss_vulnerable;
	sprite_index = spr_boss_vulnerable;
	time = -100;
	image_speed = 0.5;
	flying_back = false;
}

if (sprite_index = spr_boss_throw)
and(image_index > image_number - 1)
{
	mask_index = spr_boss_stand;
	sprite_index = spr_boss_stand;
	image_index = 0;
}

/*Draw Self*/
draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
redblinktimer += 1;
if (redblinktimer > 60)
{
	redblinktimer = 0;
}
if (redblinktimer > 55)
and(hp <= 1)
{
	draw_sprite_ext(sprite_index, image_index, x + random_range(-8, +8), y + random_range(-8, +8), draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, image_alpha);
}
else
{
	if (takendamage % 2 == 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, image_blend, image_alpha);
	}
	else
	{
		draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, image_blend, 0.5);
	}
	if (hp = 2)
	{
		if (takendamage % 2 == 0)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.25);
		}
		else
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.1);
		}
	}
	if hp <= 1
	{
		if takendamage % 2 == 0
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.5);
		}
		else
		{
			draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, angle, c_red, 0.1);
		}
	}
}
if asset_get_type("spr_arrow_boss") == asset_sprite
{
	if can_jump_on_head = true
	{
		draw_sprite_ext(spr_arrow_boss, image_index, x, y - 32, image_xscale, image_yscale, 0, image_blend, 1);
	}
}

if (hp <= 0)
{
	if (time = room_speed * 3 - 1)
	or(takendamage = 0)
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

		/*1 Coin*/
		if asset_get_type("obj_basic_collectible") == asset_object
		{
			var obj;
			obj = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
		/*200 Score*/
		score += 200;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			obj = instance_create_depth(x, y, 0, obj_scoreup);
			with(obj)
			{
				scoreup = 200;
			}
		}
		if (asset_get_type("snd_boss_defeated") == asset_sound)
		{
			audio_play_sound(snd_boss_defeated, 0, 0);
			audio_sound_gain(snd_boss_defeated, global.sfx_volume, 0);
		}
		instance_destroy();
	}
}

if (takendamage = 50)
{
	if (asset_get_type("snd_boss_invulnerable") == asset_sound)
	{
		audio_play_sound(snd_boss_invulnerable, 0, 0);
		audio_sound_gain(snd_boss_invulnerable, global.sfx_volume, 0);
	}
}

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x,y,obj_wall))
and(die = false)
and(draw_xscale>=0.8)
{
	flat = false;
	die = true;
	die_volting = true;
}
#endregion /*Kill enemy if it's inside the wall END*/