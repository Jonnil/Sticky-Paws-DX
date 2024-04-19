var get_window_width = display_get_gui_width();
var get_window_height = display_get_gui_height();

if (global.go_to_menu_when_going_back_to_title == "online_download_list_load")
{
	var quit_to_title_name = "Quit to Online Level List";
}
else
if (global.character_select_in_this_menu == "level_editor")
{
	var quit_to_title_name = "Quit to Level Select";
}
else
{
	var quit_to_title_name = "Quit to Title";
}

#region /* Pause Screenshot */
if (sprite_exists(global.pause_screenshot))
{
	var spr_width = sprite_get_width(global.pause_screenshot);
	var spr_height = sprite_get_height(global.pause_screenshot);
	
	var scale_x = get_window_width / spr_width;
	var scale_y = get_window_height / spr_height;
	
	draw_sprite_ext(global.pause_screenshot, 0, 0, 0, scale_x, scale_y, 0, c_white, 1);
}
#endregion /* Pause Screenshot END */

#region /* Darker Background */
if (!hide_menu_for_clean_screenshots)
{
	draw_set_alpha(0.5 * fade_in_pause_alpha);
	draw_rectangle_color(0, 0, get_window_width, get_window_height, c_red, c_blue, c_blue, c_red, false);
	draw_rectangle_color(0, 0, get_window_width, get_window_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
#endregion /* Darker Background END */

#region /* Which player is controlling the pause menu? */
draw_set_alpha(fade_in_pause_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

#region /* Big Collectibles */
if (global.pause_room == rm_leveleditor)
&& (!hide_menu_for_clean_screenshots)
{
	for(var i = 1; i <= global.max_big_collectible; i += 1)
	{
		if (!global.big_collectible[i])
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 * i, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
		}
		else
		if (global.big_collectible[i])
		&& (!global.big_collectible_already_collected[i])
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 * i, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
		}
		else
		{
			draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 * i, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
		}
	}
}
#endregion /* Big Collectibles */

#region /* Hide menu for clean screenshots text */
if (!hide_menu_for_clean_screenshots)
&& (!in_settings)
&& (os_type != os_ios)
&& (os_type != os_android)
{
	if (menu == "continue") /* Can only hide menu when on these buttons specifically */
	|| (menu == "change_character")
	|| (menu == "edit_level")
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	{
		/* Show Controls when pausing the game, so player can always know how to control the game at any point they pause */
		if (os_type != os_ios && os_type != os_android) {
		    for (var i = 1; i <= global.max_players; i++) {
		        if (global.player_can_play[i]) {
		            scr_draw_show_controls(i,, 1, 1);
		        }
		    }
		}
		
		var hide_menu_for_clean_screenshots_y = get_window_height - 32 - show_player_controls_y[1] - 8;
		if (global.controls_used_for_navigation == "gamepad")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(gp_face4, 32, hide_menu_for_clean_screenshots_y, 0.4, c_white, fade_in_pause_alpha, 1, 1, global.pause_player + 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, ord("Y"), 32, hide_menu_for_clean_screenshots_y, 0.4, 0.4, 0, c_white, fade_in_pause_alpha);
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(54, hide_menu_for_clean_screenshots_y, ": " + l10n_text("Hide menu for clean screenshots"), global.default_text_size * 0.75, c_black, c_white, fade_in_pause_alpha);
	}
}
#endregion /* Hide menu for clean screenshots text END */

if (!hide_menu_for_clean_screenshots)
{
	
	#region /* Games Logo in top left corner */
	if (menu == "continue") /* Can only hide menu when on these buttons specifically */
	|| (menu == "change_character")
	|| (menu == "edit_level")
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	|| (menu == "reset_from_checkpoint" || menu == "reset_from_start" || menu == "restart_nevermind")
	|| (menu == "quit_to_map" || menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
	{
		if (global.title_logo_index >= 0)
		{
			draw_sprite_ext(global.title_logo_index, 0, 160, scr_wave(70, 80, 4.5, 0), (402 / sprite_get_height(global.title_logo_index)) * 0.3, (402 / sprite_get_height(global.title_logo_index)) * 0.3, 0, c_white, 1 * fade_in_pause_alpha);
		}
		
		#region /* Display level information */
		if (global.pause_room == rm_leveleditor) {
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			scr_draw_text_outlined(32, 320,
			string(display_level_name) + "\n" +
			string(display_level_author) + "\n" +
			string(display_level_id) + "\n"
			, global.default_text_size * 0.75, c_black, c_white, 1 * fade_in_pause_alpha);
			scr_draw_level_tags(32, 420, false, fa_left, false, global.default_text_size * 0.75, 1 * fade_in_pause_alpha);
			
			if (display_level_author != "") {
				draw_sprite_ext(spr_icon_person, 0, 16, 320, 1, 1, 0, c_white, 1);
			}
			
			hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 160, 0.1);
		}
		#endregion /* Display level information END */
		
	}
	else
	{
		hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 0, 0.1);
	}
	#endregion /* Games Logo in top left corner END */
	
	if (!in_settings)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		for(var i = 1; i <= global.max_players; i += 1)
		{
			if (i == 1)
			&& (global.pause_player == 0)
			&& (global.playergame >= 2) /* Only show that player 1 is controlling the menu if it's a multiplayer game, otherwise players can assume player 1 is controlling the menu */
			|| (i >= 2)
			&& (global.pause_player == i - 1) /* If it happens that player 2, 3, or 4 is controlling the menu, player needs to know this, even if it's not technically a multiplayer game */
			{
				scr_draw_text_outlined(get_window_width * 0.5, 32, l10n_text("PLAYER " + string(i) + " IS CONTROLLING THE MENU"), global.default_text_size, c_black, c_aqua, fade_in_pause_alpha);
			}
		}
	}
	#endregion /* Which player is controlling the pause menu? END */
	
	#region /* Pause Text */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if (menu == "continue")
	|| (menu == "change_character")
	|| (menu == "edit_level")
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	|| (menu == "reset_from_checkpoint" || menu == "reset_from_start" || menu == "restart_nevermind")
	|| (menu == "quit_to_map" || menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
	{
		draw_sprite_ext(spr_pause_text, image_index, get_window_width * 0.5, 200, 1, 1, 0, c_white, scr_wave(0, 1, 4.5, 0) * fade_in_pause_alpha);
	}
	#endregion /* Pause Text END */
	
	/* PAUSE LEVEL SELECT / LEVEL EDITOR MENU */
	if (!show_loading_icon)
	&& (room == rm_world_map
	|| room == rm_leveleditor
	|| global.pause_room == rm_world_map
	|| global.pause_room == rm_leveleditor)
	{
		if (menu == "continue")
		|| (menu == "change_character")
		|| (menu == "edit_level")
		|| (menu == "options")
		|| (menu == "restart")
		|| (menu == "quit")
		|| (menu == "report")
		{
			draw_menu_button(get_window_width * 0.5 - 185, continue_y, l10n_text("Continue"), "continue", "continue", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, continue_y + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			
			draw_menu_button(get_window_width * 0.5 - 185, change_character_y, l10n_text("Change Character"), "change_character", "load_characters", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icon_change_character, 0, get_window_width * 0.5 - 185 + 20, change_character_y + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			
			if (global.character_select_in_this_menu == "level_editor")
			&& (!file_exists(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini"))
			&& (ds_list_size(global.all_loaded_custom_levels) - 1 < global.max_custom_levels) /* Don't let player download levels if they have reached the max amount of levels stored */
			{
				draw_menu_button(get_window_width * 0.5 - 185, edit_level_y, l10n_text("Download to Level Select"), "edit_level", "edit_level", c_lime, fade_in_pause_alpha);
			}
			else
			if (global.character_select_in_this_menu == "level_editor")
			&& (file_exists(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini"))
			{
				draw_menu_button(get_window_width * 0.5 - 185, edit_level_y, l10n_text("Edit Level"), "edit_level", "edit_level", c_lime, fade_in_pause_alpha);
			}
			
			if (room == rm_leveleditor)
			|| (global.pause_room == rm_leveleditor)
			{
				draw_menu_button(get_window_width * 0.5 - 185, option_y, l10n_text("Options"), "options", "options", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icon_cogwheel, 0, get_window_width * 0.5 - 185 + 20, option_y + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
				if (!global.goal_active)
				{
					draw_menu_button(get_window_width * 0.5 - 185, restart_y, l10n_text("Restart"), "restart", "restart", c_lime, fade_in_pause_alpha);
					if (holding_key_timer > 0)
					&& (menu == "restart")
					&& (global.checkpoint_x == 0)
					&& (global.checkpoint_y == 0)
					{
						scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, restart_y + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
					}
					draw_menu_button(get_window_width * 0.5 - 185, quit_y, l10n_text("Quit"), "quit", "quit_to_map", c_red, fade_in_pause_alpha);
				}
			}
			else
			{
				draw_menu_button(get_window_width * 0.5 - 185, option_y, l10n_text("Options"), "options", "options", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icon_cogwheel, 0, get_window_width * 0.5 - 185 + 20, option_y + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
				if (!global.goal_active)
				{
					draw_menu_button(get_window_width * 0.5 - 185, quit_y, l10n_text("Quit"), "quit", "quit", c_red, fade_in_pause_alpha);
				}
			}
			/* Report Button in bottom left corner */
			if (global.character_select_in_this_menu == "level_editor")
			&& (global.search_id != "")
			{
				draw_menu_button_sprite(spr_menu_button, 0, display_get_gui_height() - 42,,, 0.5, 1, 185, 42, l10n_text("Report"), "report", "report");
				draw_sprite_ext(spr_icon_report, 0, 16, display_get_gui_height() - 42 + 20, 1, 1, 0, c_white, 1);
			}
		}
		else
		if (menu == "reset_from_checkpoint" || menu == "reset_from_start" || menu == "restart_nevermind")
		{
			
			if (global.controls_used_for_navigation == "gamepad")
			{
				/* Tell the player the shortcut to quick restart */
				draw_set_halign(fa_center);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 74, l10n_text("To quick restart from start"), global.default_text_size, c_black, c_white, 1);
				scr_draw_gamepad_buttons(gp_shoulderlb, get_window_width * 0.5 - 82, get_window_height * 0.5 - 32, 1, c_white, 1, 0.75, 0.75, 1);
				scr_draw_text_outlined(get_window_width * 0.5 - 42, get_window_height * 0.5 - 32, "+", global.default_text_size, c_black, c_white, 1);
				scr_draw_gamepad_buttons(gp_shoulderrb, get_window_width * 0.5, get_window_height * 0.5 - 32, 1, c_white, 1, 0.75, 0.75, 1);
				scr_draw_text_outlined(get_window_width * 0.5 + 42, get_window_height * 0.5 - 32, "+", global.default_text_size, c_black, c_white, 1);
				scr_draw_gamepad_buttons(gp_select,	get_window_width * 0.5 + 82, get_window_height * 0.5 - 32, 1, c_white, 1, 0.75, 0.75, 1);
			}
			
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Reset from Checkpoint"), "reset_from_checkpoint", "reset_from_checkpoint", c_lime, fade_in_pause_alpha);
			if (holding_key_timer > 0 && menu == "reset_from_checkpoint") {
				scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
			}
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Reset from Start"), "reset_from_start", "reset_from_start", c_lime, fade_in_pause_alpha);
			if (holding_key_timer > 0 && menu == "reset_from_start") {
				scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
			}
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Nevermind"), "restart_nevermind", "restart_nevermind", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
		}
		else
		if (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "main_game")
		&& (menu == "quit_to_map" || menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Quit to Map"), "quit_to_map", "quit_to_map", c_lime, fade_in_pause_alpha);
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text(string(quit_to_title_name)), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.enable_option_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red * fade_in_pause_alpha);
				quit_nevermind_y = get_window_height * 0.5 + 42 + 42 + 42;
			}
			else
			{
				quit_nevermind_y = get_window_height * 0.5 + 42 + 42;
			}
		}
		else
		if (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "level_editor")
		&& (menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text(string(quit_to_title_name)), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.enable_option_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red * fade_in_pause_alpha);
				quit_nevermind_y = get_window_height * 0.5 + 42 + 42;
			}
			else
			{
				quit_nevermind_y = get_window_height * 0.5 + 42;
			}
		}
		else
		if (global.pause_room == rm_world_map)
		&& (menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text(string(quit_to_title_name)), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.enable_option_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red, fade_in_pause_alpha);
				quit_nevermind_y = get_window_height * 0.5 + 42 + 42;
			}
			else
			{
				quit_nevermind_y = get_window_height * 0.5 + 42;
			}
		}
		if (menu == "quit_to_map" || menu == "quit_to_title" || menu == "quit_to_desktop" || menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, quit_nevermind_y, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icon_back, 0, get_window_width * 0.5 - 185 + 20, quit_nevermind_y + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
		}
		if (menu == "report_back")
		|| (menu == "report_next")
		|| (menu == "report_reason_back")
		|| (menu == "report_intrusion_of_privacy")
		|| (menu == "report_violence_physical_harm")
		|| (menu == "report_abusive_harassing_bullying")
		|| (menu == "report_hateful_discriminatory")
		|| (menu == "report_advertising_spam")
		|| (menu == "report_sexually_explicit")
		|| (menu == "report_asking_for_likes")
		|| (menu == "report_uses_a_bug")
		|| (menu == "report_blatant_copying")
		|| (menu == "report_phony_world_record")
		|| (menu == "report_other_inappropriate_content")
		|| (menu == "report_message_ok")
		|| (menu == "report_message_back")
		|| (menu == "report_send_back")
		|| (menu == "report_send_confirm")
		|| (menu == "report_send_to_server")
		|| (menu == "report_complete_back")
		|| (menu == "report_complete_delete")
		|| (menu == "report_complete_back_to_online_list")
		|| (menu == "report_complete_back_to_select")
		{
			scr_draw_report();
		}
	}
	/* PAUSE LEVEL EDITOR MENU */
	
	#region /* Show loading icon and reset level */
	if (show_loading_icon)
	{
		scr_draw_loading(1 * fade_in_pause_alpha);
	}
	#endregion /* Show loading icon and reset level END */
	
	scr_option_menu(); /* Options */
	scr_character_select_menu_draw();
	
	scr_quit_to_desktop_menu("quit_to_desktop");
	scr_draw_darken_screen_when_window_is_unfocused();
	scr_debug_screen();
	scr_draw_cursor_mouse();
	
}