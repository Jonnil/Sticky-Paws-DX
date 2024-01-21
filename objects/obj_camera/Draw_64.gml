var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

scr_zoom_camera_draw_gui(10);

#region /* Big Collectibles, Basic Collectibles, Score and Timer */

#region /* Big Collectibles */
if (hud_show_big_collectibles_y != -64)
{
	
	#region /* Big Collectible 1 */
	if (!global.big_collectible1)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	if (global.big_collectible1)
	&& (!global.big_collectible1_already_collected)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Big Collectible 1 END */
	
	#region /* Big Collectible 2 */
	if (!global.big_collectible2)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	if (global.big_collectible2)
	&& (!global.big_collectible2_already_collected)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Big Collectible 2 END */
	
	#region /* Big Collectible 3 */
	if (!global.big_collectible3)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	if (global.big_collectible3)
	&& (!global.big_collectible3_already_collected)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Big Collectible 3 END */
	
	#region /* Big Collectible 4 */
	if (!global.big_collectible4)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	if (global.big_collectible4)
	&& (!global.big_collectible4_already_collected)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Big Collectible 4 END */
	
	#region /* Big Collectible 5 */
	if (!global.big_collectible5)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5);
	}
	else
	if (global.big_collectible5)
	&& (!global.big_collectible5_already_collected)
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
if (hud_show_basic_collectibles_y != -64)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 0, 32, hud_show_basic_collectibles_y, 0.75, 0.75, 0, c_white, 1);
	scr_draw_text_outlined(64, hud_show_basic_collectibles_y, global.basic_collectibles, global.default_text_size, c_black, c_white, 1);
}
#endregion /* Basic Collectible END */

#region /* Score */
if (hud_show_score_y != -64)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(get_window_width - 200, hud_show_score_y, l10n_text("Score") + "\n" + string(score), global.default_text_size, c_white, c_black, 1);
}
#endregion /* Score END */

#region /* Time Countdown */
if (global.enable_time_countdown)
{
	if (global.controls_used_for_navigation == "mouse")
	{
		time_countup_y = 94 + 42;
	}
	else
	{
		time_countup_y = 94;
	}
	
	#region /* Time is running out message */
	if (!global.player_has_entered_goal)
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
		
		#region /* Time Over Message */
		if (global.time_countdown == 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, l10n_text("TIME OVER"), global.default_text_size * 5, c_black, c_white, 1);
		}
		#endregion /* Time Over Message END */
		
	}
	#endregion /* Time is running out message END */
	
	#region /* Show the Time Countdown */
	if (global.hud_hide_time > 0)
	if (global.time_countdown >= 0)
	{
		if (global.controls_used_for_navigation == "mouse")
		{
			var time_countdown_y = 42 + 42;
		}
		else
		{
			var time_countdown_y = 42;
		}
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		if (!global.player_has_entered_goal)
		{
			if (global.time_countdown == 0)
			{
				scr_draw_text_outlined(get_window_width - 32, time_countdown_y, "TIME\n0", global.default_text_size, c_black, c_red, 1);
			}
			else
			{
				if (global.time_countdown >= 100)
				{
					scr_draw_text_outlined(get_window_width - 32, time_countdown_y, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_yellow, 1);
					draw_text_transformed_color(get_window_width - 32, time_countdown_y, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_orange, c_orange, c_orange, c_orange, timer_blinking_alpha);
				}
				else
				{
					scr_draw_text_outlined(get_window_width - 32, time_countdown_y, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_orange, 1);
					draw_text_transformed_color(get_window_width - 32, time_countdown_y, "TIME\n" + string(global.time_countdown), global.default_text_size, global.default_text_size, 0, c_red, c_red, c_red, c_red, timer_blinking_alpha);
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
			scr_draw_text_outlined(get_window_width - 32, time_countdown_y, "TIME\n" + string(global.time_countdown), global.default_text_size, c_black, c_white, 1);
		}
	}
	#endregion /* Show the Time Countdown END */
	
}
else
{
	if (global.controls_used_for_navigation == "mouse")
	{
		time_countup_y = 32 + 42;
	}
	else
	{
		time_countup_y = 32;
	}
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

#endregion /* Big Collectibles, Basic Collectibles, Score and Timer END */

#region /* Show a pause button on screen when using the mouse */
if (global.controls_used_for_navigation == "mouse")
{
	menu_cursor_index += 0.3;
	if (!global.actually_play_edited_level)
	{
		var pause_text = l10n_text("Edit Level");
	}
	else
	{
		var pause_text = l10n_text("Pause");
	}
	draw_menu_button_sprite(spr_menu_button, display_get_gui_width() - 185, 0,,, 0.5, 1, 185, 42, string(pause_text), "pause", "pause");
}
#endregion /* Show a pause button on screen when using the mouse END */

scr_debug_screen();

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
{
	scr_draw_show_controls(1);
	scr_draw_show_controls(2);
	scr_draw_show_controls(3);
	scr_draw_show_controls(4);
}
#endregion /* Show Controls END */

#region /* Show what input is used */
if (global.playergame == 1) { /* Only show controller input change if there is only one player in the game */
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

#region /* Letterboxing during cutscenes (when the player object is absent) */
if (show_letterbox > 0) {
	draw_rectangle_color(0, 0, get_window_width, letterbox_top_y, c_black, c_black, c_black, c_black, false);
	draw_rectangle_color(0, letterbox_bottom_y, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
}
#endregion /* Letterboxing during cutscenes (when the player object is absent) END */

if (global.doing_clear_check_level || global.doing_clear_check_character) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.doing_clear_check_level) {
		scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("Clear from the start"), global.default_text_size, c_black, c_white, 1);
	}
	else
	if (global.doing_clear_check_character) {
		scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("Clear level 1 before upload"), global.default_text_size, c_black, c_white, 1);
	}
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
}

#region /* Playtest Level Buttons */
if (global.character_select_in_this_menu == "level_editor")
&& (global.play_edited_level) /* When playtesting the level */
&& (!global.actually_play_edited_level) /* But not actually playing the level */
&& (!global.doing_clear_check_level)
&& (!global.doing_clear_check_character)
|| (global.character_select_in_this_menu == "main_game")
&& (global.debug_screen)
&& (!global.doing_clear_check_level)
&& (!global.doing_clear_check_character)
{
	if (global.playtest_invincibility)
	{
		var playtest_invincibility_blend = c_white;
	}
	else
	{
		var playtest_invincibility_blend = c_dkgray;
	}
	if (global.playtest_moonjump)
	{
		var playtest_moonjump_blend = c_white;
	}
	else
	{
		var playtest_moonjump_blend = c_dkgray;
	}
	if (global.character_select_in_this_menu == "level_editor")
	{
		var pause_x = 32;
		var playtest_invincibility_x = 96;
		var playtest_moonjump_x = 160;
		draw_sprite_ext(spr_menu_button_pause, 0, 32, display_get_gui_height() - 32, 1, 1, 0, c_white, 1);
	}
	else
	{
		var pause_x = -999;
		var playtest_invincibility_x = 32;
		var playtest_moonjump_x = 96;
	}
	draw_sprite_ext(spr_leveleditor_icon_invincibility, 0, playtest_invincibility_x, display_get_gui_height() - 32, 1, 1, 0, playtest_invincibility_blend, 1);
	draw_sprite_ext(spr_leveleditor_icon_moonjump, 0, playtest_moonjump_x, display_get_gui_height() - 32, 1, 1, 0, playtest_moonjump_blend, 1);
	
	#region /* Draw Pause Key */
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(gp_select, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_escape, 32 + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Pause key END */
	
	#region /* Draw Invincibility Key */
	var invincibility_key = ord("I");
	var invincibility_button = gp_shoulderl;
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(invincibility_button, playtest_invincibility_x + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, invincibility_key, playtest_invincibility_x + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Invincibility key END */
	
	#region /* Draw Moonjump Key */
	var moonjump_key = ord("M");
	var moonjump_button = gp_shoulderlb;
	if (gamepad_is_connected(global.player_slot[1]))
	&& (global.controls_used_for_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(moonjump_button, playtest_moonjump_x + 20, display_get_gui_height() - 32 + 20, 0.4, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, moonjump_key, playtest_moonjump_x + 20, display_get_gui_height() - 32 + 20, 0.4, 0.4, 0, c_white, 1);
	}
	#endregion /* Draw Moonjump key END */
	
	#region /* Press Pause button */
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), pause_x - 32 + 1, display_get_gui_height() - 64, pause_x + 32, display_get_gui_height() + 64 - 1)
	|| gamepad_button_check_pressed(global.player_slot[1], gp_select))
	&& (pause_x > 0)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			can_click_on_pause_key = true;
		}
		if (mouse_check_button_released(mb_left))
		&& (can_click_on_pause_key)
		&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), pause_x - 32 + 1, display_get_gui_height() - 64, pause_x + 32, display_get_gui_height() + 64 - 1))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_select))
		{
			pause_playtest = true;
			black_screen_gui_alpha = 1;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			score = 0;
			
			#region /* Save Level Information when in level editor */
			if (global.level_name != "" && !global.actually_play_edited_level)
			{
				ini_open(working_directory + "custom_levels/" + global.level_name + "/data/level_information.ini");
				ini_write_real("info", "view_xview", camera_get_view_x(view_camera[view_current]));
				ini_write_real("info", "view_yview", camera_get_view_y(view_camera[view_current]));
				ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			}
			#endregion /* Save Level Information when in level editor END */
			
			var time_source = time_source_create(time_source_game, 1, time_source_units_frames, function()
			{
				room_restart();
			}
			, [], 1);
			time_source_start(time_source);
		}
		draw_set_alpha(0.5);
		draw_rectangle_color(32 - 32 + 1, display_get_gui_height() - 64, 32 + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
		draw_set_alpha(1);
	}
	else
	if (mouse_check_button_released(mb_left))
	&& (can_click_on_pause_key)
	{
		can_click_on_pause_key = false;
	}
	#endregion /* Press Pause button END */
	
	/* Press Invincibility button */
	if (mouse_check_button_released(mb_left))
	&& (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), playtest_invincibility_x - 32, display_get_gui_height() - 64, playtest_invincibility_x + 32, display_get_gui_height() + 64 - 1))
	|| (keyboard_check_pressed(invincibility_key))
	|| (gamepad_button_check_pressed(global.player_slot[1], invincibility_button))
	{
		global.playtest_invincibility = not global.playtest_invincibility;
	}
	
	/* Press Moonjump button */
	if (mouse_check_button_released(mb_left))
	&& (global.controls_used_for_navigation == "mouse")
	&& (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), playtest_moonjump_x - 32, display_get_gui_height() - 64, playtest_moonjump_x + 32, display_get_gui_height() + 64 - 1))
	|| (keyboard_check_pressed(moonjump_key))
	|| (gamepad_button_check_pressed(global.player_slot[1], moonjump_button))
	{
		global.playtest_moonjump = not global.playtest_moonjump;
	}
}

/* Prevent cheating with playtest tools when playing actual level or doing clear check */
if (global.actually_play_edited_level && !global.debug_screen)
|| (global.doing_clear_check_level)
|| (global.doing_clear_check_character)
{
	global.playtest_invincibility = false;
	global.playtest_moonjump = false;
}
#endregion /* Playtest Level Buttons END */

#region /* Defeat Counter */
if (hud_show_defeats_y != -64)
&& (global.show_defeats_counter)
{
	if (sprite_lives_icon > noone)
	{
		draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_defeats_y, 0.75, 0.75, 0, c_gray, 1);
	}
	draw_line_width_color(32 - 16, hud_show_defeats_y - 16, 32 + 16, hud_show_defeats_y + 16, 3, c_red, c_red);
	draw_line_width_color(32 - 16, hud_show_defeats_y + 16, 32 + 16, hud_show_defeats_y - 16, 3, c_red, c_red);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, hud_show_defeats_y, string(global.lives_until_assist), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Defeat Counter END */

#region /* Lives Counter (Show above defeat counter) */
if (hud_show_lives_y != -64)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (sprite_lives_icon > noone)
	{
		draw_sprite_ext(sprite_lives_icon, 0, 32, hud_show_lives_y, 1, 1, 0, c_white, 1);
	}
	scr_draw_text_outlined(64, hud_show_lives_y, lives, global.default_text_size, c_black, c_white, 1);
}
#endregion /* Lives Counter (Show above defeat counter) END */

scr_draw_darken_screen_when_window_is_unfocused();
scr_draw_cursor_mouse();

#region /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see */
if (black_screen_gui_alpha > 0.2)
|| (pause_playtest)
{
	if (global.enable_transitions)
	&& (!pause_playtest)
	{
		draw_set_alpha(black_screen_gui_alpha);
		draw_rectangle_color(0, 0, get_window_width * 2, get_window_height * 2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	
	#region /* Draw loading screen when transitioning to other rooms */
	if (lives >= 1)
	|| (pause_playtest)
	{
		scr_draw_loading(black_screen_gui_alpha);
	}
	#endregion /* Draw loading screen when transitioning to other rooms END */
	
}
#endregion /* Make the screen completly black in Draw GUI, so there is no chance to see something you're not supposed to see END */