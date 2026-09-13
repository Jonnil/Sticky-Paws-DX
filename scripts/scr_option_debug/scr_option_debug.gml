/// @function scr_option_debug()
function scr_option_debug(get_window_width, get_window_height, mouse_get_x, mouse_get_y)
{
		#region /* Debug Settings */
		/* Capture Mode is also a public Video page. The Debug tab remains an
		   optional shortcut to the same menu when developer controls are unlocked. */
		var public_capture_mode_page_active = (global.settings_sidebar_menu == "video_settings")
			&& (string_pos("capture_mode_", string(menu)) == 1)
			&& (menu != "capture_mode_menu");
		if (global.settings_sidebar_menu == "debug_settings"
		|| public_capture_mode_page_active)
		{
			scr_debug_initialize_visibility_registry();

			if (!variable_instance_exists(self, "debug_screen_text_search_query"))
			{
				debug_screen_text_search_query = "";
			}

			if (!variable_instance_exists(self, "remember_keyboard_string"))
			{
				remember_keyboard_string = "";
			}

			var debug_text_menu_active = (string_pos("debug_screen_text_", string(menu)) == 1)
				&& (menu != "debug_screen_text_menu");
			var level_load_diagnostics_menu_active = (string_pos("level_load_diagnostics_", string(menu)) == 1)
				&& (menu != "level_load_diagnostics_menu");
			var capture_mode_menu_active = (string_pos("capture_mode_", string(menu)) == 1)
				&& (menu != "capture_mode_menu");
			var bool_globals_menu_active = (string_pos("bool_globals_", string(menu)) == 1)
				&& (menu != "bool_globals_menu");
			var debug_settings_submenu_active = debug_text_menu_active
				|| level_load_diagnostics_menu_active
				|| capture_mode_menu_active
				|| bool_globals_menu_active;

			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);

			if (!debug_settings_submenu_active)
			{
				var level_loading_debug = scr_get_level_loading_debug_data();
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var latest_load_check_summary = scr_debug_format_validation_summary(level_loading_debug.validation_result);
				var latest_error_log_summary = latest_level_load_error_visible
					? scr_debug_format_latest_level_load_error_summary(latest_level_load_error_log)
					: "";
				var open_debug_dump_folder_visible = global.enable_open_custom_folder;
				var debug_screen_y = 64;
				var debug_screen_text_menu_y = 64 + 48;
				var capture_mode_menu_y = 64 + (48 * 2);
				var level_load_diagnostics_menu_y = 64 + (48 * 3);
				var latest_load_check_y = 64 + (48 * 4);
				var latest_error_log_y = 64 + (48 * 5);
				var save_debug_dump_y = latest_level_load_error_visible
					? 64 + (48 * 6)
					: latest_error_log_y;
				var open_debug_dump_folder_y = save_debug_dump_y + 48;
				var debug_detailed_mode_y = open_debug_dump_folder_visible
					? open_debug_dump_folder_y + 48
					: save_debug_dump_y + 48;
				var debug_unlock_level_editor_objects_y = debug_detailed_mode_y + 48;
				var debug_auto_unlock_runner_y = debug_unlock_level_editor_objects_y + 48;
				var bool_globals_y = (GM_build_type == "run")
					? debug_auto_unlock_runner_y + 48
					: debug_unlock_level_editor_objects_y + 48;
				var force_network_error_y = bool_globals_y + 48;
				var preview_crash_message_y = force_network_error_y + 48;
				var preview_network_error_y = preview_crash_message_y + 48;
				var level_editor_unlock_before = global.debug_unlock_all_level_editor_objects;

				global.debug_screen = draw_menu_checkmark(380, debug_screen_y, l10n_text("Debug Screen"), "debug_screen", global.debug_screen, false,
					l10n_text("Displays debug information for development and troubleshooting"));

				var open_debug_screen_text_menu = draw_menu_button(420, debug_screen_text_menu_y, l10n_text("Debug Screen Text"), "debug_screen_text_menu", "");

				if (menu == "debug_screen_text_menu")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Opens the Debug Screen Text menu to customize which debug text groups are visible");
					menu_cursor_y_position = debug_screen_text_menu_y;
				}

				if (open_debug_screen_text_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "debug_screen_text_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				var capture_mode_label = l10n_text("Capture Mode") + ": " + scr_capture_mode_get_name();
				var open_capture_mode_menu = draw_menu_button(420, capture_mode_menu_y, capture_mode_label, "capture_mode_menu", "");

				if (menu == "capture_mode_menu")
				{
					global.option_default = -1;
				global.option_description = l10n_text("Temporarily prepares the game for clean recorded footage and restores your settings when turned off");
					menu_cursor_y_position = capture_mode_menu_y;
				}

				if (open_capture_mode_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "capture_mode_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				var open_level_load_diagnostics_menu = draw_menu_button(420, level_load_diagnostics_menu_y, l10n_text("Level Load Diagnostics"), "level_load_diagnostics_menu", "");

				if (menu == "level_load_diagnostics_menu")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Shows current level-load status, recent level-load sessions, and saved level-load error logs");
					menu_cursor_y_position = level_load_diagnostics_menu_y;
				}

				if (open_level_load_diagnostics_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_get_latest_level_load_error_log(true);
					menu = "level_load_diagnostics_back";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				draw_menu_info_row(410, latest_load_check_y, l10n_text("Latest Load Check"), latest_load_check_summary, "level_load_latest_check",
					l10n_text("Shows the latest automatic level-load validation result"));

				if (latest_level_load_error_visible)
				{
					draw_menu_info_row(410, latest_error_log_y, l10n_text("Latest Error Log"), latest_error_log_summary, "level_load_latest_error_log",
						l10n_text("Shows the newest saved automatic level-load error log"));
				}

				var save_debug_dump_now = draw_menu_button(420, save_debug_dump_y, l10n_text("Save Debug Dump Now"), "level_load_save_debug_dump", "");

				if (menu == "level_load_save_debug_dump")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Writes a full debug information file immediately without waiting for an automatic error");
					menu_cursor_y_position = save_debug_dump_y;
				}

				if (save_debug_dump_now)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_save_manual_debug_info_dump();
					scr_debug_show_toast("Debug dump saved");
					menu_delay = 3;
				}

				if (open_debug_dump_folder_visible)
				{
					var open_debug_dump_folder = draw_menu_button(420, open_debug_dump_folder_y, l10n_text("Open Debug Dump Folder"), "level_load_open_debug_dump_folder", "");

					if (menu == "level_load_open_debug_dump_folder")
					{
						global.option_default = -1;
						global.option_description = l10n_text("Opens the folder where manual debug dumps are saved");
						menu_cursor_y_position = open_debug_dump_folder_y;
					}

					if (open_debug_dump_folder)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_open_manual_debug_info_folder();
					}
				}

				global.debug_detailed_mode = draw_menu_checkmark(380, debug_detailed_mode_y, l10n_text("Debug Detailed Mode"), "debug_detailed_mode", global.debug_detailed_mode, false,
					l10n_text("Uses developer-facing variable names in the debug overlay"));

				var level_editor_unlock_after = draw_menu_checkmark(380, debug_unlock_level_editor_objects_y, l10n_text("Unlock All Level Editor Objects"), "debug_unlock_all_level_editor_objects", level_editor_unlock_before, false,
					l10n_text("Makes every placeable level editor object available for the current session"));

				if (level_editor_unlock_before != level_editor_unlock_after)
				{
					scr_debug_set_level_editor_objects_unlocked(level_editor_unlock_after);
				}

				if (GM_build_type == "run")
				{
					global.debug_menu_auto_unlock_runner = draw_menu_checkmark(380, debug_auto_unlock_runner_y, l10n_text("Auto-unlock Debug tab in GameMaker Runner"), "debug_menu_auto_unlock_runner", global.debug_menu_auto_unlock_runner, false,
						l10n_text("Development convenience for IDE test runs only. Ignored in shipped builds."));
				}

				if (os_type != os_switch)
				{
					var open_bool_globals = draw_menu_button(420, bool_globals_y, "Browse BoolGlobals / NWT", "bool_globals_menu", "");
					if (menu == "bool_globals_menu")
					{
						menu_cursor_y_position = bool_globals_y;
					}
					if (open_bool_globals && menu_delay == 0 && menu_joystick_delay == 0)
					{
						debug_bool_browser_mode = "live";
						debug_bool_browser_page = 0;
						debug_bool_browser_code = "";
						debug_bool_browser_decoded = undefined;
						debug_bool_browser_message = "";
						menu = "bool_globals_back";
						menu_y_offset = 0;
						menu_y_offset_real = 0;
						menu_delay = 3;
					}

					global.debug_force_network_error = draw_menu_checkmark(380, force_network_error_y,
						"Force network error", "debug_force_network_error", global.debug_force_network_error, false,
						"Makes future connection checks fail during this session");

					var preview_crash_message = draw_menu_button(420, preview_crash_message_y,
						"Preview crash message", "debug_crash_message_preview", "");
					if (menu == "debug_crash_message_preview")
					{
						menu_cursor_y_position = preview_crash_message_y;
					}
					if (preview_crash_message && menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_preview_crash_message();
						menu_delay = 3;
					}

					var preview_network_error = draw_menu_button(420, preview_network_error_y,
						"Preview network error screen", "debug_network_error_preview", "");
					if (menu == "debug_network_error_preview")
					{
						menu_cursor_y_position = preview_network_error_y;
					}
					if (preview_network_error && menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_start_network_error_preview();
					}
				}

				menu_cursor_y_position_end = (os_type == os_switch)
					? bool_globals_y + 16
					: preview_network_error_y + 64;
			}
			else
			if (bool_globals_menu_active)
			{
				scr_debug_bool_globals_browser(false);
			}
			else
			if (capture_mode_menu_active)
			{
				scr_option_capture_mode(get_window_width, get_window_height);
			}
			else
			if (debug_text_menu_active)
			{
				var debug_text_search_modal_active = (menu == "debug_screen_text_search_ok")
					|| (menu == "debug_screen_text_search_cancel");
				var debug_screen_text_title_y = 42;
				var debug_screen_text_back_y = 84;
				var debug_screen_text_search_y = debug_screen_text_back_y + 78;
				var debug_screen_text_search_label_y = debug_screen_text_search_y - 10;
				var debug_screen_text_warning_y = debug_screen_text_search_y + 66;
				var debug_screen_text_row_y = debug_screen_text_warning_y + 96;
				var debug_screen_text_row_spacing = 72;
				var debug_text_title_x = 370 + ((get_window_width - 370) * 0.5);
				var debug_text_warning_x = 410;
				var filtered_debug_visibility_ids = scr_debug_get_filtered_visibility_ids(debug_screen_text_search_query);
				var filtered_debug_visibility_count = array_length(filtered_debug_visibility_ids);
				var search_field_x = 420;
				var search_field_y = debug_screen_text_search_y + menu_y_offset;
				var search_field_width = 370;
				var search_field_height = 41;
				var search_field_left = search_field_x;
				var search_field_top = search_field_y;
				var search_field_right = search_field_left + search_field_width;
				var search_field_bottom = search_field_top + search_field_height;
				var search_field_selected = (menu == "debug_screen_text_search");
				var search_field_hovered = false;
				var search_field_display_text = string(debug_screen_text_search_query);
				var search_field_box_color = make_color_rgb(30, 170, 175);
				var search_field_outline_color = search_field_selected ? c_white : c_ltgray;
				var search_field_text_color = c_white;
				var search_field_padding = 14;

				var debug_text_previous_open_dropdown = open_dropdown;
				if (debug_text_search_modal_active)
				{
					open_dropdown = true;
				}

				var close_debug_screen_text_menu = draw_menu_button(420, debug_screen_text_back_y + menu_y_offset, l10n_text("Back"), "debug_screen_text_back", "");

				if (!debug_text_search_modal_active
				&& close_debug_screen_text_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "debug_screen_text_menu";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				if (menu == "debug_screen_text_back")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Returns to the main Debug tab");
					menu_cursor_y_position = debug_screen_text_back_y;
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				scr_draw_text_outlined(search_field_left, debug_screen_text_search_label_y + menu_y_offset, l10n_text("Search Filter"), global.default_text_size * 0.85, c_menu_outline, c_menu_fill, 1);

				if (!debug_text_search_modal_active)
				{
					search_field_hovered = point_in_rectangle(mouse_get_x, mouse_get_y, search_field_left, search_field_top, search_field_right, search_field_bottom)
						&& (global.controls_used_for_navigation == "mouse")
						&& !open_dropdown
						&& !input_key;

					if (search_field_hovered)
					{
						menu = "debug_screen_text_search";

						if (variable_instance_exists(self, "can_navigate_settings_sidebar"))
						{
							can_navigate_settings_sidebar = false;
						}
					}
				}

				if (search_field_selected
				|| search_field_hovered
				|| debug_text_search_modal_active)
				{
					search_field_outline_color = c_white;
				}

				if (string_width(search_field_display_text + "...") > search_field_width - (search_field_padding * 2))
				{
					while (string_length(search_field_display_text) > 0)
					&& (string_width(search_field_display_text + "...") > search_field_width - (search_field_padding * 2))
					{
						search_field_display_text = string_delete(search_field_display_text, string_length(search_field_display_text), 1);
					}

					search_field_display_text += "...";
				}

				if ((search_field_selected || debug_text_search_modal_active)
				&& (scr_wave(0, 1, 1, 0) > 0.5))
				{
					search_field_display_text += "|";
				}

				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, search_field_box_color, search_field_box_color, search_field_box_color, search_field_box_color, false);
				draw_set_alpha(0.6);
				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_rectangle_color(search_field_left, search_field_top, search_field_right, search_field_bottom, search_field_outline_color, search_field_outline_color, search_field_outline_color, search_field_outline_color, true);

				if (search_field_selected
				|| debug_text_search_modal_active)
				{
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, search_field_left - 24, search_field_top + (search_field_height * 0.5), 1, 1, 0, c_white, 1);
					draw_sprite_ext(spr_menu_cursor, menu_cursor_index, search_field_right + 24, search_field_top + (search_field_height * 0.5), 1, 1, 180, c_white, 1);
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(search_field_left + search_field_padding, search_field_top + (search_field_height * 0.5), search_field_display_text, global.default_text_size * 0.9, c_black, search_field_text_color, 1);

				if (!debug_text_search_modal_active)
				&& ((search_field_hovered
				&& mouse_check_button_released(mb_left))
				|| (search_field_selected
				&& key_accept_pressed
				&& menu_delay == 0
				&& menu_joystick_delay == 0))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					input_key = true;
					keyboard_string = string(debug_screen_text_search_query);
					remember_keyboard_string = string(debug_screen_text_search_query);
					menu = "debug_screen_text_search_ok";
					menu_delay = 3;
				}

				if (menu == "debug_screen_text_search")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Filters debug screen text by user-facing label or internal item key");
					menu_cursor_y_position = debug_screen_text_search_y;
				}

				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				scr_draw_text_outlined(debug_text_warning_x, debug_screen_text_warning_y + menu_y_offset,
					l10n_text("These options are for testing purposes only."),
					global.default_text_size * 0.9, c_black, c_red, 1);
				scr_draw_text_outlined(debug_text_warning_x, debug_screen_text_warning_y + 28 + menu_y_offset,
					l10n_text("They may slow down the game, or cause instability."),
					global.default_text_size * 0.9, c_black, c_red, 1);

				var debug_text_row_draw_y = debug_screen_text_row_y;
				var debug_text_content_end_y = debug_screen_text_row_y;
				var debug_text_view_top = -96;
				var debug_text_view_bottom = get_window_height + 96;

				for (var debug_text_item_index = 0; debug_text_item_index < filtered_debug_visibility_count; debug_text_item_index++)
				{
					var debug_text_item_id = filtered_debug_visibility_ids[debug_text_item_index];
					var debug_text_definition = scr_debug_get_visibility_definition(debug_text_item_id);
					var debug_text_label = global.debug_detailed_mode
						? string(debug_text_definition.item_key)
						: l10n_text(debug_text_definition.label);
					var debug_text_row_menu_id = "debug_screen_text_" + debug_text_item_id;
					var debug_text_row_screen_y = debug_text_row_draw_y + menu_y_offset;
					var debug_text_row_visible = (debug_text_row_screen_y + debug_screen_text_row_spacing >= debug_text_view_top)
						&& (debug_text_row_screen_y - 48 <= debug_text_view_bottom);

					if (debug_text_row_visible
					|| menu == debug_text_row_menu_id)
					{
						draw_menu_debug_visibility_row(400, debug_text_row_screen_y, debug_text_label,
							debug_text_row_menu_id, debug_text_item_id,
							l10n_text(debug_text_definition.description));
					}

					debug_text_row_draw_y += debug_screen_text_row_spacing;
					debug_text_content_end_y = debug_text_row_draw_y;
				}

				if (filtered_debug_visibility_count <= 0)
				{
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(410, debug_screen_text_row_y + menu_y_offset, l10n_text("No debug screen text matched this search."), global.default_text_size * 0.9, c_menu_outline, c_ltgray, 1);
					debug_text_content_end_y = debug_screen_text_row_y + 48;
				}

				var debug_screen_text_default_profile_y = debug_text_content_end_y + 24;
				var debug_screen_text_performance_profile_y = debug_screen_text_default_profile_y + 56;
				var debug_screen_text_level_loading_profile_y = debug_screen_text_performance_profile_y + 56;
				var apply_default_profile = draw_menu_button(420, debug_screen_text_default_profile_y + menu_y_offset, l10n_text("Default Profile"), "debug_screen_text_default_profile", "");
				var apply_performance_profile = draw_menu_button(420, debug_screen_text_performance_profile_y + menu_y_offset, l10n_text("Performance Profile"), "debug_screen_text_performance_profile", "");
				var apply_level_loading_profile = draw_menu_button(420, debug_screen_text_level_loading_profile_y + menu_y_offset, l10n_text("Level Loading Profile"), "debug_screen_text_level_loading_profile", "");

				if (menu == "debug_screen_text_default_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Resets every debug screen text item to the default curated profile");
					menu_cursor_y_position = debug_screen_text_default_profile_y;
				}
				else
				if (menu == "debug_screen_text_performance_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Applies the performance-focused debug screen text profile");
					menu_cursor_y_position = debug_screen_text_performance_profile_y;
				}
				else
				if (menu == "debug_screen_text_level_loading_profile")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Applies a certification-friendly profile for catching level loading bugs and load validation errors");
					menu_cursor_y_position = debug_screen_text_level_loading_profile_y;
				}

				if (!debug_text_search_modal_active
				&& apply_default_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("default");
					menu_delay = 3;
				}

				if (!debug_text_search_modal_active
				&& apply_performance_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("performance");
					menu_delay = 3;
				}

				if (!debug_text_search_modal_active
				&& apply_level_loading_profile)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_apply_profile("level_loading");
					menu_delay = 3;
				}

				scr_draw_settings_overlay_title(debug_text_title_x, debug_screen_text_title_y, l10n_text("Debug Screen Text"), min(get_window_width - 430, 560));

				open_dropdown = debug_text_previous_open_dropdown;

				if (debug_text_search_modal_active)
				{
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(get_window_width * 0.5, (get_window_height * 0.5) - 96, l10n_text("Search Debug Screen Text"), global.default_text_size * 1.4, c_black, c_white, 1);

					debug_screen_text_search_query = scr_draw_name_input_screen(debug_screen_text_search_query, 48, c_black, 1, true,
						get_window_width * 0.5, get_window_height * 0.5, "debug_screen_text_search_ok", "debug_screen_text_search_cancel", false, true, false);

					if (global.clicking_ok_input_screen
					|| global.clicking_cancel_input_screen)
					&& (menu_delay == 0
					&& menu_joystick_delay == 0)
					{
						input_key = false;
						menu = "debug_screen_text_search";
						menu_y_offset = 0;
						menu_y_offset_real = 0;
						menu_delay = 3;
					}
				}

				menu_cursor_y_position_end = debug_screen_text_level_loading_profile_y + 64;
			}
			else
			if (level_load_diagnostics_menu_active)
			{
				var level_loading_debug = scr_get_level_loading_debug_data();
				var latest_level_load_error_log = scr_debug_get_latest_level_load_error_log();
				var latest_level_load_error_visible = !is_undefined(latest_level_load_error_log)
					&& is_struct(latest_level_load_error_log)
					&& string(latest_level_load_error_log.path) != "";
				var recent_level_load_history = scr_debug_get_recent_level_load_history();
				var diagnostics_title_y = 42;
				var diagnostics_back_y = 84;
				var diagnostics_save_dump_y = diagnostics_back_y + 78;
				var diagnostics_row_y = diagnostics_save_dump_y + 78;
				var diagnostics_row_spacing = 48;
				var diagnostics_title_x = 370 + ((display_get_gui_width() - 370) * 0.5);
				var diagnostics_row_width = max(520, display_get_gui_width() - 490);
				var diagnostics_open_dump_folder_visible = global.enable_open_custom_folder;
				var diagnostics_open_dump_folder_y = diagnostics_save_dump_y + 56;
				var diagnostics_row_draw_y = diagnostics_row_y;
				var current_level_identifier = scr_debug_get_level_identifier(level_loading_debug);
				var load_mode_text = string(level_loading_debug.load_mode);
				var selected_official_level_id_text = string(level_loading_debug.selected_official_level_id) != "" ? string(level_loading_debug.selected_official_level_id) : "n/a";
				var active_official_level_id_text = string(level_loading_debug.active_official_level_id) != "" ? string(level_loading_debug.active_official_level_id) : "n/a";
				var after_goal_level_text = string(level_loading_debug.after_goal_go_to_this_level);
				var load_snapshot_summary = scr_debug_format_snapshot_summary(level_loading_debug.load_snapshot_status, level_loading_debug.load_snapshot_reason);
				var level_info_summary = scr_debug_format_resolved_path_summary(level_loading_debug.level_information_path, level_loading_debug.level_information_exists);
				var object_json_summary = scr_debug_format_resolved_path_summary(level_loading_debug.object_placement_path, level_loading_debug.object_placement_exists);
				var background_summary = scr_debug_format_resolved_path_summary(level_loading_debug.background_path, level_loading_debug.background_path_exists);
				var automatic_load_check_summary = scr_debug_format_validation_summary(level_loading_debug.validation_result);
				var placed_object_placeholder_summary = scr_debug_format_loaded_live_summary(level_loading_debug.loaded_placed_object_count, level_loading_debug.current_live_placed_object_count);
				var spawn_pass_summary = scr_debug_format_runtime_spawn_pass_summary(level_loading_debug.runtime_spawn_calls);
				var instances_created_summary = scr_debug_format_runtime_instances_created_summary(level_loading_debug.runtime_instances_created_total);
				var auto_log_saved_text = level_loading_debug.auto_log_saved ? l10n_text("Yes") : l10n_text("No");
				var latest_error_validation_summary = latest_level_load_error_visible
					? scr_debug_format_validation_summary(latest_level_load_error_log.validation_result)
					: "";

				var close_level_load_diagnostics_menu = draw_menu_button(420, diagnostics_back_y + menu_y_offset, l10n_text("Back"), "level_load_diagnostics_back", "");

				if (close_level_load_diagnostics_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu = "level_load_diagnostics_menu";
					menu_y_offset = 0;
					menu_y_offset_real = 0;
					menu_delay = 3;
				}

				if (menu == "level_load_diagnostics_back")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Returns to the main Debug tab");
					menu_cursor_y_position = diagnostics_back_y;
				}

				var save_level_load_debug_dump = draw_menu_button(420, diagnostics_save_dump_y + menu_y_offset, l10n_text("Save Debug Dump Now"), "level_load_diagnostics_save_debug_dump", "");

				if (menu == "level_load_diagnostics_save_debug_dump")
				{
					global.option_default = -1;
					global.option_description = l10n_text("Writes a full debug information file immediately without waiting for an automatic error");
					menu_cursor_y_position = diagnostics_save_dump_y;
				}

				if (save_level_load_debug_dump)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					scr_debug_save_manual_debug_info_dump();
					scr_debug_show_toast("Debug dump saved");
					menu_delay = 3;
				}

				if (diagnostics_open_dump_folder_visible)
				{
					var open_level_load_debug_dump_folder = draw_menu_button(420, diagnostics_open_dump_folder_y + menu_y_offset, l10n_text("Open Debug Dump Folder"), "level_load_diagnostics_open_debug_dump_folder", "");

					if (menu == "level_load_diagnostics_open_debug_dump_folder")
					{
						global.option_default = -1;
						global.option_description = l10n_text("Opens the folder where manual debug dumps are saved");
						menu_cursor_y_position = diagnostics_open_dump_folder_y;
					}

					if (open_level_load_debug_dump_folder)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						scr_debug_open_manual_debug_info_folder();
					}
				}

				if (diagnostics_open_dump_folder_visible)
				{
					diagnostics_row_draw_y = diagnostics_open_dump_folder_y + 78;
				}

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Automatic Load Check"), automatic_load_check_summary, "level_load_diagnostics_automatic_load_check",
					l10n_text("Shows the current automatic level-load validation result"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Load Snapshot"), load_snapshot_summary, "level_load_diagnostics_load_snapshot",
					l10n_text("Shows the current snapshot of load-time file resolution and object capture"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Current Level"), current_level_identifier, "level_load_diagnostics_current_level",
					l10n_text("Shows which level identifier the monitor is currently tracking"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Load Mode"), load_mode_text, "level_load_diagnostics_load_mode",
					l10n_text("Shows whether the current load is official, template_official, or custom"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Selected Official ID"), selected_official_level_id_text, "level_load_diagnostics_selected_official_id",
					l10n_text("Shows the currently selected official level ID"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Active Official ID"), active_official_level_id_text, "level_load_diagnostics_active_official_id",
					l10n_text("Shows the official level ID that actually finished loading"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("After Goal Level"), after_goal_level_text, "level_load_diagnostics_after_goal_level",
					l10n_text("Shows where the game plans to send the player after clearing the level"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Level Info"), level_info_summary, "level_load_diagnostics_level_info",
					l10n_text("Shows whether level_information.ini was found at the resolved path"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Object JSON"), object_json_summary, "level_load_diagnostics_object_json",
					l10n_text("Shows whether object_placement_all.json was found at the resolved path"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Background"), background_summary, "level_load_diagnostics_background",
					l10n_text("Shows whether the resolved background directory exists"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("JSON Entries"), string(level_loading_debug.load_snapshot_json_entry_count), "level_load_diagnostics_json_entries",
					l10n_text("Shows how many entries were read from object_placement_all.json during the load snapshot"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Placed-Object Placeholder"), placed_object_placeholder_summary, "level_load_diagnostics_placeholder_summary",
					l10n_text("Compares the load-time placed-object placeholder count with the live count now"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Placed-Object Spawn Passes"), spawn_pass_summary, "level_load_diagnostics_spawn_passes",
					l10n_text("Shows how many placed-object placeholder spawn passes finished"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Gameplay Instances Created"), instances_created_summary, "level_load_diagnostics_instances_created",
					l10n_text("Shows how many gameplay instances were created from placed-object placeholders"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Auto-Log Saved This Load"), auto_log_saved_text, "level_load_diagnostics_auto_log_saved",
					l10n_text("Shows whether the current validation session already saved an automatic error log"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Monitor Session ID"), string(level_loading_debug.monitor_session_id), "level_load_diagnostics_monitor_session_id",
					l10n_text("Shows the current level-load monitor session ID"), diagnostics_row_width);
				diagnostics_row_draw_y += diagnostics_row_spacing;

				if (latest_level_load_error_visible)
				{
					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Log"), string(latest_level_load_error_log.display_path), "level_load_diagnostics_latest_error_log",
						l10n_text("Shows the newest saved automatic level-load error log path"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Reason"), string(latest_level_load_error_log.failure_reason), "level_load_diagnostics_latest_error_reason",
						l10n_text("Shows why the newest saved automatic level-load error log was written"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Validation"), latest_error_validation_summary, "level_load_diagnostics_latest_error_validation",
						l10n_text("Shows the saved validation result for the newest automatic level-load error log"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Saved At"), string(latest_level_load_error_log.saved_at), "level_load_diagnostics_latest_error_saved_at",
						l10n_text("Shows when the newest automatic level-load error log was saved"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;

					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Latest Error Session ID"), string(latest_level_load_error_log.session_id), "level_load_diagnostics_latest_error_session_id",
						l10n_text("Shows which monitor session created the newest automatic level-load error log"), diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;
				}

				for (var recent_load_index = 0; recent_load_index < min(5, array_length(recent_level_load_history)); recent_load_index++)
				{
					draw_menu_info_row(410, diagnostics_row_draw_y + menu_y_offset, l10n_text("Recent Load") + " " + string(recent_load_index + 1),
						scr_debug_format_recent_level_load_history_entry(recent_level_load_history[recent_load_index]),
						"level_load_diagnostics_recent_load_" + string(recent_load_index + 1),
						l10n_text("Shows a recently completed automatic level-load validation result"),
						diagnostics_row_width);
					diagnostics_row_draw_y += diagnostics_row_spacing;
				}

				var export_reminder_text_scale = global.default_text_size * 0.78;
				var export_reminder_lines = [];
				var export_reminder_single_line = l10n_text("If a level-loading bug happens, export all save data with Includes CacheStorage enabled.");

				if ((string_width(export_reminder_single_line) * export_reminder_text_scale) <= diagnostics_row_width)
				{
					export_reminder_lines[0] = export_reminder_single_line;
				}
				else
				{
					var export_reminder_multiline_text = l10n_text("If a level-loading bug happens, export all save data{br}with Includes CacheStorage enabled.");
					var export_reminder_newline_index = string_pos("\n", export_reminder_multiline_text);

					if (export_reminder_newline_index > 0)
					{
						export_reminder_lines[0] = string_copy(export_reminder_multiline_text, 1, export_reminder_newline_index - 1);
						export_reminder_lines[1] = string_delete(export_reminder_multiline_text, 1, export_reminder_newline_index);
					}
					else
					{
						export_reminder_lines[0] = export_reminder_multiline_text;
					}
				}

				var export_reminder_outline_offset = max(1, round(export_reminder_text_scale));
				var export_reminder_line_spacing = max(24, round(string_height("A") * export_reminder_text_scale) + 10);

				draw_set_halign(fa_left);
				draw_set_valign(fa_top);
				for (var export_reminder_index = 0; export_reminder_index < array_length(export_reminder_lines); export_reminder_index++)
				{
					var export_reminder_line_text = string(export_reminder_lines[export_reminder_index]);
					var export_reminder_line_y = diagnostics_row_draw_y + 18 + menu_y_offset + (export_reminder_index * export_reminder_line_spacing);

					draw_text_transformed_color(410 - export_reminder_outline_offset, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410 + export_reminder_outline_offset, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y - export_reminder_outline_offset, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y + export_reminder_outline_offset, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_menu_outline, c_menu_outline, c_menu_outline, c_menu_outline, 1);
					draw_text_transformed_color(410, export_reminder_line_y, export_reminder_line_text, export_reminder_text_scale, export_reminder_text_scale, 0,
						c_ltgray, c_ltgray, c_ltgray, c_ltgray, 1);
				}

				scr_draw_settings_overlay_title(diagnostics_title_x, diagnostics_title_y, l10n_text("Level Load Diagnostics"), min(get_window_width - 430, 620));

				menu_cursor_y_position_end = diagnostics_row_draw_y + 112 + (max(0, array_length(export_reminder_lines) - 1) * export_reminder_line_spacing);
			}
		}
		#endregion /* Debug Settings END */
}
