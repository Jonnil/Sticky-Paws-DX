function scr_player_move_restart() {
	
	#region /* Restart Level */
	var quick_restart = false;
	if (controller_connected) {
		if (gamepad_button_check(global.player_slot[player], gp_shoulderlb))
		&& (gamepad_button_check(global.player_slot[player], gp_shoulderrb))
		&& (gamepad_button_check_pressed(global.player_slot[player], gp_select)) {
			var quick_restart = true;
		}
	}
	if (global.restart_level || quick_restart) {
		if (quick_restart) {
			if (global.character_select_in_this_menu == "main_game") {
				var ini_path = game_save_id + "save_file/file" + string(global.file) + ".ini";
			}
			else {
				var ini_path = game_save_id + "save_file/custom_level_save.ini";
			}
			ini_open(ini_path);
			ini_key_delete(global.level_name, "checkpoint_x");
			ini_key_delete(global.level_name, "checkpoint_y");
			ini_key_delete(global.level_name, "checkpoint_direction");
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			global.checkpoint_x = 0;
			global.checkpoint_y = 0;
		}
		global.restart_level = false;
		global.quit_level = false;
		audio_stop_all();
		room_persistent = false; /* Turn OFF Room Persistency */
		if (global.goal_active || global.player_has_entered_goal) {
			scr_save_level(); /* Save timeattack record when resetting at goal */
			global.goal_active = false;
			global.player_has_entered_goal = false;
		}
		global.timeattack_realmillisecond = 0; /* Reset timer back to zero */
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;	
		score = 0;
		for(var i = 1; i <= global.max_players + 1; i += 1) {
			gamepad_set_vibration(i - 1, 0, 0);
		}
		room_restart();
	}
	#endregion /* Restart Level END */
	
}

function scr_player_move_quit() {
	
	#region /* Quit Level */
	if (global.quit_level) {
		global.doing_clear_check_level = false; /* If you exit the level manually , you no longer are doing level clear check */
		global.doing_clear_check_character = false; /* If you exit the level manually , you no longer are doing character clear check */
		audio_stop_all();
		room_persistent = false; /* Turn OFF Room Persistency */
		global.timeattack_realmillisecond = 0; /* Reset timer back to zero */
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;	
		score = 0;
		scr_save_level();
		if (global.quit_to_map || global.quit_to_title) {
			
			#region /* Player availability check. These variables control player availability */
			/* If certain players are not playing the level anymore, make them disconnect until they join manually again */
			for(var i = 1; i <= global.max_players; i += 1) {
				if (!instance_exists(obj_camera.player[i])) {
					global.player_can_play[i] = false;
				}
				gamepad_set_vibration(i - 1, 0, 0);
			}
			#endregion /* Player availability check. These variables control player availability END */
			
			room_goto(global.quit_to_map ? rm_world_map : rm_title); /* If player chose to quit to map, then go to world map, otherwise go to title screen */
			global.quit_level = false;
			global.quit_to_map = false;
			global.quit_to_title = false;
		}
	}
	#endregion /* Quit Level END */
	
}