#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay -= 1;
}

count += 1;

#region /* Check if the last player just died */
if (count == 1)
and (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
{
	last_player = true;
}
#endregion /* Check if the last player just died END */

#region /* Start death animation, falling off screen */
if (count = 50)
{
	gravity_direction = 270;
	gravity = 0.5;
	vspeed = - 10;
	image_speed = 0.3;
	if (asset_get_type("obj_lava") == asset_object)
	and (place_meeting(x, y, obj_lava))
	{
		if (asset_get_type("spr_player_burnt") == asset_sprite)
		{
			sprite_index = spr_player_burnt;
		}
		audio_sound_pitch(voice_burned_die, default_voice_pitch);
		scr_audio_play(voice_burned_die, volume_source.voice);
	}
	else
	{
		audio_sound_pitch(voice_damage, default_voice_pitch);
		scr_audio_play(voice_damage, volume_source.voice);
	}
}
#endregion /* Start death animation, falling off screen END */

#region /* If the player is burned, have black smoke coming out */
if (asset_get_type("spr_player_burnt") == asset_sprite)
and (sprite_index = spr_player_burnt)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
}
#endregion /* If the player is burned, have black smoke coming out END */

#region /* Play death melody */
if (!instance_exists(obj_player))
and (count = 50)
and (last_player == true)
{
	scr_audio_play(player_lose_melody, volume_source.melody);
}
#endregion /* Play death melody END */

#region /* Limit the vertical speed */
if (vspeed >+ 32)
{
	vspeed = +32
}
#endregion /* Limit the vertical speed END */

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (!instance_exists(obj_player))
and (iris_xscale <= 0.001)
{
	global.time_countdown = 500; /* Reset countdown back to default value */
	global.time_countdown_bonus = 500; /* Reset countdown bonus back to default value */
	sprite_index = noone;
	gravity = 0;
	speed = 0;
	if (!audio_is_playing(player_lose_melody))
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
			
			#region /* Go to level editor if you die in level editor */
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room == room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /* Go to level editor if you die in level editor END */
			
		}
	}
	else
	{
		if (lives >= 1)
		{
			global.timeattack_realmillisecond = 0;
			score = 0;
			scr_save_level();
			audio_stop_all();
		
			#region /* Go to level editor if you die in level editor */
			if (asset_get_type("room_leveleditor") == asset_room)
			and (room == room_leveleditor)
			{
				global.play_edited_level = false;
				room_restart();
			}
			#endregion /* Go to level editor if you die in level editor END */
			
		}
	}
}
else
if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	if (lives >= 1)
	and (instance_exists(obj_player))
	{
		
		#region /* Disable the players for the camera */
		
		#region /* Disable player 1 */
		if (player == 1)
		and (instance_exists(obj_camera))
		{
			obj_camera.player1 = noone;
			obj_camera.can_spawn_player1 = true;
		}
		#endregion /* Disable player 1 END */
		
		#region /* Disable player 2 */
		if (player == 2)
		and (instance_exists(obj_camera))
		{
			obj_camera.player2 = noone;
			obj_camera.can_spawn_player2 = true;
		}
		#endregion /* Disable player 2 END */
		
		#region /* Disable player 3 */
		if (player == 3)
		and (instance_exists(obj_camera))
		{
			obj_camera.player3 = noone;
			obj_camera.can_spawn_player3 = true;
		}
		#endregion /* Disable player 3 END */
		
		#region /* Disable player 4 */
		if (player == 4)
		and (instance_exists(obj_camera))
		{
			obj_camera.player4 = noone;
			obj_camera.can_spawn_player4 = true;
		}
		#endregion /* Disable player 4 END */
		
		#endregion /* Disable the players for the camera END */
		
		instance_destroy();
	}
}

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
and (continue_falling = false)
{
	y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 1;
	sprite_index = noone;
}
else
if (continue_falling == true)
{
	gravity = 0.5;
}
if (image_index > image_number - 1)
{
	image_speed = 0;
}
else
{
	image_speed = 0.5;
}
#region /* Bubble */
if (bubble == true)
{
	
	#region /* Don't go outside view boundary */
	if (x < camera_get_view_x(view_camera[view_current]) + 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + 32;
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32)
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) - 32;
	}
	if (y < camera_get_view_y(view_camera[view_current]) + 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + 32;
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32)
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) - 32;
	}
	#endregion /* Don't go outside view boundary END */
	
	image_speed = 0.5;
	gravity = 0;
	if (key_up)
	{
		vspeed-= 0.4;
	}
	if (key_left)
	{
		hspeed -= 0.4;
		image_xscale = -1;
	}
	if (key_right)
	{
		hspeed += 0.4;
		image_xscale = +1;
	}
	if (key_down)
	{
		vspeed += 0.4;
	}
	if (key_a)
	{
		move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 128);
	}
	if (!position_meeting(x, y, obj_wall))
	and (place_meeting(x, y, obj_player))
	{
		vspeed = - 11.5;
		bubble = false;
	}
	if (vspeed <-4)
	{
		vspeed = -4;
	}
	if (hspeed <-4)
	{
		hspeed = -4;
	}
	if (hspeed >+ 4)
	{
		hspeed = +4;
	}
	if (vspeed >+ 4)
	{
		vspeed = +4;
	}
	friction = 0.2;
	
	#region /* If there are no more players in the room */
	if (!instance_exists(obj_player))
	{
		bubble = false;
		count = 0;
	}
	#endregion /* If there are no more players in the room END */
	
}
#endregion /* Bubble END */