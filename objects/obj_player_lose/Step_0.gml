#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (menu_delay > 0)
{
	menu_delay--;
}

count++;

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
	effect_create_depth(depth - 1, ef_smoke, x, bbox_bottom, 0, c_black);
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

if (y > camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
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
if (y > camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
{
	if (lives >= 1)
	&& (instance_exists(obj_player))
	{

		#region /* Re-enable the players for the camera */
		if (instance_exists(obj_camera))
		{
			for(var i = 1; i <= global.max_players; i += 1)
			{
				if (player == i)
				{
					obj_camera.player[i] = noone;
					obj_camera.can_spawn_player[i] = true;
					break; /* Exit the loop once the correct player is found */
				}
			}
		}
		#endregion /* Re-enable the players for the camera END */

		instance_destroy();
	}
}

if (y > camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
&& (!continue_falling)
{
	y = camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)) + 1;
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
|| (gamepad_button_check(global.player_slot[player], gp_shoulderlb))
&& (gamepad_button_check(global.player_slot[player], gp_shoulderrb))
&& (gamepad_button_check_pressed(global.player_slot[player], gp_select))
{
	if (gamepad_button_check(global.player_slot[player], gp_shoulderlb))
	&& (gamepad_button_check(global.player_slot[player], gp_shoulderrb))
	&& (gamepad_button_check_pressed(global.player_slot[player], gp_select))
	{
		if (global.character_select_in_this_menu == "main_game")
		{
			ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
		}
		else
		{
			ini_open(game_save_id + "save_file/custom_level_save.ini");
		}
		ini_key_delete(global.level_name, "checkpoint_x");
		ini_key_delete(global.level_name, "checkpoint_y");
		ini_key_delete(global.level_name, "checkpoint_direction");
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
	}

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

	if (os_type == os_switch)
	{
		switch_controller_vibrate_hd(global.player_slot[player], 0, 0, 0, 0, 0);
	}
	else
	{
		gamepad_set_vibration(global.player_slot[player], 0, 0);
	}
	room_restart();
}
#endregion /* Restart Level END */

#region /* Quit Level */
if (global.quit_level)
{
	global.doing_clear_check_level = false; /* If you exit the level manually , you no longer are doing level clear check */
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

	if (global.quit_to_world || global.quit_to_title)
	{
		if (os_type == os_switch)
		{
			switch_controller_vibrate_hd(global.player_slot[player], 0, 0, 0, 0, 0);
		}
		else
		{
			gamepad_set_vibration(global.player_slot[player], 0, 0);
		}
		room_goto(global.quit_to_world ? rm_world : rm_title); /* If player chose to quit to map, then go to world map, otherwise go to title screen */
		global.quit_level = false;
		global.quit_to_world = false;
		global.quit_to_title = false;
	}
}
#endregion /* Quit Level END */
