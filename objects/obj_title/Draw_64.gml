var main_game_y = display_get_gui_height() * 0.5 + 100 + 40;
var level_editor_y = display_get_gui_height() * 0.5 + 100 + 80 + 2;
if (global.free_communication_available)
{
	var online_level_list_title_y = display_get_gui_height() * 0.5 + 100 + 120 + 4;
	var option_and_quit_y = display_get_gui_height() * 0.5 + 225 + 40;
}
else
{
	var online_level_list_title_y = -999;
	var option_and_quit_y = display_get_gui_height() * 0.5 + 225;
}
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);
var fixed_player = 1;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

/* Title Screen */

room_speed = global.max_fps; /* Room Speed END */

#region /* Change title screen during specific times and dates */
if (current_month == 12)
&& (current_day >= 24)
&& (current_day <= 26)
{
	if (floor(random(10)) == 0)
	{
		effect_create_below(ef_snow, 0, 0, 2, c_white); /* Make the title screen snow when it's between 24th and 26th December */
	}
}
#endregion /* Change title screen during specific times and dates END */

#region /* Volumes stay between 0 and 1 */
global.volume_ambient = clamp(global.volume_ambient, 0, 1);
global.volume_footstep = clamp(global.volume_footstep, 0, 1);
global.volume_main = clamp(global.volume_main, 0, 1);
global.volume_melody = clamp(global.volume_melody, 0, 1);
global.volume_music = clamp(global.volume_music, 0, 1);
global.volume_sound = clamp(global.volume_sound, 0, 1);
global.volume_voice = clamp(global.volume_voice, 0, 1);
#endregion /* Volumes stay between 0 and 1 END */

#region /* Quit Game trough pause menu */
if (global.enable_option_for_pc)
&& (!can_remap_key)
&& (!input_key)
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	if (menu == "main_game")
	|| (menu == "level_editor")
	|| (menu == "online_level_list_title")
	|| (menu == "options")
	|| (menu == "information")
	|| (menu == "quit")
	|| (menu == "fullscreen_mode_title")
	{
		if (keyboard_check_pressed(vk_escape))
		{
			menu_delay = 3;
			menu = "quit_game_no";
		}
		else
		{
			room_persistent = false; /* Turn OFF Room Persistency */
		}
		if (global.quit_level)
		{
			game_end();
		}
	}
}
#endregion /* Quit Game trough pause menu END */

/* Draw Event */

#region /* Fullscreen toggle */
var can_toggle_fullscreen = (os_type != os_ios)
&& (os_type != os_android)
&& (global.enable_option_for_pc)
&& (global.controls_used_for_navigation != "gamepad");

if (can_toggle_fullscreen)
{
	scr_draw_fullscreen_button(-74, display_get_gui_height() - 65 + version_y_pos, "fullscreen_mode_title");
	
	if (window_get_fullscreen())
	{
		var fullscreen_text = l10n_text("Windowed");
	}
	else
	{
		var fullscreen_text = l10n_text("Fullscreen");
	}
	
	if (global.controls_used_for_navigation == "mouse")
	&& (mouse_check_button_released(mb_left))
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 65 + version_y_pos - 6, -74 + string_width(fullscreen_text) + 100, display_get_gui_height() - 65 + version_y_pos + 32 + 6))
	&& (menu == "fullscreen_mode_title")
	{
		if (window_get_fullscreen())
		{
			window_set_fullscreen(false);
		}
		else
		{
			window_set_fullscreen(true);
		}
		menu_delay = 3;
	}
}
#endregion /* Fullscreen toggle END */

#region /* Build Date and Version */
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
scr_draw_text_outlined(0 + 16, display_get_gui_height() - 16 + version_y_pos, "v" + scr_get_build_date(), global.default_text_size, c_menu_outline, c_menu_fill, 1);
draw_set_halign(fa_center);
#endregion /* Build Date and Version END */

#region /* Hide Fullscreen and Version text / Set certain variables to default value */
if (menu == "main_game")
|| (menu == "level_editor")
|| (menu == "online_level_list_title")
|| (menu == "options")
|| (menu == "quit")
|| (menu == "information")
|| (menu == "fullscreen_mode_title")
{
	if (!in_settings)
	{
		for(var i = 1; i <= global.max_players; i += 1)
		{
			player_accept_selection[i] = - 1; /* Character select Accept Selection */
			can_input_player_name[i] = 2; /* What player can enter a name */
		}
		player_start_game = false;
		show_title_logo = true;
		version_y_pos = lerp(version_y_pos, 0, 0.1);
	}
	else
	{
		show_title_logo = false;
		version_y_pos = lerp(version_y_pos, 128, 0.1);
	}
}
else
{
	show_title_logo = false;
	version_y_pos = lerp(version_y_pos, 128, 0.1);
}
#endregion /* Hide Fullscreen and Version text / Set certain variables to default value END */

#region /* Draw Title Screen */
if (sprite_exists(global.title_logo_index))
{
	draw_sprite_ext(global.title_logo_index, image_index, display_get_gui_width() * 0.5 + title_x, display_get_gui_height() * 0.5 - 100 + title_y, 402 / sprite_get_height(global.title_logo_index) * title_xscale, 402 / sprite_get_height(global.title_logo_index) * title_yscale, 0, c_white, title_alpha);
}

if (menu != "select_custom_level")
&& (menu != "level_editor_play")
&& (menu != "level_editor_make")
&& (menu != "import_export_level")
&& (menu != "delete_level")
&& (show_title_logo)
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, scr_sin_oscillate(0, 40, 4.5), 0.1);
	title_alpha = lerp(title_alpha, 1, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
else
{
	title_x = lerp(title_x, 0, 0.1);
	title_y = lerp(title_y, - 800, 0.1);
	title_alpha = lerp(title_alpha, 0, 0.1);
	title_xscale = lerp(title_xscale, 1, 0.1);
	title_yscale = lerp(title_yscale, 1, 0.1);
}
#endregion /* Draw Title Screen END */

#region /* Main Menu */
if (!in_settings)
{
	if (menu == "main_game" ||
	menu == "level_editor" ||
	menu == "online_level_list_title" ||
	menu == "options" ||
	menu == "quit" ||
	menu == "information" ||
	menu == "fullscreen_mode_title")
    {
		
		draw_menu_button(display_get_gui_width() * 0.5 - 185, main_game_y, l10n_text("Main Game"), "main_game", "main_game");
		draw_menu_button(display_get_gui_width() * 0.5 - 185, level_editor_y, l10n_text("Level Editor"), "level_editor", "level_editor");
		if (global.free_communication_available)
		{
			draw_menu_button(display_get_gui_width() * 0.5 - 185, online_level_list_title_y, l10n_text("Online Level List"), "online_level_list_title", "online_level_list_title");
			if (levels_added_today_text != "")
			{
				draw_set_halign(fa_left);
				scr_draw_text_outlined(display_get_gui_width() * 0.5 + 185 + 25, online_level_list_title_y + 21, string(levels_added_today_text), global.default_text_size + scr_wave(0, 0.1, 1), c_black, c_lime, 1);
				draw_set_halign(fa_center);
			}
		}
		
		select_custom_level_menu_open = false;
		can_input_level_name = false;
		
		#region /* Click on menu buttons */
		
		#region /* Click Main Game */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, main_game_y, display_get_gui_width() * 0.5 + 185, main_game_y + 41))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		|| (menu == "main_game")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		{
			menu_delay = 3;
			if (mouse_check_button_released(mb_left))
			{
				player_automatically_join[fixed_player] = true; /* Player 1 joins if you click Main Game */
			}
			for(var i = 1; i <= global.max_players; i += 1)
			{
				global.player_can_play[i] = false;
				player_accept_selection[i] = - 1;
			}
			global.character_select_in_this_menu = "main_game";
			in_settings = false;
			global.doing_clear_check_level = false;
			global.actually_play_edited_level = false;
			global.play_edited_level = false;
			scr_load_character_initializing();
			menu = "load_characters";
		}
		#endregion /* Click Main Game END */
		
		else
		
		#region /* Click Level Editor */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, level_editor_y, display_get_gui_width() * 0.5 + 185, level_editor_y + 41))
		&& (mouse_check_button_released(mb_left))
		&& (menu == "level_editor")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		|| (menu == "level_editor")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		{
			if (mouse_check_button_released(mb_left))
			{
				player_automatically_join[fixed_player] = true; /* Player 1 joins if you click Level Editor */
			}
			for(var i = 1; i <= global.max_players; i += 1)
			{
				global.player_can_play[i] = false;
				player_accept_selection[i] = - 1;
			}
			in_settings = false;
			
			#region /* Select Level Editor */
			if (menu == "level_editor")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				scr_audio_play(menuvoice_leveleditor, volume_source.voice);
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				global.character_select_in_this_menu = "level_editor";
				scr_load_character_initializing();
				menu = "load_characters";
				global.level_editor_level = 1;
			}
			#endregion /* Select Level Editor END */
			
		}
		#endregion /* Click Level Editor END */
		
		else
		
		#region /* Click Online Level List Title */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, online_level_list_title_y, display_get_gui_width() * 0.5 + 185, online_level_list_title_y + 41))
		&& (mouse_check_button_released(mb_left))
		&& (menu == "online_level_list_title")
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		&& (global.free_communication_available)
		|| (menu == "online_level_list_title")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		&& (global.free_communication_available)
		{
			if (mouse_check_button_released(mb_left))
			{
				player_automatically_join[fixed_player] = true; /* Player 1 joins if you click Level Editor */
			}
			for(var i = 1; i <= global.max_players; i += 1)
			{
				global.player_can_play[i] = false;
				player_accept_selection[i] = - 1;
			}
			in_settings = false;
			
			#region /* Go to character select before going to online level list */
			if (menu == "online_level_list_title")
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				scr_audio_play(menuvoice_leveleditor, volume_source.voice);
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				global.character_select_in_this_menu = "online_level_list_title";
				scr_load_character_initializing();
				menu = "load_characters";
				global.level_editor_level = 1;
			}
			#endregion /* Go to character select before going to online level list END */
			
		}
		#endregion /* Click Online Level List Title END */
		
		else
		
		#region /* Click Options */
		if (global.enable_option_for_pc)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, option_and_quit_y + 2, display_get_gui_width() * 0.5, option_and_quit_y + 41))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		|| (!global.enable_option_for_pc)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 185, option_and_quit_y + 2, display_get_gui_width() * 0.5 + 185, option_and_quit_y + 41))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		|| (menu == "options")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		{
			
			#region /* Play Options Voice */
			if (voice_options > noone)
			{
				audio_stop_sound(voice_game_title);
				scr_audio_play(voice_options, volume_source.voice);
			}
			#endregion /* Play Options Voice END */
			
			menu_cursor_y_position = 0; /* Reset so the scrolling menus are back to 0 */
			in_settings = true;
			can_navigate_settings_sidebar = true;
			menu = noone;
			menu_delay = 3;
			scr_load_storage_variables();
		}
		#endregion /* Click Options END */
		
		else
		
		#region /* Click Quit */
		if (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5, option_and_quit_y + 2, display_get_gui_width() * 0.5 + 185, option_and_quit_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		&& (global.enable_option_for_pc)
		|| (menu == "quit")
		&& (key_a_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!in_settings)
		&& (global.enable_option_for_pc)
		{
			in_settings = false;
			menu = "quit_game_no";
			menu_delay = 3;
		}
		#endregion /* Click Quit END */
		
		#endregion /* Click on menu buttons END */
		
		if (menu == "main_game")
		{
			global.character_select_in_this_menu = "main_game";
		}
		
		if (menu == "level_editor")
		{
			if (global.level_editor_level > 0)
			{
				global.level_editor_level = 0;
			}
			global.character_select_in_this_menu = "level_editor"; /* No custom level is selected before you go into the level editor */
		}
		
		if (global.enable_option_for_pc)
		{
			draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 - 185, option_and_quit_y, 0, 0, 0.5, 1, 185, 42, l10n_text("Options"), "options", "options", true);
			draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5, option_and_quit_y, 0, 0, 0.5, 1, 185, 42, l10n_text("Quit"), "quit", "quit_game_no", true, c_red);
			if (menu == "quit")
			{
				draw_menu_button_sprite(spr_menu_button, display_get_gui_width() * 0.5 - 185, option_and_quit_y, 0, 0, 0.5, 1, 185, 42, l10n_text("Options"), "options", "options", true);
			}
		}
		else
		if (!global.enable_option_for_pc)
		{
			draw_menu_button(display_get_gui_width() * 0.5 - 185, option_and_quit_y, l10n_text("Options"), "options", "options");
		}
		draw_sprite_ext(spr_icon_cogwheel, 0, display_get_gui_width() * 0.5 - 185 + 8, option_and_quit_y + 21, 1, 1, 0, c_white, 1);
		
		/* Information button */
		if (!latest_whats_new_read)
		{
			var information_alpha = scr_wave(0, 1, 1);
		}
		else
		{
			var information_alpha = 1;
		}
		draw_menu_button_sprite(spr_icon_exclamation, display_get_gui_width() - 32, display_get_gui_height() - 35, 16, 0, 1, 1, 32, 32, "", "information", "information", false,,information_alpha);
		if (menu == "information")
		{
			draw_set_halign(fa_right);
			scr_draw_text_outlined(display_get_gui_width() - 8, display_get_gui_height() - 54, l10n_text("Information"), global.default_text_size, c_black, c_white, 1);
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32, display_get_gui_height() - 35, display_get_gui_width(), display_get_gui_height()))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				information_menu_open = "about";
				menu = "about";
				menu_delay = 3;
			}
		}
	}
}
#endregion /* Main Menu END */

scr_draw_information_menu();

scr_option_menu(); /* Options */

scr_quit_to_desktop_menu("quit");

#region /* Select Custom Level Menu */
if (level_editor_template_select)
{
	select_custom_level_menu_open = false;
	scr_select_official_level_menu();
	scr_custom_level_select_with_the_mouse(global.all_loaded_main_levels);
}
else
if (select_custom_level_menu_open)
{
	level_editor_template_select = false;
	if (menu != "no_internet_level")
	{
		scr_select_custom_level_menu();
		scr_custom_level_select_with_the_mouse(global.all_loaded_custom_levels);
	}
	scr_draw_upload_level_menu(); /* Draw upload level menu above everything */
}
#endregion /* Select Custom Level Menu END */

if (menu == "search_id_ok")
|| (menu == "search_id_cancel")
|| (menu == "search_online_list")
|| (menu == "searching_for_id")
|| (menu == "searched_file_downloaded_play")
|| (menu == "searched_file_downloaded_make")
|| (menu == "open_downloaded_level_folder")
|| (menu == "searched_file_downloaded_delete")
|| (menu == "searched_file_downloaded_back_to_list")
|| (menu == "searched_file_downloaded_back")
|| (menu == "searched_file_downloaded_report")
|| (menu == "searched_file_downloaded_i_understand")
|| (menu == "searched_file_downloaded_failed")
|| (menu == "searched_file_downloaded_deleted_download_again")
|| (menu == "searched_file_downloaded_deleted_back_to_list")
|| (menu == "searched_file_downloaded_deleted")
|| (menu == "play_from_temp")
|| (menu == "download_to_working")
{
	scr_draw_menu_search_id(content_type); /* Display the search for ID screen */
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

if (menu == "caution_online_back")
|| (menu == "caution_online_do_not_show")
|| (menu == "caution_online_proceed")
|| (menu == "caution_online_network_service_unavailable")
|| (menu == "caution_online_token_invalidated")
{
	scr_draw_caution_online();
}

if (menu == "upload_rules_back")
|| (menu == "upload_rules_do_not_show")
|| (menu == "upload_rules")
{
	scr_draw_upload_rules();
}

scr_character_select_menu_draw();

scr_draw_online_download_list();

#region /* Menu Navigation */
if (!input_key)
&& (can_navigate)
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	
	/* Level Editor Menu */
	if (global.level_editor_level<= 0)
	{
		global.level_editor_level = 1;
	}
	
	#region /* Navigate Main Menu */
	if (menu == "main_game")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "information";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "level_editor";
		}
	}
	else
	if (menu == "level_editor")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			if (global.free_communication_available)
			{
				menu = "online_level_list_title";
			}
			else
			{
				menu = "options";
			}
		}
	}
	else
	if (menu == "online_level_list_title")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "level_editor";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "options";
		}
	}
	else
	if (menu == "options")
	{
		if (key_right)
		|| (key_left)
		{
			menu_delay = 3;
			if (global.enable_option_for_pc)
			{
				menu = "quit";
			}
			else
			{
				menu = "main_game";
			}
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			if (global.free_communication_available)
			{
				menu = "online_level_list_title";
			}
			else
			{
				menu = "level_editor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "information";
		}
	}
	else
	if (menu == "quit")
	{
		if (key_left)
		|| (key_right)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_up)
		{
			menu_delay = 3;
			if (global.free_communication_available)
			{
				menu = "online_level_list_title";
			}
			else
			{
				menu = "level_editor";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "information";
		}
	}
	else
	if (menu == "information")
	{
		if (key_up)
		{
			menu_delay = 3;
			if (global.enable_option_for_pc)
			{
				menu = "quit";
			}
			else
			{
				menu = "options";
			}
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (can_toggle_fullscreen)
		&& (key_left || key_right)
		{
			menu_delay = 3;
			menu = "fullscreen_mode_title"
		}
	}
	else
	if (menu == "fullscreen_mode_title")
	{
		if (key_up)
		{
			menu_delay = 3;
			menu = "options";
		}
		else
		if (key_down)
		{
			menu_delay = 3;
			menu = "main_game";
		}
		else
		if (key_left || key_right)
		{
			menu_delay = 3;
			menu = "information";
		}
	}
	#endregion /* Navigate Main Menu END */

}
#endregion /* Menu Navigation END */

#region /* Accept */

#region /* Select Quit */
if (menu == "quit")
&& (key_a_pressed)
&& (menu_delay == 0 && menu_joystick_delay == 0)
&& (global.enable_option_for_pc)
{
	menu = "quit_game_no";
	menu_delay = 3;
}
#endregion /* Select Quit END */

#endregion /* Accept END */

#region /* Have a black screen at the first frame so transitions look natural */
if (black_screen_at_start_delay < 1)
{
	draw_rectangle_color(0, 0, display_get_gui_width() * 3, display_get_gui_height() * 3, c_black, c_black, c_black, c_black, false);
	black_screen_at_start_delay ++;
}
#endregion /* Have a black screen at the first frame so transitions look natural END */

#region /* Draw Iris Transitions */

#region /* Iris Zooming */
if (menu_delay > 999)
{
	if (iris_zoom == 1)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.15);
		iris_yscale = lerp(iris_yscale, 1, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.15);
		iris_yscale = lerp(iris_yscale, 0, 0.15);
		if (iris_xscale <= 1.1)
		{
			iris_zoom = 0;
		}
	}
}

else

#region /* Zoom Out */
if (iris_zoom == 0)
{
	iris_xscale = lerp(iris_xscale, 1, 0.15);
	iris_yscale = lerp(iris_yscale, 1, 0.15);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
else
{
	iris_xscale = lerp(iris_xscale, 32, 0.015);
	iris_yscale = lerp(iris_yscale, 32, 0.015);
	if (iris_xscale >= 0.99)
	{
		iris_zoom = 1;
	}
}
#endregion /* Zoom Out END */

#endregion /* Iris Zooming END */

#region /* Loading Screen */
if (menu == "load_custom_level")
|| (menu == "load_characters")
|| (menu == "load_official_level_template")
{
	scr_draw_loading(1);
	scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5 + 64 + 32, string(file_found), global.default_text_size, c_white, c_black, 1);
}
#endregion /* Loading Screen END */

if (global.enable_transitions)
{
	if (iris_xscale < 15)
	{
		draw_set_alpha(1);
		draw_sprite_ext(spr_iris, 0, display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
		draw_rectangle_color(0, 0, display_get_gui_width()* 2, display_get_gui_height() * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, display_get_gui_width() * 0.5 - iris_xscale * 128, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(display_get_gui_width() * 0.5 + iris_xscale * 128 - 1, 0, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, display_get_gui_height() * 0.5 + iris_yscale * 128, display_get_gui_width()* 2, display_get_gui_height()* 2, c_black, c_black, c_black, c_black, false);
		if (iris_xscale < 0.5)
		&& (menu_delay > 999)
		{
			scr_draw_loading(1);
		}
	}
}
#endregion /* Draw Iris Transitions END */

scr_draw_no_internet_menu();

scr_draw_darken_screen_when_window_is_unfocused();
scr_debug_screen();
scr_draw_cursor_mouse();