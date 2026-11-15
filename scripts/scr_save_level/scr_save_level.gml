/* Save Level Information like if you have cleared the level or if you have a checkpoint */
function scr_save_level()
{
	if (global.big_collectible_test_override
	|| (variable_global_exists("big_collectible_tier_format_unsupported") && global.big_collectible_tier_format_unsupported))
	{
		global.level_clear_rate = noone;
		global.level_score = 0;
		global.debug_mode_activated_once = false;
		return;
	}
	var context = scr_level_progress_current();
	var level_name = context.section;
	var level_id = context.online_id;

	#region /* If doing a character clear check, and winning the level, then add in character config that you have done a clear check */
	if (global.level_clear_rate == "clear"
	&& global.doing_clear_check_character)
	{
		if (!global.debug_mode_activated_once)
		{
			ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/data/character_config.ini");
			ini_write_real("info", "clear_check_character", true);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		}
		
		global.go_to_menu_when_going_back_to_title = "upload_yes_character";
	}
	#endregion /* If doing a character clear check, and winning the level, then add in character config that you have done a clear check END */

	if (global.character_select_in_this_menu == "main_game"
	&& global.actually_play_edited_level
	&& !global.doing_clear_check_level && !global.doing_clear_check_character)
	{
		scr_save_ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");

		if (global.level_clear_rate == "clear"
		&& !global.doing_clear_check_character)
		{
			ini_write_real(level_name, "number_of_clears", ini_read_real(level_name, "number_of_clears", 0) + 1); /* Increase how many times you've played this specific level */

			if (global.increase_number_of_levels_cleared
			&& ini_key_exists(level_name, "clear_rate")
			&& ini_read_string(level_name, "clear_rate", "closed") != "clear")
			{
				var levels_cleared_before = ini_read_real("Player", "number_of_levels_cleared", 1);
				var levels_cleared_after = levels_cleared_before + 1;
				ini_write_real("Player", "number_of_levels_cleared", levels_cleared_after); /* Increase how many levels in total you have cleared */
			}
			
			ini_write_string(level_name, "clear_rate", "clear"); /* Make the level clear after checking number of levels cleared */
			
			/* Mark when the last playable demo level was just cleared */
			if (global.demo_enable
			&& global.select_level_index >= global.demo_number_of_levels)
			{
				global.demo_over_popup = true;
			}
		}

		/* Make it known if the level was cleared with debug mode or not */
		if (global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "cleared_with_debug", true);
		}
		else
		{
			ini_write_real(level_name, "cleared_with_debug", false);
		}

		ini_write_string("Player", "last_played_level_name", global.level_name);
		ini_write_real("Player", "current_month", current_month);
		ini_write_real("Player", "current_day", current_day);
		ini_write_real("Player", "current_year", current_year);
		ini_write_real("Player", "current_hour", current_hour);
		ini_write_real("Player", "current_minute", current_minute);
		ini_write_real("Player", "current_second", current_second);
		ini_write_real("Player", "brand_new_file", false); /* Make absolutely sure that the game knows you're not starting on a brand new file if you hit checkpoints or goals */
		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);

		if (!global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
			ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
			ini_write_real(level_name, "checkpoint_big_collectible_tier", global.big_collectible_active_tier);
			ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
			ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
			ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
			ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		}

		#region /* Zero Defeats */
		if (global.lives_until_assist == 0
		&& global.player_has_entered_goal)
		&& (!global.debug_mode_activated_once)
		{
			if (global.zero_hits
			&& ini_read_real(level_name, "zero_defeats", 0) <= 1)
			{

				/* Update zero defeats stat achievement */
				if (ini_read_real(level_name, "zero_defeats", 0) <= 0)
				{
					ini_write_real("Player", "total_zero_defeats", ini_read_real("Player", "total_zero_defeats", 0) + 1);
					scr_set_stat_achievement("ZERO_DEFEATS", ini_read_real("Player", "total_zero_defeats", 0));
				}

				/* Update zero hits stat achievement */
				ini_write_real("Player", "total_zero_hits", ini_read_real("Player", "total_zero_hits", 0) + 1);
				scr_set_stat_achievement("ZERO_HITS", ini_read_real("Player", "total_zero_hits", 0));

				ini_write_real(level_name, "zero_defeats", 2); /* Write Zero Hits value last */
			}
			else
			if (ini_read_real(level_name, "zero_defeats", 0) <= 0)
			{

				/* Update zero defeats stat achievement */
				ini_write_real("Player", "total_zero_defeats", ini_read_real("Player", "total_zero_defeats", 0) + 1);
				scr_set_stat_achievement("ZERO_DEFEATS", ini_read_real("Player", "total_zero_defeats", 0));

				ini_write_real(level_name, "zero_defeats", 1); /* Write Zero Defeats value last */
			}
		}
		#endregion /* Zero Defeats END */

		#region /* Save Fastest Time */
		if (global.timeattack_realmillisecond > 2)
		&& (!global.debug_mode_activated_once)
		{
			if (!ini_key_exists(level_name, "timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", 999999999))
			{
				ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real(level_name, "timeattack_second", global.timeattack_second);
				ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
				ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
		}
		#endregion /* Save Fastest Time END */

		if (global.level_score > ini_read_real(level_name, "level_score", false))
		&& (!global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "level_score", global.level_score);
		}
		
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	else
	if (global.character_select_in_this_menu == "level_editor"
	&& global.actually_play_edited_level
	&& !global.doing_clear_check_level && !global.doing_clear_check_character)
	{

		#region /* Save to custom level save file */
		/* Use a dedicated file for online progress (not mixed with local custom-level data) */
		var online_progress_path = context.path;
		scr_save_ini_open(online_progress_path);

		#region /* Downloaded Level Progression */
		/* Update a list of downloaded levels that you have finished */
		if (level_id != ""
		&& !global.doing_clear_check_character)
		{
			var previous_status = max(ini_read_real("finished_downloaded_level", level_id, 0),
				ini_read_real(level_name, "finished_status", 0));
			var next_status = 1;
			if (global.level_clear_rate == "clear" && !global.debug_mode_activated_once)
			{
				var all_collected = global.big_collectible_active_tier == 0;
				for (var i = 1; i <= global.max_big_collectible; i++)
					if (!global.big_collectible_already_collected[i]) { all_collected = false; break; }
				next_status = all_collected ? 3 : 2;
			}
			next_status = max(previous_status, next_status);
			ini_write_real(level_name, "finished_status", next_status);
			/* Compatibility index mirrors the canonical ID-owned state. Debug never lowers it. */
			ini_write_real("finished_downloaded_level", level_id, next_status);
		}

		if (!global.debug_mode_activated_once)
		{
			/* Update a list of downloaded levels that you have completed with zero defeats or zero hits */
			var read_zero_defeats_downloaded_level = ini_read_real("zero_defeats_downloaded_level", string(level_id), 0);

			if (level_id != ""
			&& read_zero_defeats_downloaded_level < 2
			&& !global.doing_clear_check_character)
			{
				if (global.lives_until_assist == 0
				&& global.player_has_entered_goal)
				{
					if (global.zero_hits
					&& read_zero_defeats_downloaded_level <= 1)
					{
						ini_write_real("zero_defeats_downloaded_level", string(level_id), 2); /* Zero Hits */
					}
					else
					if (read_zero_defeats_downloaded_level <= 0)
					{
						ini_write_real("zero_defeats_downloaded_level", string(level_id), 1); /* Zero Defeats */
					}
				}
			}
		}
		#endregion /* Downloaded Level Progression END */

		ini_write_real(level_name, "lives_until_assist", global.lives_until_assist);
		if (!global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "checkpoint_x", global.checkpoint_x);
			ini_write_real(level_name, "checkpoint_y", global.checkpoint_y);
			ini_write_real(level_name, "checkpoint_big_collectible_tier", global.big_collectible_active_tier);
			ini_write_real(level_name, "checkpoint_millisecond", global.checkpoint_millisecond);
			ini_write_real(level_name, "checkpoint_second", global.checkpoint_second);
			ini_write_real(level_name, "checkpoint_minute", global.checkpoint_minute);
			ini_write_real(level_name, "checkpoint_realmillisecond", global.checkpoint_realmillisecond);
		}

		#region /* Zero Defeats */
		if (global.lives_until_assist == 0
		&& global.player_has_entered_goal)
		&& (!global.debug_mode_activated_once)
		{
			if (global.zero_hits
			&& ini_read_real(level_name, "zero_defeats", 0) <= 1)
			{

				/* Update zero defeats stat achievement */
				if (ini_read_real(level_name, "zero_defeats", 0) == 0)
				{
					ini_write_real("Player", "total_zero_defeats", ini_read_real("Player", "total_zero_defeats", 0) + 1);
				}

				/* Update zero hits stat achievement */
				ini_write_real("Player", "total_zero_hits", ini_read_real("Player", "total_zero_hits", 0) + 1);

				ini_write_real(level_name, "zero_defeats", 2); /* Write Zero Hits value last */
			}
			else
			if (ini_read_real(level_name, "zero_defeats", 0) == 0)
			{

				/* Update zero defeats stat achievement */
				ini_write_real("Player", "total_zero_defeats", ini_read_real("Player", "total_zero_defeats", 0) + 1);

				ini_write_real(level_name, "zero_defeats", 1); /* Write Zero Defeats value last */
			}
		}
		#endregion /* Zero Defeats END */

		#region /* Save Fastest Time */
		if (global.timeattack_realmillisecond > 2)
		&& (!ini_key_exists(level_name, "timeattack_realmillisecond")
		|| global.timeattack_realmillisecond < ini_read_real(level_name, "timeattack_realmillisecond", 999999999))
		&& (!global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "timeattack_millisecond", global.timeattack_millisecond);
			ini_write_real(level_name, "timeattack_second", global.timeattack_second);
			ini_write_real(level_name, "timeattack_minute", global.timeattack_minute);
			ini_write_real(level_name, "timeattack_realmillisecond", global.timeattack_realmillisecond);
		}
		#endregion /* Save Fastest Time END */

		if (global.level_score > ini_read_real(level_name, "level_score", false))
		&& (!global.debug_mode_activated_once)
		{
			ini_write_real(level_name, "level_score", global.level_score);
		}

		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
		#endregion /* Save to custom level save file END */

	}

	#region /* Update ranking highscore to actual custom level */
	if (global.character_select_in_this_menu == "level_editor"
	&& (global.actually_play_edited_level
	|| global.playing_level_from_beginning))
	&& (!global.debug_mode_activated_once)
	{
		var level_folder_name = scr_get_custom_level_folder_name(); /* Use real folder name, ALWAYS the display name, NEVER forced sanitized */
		ini_open(global.use_temp_or_working + "custom_levels/" + string(level_folder_name) + "/data/level_information.ini");

		#region /* Save Fastest Time */
		if (global.timeattack_realmillisecond > 2)
		{
			if (!ini_key_exists("rank", "rank_timeattack_realmillisecond"))
			|| (global.timeattack_realmillisecond < ini_read_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond))
			{
				ini_write_real("rank", "rank_timeattack_millisecond", global.timeattack_millisecond);
				ini_write_real("rank", "rank_timeattack_second", global.timeattack_second);
				ini_write_real("rank", "rank_timeattack_minute", global.timeattack_minute);
				ini_write_real("rank", "rank_timeattack_realmillisecond", global.timeattack_realmillisecond);
			}
		}
		#endregion /* Save Fastest Time END */

		if (global.level_score > ini_read_real("rank", "rank_level_score", false))
		{
			ini_write_real("rank", "rank_level_score", global.level_score);
		}

		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	#endregion /* Update ranking highscore to actual custom level END */

	/* Only reset the "big collectible already collected" variables in certain cases */
	if (global.level_clear_rate == "clear")
	|| (global.quit_level)
	|| (global.restart_level
	&& global.checkpoint_x == 0
	&& global.checkpoint_y == 0)
	{
		for(var i = 1; i <= global.max_big_collectible; i += 1)
		{
			global.big_collectible_already_collected[i] = false;
		}

		for(var i = 1; i <= global.max_key_fragment; i += 1)
		{
			global.key_fragment_already_collected[i] = false;
		}
		global.how_many_big_collectible_collected = 0;
	}

	if (global.actually_play_edited_level) /* Only reset when actually playing level, this information needs to be used in level editor after playtesting from beginning */
	&& (!global.doing_clear_check_level)
	{
		global.timeattack_realmillisecond = 0;
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;
	}
	if (global.level_clear_rate == "clear" || global.quit_level)
	{
		scr_big_collectible_tiers_reset_run();
	}
	global.level_clear_rate = noone;
	global.debug_mode_activated_once = false;
	global.level_score = 0;

	scr_save_ini_open(game_save_id + "save_file/config.ini")
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world", global.zoom_world);
	ini_close();

	switch_save_data_commit(); /* Remember to commit the save data! */
}
