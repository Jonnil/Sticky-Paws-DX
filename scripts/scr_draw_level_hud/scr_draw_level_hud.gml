function scr_draw_level_hud() {
	var get_window_width = display_get_gui_width();
	
	#region /* Big Collectibles, Basic Collectibles, Score and Timer */
	
	#region /* Big Collectibles */
	if (hud_show_big_collectibles_y != -64) {
		for(var i = 1; i <= global.max_big_collectible; i += 1) {
			if (!global.big_collectible[i]) {
				var big_collectible_sprite = global.resource_pack_sprite_big_collectible_outline;
				var big_collectible_alpha = 0.5;
			}
			else
			if (global.big_collectible[i])
			&& (!global.big_collectible_already_collected[i]) {
				var big_collectible_sprite = global.resource_pack_sprite_big_collectible;
				var big_collectible_alpha = 0.5;
			}
			else {
				var big_collectible_sprite = global.resource_pack_sprite_big_collectible;
				var big_collectible_alpha = 1;
			}
			draw_sprite_ext(big_collectible_sprite, 0, 32 * i, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, big_collectible_alpha);
		}
	}
	#endregion /* Big Collectibles */
	
	#region /* Basic Collectible */
	if (hud_show_basic_collectibles_y != -64) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles_y, 0.75, 0.75, 0, c_white, 1);
		scr_draw_text_outlined(64, hud_show_basic_collectibles_y, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
	}
	#endregion /* Basic Collectible END */
	
	#region /* Score */
	if (hud_show_score_y != -64) {
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(get_window_width - 200, hud_show_score_y, l10n_text("Score") + "\n" + string(score), global.default_text_size, c_white, c_black, 1);
	}
	#endregion /* Score END */
	
	#region /* Time Countdown */
	if (global.enable_time_countdown) {
		if (global.controls_used_for_navigation == "mouse") {
			time_countup_y = 94 + 42;
		}
		else {
			time_countup_y = 94;
		}
		
		#region /* Time is running out message */
		if (!global.player_has_entered_goal) {
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			if (global.time_countdown <= 99 && hurry_up_message_timer <= 300) { /* Make the hurry up message stay on screen for 5 seconds (which is 300 frames) */
				hurry_up_message_timer ++;
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("HURRY UP!"), global.default_text_size, c_black, c_red, scr_wave(0, 1, 0.5));
			}
			
			#region /* Time Over Message */
			if (global.time_countdown == 0) {
				scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
			}
			#endregion /* Time Over Message END */
			
		}
		#endregion /* Time is running out message END */
		
		#region /* Show the Time Countdown */
		if (global.hud_hide_time > 0 && global.time_countdown >= 0) {
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(get_window_width - 32, time_countdown_y, l10n_text("TIME") + "\n" + string(global.time_countdown), global.default_text_size, c_black, time_fill_color, 1);
			draw_text_transformed_color(get_window_width - 32, time_countdown_y, l10n_text("TIME") + "\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, time_fill_color_blink, time_fill_color_blink, time_fill_color_blink, time_fill_color_blink, timer_blinking_alpha);
		}
		#endregion /* Show the Time Countdown END */
		
	}
	else {
		if (global.controls_used_for_navigation == "mouse") {
			time_countup_y = 32 + 42;
		}
		else {
			time_countup_y = 32;
		}
	}
	#endregion /* Time Countdown END */
	
	#region /* Time countup in Minutes, Seconds and Milliseconds */
	if (global.show_timer && !global.debug_screen)
	|| (global.player_has_entered_goal && !global.debug_screen) {
		if (global.timeattack_realmillisecond < timeattack_record_realmillisecond)
		&& (global.player_has_entered_goal)
		&& (timeattack_record_realmillisecond != 999999999) {
			scr_draw_text_outlined(get_window_width - 32, time_countup_y - 20, l10n_text("New Record"), global.default_text_size * 0.75, c_black, c_white, scr_wave(0, 1, 0.5));
		}
		
		#region /* Your Time */
		draw_set_halign(fa_right)
		if (global.timeattack_minute > 0) {
			scr_draw_text_outlined(get_window_width - 100, time_countup_y, string(global.timeattack_minute) + ":", global.default_text_size, c_black, c_white, 1);
		}
		if (global.timeattack_minute <= 0)
		&& (global.timeattack_second <= 9) {
			scr_draw_text_outlined(get_window_width - 65, time_countup_y, string(global.timeattack_second), global.default_text_size, c_black, c_white, 1);
		}
		else {
			scr_draw_text_outlined(get_window_width - 65, time_countup_y, string_replace_all(string_format(global.timeattack_second, 2, 0), " ", "0"), global.default_text_size, c_black, c_white, 1);
		}
		scr_draw_text_outlined(get_window_width - 30, time_countup_y + 2, "." + string(string_replace_all(string_format(global.timeattack_millisecond, 2, 0), " ", "0")), global.default_text_size * 0.75, c_black, c_white, 1);
		#endregion /* Your Time END */
		
		#region /* Record Time */
		if (timeattack_record_realmillisecond != 999999999) {
			draw_set_halign(fa_right)
			scr_draw_text_outlined(get_window_width - 32, time_countup_y + 32, best_time_text, global.default_text_size * 0.75, c_black, c_white, 1);
		}
		#endregion /* Record Time END */
		
	}
	#endregion /* Time countup in Minutes, Seconds and Milliseconds END */
	
	#endregion /* Big Collectibles, Basic Collectibles, Score and Timer END */
	
}