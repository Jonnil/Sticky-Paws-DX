function scr_draw_level_hud() {
	if (global.hud_hide_time != 0) {
		var window_width = display_get_gui_width();
	    var window_height = display_get_gui_height();
	    var half_window_width = window_width * 0.5;
		var half_window_height = window_height * 0.5;
		
	    /* Pre-calculate frequently used values */
	    var collectible_alpha = 1;
	    var collectible_outline_sprite = global.resource_pack_sprite_big_collectible_outline;
	    var collectible_sprite = global.resource_pack_sprite_big_collectible;
		
		if (global.player_has_entered_goal && global.lives_until_assist == 0) {
			var zero_defeats_x = 200;
			if (global.zero_hits) {
				var zero_defeats_sprite = spr_icon_zero_hits;
				var zero_defeats_text = l10n_text("Zero Hits");
			}
			else {
				var zero_defeats_sprite = spr_icon_zero_defeats;
				var zero_defeats_text = l10n_text("Zero Defeats");
			}
			draw_sprite_ext(zero_defeats_sprite, 0, zero_defeats_x, 32, 1, 1, 0, c_white, 1);
			draw_set_halign(fa_left);
			scr_draw_text_outlined(zero_defeats_x + 20, 32, zero_defeats_text, global.default_text_size, c_black, c_white, 1);
		}
		
		/* Defeat Counter */
		if (hud_show_defeats_y != -64 && global.show_defeats_counter) {
		    draw_sprite_ext(sprite_exists(sprite_lives_icon) ? sprite_lives_icon : spr_1up, 0, 32, hud_show_defeats_y, 0.75, 0.75, 0, c_gray, 1);
		    draw_line_width_color(32 - 16, hud_show_defeats_y - 16, 32 + 16, hud_show_defeats_y + 16, 3, c_red, c_red);
		    draw_line_width_color(32 - 16, hud_show_defeats_y + 16, 32 + 16, hud_show_defeats_y - 16, 3, c_red, c_red);
		    draw_set_halign(fa_left);
		    draw_set_valign(fa_middle);
		    scr_draw_text_outlined(64, hud_show_defeats_y, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
		}
		
		/* Lives Counter */
		if (hud_show_lives_y != -64) {
		    draw_set_halign(fa_left);
		    draw_set_valign(fa_middle);
		    draw_sprite_ext(sprite_exists(sprite_lives_icon) ? sprite_lives_icon : spr_1up, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
		    scr_draw_text_outlined(64, hud_show_lives_y, string(lives), global.default_text_size, c_black, c_white, 1);
		}
		
	    #region /* Big Collectibles */
	    if (hud_show_big_collectibles_y != -64)
		{
	        draw_set_halign(fa_left);
	        draw_set_valign(fa_middle);
	        for (var i = 1; i <= global.max_big_collectible; i++)
			{
				if (hud_show_big_collectible_blink[i] >= 1)
				{
					hud_show_big_collectible_blink[i] -= 1;
					collectible_alpha = scr_wave(0, 1, 0.5);
				}
				else
				{
					collectible_alpha = (global.big_collectible[i] && !global.big_collectible_already_collected[i]) ? 0.5 : 1;
				}
	            draw_sprite_ext((global.big_collectible[i] ? collectible_sprite : collectible_outline_sprite), 0, 32 * i, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, collectible_alpha);
	        }
	    }
		#endregion /* Big Collectibles END */
		
	    /* Basic Collectible */
	    if (hud_show_basic_collectibles_y != -64) {
	        draw_set_halign(fa_left);
	        draw_set_valign(fa_middle);
	        draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles_y, 0.75, 0.75, 0, c_white, 1);
	        scr_draw_text_outlined(64, hud_show_basic_collectibles_y, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
	    }
		
	    /* Score */
	    if (hud_show_score_y != -128) {
	        draw_set_halign(fa_right);
	        draw_set_valign(fa_middle);
	        scr_draw_text_outlined(window_width - 200, hud_show_score_y, l10n_text("Score") + "\n" + string(score), global.default_text_size, c_white, c_black, 1);
	    }
		
		#region /* Time Countdown */
		if (global.enable_time_countdown) {
			var time_countup_y = global.controls_used_for_navigation == "mouse" ? 94 + 42 : 94;
			
			#region /* Time is running out message */
			if (!global.player_has_entered_goal) {
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				
				if (global.time_countdown <= 99 && hurry_up_message_timer <= 300) { /* Make the hurry up message stay on screen for 5 seconds (which is 300 frames) */
					hurry_up_message_timer ++;
					scr_draw_text_outlined(half_window_width, half_window_height, l10n_text("HURRY UP!"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 0.5));
				}
				
				#region /* Time Over Message */
				if (global.time_countdown == 0) {
					scr_draw_text_outlined(half_window_width, half_window_height, l10n_text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
				}
				#endregion /* Time Over Message END */
				
			}
			#endregion /* Time is running out message END */
			
			#region /* Show the Time Countdown */
			if (global.hud_hide_time > 0 && global.time_countdown >= 0) {
				draw_set_halign(fa_right);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(window_width - 32, time_countup_y, l10n_text("TIME") + "\n" + string(global.time_countdown), global.default_text_size, c_black, time_fill_color, 1);
				draw_text_transformed_color(window_width - 32, time_countup_y, l10n_text("TIME") + "\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, time_fill_color_blink, time_fill_color_blink, time_fill_color_blink, time_fill_color_blink, timer_blinking_alpha);
			}
			#endregion /* Show the Time Countdown END */
			
		}
		#endregion /* Time Countdown END */
		
	    /* Time countup in Minutes, Seconds, and Milliseconds */
	    if ((global.show_timer && !global.debug_screen) || (global.player_has_entered_goal && !global.debug_screen)) {
	        var time_countup_y = global.controls_used_for_navigation == "mouse" ? 32 + 42 : 32;
	        if (global.timeattack_realmillisecond < timeattack_record_realmillisecond && global.player_has_entered_goal && timeattack_record_realmillisecond != 999999999) {
	            scr_draw_text_outlined(window_width - 32, time_countup_y - 20, l10n_text("New Record"), global.default_text_size * 0.75, c_black, c_white, scr_wave(0, 1, 0.5));
	        }
	        draw_set_halign(fa_right);
	        if (global.timeattack_minute > 0) {
	            scr_draw_text_outlined(window_width - 100, time_countup_y, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
	        }
	        if (global.timeattack_minute <= 0 && global.timeattack_second <= 9) {
	            scr_draw_text_outlined(window_width - 65, time_countup_y, string(global.timeattack_second), global.default_text_size, c_black, c_white, 1);
	        }
			else
			{
	            scr_draw_text_outlined(window_width - 65, time_countup_y, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
	        }
	        scr_draw_text_outlined(window_width - 30, time_countup_y + 2, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
	        if (timeattack_record_realmillisecond != 999999999) {
	            scr_draw_text_outlined(window_width - 32, time_countup_y + 32, best_time_text, global.default_text_size * 0.75, c_black, c_white, 1);
	        }
	    }
	}
}