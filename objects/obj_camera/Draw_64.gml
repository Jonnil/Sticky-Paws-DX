var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

scr_zoom_camera_draw_gui(10);

if (global.convention_mode)
&& (reset_game_if_no_interactivity_second_countdown <= 30)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (reset_game_if_no_interactivity_second_countdown >= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("seconds"), global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("second"), global.default_text_size * 2, c_black, c_red, 1);
	}
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Start moving to continue playing"), global.default_text_size, c_black, c_red, 1);
}

#region /* Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer */
if (!instance_exists(obj_pause))
{
	
	#region /* Lives */
	if (hud_show_lives_y != -32)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		if (sprite_lives_icon > noone)
		{
			draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
		}
		if (lives <= 0)
		{
			scr_draw_text_outlined(64, hud_show_lives_y, "0", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(64, hud_show_lives_y, lives, global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Lives END */
	
	#region /* Death Counter */
	if (hud_show_deaths_y != -32)
	{
		if (global.show_deaths_counter)
		{
			if (sprite_lives_icon > noone)
			{
				draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_deaths_y, 0.75, 0.75, 0, c_gray, 1);
			}
			draw_line_width_color(32 - 16, hud_show_deaths_y - 16, 32 + 16, hud_show_deaths_y + 16, 3, c_red, c_red);
			draw_line_width_color(32 - 16, hud_show_deaths_y + 16, 32 + 16, hud_show_deaths_y - 16, 3, c_red, c_red);
			scr_draw_text_outlined(64, hud_show_deaths_y, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Death Counter END */
	
	#region /* Big Collectibles */
	if (hud_show_big_collectibles_y != -32)
	{
		
		#region /* Big Collectible 1 */
		if (global.big_collectible1 == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible1)
		&& (big_collectible1_already_collected == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 1 END */
		
		#region /* Big Collectible 2 */
		if (global.big_collectible2 == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible2)
		&& (big_collectible2_already_collected == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 2 END */
		
		#region /* Big Collectible 3 */
		if (global.big_collectible3 == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible3)
		&& (big_collectible3_already_collected == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 3 END */
		
		#region /* Big Collectible 4 */
		if (global.big_collectible4 == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible4)
		&& (big_collectible4_already_collected == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 4 END */
		
		#region /* Big Collectible 5 */
		if (global.big_collectible5 == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible5)
		&& (big_collectible5_already_collected == false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 5 END */
		
	}
	#endregion /* Big Collectibles */
	
	#region /* Basic Collectible */
	if (hud_show_basic_collectibles_y != -32)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles_y, 0.75, 0.75, 0, c_white, 1);
		scr_draw_text_outlined(64, hud_show_basic_collectibles_y, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Basic Collectible END */
	
	#region /* Score */
	if (hud_show_score_y != -32)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 200, hud_show_score_y, l10n_text("Score"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(get_window_width - 200, hud_show_score_y + 32, string(score), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /* Score END */
	
	#region /* Time Countdown */
	if (instance_exists(obj_player))
	&& (global.enable_time_countdown)
	|| (instance_exists(obj_player_lose))
	&& (global.enable_time_countdown)
	{
		time_countup_y = 94;
			
		#region /* Time is running out message */
		if (global.player_has_entered_goal == false)
		{
			if (global.time_countdown <= 99)
			&& (hurry_up_message_timer <= 300) /* Make the hurry up message stay on screen for 5 seconds (which is 300 frames) */
			{
				hurry_up_message_timer ++;
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("HURRY UP!"), global.default_text_size, c_black, c_orange, 1);
				draw_text_transformed_color(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("HURRY UP!"), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
			}
		}
		#endregion /* Time is running out message END */
			
		#region /* Time Over Message */
		if (global.time_countdown == 0)
		&& (global.player_has_entered_goal == false)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
		}
		#endregion /* Time Over Message END */
			
		if (global.hud_hide_time > 0)
		if (global.time_countdown >= 0)
		{
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			if (global.player_has_entered_goal == false)
			{
				if (global.time_countdown == 0)
				{
					scr_draw_text_outlined(get_window_width - 32, 42, "TIME\n0", global.default_text_size, c_black, c_red, 1);
				}
				else
				{
					if (global.time_countdown >= 100)
					{
						scr_draw_text_outlined(get_window_width - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_yellow, 1);
						draw_text_transformed_color(get_window_width - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_orange, c_orange, c_orange, c_orange, timer_blinking_alpha);
					}
					else
					{
						scr_draw_text_outlined(get_window_width - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_orange, 1);
						draw_text_transformed_color(get_window_width - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
					}
				}
				if (global.timeattack_millisecond < room_speed * 0.5)
				{
					timer_blinking_alpha = lerp(timer_blinking_alpha, 1, 0.2);
				}
				else
				{
					timer_blinking_alpha = lerp(timer_blinking_alpha, 0, 0.2);
				}
			}
			else
			{
				scr_draw_text_outlined(get_window_width - 32, 42, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
			}
		}
	}
	else
	{
		time_countup_y = 32;
	}
	#endregion /* Time Countdown END */
	
	#region /* Time countup in Minutes, Seconds and Milliseconds */
	if (global.show_timer)
	|| (global.player_has_entered_goal)
	{
		
		if (global.timeattack_realmillisecond < timeattack_record_realmillisecond)
		&& (global.player_has_entered_goal)
		&& (timeattack_record_realmillisecond != 999999999)
		{
			scr_draw_text_outlined(get_window_width - 32, time_countup_y - 20, l10n_text("New Record"), global.default_text_size * 0.75, c_black, c_white, scr_wave(0, 1, 0.5));
		}
		
		#region /* Your Time */
		draw_set_halign(fa_right)
		if (global.timeattack_minute > 0)
		{
			scr_draw_text_outlined(get_window_width - 100, time_countup_y, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
		}
		if (global.timeattack_minute <= 0)
		&& (global.timeattack_second <= 9)
		{
			scr_draw_text_outlined(get_window_width - 65, time_countup_y, global.timeattack_second, global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(get_window_width - 65, time_countup_y, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
		}
		scr_draw_text_outlined(get_window_width - 30, time_countup_y + 2, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
		#endregion /* Your Time END */
		
		#region /* Record Time */
		if (timeattack_record_realmillisecond != 999999999)
		{
			draw_set_halign(fa_right)
			if (timeattack_record_minute > 0)
			{
				scr_draw_text_outlined(get_window_width - 100 - string_width(timeattack_record_minute), time_countup_y + 32, l10n_text("Best") + ": ", global.default_text_size * 0.75, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(get_window_width - 65 - string_width(timeattack_record_second), time_countup_y + 32, l10n_text("Best") + ": ", global.default_text_size * 0.75, c_black, c_white, 1);
			}
			if (timeattack_record_minute > 0)
			{
				scr_draw_text_outlined(get_window_width - 100, time_countup_y + 32, string(timeattack_record_minute) + ":", global.default_text_size, c_black, c_white, 1);
			}
			if (timeattack_record_minute <= 0)
			&& (timeattack_record_second <= 9)
			{
				scr_draw_text_outlined(get_window_width - 65, time_countup_y + 32, timeattack_record_second, global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(get_window_width - 65, time_countup_y + 32, string_replace_all(string_format(timeattack_record_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
			}
			scr_draw_text_outlined(get_window_width - 30, time_countup_y + 32 + 2, "." + string(string_replace_all(string_format(timeattack_record_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		#endregion /* Record Time END */
		
	}
	#endregion /* Time countup in Minutes, Seconds and Milliseconds END */
	
}
#endregion /* Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer END */

scr_debug_screen();

#region /* Show if you are playing the demo version or not */
if (global.demo)
&& (global.play_attract_demo == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.arcade_mode)
	{
		scr_draw_text_outlined(get_window_width * 0.5, + 32, string(global.game_name) + " " + l10n_text("Demo") + " - " + l10n_text("Arcade mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (global.convention_mode)
	{
		scr_draw_text_outlined(get_window_width * 0.5, + 32, string(global.game_name) + " " + l10n_text("Demo") + " - " + l10n_text("Convention mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(get_window_width * 0.5, + 32, string(global.game_name) + " " + l10n_text("Demo"), global.default_text_size, c_black, c_white, 1);
	}
}
#endregion /* Show if you are playing the demo version or not END */

#region /* Show if you have Assist mode enabled or not */
if (global.assist_enable)
&& (global.assist_show_assist_mode_text)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Assist Mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you have Assist mode enabled or not END */

#region /* Show Controls */
if (os_type != os_ios)
&& (os_type != os_android)
&& (!instance_exists(obj_pause))
{
	scr_draw_show_controls(1);
	scr_draw_show_controls(2);
	scr_draw_show_controls(3);
	scr_draw_show_controls(4);
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (global.player1_can_play >= 1) /* Only show controller input change if there is only one player in the game */
&& (global.player2_can_play <= 0)
&& (global.player3_can_play <= 0)
&& (global.player4_can_play <= 0)
|| (global.player1_can_play <= 0)
&& (global.player2_can_play >= 1)
&& (global.player3_can_play <= 0)
&& (global.player4_can_play <= 0)
|| (global.player1_can_play <= 0)
&& (global.player2_can_play <= 0)
&& (global.player3_can_play >= 1)
&& (global.player4_can_play <= 0)
|| (global.player1_can_play <= 0)
&& (global.player2_can_play <= 0)
&& (global.player3_can_play <= 0)
&& (global.player4_can_play >= 1)
{
	if (global.show_prompt_when_changing_to_gamepad)
	{
		draw_sprite_ext(spr_change_input_to_controller, 0, 110, get_window_height + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
	if (global.show_prompt_when_changing_to_keyboard_and_mouse)
	{
		draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, get_window_height + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
}
#endregion /* Show what input is used END */

scr_virtual_keys();

#region /* Display Rank */
if (global.enable_ranks)
&& (global.show_ranks)
&& (global.goal_active)
{
	if (global.character_select_in_this_menu == "main_game")
	&& (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
	
	|| (global.character_select_in_this_menu == "level_editor")
	&& (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
	{
		if (global.character_select_in_this_menu == "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		}
		
		if (ini_key_exists("rank", "rank_level_score"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5 - 128, get_window_height * 0.5 - 74, l10n_text("Score"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width * 0.5 - 32, get_window_height * 0.5 + 74, l10n_text("S Rank Score") + ": " + string(ini_read_real("rank", "rank_level_score", 0)), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5 - 32, get_window_height * 0.5 + 74 + 32, l10n_text("Your Score") + ": " + string(score), global.default_text_size, c_black, c_white, 1);
			if (score >= ini_read_real("rank", "rank_level_score", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank S */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank A */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 50000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank B */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 80000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank C */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 100000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank D */
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, get_window_width * 0.5 - 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank E */
			}
		}
		if (ini_key_exists("rank", "rank_timeattack_realmillisecond"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width * 0.5 + 128, get_window_height * 0.5 - 74, l10n_text("Time"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right)
			scr_draw_text_outlined(get_window_width * 0.5 + 328, get_window_height * 0.5 + 74, l10n_text("S Rank Time") + ": " + string(ini_read_real("rank", "rank_timeattack_minute", 0)) + ":" + string(ini_read_real("rank", "rank_timeattack_second", 0)) + "." + string(string_replace_all(string_format(ini_read_real("rank", "rank_timeattack_millisecond", 0), 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width * 0.5 + 328, get_window_height * 0.5 + 74 + 32, l10n_text("Your Time") + ": " + string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank S */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 1000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank A */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 5000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank B */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 8000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank C */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank D */
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, get_window_width * 0.5 + 128, get_window_height * 0.5, 1, 1, 0, c_white, 1); /* Rank E */
			}
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
}
#endregion /* Display Rank END */

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (show_letterbox > 0)
{
	draw_rectangle_color(0, 0, get_window_width, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

if (global.doing_clear_check)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("Clear from the start"), global.default_text_size, c_white, c_black, 1);
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
}

#region /* Pause Level Button */
if (global.play_edited_level) /* When playtesting the level */
&& (global.actually_play_edited_level == false) /* But not actually playing the level */
&& (global.character_select_in_this_menu == "level_editor")
{
	draw_sprite_ext(spr_menu_button_pause, 0, 32, display_get_gui_height() - 32, 1, 1, 0, c_white, 1);
	
	#region /* Draw Pause Key */
	if (gamepad_is_connected(global.player1_slot))
	&& (global.controls_used_for_menu_navigation == "controller")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(gp_select, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_escape, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Pause key END */
	
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 32 - 32 + 1, display_get_gui_height() - 64, 32 + 32, display_get_gui_height() + 64 - 1))
	{
		if (mouse_check_button_released(mb_left))
		&& (menu_delay == 0)
		{
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			room_restart();
		}
		draw_set_alpha(0.5);
		draw_rectangle_color(32 - 32 + 1, display_get_gui_height() - 64, 32 + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
}
#endregion /* Play Level Button END */

scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (black_screen_gui_alpha > 0.2)
{
	if (global.enable_transitions)
	{
		draw_set_alpha(black_screen_gui_alpha);
		draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	
	#region /* Draw loading screen when transitioning to other rooms */
	if (lives >= 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		global.loading_spinning_angle -= 10;
		draw_sprite_ext(spr_loading, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 1, 1, global.loading_spinning_angle, c_white, black_screen_gui_alpha);
		scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 42, l10n_text("Loading"), global.default_text_size, c_white, c_black, black_screen_gui_alpha);
	}
	#endregion /* Draw loading screen when transitioning to other rooms END */
	
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */