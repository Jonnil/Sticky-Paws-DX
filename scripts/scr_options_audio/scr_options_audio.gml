/// @function scr_options_audio()
/* Draws and handles the Audio tab. Capture Mode owns the seven mix sliders
   while active so trailer recordings cannot accidentally be silent or contain music. */
function scr_options_audio()
{
	if (global.settings_sidebar_menu != "audio_settings")
	{
		return;
	}

	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var fixed_player = 1;
	var capture_audio_locked = scr_capture_mode_is_active();
	var volume_main_y = 64;
	var volume_music_y = 96 + 64;
	var volume_melody_y = 96 + (64 * 2);
	var volume_sound_y = 96 + (64 * 3);
	var volume_ambient_y = 96 + (64 * 4);
	var volume_footstep_y = 96 + (64 * 5);
	var volume_voice_y = 96 + (64 * 6);
	var number_of_audio_channels_y = 96 + 8 + (64 * 7) - 20;
	var narrator_y = 96 + 8 + (64 * 8) - 10;
	var default_audio_settings_y = 96 + (64 * 8) + 20;

	#region /* Keep audio settings in their valid ranges */
	global.volume_main = clamp(global.volume_main, 0, 1);
	global.volume_music = clamp(global.volume_music, 0, 1);
	global.volume_melody = clamp(global.volume_melody, 0, 1);
	global.volume_sound = clamp(global.volume_sound, 0, 1);
	global.volume_ambient = clamp(global.volume_ambient, 0, 1);
	global.volume_footstep = clamp(global.volume_footstep, 0, 1);
	global.volume_voice = clamp(global.volume_voice, 0, 1);
	global.verbosity_slider = clamp(global.verbosity_slider, 0, 1);
	#endregion

	#region /* Volume sliders */
	draw_menu_slider(410, volume_main_y, l10n_text("Main Volume"), "volume_main", global.volume_main, c_red, capture_audio_locked);
	draw_line_width_color(410, volume_main_y + 32, 820, volume_main_y + 32, 3, c_white, c_white);
	draw_menu_slider(410, volume_music_y, l10n_text("Music Volume"), "volume_music", global.volume_music, c_red, capture_audio_locked);
	draw_menu_slider(410, volume_melody_y, l10n_text("Melody Volume"), "volume_melody", global.volume_melody, c_red, capture_audio_locked);
	draw_menu_slider(410, volume_sound_y, l10n_text("Sound Volume"), "volume_sound", global.volume_sound, c_lime, capture_audio_locked);
	draw_menu_slider(410, volume_ambient_y, l10n_text("Ambient Volume"), "volume_ambient", global.volume_ambient, c_lime, capture_audio_locked);
	draw_menu_slider(410, volume_footstep_y, l10n_text("Footstep Volume"), "volume_footstep", global.volume_footstep, c_lime, capture_audio_locked);
	draw_menu_slider(410, volume_voice_y, l10n_text("Voices Volume"), "volume_voices", global.volume_voice, c_aqua, capture_audio_locked);

	if (global.enable_verbosity_slider)
	{
		draw_menu_slider(410, 96 + (64 * 7), l10n_text("Verbosity"), "verbosity_slider", global.verbosity_slider, c_aqua);
	}
	#endregion

	#region /* Capture Mode explanation */
	if (capture_audio_locked)
	{
		var capture_audio_dropdown_layout = scr_menu_dropdown_get_layout();
		var capture_audio_panel_left = 400
			+ capture_audio_dropdown_layout.button_x_offset
			+ capture_audio_dropdown_layout.dropdown_width
			+ 40;
		var capture_audio_panel_lines = [
			{text: l10n_text("CAPTURE MODE AUDIO IS LOCKED"), color: c_yellow, relative_scale: 1.08, gap_after: 12},
			{text: l10n_text("Required trailer mix:"), color: c_white, relative_scale: 1, gap_after: 8},
			{text: l10n_text("Music and musical jingles: OFF (0%)"), color: c_red, relative_scale: 1, gap_after: 6},
			{text: l10n_text("Gameplay sound effects: ON (70%)"), color: c_lime, relative_scale: 1, gap_after: 6},
			{text: l10n_text("Ambient sounds: ON (70%)"), color: c_lime, relative_scale: 1, gap_after: 6},
			{text: l10n_text("Footsteps: ON (70%)"), color: c_lime, relative_scale: 1, gap_after: 6},
			{text: l10n_text("Voices: ON (70%)"), color: c_lime, relative_scale: 1, gap_after: 6},
			{text: l10n_text("Main volume: 70%"), color: c_lime, relative_scale: 1, gap_after: 12},
			{text: l10n_text("Gameplay sounds must be audible."), color: c_white, relative_scale: 1, gap_after: 6},
			{text: l10n_text("The recording must not be silent."), color: c_white, relative_scale: 1, gap_after: 12},
			{text: l10n_text("Turn off Capture Mode to edit these sliders."), color: c_ltgray, relative_scale: 1, gap_after: 0}
		];
		scr_capture_mode_draw_settings_info_panel(
			capture_audio_panel_lines,
			capture_audio_panel_left,
			32,
			display_get_gui_height() - 20
		);
	}
	#endregion

	#region /* Select Narrator */
	if (global.enable_narrator)
	{
		var file_select_x = 450;
		var file_select_right_arrow_x = 400;

		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);

		if (global.narrator_selection <= -3)
		{
			global.narrator_selection = -2;
			global.narrator = -1;
		}

		if (menu == "select_narrator")
		{
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, 390, narrator_y, 1, 1, 0, c_white, 1);
		}

		if (global.narrator_selection <= -2)
		{
			scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + l10n_text("Nobody"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		else
		if (global.narrator_selection == -1)
		{
			scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + l10n_text("Match Player 1"), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}
		else
		{
			scr_draw_text_outlined(file_select_x, narrator_y, l10n_text("Narrator") + ": " + string(narrator_name), global.default_text_size * 1.1, c_menu_outline, c_menu_fill, 1);
		}

		if (global.narrator_selection >= -1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_left, file_select_x - 32, narrator_y, 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 48, narrator_y - 16, file_select_x - 16, narrator_y + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				if (!open_dropdown)
				{
					menu = "select_narrator";
				}
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x - 48, narrator_y - 16, file_select_x - 16, narrator_y + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}

		if (global.narrator_selection < ds_list_size(global.all_loaded_characters) - 1)
		{
			draw_sprite_ext(spr_keyboard_keys, vk_right, file_select_x + file_select_right_arrow_x + 100, narrator_y, 0.5, 0.5, 0, c_white, 1);
			if (point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x + 84, narrator_y - 16, file_select_x + file_select_right_arrow_x + 116, narrator_y + 16))
			&& (global.controls_used_for_navigation == "mouse")
			{
				if (!open_dropdown)
				{
					menu = "select_narrator";
				}
				draw_set_alpha(0.5);
				draw_rectangle_color(file_select_x + file_select_right_arrow_x + 84, narrator_y - 16, file_select_x + file_select_right_arrow_x + 116, narrator_y + 16, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
			}
		}

		var narrator_left_clicked = mouse_check_button_released(mb_left)
			&& point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x - 48, narrator_y - 16, file_select_x - 16, narrator_y + 16)
			&& global.controls_used_for_navigation == "mouse";
		var narrator_right_clicked = mouse_check_button_released(mb_left)
			&& point_in_rectangle(mouse_get_x, mouse_get_y, file_select_x + file_select_right_arrow_x + 84, narrator_y - 16, file_select_x + file_select_right_arrow_x + 116, narrator_y + 16)
			&& global.controls_used_for_navigation == "mouse";

		if (((key_left && menu == "select_narrator") || narrator_left_clicked)
		&& menu_delay == 0
		&& menu_joystick_delay == 0
		&& global.narrator_selection > -2
		&& !open_dropdown)
		{
			menu = "select_narrator";
			menu_delay = 3;
			global.narrator_selection--;
			scr_set_narrator();
			scr_options_audio_refresh_narrator_portrait(fixed_player);
		}
		else
		if (((key_right && menu == "select_narrator") || narrator_right_clicked)
		&& menu_delay == 0
		&& menu_joystick_delay == 0
		&& !open_dropdown)
		{
			menu = "select_narrator";
			menu_delay = 3;
			global.narrator_selection = clamp(global.narrator_selection + 1, -2, ds_list_size(global.all_loaded_characters) - 1);
			scr_set_narrator();
			scr_options_audio_refresh_narrator_portrait(fixed_player);
		}
	}
	#endregion

	#region /* Remaining audio options */
	if (!capture_audio_locked)
	{
		draw_menu_button(430, default_audio_settings_y, l10n_text("Default Settings"), "default_audio_settings", "default_audio_settings");

		if (menu == "default_audio_settings")
		&& (((key_accept_pressed)
			&& menu_delay == 0
			&& menu_joystick_delay == 0)
			|| (mouse_check_button_released(mb_left)
			&& mouse_get_x > 370
			&& point_in_rectangle(mouse_get_x, mouse_get_y, 430, default_audio_settings_y + 1, 800, default_audio_settings_y + 41)
			&& global.controls_used_for_navigation == "mouse"
			&& menu_delay == 0
			&& menu_joystick_delay == 0))
		{
			scr_set_default_audio_settings();
			menu_delay = 3;
		}
	}

	draw_menu_dropdown(390, number_of_audio_channels_y, l10n_text("Number of Audio Channels"), "number_of_audio_channels", global.number_of_audio_channels, "32", "64", "96", "128", "160", "192", "224", "256");
	scr_set_default_dropdown_description("number_of_audio_channels", "128");
	#endregion

	#region /* Keyboard and gamepad navigation */
	if (menu_delay == 0 && menu_joystick_delay == 0 && can_navigate)
	{
		var audio_slider_selected = menu == "volume_main"
			|| menu == "volume_music"
			|| menu == "volume_melody"
			|| menu == "volume_sound"
			|| menu == "volume_ambient"
			|| menu == "volume_footstep"
			|| menu == "volume_voices";

		if (audio_slider_selected
		&& !capture_audio_locked
		&& !open_dropdown
		&& (key_left || key_right))
		{
			var audio_change_amount = keyboard_check(vk_shift) ? 0.0001 : 0.05;
			if (key_left)
			{
				audio_change_amount = -audio_change_amount;
			}

			scr_options_audio_change_selected_volume(menu, audio_change_amount);
			menu_delay = 3;
		}
		else
		if (menu == "verbosity_slider"
		&& !open_dropdown
		&& (key_left || key_right))
		{
			var verbosity_change_amount = keyboard_check(vk_shift) ? 0.0001 : 0.05;
			if (key_left)
			{
				verbosity_change_amount = -verbosity_change_amount;
			}

			global.verbosity_slider = clamp(global.verbosity_slider + verbosity_change_amount, 0, 1);
			menu_delay = 3;
		}
		else
		if (menu == "number_of_audio_channels" && open_dropdown)
		{
			if (key_up && global.number_of_audio_channels > 0)
			{
				global.number_of_audio_channels--;
				menu_delay = 3;
			}
			else
			if (key_down && global.number_of_audio_channels < 7)
			{
				global.number_of_audio_channels++;
				menu_delay = 3;
			}
		}
		else
		if (!open_dropdown && (key_up || key_down))
		{
			var audio_navigation = [
				"volume_main",
				"volume_music",
				"volume_melody",
				"volume_sound",
				"volume_ambient",
				"volume_footstep",
				"volume_voices",
				"number_of_audio_channels"
			];

			if (global.enable_verbosity_slider)
			{
				array_push(audio_navigation, "verbosity_slider");
			}
			if (global.enable_narrator)
			{
				array_push(audio_navigation, "select_narrator");
			}
			if (!capture_audio_locked)
			{
				array_push(audio_navigation, "default_audio_settings");
			}

			var audio_navigation_index = -1;
			for (var audio_index = 0; audio_index < array_length(audio_navigation); audio_index++)
			{
				if (menu == audio_navigation[audio_index])
				{
					audio_navigation_index = audio_index;
					break;
				}
			}

			if (audio_navigation_index >= 0)
			{
				var audio_navigation_direction = key_up ? -1 : 1;
				var audio_next_index = (audio_navigation_index + audio_navigation_direction + array_length(audio_navigation)) mod array_length(audio_navigation);
				menu = audio_navigation[audio_next_index];
				menu_delay = 3;
			}
		}
	}
	#endregion

	var audio_last_option_y = number_of_audio_channels_y;
	if (global.enable_verbosity_slider)
	{
		audio_last_option_y = 96 + (64 * 7);
	}
	if (global.enable_narrator)
	{
		audio_last_option_y = narrator_y;
	}
	if (!capture_audio_locked)
	{
		audio_last_option_y = default_audio_settings_y;
	}
	menu_cursor_y_position_end = audio_last_option_y + 64;
}

/// @function scr_options_audio_change_selected_volume(menu_id, change_amount)
/* Applies one slider-key adjustment and plays the same preview used by the old Audio tab. */
function scr_options_audio_change_selected_volume(menu_id, change_amount)
{
	switch (menu_id)
	{
		case "volume_main":
			global.volume_main = clamp(global.volume_main + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_main);
		break;

		case "volume_music":
			global.volume_music = clamp(global.volume_music + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_music * global.volume_main);
		break;

		case "volume_melody":
			global.volume_melody = clamp(global.volume_melody + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_melody * global.volume_main);
		break;

		case "volume_sound":
			global.volume_sound = clamp(global.volume_sound + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_sound * global.volume_main);
		break;

		case "volume_ambient":
			global.volume_ambient = clamp(global.volume_ambient + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_ambient * global.volume_main);
		break;

		case "volume_footstep":
			global.volume_footstep = clamp(global.volume_footstep + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_footstep * global.volume_main);
		break;

		case "volume_voices":
			global.volume_voice = clamp(global.volume_voice + change_amount, 0, 1);
			audio_play_sound(snd_basic_collectible, 0, false, global.volume_voice * global.volume_main);
		break;
	}
}

/// @function scr_options_audio_refresh_narrator_portrait(player_index)
/* Keeps the existing narrator preview behavior isolated with the Audio tab. */
function scr_options_audio_refresh_narrator_portrait(player_index)
{
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	|| file_exists(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini")
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}
		else
		{
			ini_open(game_save_id + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}

		narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
		ini_close();
	}
	else
	{
		narrator_name = string(global.narrator + 1);
	}

	scr_delete_sprite_properly(global.sprite_select_player[player_index]);
	global.sprite_select_player[player_index] = spr_noone;
	scr_set_character_folder(player_index, global.skin_for_player[player_index]);
	ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
	global.sprite_select_player[player_index] = scr_initialize_character_sprite("walk", global.sprite_select_player[player_index]);
	global.sprite_select_player[player_index] = scr_initialize_character_sprite("idle", global.sprite_select_player[player_index]);
	global.sprite_select_player[player_index] = scr_initialize_character_sprite("stand", global.sprite_select_player[player_index]);
	global.sprite_select_player[player_index] = scr_initialize_character_sprite("character_select_portrait", global.sprite_select_player[player_index]);
	ini_close();
}
