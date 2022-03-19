#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}
if (asset_get_type("obj_semisolid_platform") == asset_object)
{
	if (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(x, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_left, bbox_bottom + 4, obj_semisolid_platform))

	or(position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 2, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 3, obj_semisolid_platform))
	or(position_meeting(bbox_right, bbox_bottom + 4, obj_semisolid_platform))
	{
		gravity = 0;
	}
}
#endregion /*Set the gravity END*/

if (cutscene = 0)
{
	time += 1;
	if (time >= room_speed* 2.3)
	{
		if (place_meeting(x + 1, y, obj_wall))
		{
			sprite_index = global.resourcepack_sprite_basic_enemy;
			hspeed = 0;
			image_xscale = -1;
		}
		else
		{
			sprite_index = global.resourcepack_sprite_basic_enemy_angry;
			hspeed = +7;
			image_xscale = +1;
			visible = true;
		}
	}
}
else
if (cutscene = 1) /*When placed in level, use this cutscene value*/
{
	if (global.character_select_in_this_menu = "main_game")
	{
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		if (ini_read_real("Player", "beat_last_level", false) = true)
		{
			instance_destroy();
		}
		ini_close();
	}
	if (instance_exists(obj_player))
	and (distance_to_object(obj_player) < 256)
	or (instance_exists(obj_player))
	and (instance_nearest(x, y, obj_player).bbox_right >= bbox_left)
	and (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	{
		time += 30;
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= 1)
	and (!place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		hspeed = +12;
		image_xscale = +1;
	}
}
else
if (cutscene = 2)
{
	time += 1;
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= room_speed* 2)
	and (!place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		hspeed = +7;
		image_xscale = +1;
	}
}

if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 16)
and (cutscene != 1)
{
	instance_destroy();
}

if (instance_exists(obj_player))
and (place_meeting(x, y, obj_player))
and (instance_nearest(x, y, obj_player).intro_animation = "")
and (cutscene != 1)
{
	with (instance_create_depth(x, y, 0, obj_basic_enemy))
	{
		image_xscale = -1;
		
		#region /*Enemy Voice Defeated*/
		audio_play_sound(choose(enemyvoice_defeated1,enemyvoice_defeated2,enemyvoice_defeated3), 0, 0);
		audio_sound_gain(enemyvoice_defeated1, global.voices_volume * global.main_volume, 0);
		audio_sound_gain(enemyvoice_defeated2, global.voices_volume * global.main_volume, 0);
		audio_sound_gain(enemyvoice_defeated3, global.voices_volume * global.main_volume, 0);
		#endregion /*Enemy Voice Defeated END*/
		
		if (asset_get_type("snd_stomp") == asset_sound)
		{
			audio_play_sound(snd_stomp, 0, 0);
			audio_sound_gain(snd_stomp, global.sound_volume * global.main_volume, 0);
			audio_sound_pitch(snd_stomp, 1);
		}
		
		flat = true;
		die = true;
	}
	
	if (instance_nearest(x, y, obj_player).key_jump_hold)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (simple_controls = false)
			{
				vspeed = -triple_jump_height;
			}
			else
			{
				vspeed = - 8;
			}
		}
	}
	else
	{
		instance_nearest(x, y, obj_player).vspeed = - 8;
	}
	
	instance_destroy();
}