var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

#region /* Which player is controling the pause menu? */
draw_set_alpha(fade_in_pause_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

hud_show_big_collectibles_y = lerp(hud_show_big_collectibles_y, 160, 0.1);

#region /* Big Collectibles */
if (global.pause_room == rm_leveleditor)
and (hide_menu_for_clean_screenshots == false)
{
	
	#region /* Big Collectible 1 */
	if (global.big_collectible1 == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	if (global.big_collectible1)
	&& (global.big_collectible1_already_collected == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Big Collectible 1 END */
	
	#region /* Big Collectible 2 */
	if (global.big_collectible2 == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	if (global.big_collectible2)
	&& (global.big_collectible2_already_collected == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 32, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, fade_in_pause_alpha);
	}
	#endregion /* Big Collectible 2 END */
	
	#region /* Big Collectible 3 */
	if (global.big_collectible3 == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	if (global.big_collectible3)
	&& (global.big_collectible3_already_collected == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 64, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, fade_in_pause_alpha);
	}
	#endregion /* Big Collectible 3 END */
	
	#region /* Big Collectible 4 */
	if (global.big_collectible4 == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	if (global.big_collectible4)
	&& (global.big_collectible4_already_collected == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 96, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, fade_in_pause_alpha);
	}
	#endregion /* Big Collectible 4 END */
	
	#region /* Big Collectible 5 */
	if (global.big_collectible5 == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible_outline, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	if (global.big_collectible5)
	&& (global.big_collectible5_already_collected == false)
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, 0.5 * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(global.resource_pack_sprite_big_collectible, 0, 32 + 128, hud_show_big_collectibles_y, 0.5, 0.5, 0, c_white, fade_in_pause_alpha);
	}
	#endregion /* Big Collectible 5 END */
	
}
#endregion /* Big Collectibles */

#region /* Hide menu for clean screenshots text */
if (hide_menu_for_clean_screenshots == false)
&& (in_settings == false)
&& (os_type != os_ios)
&& (os_type != os_android)
{
	if (global.controls_used_for_menu_navigation == "gamepad")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(gp_face4, 32, get_window_height - 32, 0.75, c_white, hide_menu_for_clean_screenshots_alpha * fade_in_pause_alpha);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, ord("Y"), 32, get_window_height - 32, 0.75, 0.75, 0, c_white, hide_menu_for_clean_screenshots_alpha * fade_in_pause_alpha);
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(64, get_window_height - 32, ": " + l10n_text("Hide menu for clean screenshots"), global.default_text_size, c_black, c_white, hide_menu_for_clean_screenshots_alpha * fade_in_pause_alpha);
}
#endregion /* Hide menu for clean screenshots text END */

if (hide_menu_for_clean_screenshots == false)
{
	
	#region /* Games Logo in top left corner */
	if (global.title_logo_index >= 0)
	{
		draw_sprite_ext(global.title_logo_index, 0, 160, scr_wave(70, 80, 4.5, 0), (402 / sprite_get_height(global.title_logo_index)) * 0.3, (402 / sprite_get_height(global.title_logo_index)) * 0.3, 0, c_white, 1 * fade_in_pause_alpha);
	}
	#endregion /* Games Logo in top left corner END */
	
	if (in_settings == false)
	&& (menu != "remap_key_up")
	&& (menu != "remap_key_down")
	&& (menu != "remap_key_left")
	&& (menu != "remap_key_right")
	&& (menu != "remap_key_sprint")
	&& (menu != "remap_key_jump")
	&& (menu != "remap_reset")
	&& (menu != "remap_save")
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if (global.pause_player == 0)
		{
			scr_draw_text_outlined(get_window_width * 0.5, 32, "PLAYER 1 IS CONTROLING THE MENU", global.default_text_size, c_black, c_aqua, fade_in_pause_alpha);
		}
		else
		if (global.pause_player == 1)
		{
			scr_draw_text_outlined(get_window_width * 0.5, 32, "PLAYER 2 IS CONTROLING THE MENU", global.default_text_size, c_black, c_red, fade_in_pause_alpha);
		}
		else
		if (global.pause_player = 2)
		{
			scr_draw_text_outlined(get_window_width * 0.5, 32, "PLAYER 3 IS CONTROLING THE MENU", global.default_text_size, c_black, c_lime, fade_in_pause_alpha);
		}
		else
		if (global.pause_player = 3)
		{
			scr_draw_text_outlined(get_window_width * 0.5, 32, "PLAYER 4 IS CONTROLING THE MENU", global.default_text_size, c_black, c_yellow, fade_in_pause_alpha);
		}
	}
	#endregion /* Which player is controling the pause menu? END */
	
	#region /* Pause Text blink effect */
	if (pause_text_lerp <= 0)
	{
		pause_text_alpha = lerp(pause_text_alpha, 1, 0.1);
		if (pause_text_alpha >= 1)
		{
			pause_text_lerp = 1;
		}
	}
	else
	if (pause_text_lerp >= 1)
	{
		pause_text_alpha = lerp(pause_text_alpha, 0, 0.2);
		if (pause_text_alpha <= 0)
		{
			pause_text_lerp = 0;
		}
	}
	#endregion /* Pause Text blink effect END */

	#region /* Pause Text */
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	if (in_settings == false)
	&& (menu != "quit_game_no")
	&& (menu != "quit_game_yes")
	{
		draw_sprite_ext(spr_pause_text, image_index, get_window_width * 0.5, 200, 1, 1, 0, c_white, scr_wave(0, 1, 4.5, 0) * fade_in_pause_alpha);
	}
	#endregion /* Pause Text END */

	/* PAUSE LEVEL SELECT / LEVEL EDITOR MENU */
	if (room == rm_world_map)
	&& (show_loading_icon == false)
	|| (room == rm_leveleditor)
	&& (show_loading_icon == false)
	|| (global.pause_room == rm_world_map)
	&& (show_loading_icon == false)
	|| (global.pause_room == rm_leveleditor)
	&& (show_loading_icon == false)
	{
		if (menu == "continue")
		|| (menu == "options")
		|| (menu == "restart")
		|| (menu == "quit")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Continue"), "continue", "continue", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			
			if (room == rm_leveleditor)
			|| (global.pause_room == rm_leveleditor)
			{
				if (global.convention_mode == false)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Options"), "options", "options", c_lime, fade_in_pause_alpha);
					draw_sprite_ext(spr_icons_cogwheel, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
					if (global.goal_active == false)
					{
						draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Restart"), "restart", "restart", c_lime, fade_in_pause_alpha);
						if (holding_key_timer > 0)
						&& (menu == "restart")
						&& (global.checkpoint_x == 0)
						&& (global.checkpoint_y == 0)
						{
							scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 42 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
						}
						draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, l10n_text("Quit"), "quit", "quit_to_map", c_red, fade_in_pause_alpha);
					}
				}
				else
				if (global.goal_active == false)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Restart"), "restart", "restart", c_lime, fade_in_pause_alpha);
					if (holding_key_timer > 0)
					&& (menu == "restart")
					&& (global.checkpoint_x == 0)
					&& (global.checkpoint_y == 0)
					{
						scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
					}
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Quit"), "quit", "quit_to_map", c_red, fade_in_pause_alpha);
				}
			}
			else
			{
				if (global.convention_mode == false)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Options"), "options", "options", c_lime, fade_in_pause_alpha);
					draw_sprite_ext(spr_icons_cogwheel, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
					if (global.goal_active == false)
					{
						draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Quit"), "quit", "quit", c_red, fade_in_pause_alpha);
					}
				}
				else
				if (global.goal_active == false)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit"), "quit", "quit", c_red, fade_in_pause_alpha);
				}
			}
		}
		else
		if (menu == "reset_from_checkpoint")
		|| (menu == "reset_from_start")
		|| (menu == "restart_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Reset from Checkpoint"), "reset_from_checkpoint", "reset_from_checkpoint", c_lime, fade_in_pause_alpha);
			if (holding_key_timer > 0)
			&& (menu == "reset_from_checkpoint")
			{
				scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
			}
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Reset from Start"), "reset_from_start", "reset_from_start", c_lime, fade_in_pause_alpha);
			if (holding_key_timer > 0)
			&& (menu == "reset_from_start")
			{
				scr_draw_circular_bar(get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 21, holding_key_timer, 60, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding reset from checkpoint key */
			}
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Nevermind"), "restart_nevermind", "restart_nevermind", c_lime, fade_in_pause_alpha);
			draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
		}
		else
		if (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "main_game")
		&& (menu == "quit_to_map")
		|| (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "main_game")
		&& (menu == "quit_to_title")
		|| (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "main_game")
		&& (menu == "quit_to_desktop")
		|| (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "main_game")
		&& (menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Quit to Map"), "quit_to_map", "quit_to_map", c_lime, fade_in_pause_alpha);
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.convention_mode == false)
			&& (global.enable_options_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red * fade_in_pause_alpha);
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
			else
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
		}
		else
		if (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "level_editor")
		&& (menu == "quit_to_title")
		|| (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "level_editor")
		&& (menu == "quit_to_desktop")
		|| (global.pause_room == rm_leveleditor)
		&& (global.character_select_in_this_menu == "level_editor")
		&& (menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.convention_mode == false)
			&& (global.enable_options_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red * fade_in_pause_alpha);
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
			else
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
		}
		else
		if (global.pause_room == rm_world_map)
		&& (menu == "quit_to_title")
		|| (global.pause_room == rm_world_map)
		&& (menu == "quit_to_desktop")
		|| (global.pause_room == rm_world_map)
		&& (menu == "quit_nevermind")
		{
			draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Quit to Title"), "quit_to_title", "quit_to_title", c_lime, fade_in_pause_alpha);
			if (global.convention_mode == false)
			&& (global.enable_options_for_pc)
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Quit to Desktop"), "quit_to_desktop", "quit_to_desktop", c_red, fade_in_pause_alpha);
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
			else
			{
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Nevermind"), "quit_nevermind", "quit_nevermind", c_lime, fade_in_pause_alpha);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1 * fade_in_pause_alpha);
			}
		}
	}
	/* PAUSE LEVEL EDITOR MENU */
	
	#region /* Show loading icon and reset level */
	if (show_loading_icon)
	{
		scr_draw_loading(1 * fade_in_pause_alpha);
	}
	#endregion /* Show loading icon and reset level END */
	
	scr_options_menu(); /* Options */
	
	scr_quit_to_desktop_menu("quit_to_desktop");
	scr_debug_screen();
	scr_draw_darken_screen_when_window_is_unfocused();
	scr_draw_cursor_mouse();
	scr_menu_navigation_with_joystick_delay();
	
}