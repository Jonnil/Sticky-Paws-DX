#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay --;
}

count ++;

#region /* Check if the last player just died */
if (count == 1)
&& (!instance_exists(obj_player))
{
	last_player = true;
}
#endregion /* Check if the last player just died END */

#region /* Start defeat animation, falling off screen */
if (count = 50)
{
	gravity_direction = 270;
	gravity = 0.5;
	vspeed = -10;
	image_speed = 0.3;
	if (burnt)
	{
		scr_audio_play(voice_burned_die, volume_source.voice);
	}
	else
	{
		scr_audio_play(voice_damage, volume_source.voice);
	}
}
#endregion /* Start defeat animation, falling off screen END */

#region /* If the player is burned, have black smoke coming out */
if (burnt)
&& (speed > 0)
{
	effect_create_above(ef_smoke, x, bbox_bottom, 0, c_black);
}
#endregion /* If the player is burned, have black smoke coming out END */

#region /* Play defeat melody */
if (!instance_exists(obj_player))
&& (count = 50)
&& (last_player)
{
	scr_audio_play(player_lose_melody, volume_source.melody);
}
#endregion /* Play defeat melody END */

#region /* Limit the vertical speed */
if (vspeed >+ 32)
{
	vspeed = +32
}
#endregion /* Limit the vertical speed END */

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
&& (!instance_exists(obj_player))
&& (iris_xscale <= 0.01)
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
			if (room == rm_leveleditor)
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
			if (room == rm_leveleditor)
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
	&& (instance_exists(obj_player))
	{
		
		#region /* Re-enable the players for the camera */
		if (instance_exists(obj_camera))
		{
			if (player == 1) /* Re-enable player 1 */
			{
				obj_camera.player1 = noone;
				obj_camera.can_spawn_player1 = true;
			}
			if (player == 2) /* Re-enable player 2 */
			{
				obj_camera.player2 = noone;
				obj_camera.can_spawn_player2 = true;
			}
			if (player == 3) /* Re-enable player 3 */
			{
				obj_camera.player3 = noone;
				obj_camera.can_spawn_player3 = true;
			}
			if (player == 4) /* Re-enable player 4 */
			{
				obj_camera.player4 = noone;
				obj_camera.can_spawn_player4 = true;
			}
		}
		#endregion /* Re-enable the players for the camera END */
		
		instance_destroy();
	}
}

if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
&& (continue_falling == false)
{
	y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + 1;
	sprite_index = noone;
}
else
if (continue_falling)
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

#region /* If controller gets disconnected during gameplay, pause the game */
if (gamepad_is_connected(global.player_slot[player]))
{
	controller_connected = true;
}
#endregion /* If controller gets disconnected during gameplay, pause the game END */

scr_player_move_pause();

#region /* Restart Level */
if (global.restart_level)
{
	global.restart_level = false;
	global.quit_level = false;
	audio_stop_all();
	room_persistent = false; /* Turn OFF Room Persistency */
	
	#region /* Reset timer back to zero */
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /* Reset timer back to zero END */
	
	score = 0;
	
	room_restart();
}
#endregion /* Restart Level END */

#region /* Quit Level */
if (global.quit_level)
{
	global.doing_clear_check = false; /* If you exit the level manually , you no longer are doing level clear check */
	global.doing_clear_check_character = false; /* If you exit the level manually , you no longer are doing character clear check */
	audio_stop_all();
	room_persistent = false; /* Turn OFF Room Persistency */
	
	#region /* Reset timer back to zero */
	global.timeattack_realmillisecond = 0;
	global.timeattack_millisecond = 0;
	global.timeattack_second = 0;
	global.timeattack_minute = 0;	
	#endregion /* Reset timer back to zero END */
	
	score = 0;
	
	scr_save_level();
	
	if (global.quit_to_map || global.quit_to_title)
	{
		global.quit_level = false;
		room_goto(global.quit_to_map ? rm_world_map : rm_title); /* If player chose to quit to map, then go to world map, otherwise go to title screen */
		global.quit_to_map = false;
		global.quit_to_title = false;
	}
}
#endregion /* Quit Level END */