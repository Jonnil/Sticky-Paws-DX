var view_left = camera_get_view_x(view_camera[view_current]) - 42;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 42;
var view_top = camera_get_view_y(view_camera[view_current]) - 42;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 42;
var get_room_speed = room_speed;

if (x > view_right)
&& (hspeed > 0)
|| (x < view_left)
&& (hspeed < 0)
|| (y > view_bottom)
&& (vspeed > 0)
|| (y < view_top)
&& (vspeed < 0)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
	friction = 500;
}
else
{
	friction = 0;
}

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (asset_get_type("obj_wall") == asset_object)
&& (!place_meeting(x, y + 1, obj_wall))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
if (asset_get_type("obj_semisolid_platform") == asset_object)
{
	if (position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(x, bbox_bottom + 2, obj_semisolid_platform))
	|| (position_meeting(x, bbox_bottom + 3, obj_semisolid_platform))
	|| (position_meeting(x, bbox_bottom + 4, obj_semisolid_platform))

	|| (position_meeting(bbox_left, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 2, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 3, obj_semisolid_platform))
	|| (position_meeting(bbox_left, bbox_bottom + 4, obj_semisolid_platform))

	|| (position_meeting(bbox_right, bbox_bottom + 1, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 2, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 3, obj_semisolid_platform))
	|| (position_meeting(bbox_right, bbox_bottom + 4, obj_semisolid_platform))
	{
		gravity = 0;
	}
}
#endregion /* Set the gravity END */

if (cutscene == 0)
{
	time ++;
	if (time >= get_room_speed * 2.3)
	{
		if (place_meeting(x + 1, y, obj_wall))
		{
			sprite_index = global.resource_pack_sprite_basic_enemy;
			hspeed = 0;
			image_xscale = -1;
		}
		else
		{
			sprite_index = global.resource_pack_sprite_basic_enemy_angry;
			hspeed = +7;
			image_xscale = +1;
			visible = true;
		}
	}
}
else
if (cutscene == 1) /* When placed in level, use this cutscene value */
{
	if (global.character_select_in_this_menu == "main_game")
	{
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		if (ini_read_real("Player", "beat_last_level", false))
		{
			instance_destroy();
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
	if (instance_exists(obj_player))
	&& (distance_to_object(obj_player) < 256)
	|| (instance_exists(obj_player))
	&& (instance_nearest(x, y, obj_player).bbox_right >= bbox_left)
	&& (!collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
	{
		time += 30;
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= 1)
	&& (!place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy_angry;
		hspeed = +12;
		image_xscale = +1;
	}
}
else
if (cutscene = 2)
{
	time ++;
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= get_room_speed * 2)
	&& (!place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy_angry;
		hspeed = +7;
		image_xscale = +1;
	}
}

if (instance_exists(obj_player))
&& (place_meeting(x, y, obj_player))
&& (instance_nearest(x, y, obj_player).intro_animation = "")
&& (cutscene != 1)
{
	with (instance_create_depth(x, y, 0, obj_basic_enemy))
	{
		image_xscale = -1;
		if (instance_exists(obj_player))
		{
			scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
		}
		
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
		
		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, volume_source.sound);
		
		flat = true;
		die = true;
	}
	
	if (instance_nearest(x, y, obj_player).key_jump_hold)
	{
		with(instance_nearest(x, y, obj_player))
		{
			if (simple_controls == false)
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