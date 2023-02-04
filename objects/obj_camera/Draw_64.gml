var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

scr_set_screen_size();

scr_zoom_camera_draw_gui(10);

if (global.convention_mode == true)
and (!instance_exists(obj_title))
{
	reset_game_if_no_interactivity += 1;
	reset_game_if_no_interactivity_second_countdown_timer += 1;
	if (reset_game_if_no_interactivity_second_countdown_timer >= 60)
	{
		reset_game_if_no_interactivity_second_countdown_timer = 0;
		reset_game_if_no_interactivity_second_countdown -= 1;
	}
	if (reset_game_if_no_interactivity >= 3600)
	{
		game_restart();
	}
}
if (global.convention_mode == true)
and (!instance_exists(obj_title))
and (reset_game_if_no_interactivity_second_countdown <= 30)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (reset_game_if_no_interactivity_second_countdown >= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("seconds"), global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("second"), global.default_text_size * 2, c_black, c_red, 1);
	}
	scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 + 42, l10n_text("Start moving to continue playing"), global.default_text_size, c_black, c_red, 1);
}

///HUD
if (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	
	#region /* Show HUD timers */
	
	#region /* If HUD show timer is set to always hide */
	if (global.hud_hide_time <= 0)
	or (show_letterbox > 0)
	{
		hud_show_lives_timer = false;
		hud_show_deaths_timer = false;
		hud_show_basic_collectibles_timer = false;
		hud_show_big_collectibles_timer = false;
		hud_show_score_timer = false;
	}
	#endregion /* If HUD show timer is set to always hide */
	
	#region /* If HUD show timer is set to never hide */
	if (global.hud_hide_time >= 10)
	{
		hud_show_lives_timer = global.hud_hide_time * 60;
		if (global.show_deaths_counter == true)
		{
			hud_show_deaths_timer = global.hud_hide_time * 60;
		}
		hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		hud_show_score_timer = global.hud_hide_time * 60;
	}
	#endregion /* If HUD show timer is set to never hide */
	
	if (global.hud_hide_time >= 10)
	{
		if (global.show_deaths_counter == true)
		{
			hud_show_deaths_timer = global.hud_hide_time * 60;
		}
		hud_show_lives_timer = global.hud_hide_time * 60;
		hud_show_deaths_timer = global.hud_hide_time * 60;
		hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		hud_show_big_collectibles_timer = global.hud_hide_time * 60;
		hud_show_score_timer = global.hud_hide_time * 60;
	}
	else
	{
		if (hud_show_lives_timer > 0)
		{
			hud_show_lives_timer -= 1;
		}
		if (hud_show_deaths_timer > 0)
		{
			hud_show_deaths_timer -= 1;
		}
		if (hud_show_big_collectibles_timer > 0)
		{
			hud_show_big_collectibles_timer -= 1;
		}
		if (hud_show_score_timer > 0)
		{
			hud_show_score_timer -= 1;
		}
	}
	
	#region /* Y position of all HUD should be lerping onto screen when it's relevant */
	if (global.hud_hide_time > 0)
	{
		/*
		Show these in right order:
		Lives
		Deaths
		Big Collectibles
		Basic Collectibles
		*/
		
		#region /* Show Lives y position */
		if (asset_get_type("room_world_map") == asset_room)
		and (room == room_world_map)
		{
			hud_show_lives_y = 32;
		}
		else
		{
			if (hud_show_lives_timer > 0)
			{
				hud_show_lives_y = lerp(hud_show_lives_y, 32, 0.1);
			}
			else
			{
				hud_show_lives_y = lerp(hud_show_lives_y, - 32, 0.1);
			}
		}
		#endregion /* Show Lives y position END */
		
		#region /* Show Deaths y position */
		if (hud_show_deaths_timer > 0)
		and (global.show_deaths_counter == true)
		{
			if (hud_show_lives_y > 0)
			{
				hud_show_deaths_y = lerp(hud_show_deaths_y, 70, 0.1);
			}
			else
			{
				hud_show_deaths_y = lerp(hud_show_deaths_y, 32, 0.1);
			}
		}
		else
		{
			hud_show_deaths_y = lerp(hud_show_deaths_y, - 32, 0.1);
		}
		#endregion /* Show Deaths y position END */
		
		#region /* Show Big Collectibles y position */
		if (hud_show_big_collectibles_timer > 0) /* Make sure it says BIG collectibles */
		{
			if (hud_show_lives_y > 0)
			and (hud_show_deaths_y > 0)
			{
				hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 110, 0.1);
			}
			else
			if (hud_show_lives_y > 0)
			{
				hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 70, 0.1);
			}
			else
			{
				hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 30, 0.1);
			}
		}
		else
		{
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, - 32, 0.1);
		}
		#endregion /* Show Big Collectibles y position END */
		
		#region /* Show Basic Collectible y position */
		if (hud_show_basic_collectibles_timer > 0) /* Make sure it says BASIC collectibles */
		{
			hud_show_basic_collectibles_timer -= 1;
			
			if (hud_show_lives_y > 0)
			and (hud_show_deaths_y > 0)
			and (hud_show_big_collectibles_y > 0)
			{
				hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 150, 0.1);
			}
			else
			if (hud_show_lives_y < 0)
			and (hud_show_deaths_y > 0)
			and (hud_show_big_collectibles_y > 0)
			or(hud_show_lives_y > 0)
			and (hud_show_deaths_y < 0)
			and (hud_show_big_collectibles_y > 0)
			or(hud_show_lives_y > 0)
			and (hud_show_deaths_y > 0)
			and (hud_show_big_collectibles_y < 0)
			{
				hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 110, 0.1);
			}
			else
			if (hud_show_lives_y > 0)
			and (hud_show_deaths_y < 0)
			and (hud_show_big_collectibles_y < 0)
			or(hud_show_lives_y < 0)
			and (hud_show_deaths_y > 0)
			and (hud_show_big_collectibles_y < 0)
			or(hud_show_lives_y < 0)
			and (hud_show_deaths_y < 0)
			and (hud_show_big_collectibles_y > 0)
			{
				hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 64, 0.1);
			}
			else
			{
				hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, 32, 0.1);
			}
		}
		else
		{
			hud_show_basic_collectibles_y = lerp(hud_show_basic_collectibles_y, - 32, 0.1);
		}
		#endregion /* Show Basic Collectible y position END */
		
		#region /* Show Score y position */
		if (hud_show_score_timer > 0)
		{
			hud_show_score_y = lerp(hud_show_score_y, 32, 0.1);
		}
		else
		{
			hud_show_score_y = lerp(hud_show_score_y, -64, 0.1);
		}
		#endregion /* Show Score y position END */
		
	}
	#endregion /* Y position of all HUD should be lerping onto screen when it's relevant END */
	
	#endregion /* Show HUD timers END */
		
	#region /* Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer */
	if (asset_get_type("obj_pause") == asset_object)
	and (!instance_exists(obj_pause))
	{
		
		#region /* Lives */
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		if (sprite_lives_icon > noone)
		{
			draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
		}
		if (lives < 0)
		{
			scr_draw_text_outlined(64, hud_show_lives_y, "0", global.default_text_size, c_black, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(64, hud_show_lives_y, lives, global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Lives END */
		
		#region /* Death Counter */
		if (global.show_deaths_counter == true)
		{
			if (sprite_lives_icon > noone)
			{
				draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_deaths_y, 0.75, 0.75, 0, c_gray, 1);
			}
			draw_line_width_color(32 - 16, hud_show_deaths_y - 16, 32 + 16, hud_show_deaths_y + 16, 3, c_red, c_red);
			draw_line_width_color(32 - 16, hud_show_deaths_y + 16, 32 + 16, hud_show_deaths_y - 16, 3, c_red, c_red);
			scr_draw_text_outlined(64, hud_show_deaths_y, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Death Counter END */
		
		#region /* Big Collectibles */
		
		#region /* Big Collectible 1 */
		if (global.big_collectible1 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible1 == true)
		and (big_collectible1_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 1 END */
		
		#region /* Big Collectible 2 */
		if (global.big_collectible2 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible2 == true)
		and (big_collectible2_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 2 END */
		
		#region /* Big Collectible 3 */
		if (global.big_collectible3 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible3 == true)
		and (big_collectible3_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 3 END */
		
		#region /* Big Collectible 4 */
		if (global.big_collectible4 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible4 == true)
		and (big_collectible4_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 4 END */
		
		#region /* Big Collectible 5 */
		if (global.big_collectible5 = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		if (global.big_collectible5 == true)
		and (big_collectible5_already_collected = false)
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
		#endregion /* Big Collectible 5 END */
		
		#endregion /* Big Collectibles */
		
		#region /* Basic Collectible */
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles_y, 0.75, 0.75, 0, c_white, 1);
		scr_draw_text_outlined(64, hud_show_basic_collectibles_y, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
		#endregion /* Basic Collectible END */
		
		#region /* Score */
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 200, hud_show_score_y, l10n_text("Score"), global.default_text_size, c_white, c_black, 1);
		scr_draw_text_outlined(get_window_width - 200, hud_show_score_y + 32, string(score), global.default_text_size, c_white, c_black, 1);
		#endregion /* Score END */
		
		#region /* Time Countdown */
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (global.enable_time_countdown == true)
		or (asset_get_type("obj_player_lose") == asset_object)
		and (instance_exists(obj_player_lose))
		and (global.enable_time_countdown == true)
		{
			time_countup_y = 94;
			
			#region /* Time is running out message */
			if (global.player_has_entered_goal = false)
			{
				if (global.time_countdown <= 99)
				and (hurry_up_message_timer <= 300) /* Make the hurry up message stay on screen for 5 seconds (which is 300 frames) */
				{
					hurry_up_message_timer += 1;
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("HURRY UP!"), global.default_text_size, c_black, c_orange, 1);
					draw_text_transformed_color(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("HURRY UP!"), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
				}
			}
			#endregion /* Time is running out message END */
			
			#region /* Time Over Message */
			if (global.time_countdown == 0)
			and (global.player_has_entered_goal == false)
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
			}
			#endregion /* Time Over Message END */
			
			if (global.hud_hide_time > 0)
			if (global.time_countdown >= 0)
			{
				draw_set_halign(fa_right);
				draw_set_valign(fa_middle);
				if (global.player_has_entered_goal = false)
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
					if (global.timeattack_millisecond < room_speed / 2)
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
		if (global.show_timer == true)
		{
			draw_set_halign(fa_right)
			if (global.timeattack_minute > 0)
			{
				scr_draw_text_outlined(get_window_width - 100, time_countup_y, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
			}
			if (global.timeattack_minute <= 0)
			and (global.timeattack_second <= 9)
			{
				scr_draw_text_outlined(get_window_width - 65, time_countup_y, global.timeattack_second, global.default_text_size, c_black, c_white, 1);
			}
			else
			{
				scr_draw_text_outlined(get_window_width - 65, time_countup_y, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
			}
			scr_draw_text_outlined(get_window_width - 30, time_countup_y + 2, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
		}
		#endregion /* Time countup in Minutes, Seconds and Milliseconds END */
		
	}
	#endregion /* Lives, Deaths, Big Collectibles, Basic Collectibles, Score and Timer END */

}

scr_debug_screen();

#region /* Show if you are playing the demo version or not */
if (global.demo == true)
and (global.play_attract_demo = false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.arcade_mode == true)
	{
		scr_draw_text_outlined(get_window_width / 2, + 32, string(global.game_name) + " " + l10n_text("Demo") + " - " + l10n_text("Arcade mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (global.convention_mode == true)
	{
		scr_draw_text_outlined(get_window_width / 2, + 32, string(global.game_name) + " " + l10n_text("Demo") + " - " + l10n_text("Convention mode"), global.default_text_size, c_black, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(get_window_width / 2, + 32, string(global.game_name) + " " + l10n_text("Demo"), global.default_text_size, c_black, c_white, 1);
	}
}
#endregion /* Show if you are playing the demo version or not END */

#region /* Show if you are playing on convention mode or not */
if (global.convention_mode == true)
and (global.demo == false)
and (global.play_attract_demo = false)
and (room == room_title)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width / 2, + 32, l10n_text("Convention mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you are playing on convention mode or not END */

#region /* Show if you are playing on arcade mode or not */
if (global.arcade_mode == true)
and (global.demo == false)
and (global.play_attract_demo = false)
and (room == room_title)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width / 2, + 32, l10n_text("Arcade mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you are playing on arcade mode or not END */

#region /* Show if you have Assist mode enabled or not */
if (global.assist_enable == true)
and (global.assist_show_assist_mode_text == true)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width - 32, get_window_height - 32, l10n_text("Assist Mode"), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Show if you have Assist mode enabled or not END */

#region /* Show Controls */

if (os_type != os_ios)
and (os_type != os_android)
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	
	#region /* Show Multiplayer Controls */
	if (global.player1_can_play == true)
	or (global.player2_can_play == true)
	or (global.player3_can_play == true)
	or (global.player4_can_play == true)
	{
		
		#region /* Y position of show controls for each player */
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 32, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha > 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
		}
		else
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 32, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 116, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 74, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha > 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 74, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha > 0)
		and (player3_show_controls_alpha > 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player2_controls_y = lerp(show_player2_controls_y, 74, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, 32, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		if (player1_show_controls_alpha <= 0)
		and (player2_show_controls_alpha <= 0)
		and (player3_show_controls_alpha <= 0)
		and (player4_show_controls_alpha <= 0)
		{
			show_player1_controls_y = lerp(show_player1_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player2_controls_y = lerp(show_player2_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player3_controls_y = lerp(show_player3_controls_y, + 32, 0.1); /* + 32 = don't show */
			show_player4_controls_y = lerp(show_player4_controls_y, + 32, 0.1); /* + 32 = don't show */
		}
		else
		{
			show_player1_controls_y = lerp(show_player1_controls_y, 158, 0.1);
			show_player2_controls_y = lerp(show_player2_controls_y, 116, 0.1);
			show_player3_controls_y = lerp(show_player3_controls_y, 74, 0.1);
			show_player4_controls_y = lerp(show_player4_controls_y, 32, 0.1);
		}
		
		#endregion /* Y position of show controls for each player END */
		
		scr_draw_show_controls(1);
		scr_draw_show_controls(2);
		scr_draw_show_controls(3);
		scr_draw_show_controls(4);
		
	}
	#endregion /* Show Multiplayer Controls END */
	
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (show_controller_input_change_prompt > 0)
{
	show_controller_input_change_prompt -= 1;
	show_keyboard_and_mouse_input_change_prompt = 0;
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, -400, 0.1);
}
else
{
	show_controller_input_change_prompt_y = lerp(show_controller_input_change_prompt_y, 0, 0.1);
}

if (show_keyboard_and_mouse_input_change_prompt > 0)
{
	show_keyboard_and_mouse_input_change_prompt -= 1;
	show_controller_input_change_prompt = 0;
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, -400, 0.1);
}
else
{
	show_keyboard_and_mouse_input_change_prompt_y = lerp(show_keyboard_and_mouse_input_change_prompt_y, 0, 0.1);
}
if (global.player1_can_play >= 1) /* Only show controller input change if there is only one player in the game */
and (global.player2_can_play <= 0)
and (global.player3_can_play <= 0)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play >= 1)
and (global.player3_can_play <= 0)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play >= 1)
and (global.player4_can_play <= 0)
or (global.player1_can_play <= 0)
and (global.player2_can_play <= 0)
and (global.player3_can_play <= 0)
and (global.player4_can_play >= 1)
{
	if (global.show_prompt_when_changing_to_gamepad == true)
	{
		draw_sprite_ext(spr_change_input_to_controller, 0, 110, get_window_height + 300 + show_controller_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
	if (global.show_prompt_when_changing_to_keyboard_and_mouse == true)
	{
		draw_sprite_ext(spr_change_input_to_keyboard, 0, 110, get_window_height + 300 + show_keyboard_and_mouse_input_change_prompt_y, 1, 1, 0, c_white, 1);
	}
}
#endregion /* Show what input is used END */

scr_virtual_keys();

#region /* Display Rank */
if (global.goal_active == true)
and (global.show_ranks == true)
and (global.enable_ranks == true)
{
	if (global.character_select_in_this_menu == "main_game")
	and (file_exists("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini"))
	
	or (global.character_select_in_this_menu == "level_editor")
	and (global.select_level_index <= 0)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
		
	or (global.character_select_in_this_menu == "level_editor")
	and (global.create_level_from_template >= 2)
	and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
	
	or (global.character_select_in_this_menu == "level_editor")
	and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
	{
		if (global.character_select_in_this_menu == "main_game")
		{
			ini_open("levels/" + string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		and (global.select_level_index <= 0)
		or (global.character_select_in_this_menu == "level_editor")
		and (global.create_level_from_template >= 2)
		{
			ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
		}
		
		if (ini_key_exists("rank", "rank_level_score"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width / 2 - 128, get_window_height / 2 - 74, l10n_text("Score"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right);
			scr_draw_text_outlined(get_window_width / 2 - 32, get_window_height / 2 + 74, l10n_text("S Rank Score") + ": " + string(ini_read_real("rank", "rank_level_score", 0)), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width / 2 - 32, get_window_height / 2 + 74 + 32, l10n_text("Your Score") + ": " + string(score), global.default_text_size, c_black, c_white, 1);
			if (score >= ini_read_real("rank", "rank_level_score", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank S */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank A */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 50000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank B */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 80000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank C */
			}
			else
			if (score >= ini_read_real("rank", "rank_level_score", 0) - 100000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank D */
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, get_window_width / 2 - 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank E */
			}
		}
		if (ini_key_exists("rank", "rank_timeattack_realmillisecond"))
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width / 2 + 128, get_window_height / 2 - 74, l10n_text("Time"), global.default_text_size, c_black, c_white, 1);
			draw_set_halign(fa_right)
			scr_draw_text_outlined(get_window_width / 2 + 328, get_window_height / 2 + 74, l10n_text("S Rank Time") + ": " + string(ini_read_real("rank", "rank_timeattack_minute", 0)) + ":" + string(ini_read_real("rank", "rank_timeattack_second", 0)) + "." + string(string_replace_all(string_format(ini_read_real("rank", "rank_timeattack_millisecond", 0), 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(get_window_width / 2 + 328, get_window_height / 2 + 74 + 32, l10n_text("Your Time") + ": " + string(global.timeattack_minute) + ":" + string(global.timeattack_second) + "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size, c_black, c_white, 1);
			
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0))
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 0, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank S */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 1000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 1, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank A */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 5000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 2, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank B */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 8000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 3, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank C */
			}
			else
			if (global.timeattack_realmillisecond <= ini_read_real("rank", "rank_timeattack_realmillisecond", 0) + 10000)
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 4, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank D */
			}
			else
			{
				draw_sprite_ext(global.resource_pack_sprite_ranks, 5, get_window_width / 2 + 128, get_window_height / 2, 1, 1, 0, c_white, 1); /* Rank E */
			}
		}
		ini_close();
	}
}
#endregion /* Display Rank END */

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (show_letterbox > 0)
and (global.play_edited_level == false)
and (global.actually_play_edited_level == false)
or(show_letterbox > 0)
and (global.play_edited_level == true)
and (global.actually_play_edited_level == true)
{
	draw_rectangle_color(0, 0, get_window_width * 3, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, get_window_width * 3, get_window_height * 3, c_black, c_black, c_black, c_black, false);
}
if (asset_get_type("obj_player") == asset_object)
and (!instance_exists(obj_player))
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
or (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (obj_player.can_move = false)
{
	letterbox_top_y = lerp(letterbox_top_y, + 64, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, get_window_height - 64, 0.1);
	show_letterbox = 60;
}
else
{
	letterbox_top_y = lerp(letterbox_top_y, 0, 0.1);
	letterbox_bottom_y = lerp(letterbox_bottom_y, get_window_height, 0.1);
	if (show_letterbox > 0)
	{
		show_letterbox -= 1;
	}
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

if (global.doing_clear_check == true)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width / 2, 32, l10n_text("Clear from the start"), global.default_text_size, c_white, c_black, 1);
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
}

scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (iris_xscale <= 1)
and (iris_zoom != 0)
or (instance_exists(obj_player_lose))
and (obj_player_lose.iris_xscale <= 1)
and (obj_player_lose.iris_zoom != 0)
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 1, 0.1);
}
else
{
	black_screen_gui_alpha = lerp(black_screen_gui_alpha, 0, 0.1);
}
if (global.enable_transitions == true)
{
	draw_set_alpha(black_screen_gui_alpha);
	draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */