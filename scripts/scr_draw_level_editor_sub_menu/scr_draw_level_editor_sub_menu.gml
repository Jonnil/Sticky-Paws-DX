/// @desc  scr_draw_level_editor_sub_menu(xx)
/// @param {real} [xx]=0
function scr_draw_level_editor_sub_menu(xx = 0)
{
	var get_window_height = display_get_gui_height();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var daily_build_enabled = true;
	if (!variable_instance_exists(id, "big_collectible_entry_cache")) big_collectible_entry_cache = scr_big_collectible_entry_cache_create();
	var tier_panel_visible = false;
	var tier_panel_bounds = scr_big_collectible_custom_panel_bounds(xx);
	if (open_sub_menu && menu == "level_editor_play" && global.select_level_index > 0
	&& can_navigate && !can_input_level_name)
	{
		var tier_folder = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
		var tier_data_path = game_save_id + "custom_levels/" + tier_folder + "/data/";
		scr_big_collectible_entry_cache_refresh(big_collectible_entry_cache, tier_data_path + "level_information.ini",
			tier_data_path + "object_placement_all.json", false, "", tier_folder, global.level_name);
		tier_panel_visible = scr_big_collectible_entry_has_rows(big_collectible_entry_cache.model);
		if (tier_panel_visible)
		{
			tier_panel_bounds = scr_big_collectible_custom_panel_bounds(xx, big_collectible_entry_cache.model, big_collectible_entry_cache.state);
			tier_panel_visible = tier_panel_bounds.visible;
			big_collectible_entry_cache.state.tooltip_exclusion = {left:0, top:0, right:tier_panel_bounds.corner_right, bottom:tier_panel_bounds.corner_bottom};
			var tier_pointer_in_corner = global.controls_used_for_navigation == "mouse"
				&& point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, tier_panel_bounds.corner_right, tier_panel_bounds.corner_bottom);
			if (tier_panel_visible && menu_delay == 0 && menu_joystick_delay == 0
			&& !tier_pointer_in_corner)
			{
				var tier_choice = scr_big_collectible_selector_step(big_collectible_entry_cache.state, big_collectible_entry_cache.model,
					tier_panel_bounds.left, tier_panel_bounds.top, tier_panel_bounds.width, tier_panel_bounds.height);
				if (tier_choice >= 0 && scr_big_collectible_preview_choose(big_collectible_entry_cache.model, tier_choice)) menu_delay = 3;
			}
			else if (tier_pointer_in_corner)
			{
				big_collectible_entry_cache.state.hover_tier = -1;
				big_collectible_entry_cache.state.hover_slot = -1;
				big_collectible_entry_cache.state.hover_cycle = false;
				big_collectible_entry_cache.state.pointer_inside = false;
			}
			if (tier_panel_visible) scr_big_collectible_entry_draw(big_collectible_entry_cache, tier_panel_bounds.left, tier_panel_bounds.top, tier_panel_bounds.width, tier_panel_bounds.height);
		}
	}
	else big_collectible_entry_cache.source_key = "";

	var back_y = 226 * (column - scroll) + 569 - 3;
	var daily_build_y = 226 * (column - scroll) + 569 - 3;

	#region /* Draw sub menu (code must be here to be above everything else) */
	if (open_sub_menu)
	&& (menu != "caution_online_back")
	&& (menu != "caution_online_do_not_show")
	&& (menu != "caution_online_proceed")
	&& (menu != "caution_online_network_error")
	&& (menu != "upload_rules_back")
	&& (menu != "upload_rules_do_not_show")
	&& (menu != "upload_rules")
	&& (menu != "level_editor_downloaded_level")
	&& (menu != "level_length_recommendation_ok" && menu != "level_length_recommendation_back")
	{

		#region /* Navigate Sub Menu */
		if (key_up)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
		{
			menu_delay = 3;
			if (menu == "level_editor_play")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_make")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				if (global.free_communication_available)
				{
					menu = "level_editor_upload";
				}
				else
				{
					menu = "level_editor_make";
				}
			}
			else
			if (menu == "level_editor_enter_description")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_selected_back")
			{
				if (show_delete_button)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_make";
				}
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_create_daily_build")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				if (daily_build_enabled) {
					menu = "level_editor_create_daily_build";
				}
				else
				{
					menu = "level_editor_create_from_template";
				}
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_enter_description";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
		}
		else
		if (key_down)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (!can_input_level_name)
		{
			menu_delay = 3;
			if (menu == "level_editor_play")
			{
				menu = "level_editor_make";
			}
			else
			if (menu == "level_editor_make")
			{
				if (global.free_communication_available)
				{
					menu = "level_editor_upload";
				}
				else
				{
					menu = "level_editor_edit_name";
				}
			}
			else
			if (menu == "level_editor_upload")
			{
				menu = "level_editor_edit_name";
			}
			else
			if (menu == "level_editor_edit_name")
			{
				menu = "level_editor_enter_description";
			}
			else
			if (menu == "level_editor_enter_description")
			{
				if (show_delete_button)
				{
					menu = "level_editor_delete";
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			else
			if (menu == "level_editor_selected_back")
			{
				menu = "level_editor_play";
			}
			else
			if (menu == "level_editor_create_from_scratch")
			{
				menu = "level_editor_create_from_template";
			}
			else
			if (menu == "level_editor_create_from_template")
			{
				if (daily_build_enabled)
				{
					menu = "level_editor_create_daily_build";
				}
				else
				{
					menu = "level_editor_create_from_back";
				}
			}
			else
			if (menu == "level_editor_create_daily_build")
			{
				menu = "level_editor_create_from_back";
			}
			else
			if (menu == "level_editor_create_from_back")
			{
				menu = "level_editor_create_from_scratch";
			}
			else
			if (menu == "level_editor_delete")
			{
				menu = "level_editor_selected_back";
			}
			else
			if (menu == "level_editor_delete_no")
			{
				menu = "level_editor_delete_yes";
			}
			else
			if (menu == "level_editor_delete_yes")
			{
				menu = "level_editor_delete_no";
			}
		}
		#endregion /* Navigate Sub Menu END */

		#region /* Button Y Positions */
		var play_y = 0;
		var make_y = 42;
		var edit_name_y = 42 * 2;
		var edit_description_y = 42 * 3;
		var delete_y = 42 * 4;
		var upload_y = -99999;
		back_y = 42 * 5;
		
		if (show_delete_button)
		{
			if (global.free_communication_available)
			{
				upload_y = 42 * 2;
				edit_name_y = 42 * 3;
				edit_description_y = 42 * 4;
				delete_y = 42 * 5;
				back_y = 42 * 6;
			}
		}
		else
		{
			delete_y = -99999;
			
			if (global.free_communication_available)
			{
				upload_y = 42 * 2;
				edit_name_y = 42 * 3;
				edit_description_y = 42 * 4;
				back_y = 42 * 5;
			}
			else
			{
				back_y = 42 * 4;
			}
		}
		#endregion /* Button Y Positions END */

		#region /* Show Sub Menu Buttons */
		if (!can_input_level_name)
		&& (menu != "load_official_level_template")
		{
			if (menu == "level_editor_delete_no") /* Delete level menu */
			|| (menu == "level_editor_delete_yes")
			{
				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3, xx + 384, 226 * (column - scroll) + 408 + 216 + 3, 50, 50, c_red, c_red, false);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(xx + 200, 226 * (column - scroll) + 485 - 3, l10n_text("Delete Level") + "?", global.default_text_size * 1.2, c_white, c_black, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("No"), "level_editor_delete_no", "level_editor_delete"); /* + 47 on y */
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, 226 * (column - scroll) + 522 - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 569 - 3, l10n_text("Yes"), "level_editor_delete_yes", "level_editor_delete_yes", c_red);
				draw_sprite_ext(spr_icon_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 569 - 3 + 21, 1, 1, 0, c_white, 1);
			}
			else
			if (global.select_level_index == 0) /* Create from Scratch and Create from Template menu */
			{
				back_y = 226 * (column - scroll) + 569 - 3;
				daily_build_y = 226 * (column - scroll) + 569 - 3;
				
				if (daily_build_enabled)
				{
					back_y += 47;
				}

				scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				draw_roundrect_color_ext(xx - 3, 226 * (column - scroll) + 455 - 3 + 10 - 3, xx + 384 + 3, back_y + 47 + 3, 50, 50, c_black, c_black, false);
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, back_y + 47, 50, 50, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 - 3, l10n_text("Create from Scratch"), "level_editor_create_from_scratch", "level_editor_create_from_scratch");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 522 - 3, l10n_text("Create from Template"), "level_editor_create_from_template", "level_editor_create_from_template"); /* + 47 on y */
				
				if (daily_build_enabled)
				{
					draw_menu_button(xx + 8, daily_build_y, l10n_text("Create Daily Build"), "level_editor_create_daily_build", "level_editor_create_daily_build"); /* + 47 on y */
					draw_sprite_ext(spr_icon_daily_build, 0, xx + 8 + 20, daily_build_y + 21, 1, 1, 0, c_white, 1);
				}
				
				draw_menu_button(xx + 8, back_y, l10n_text("Back"), "level_editor_create_from_back", "level_editor_create_from_back");
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, back_y + 21, 1, 1, 0, c_white, 1);
			}
			else /* Regular sub menu */
			{
				show_level_editor_corner_menu = true;
				if (get_window_height <= 720)
				{
					scroll_to = floor(global.select_level_index / row) + 0.8; /* Scroll the view to fit all the buttons */
				}
				else
				{
					scroll_to = floor(global.select_level_index / row) + 0.1; /* Scroll the view to fit all the buttons */
				}
				draw_roundrect_color_ext(xx - 3, 226 * (column - scroll) + 455 - 3 + 10 - 3, xx + 384 + 3, 226 * (column - scroll) + 475 + back_y + 47 + 3 + 3, 50, 50, c_black, c_black, false);
				draw_roundrect_color_ext(xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 475 + back_y + 47 + 3, 50, 50, c_white, c_white, false);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (play_y) - 3, l10n_text("Play"), "level_editor_play", "");
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, l10n_text("Make"), "level_editor_make", "");
				if (global.free_communication_available)
				{
					draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (upload_y) - 3, l10n_text("Upload"), "level_editor_upload", "");
					draw_sprite_ext(spr_icon_upload, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (upload_y) - 3 + 21, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, l10n_text("Edit Name"), "level_editor_edit_name", "");
				draw_sprite_ext(spr_icon_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 21, 1, 1, 0, c_white, 1);
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, l10n_text("Edit Description"), "level_editor_enter_description", "");
				draw_sprite_ext(spr_icon_pen, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 21, 1, 1, 0, c_white, 1);
				if (show_delete_button)
				{
					draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (delete_y) - 3, l10n_text("Delete"), "level_editor_delete", "level_editor_delete_no", c_red);
					draw_sprite_ext(spr_icon_delete, 0, xx + 8 + 16, 226 * (column - scroll) + 475 + (delete_y) - 3 + 21, 1, 1, 0, c_white, 1);
				}
				draw_menu_button(xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, l10n_text("Back"), "level_editor_selected_back", "");
				draw_sprite_ext(spr_icon_back, 0, xx + 8 + 20, 226 * (column - scroll) + 475 + (back_y) - 3 + 21, 1, 1, 0, c_white, 1);
			}
		}
		#endregion /* Show Sub Menu Buttons END */

		#region /* Pressing the Create from Scratch button */
		if (menu == "level_editor_create_from_scratch")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 - 3, xx + 8 + 370, 226 * (column - scroll) + 475 - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_accept_pressed)
			{
				global.save_data_size_is_sufficient = true; /* Avoid Switch save-data API calls during Create menu transitions. */
				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = false; /* Disable Daily Build */
					menu = "level_editor_enter_name_ok";
					menu_delay = 3;
					keyboard_string = "";
					can_input_level_name = true;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create from Scratch button END */

		#region /* Pressing the Create from Back button */
		if (menu == "level_editor_create_from_back")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, back_y, xx + 8 + 370, back_y + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_accept_pressed)
			{
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Create from Back button END */

		#region /* Pressing the Back button when selecting level */
		if (menu == "level_editor_selected_back")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_level_editor_corner_menu = true;
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (back_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (back_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_accept_pressed)
			{
				file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				menu = "level_editor_play";
			}
		}
		#endregion /* Pressing the Back button when selecting level END */

		#region /* Clicking outside of the sub menu should close the sub menu */
		if (open_sub_menu)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_play")
			|| (menu == "level_editor_make")
			|| (menu == "level_editor_upload")
			|| (menu == "level_editor_edit_name")
			|| (menu == "level_editor_enter_description")
			|| (menu == "level_editor_delete")
			|| (menu == "level_editor_selected_back")
			{
				if (!point_in_rectangle(mouse_get_x, mouse_get_y, xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 475 + back_y + 47 + 3))
				&& (!tier_panel_visible || !point_in_rectangle(mouse_get_x, mouse_get_y, tier_panel_bounds.outer_left, tier_panel_bounds.outer_top, tier_panel_bounds.outer_right, tier_panel_bounds.outer_bottom))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
					menu_delay = 3;
					open_sub_menu = false;
					show_level_editor_corner_menu = true;
					scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
					menu = "level_editor_play";
				}
			}
			else
			if (menu == "level_editor_create_from_scratch")
			|| (menu == "level_editor_create_from_template")
			|| (menu == "level_editor_create_from_back")
			{
				if (!point_in_rectangle(mouse_get_x, mouse_get_y, xx, 226 * (column - scroll) + 455 - 3 + 10, xx + 384, 226 * (column - scroll) + 408 + 216 + 3))
				&& (mouse_check_button_released(mb_left))
				&& (global.controls_used_for_navigation == "mouse")
				{
					file_load_timer = 0; /* Reset the "file load timer" to 0 just in case, otherwise you can't navigate the thumbnails with mouse */
					menu_delay = 3;
					open_sub_menu = false;
					show_level_editor_corner_menu = true;
					scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
					menu = "level_editor_play";
				}
			}
		}
		#endregion /* Clicking outside of the sub menu should close the sub menu END */

		#region /* Pressing the Play button */
		if (menu == "level_editor_play")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (play_y)- 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (play_y)- 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_accept_pressed)
			{
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = true; /* Even before going to the level, set this variable to true */
				global.play_edited_level = true;
				can_navigate = false;
				menu_delay = 9999;
			}
		}
		#endregion /* Pressing the Play button END */

		#region /* Pressing the Make button */
		if (menu == "level_editor_make")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (make_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (make_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			|| (key_accept_pressed)
			{
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;
				global.play_edited_level = false;
				can_navigate = false;
				menu_delay = 9999;
			}
		}
		#endregion /* Pressing the Make button END */

		#region /* Pressing the Edit Name button */
		if (menu == "level_editor_edit_name")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_name_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_name_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_accept_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;

				old_level_index = ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index);

				if (ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index) != undefined) /* Don't set "global level name" to "ds list find value" if it's undefined */
				{
					var folder_name = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
					global.level_folder_name = folder_name;
					global.level_name = scr_get_level_display_name(folder_name); /* Use the saved display name, not the sanitized folder name */
					keyboard_string = global.level_name;
				}

				old_level_name = global.level_name; /* Need to remember original name of level, so that renaming level doesn't actually happen if you haven't edited the name */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "level_editor_enter_name_ok"
			}
		}
		#endregion /* Pressing the Edit Name button END */

		#region /* Pressing the Edit Description button */
		if (menu == "level_editor_enter_description")
		{
			if (!hovering_over_level_editor_corner_menu)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 475 + (edit_description_y) - 3, xx + 8 + 370, 226 * (column - scroll) + 475 + (edit_description_y) - 3 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (global.controls_used_for_navigation == "mouse")
			&& (!level_editor_edit_name)
			|| (key_accept_pressed)
			&& (!level_editor_edit_name)
			{
				level_editor_edit_name = true;
				can_input_level_name = true;
				can_navigate = true;
				global.doing_clear_check_level = false;
				global.actually_play_edited_level = false;

				if (file_exists(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini"))
				{
					ini_open(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini");
					keyboard_string = ini_read_string("info", "level_description", "");
					global.level_description = ini_read_string("info", "level_description", "");
					ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
				}
				else
				{
					keyboard_string = "";
					global.level_description = "";
				}

				old_level_description = global.level_description; /* Need to remember original description of level, so that renaming level doesn't actually happen if you haven't edited the description */
				global.play_edited_level = false;
				menu_delay = 3;
				menu = "level_editor_enter_description_ok";
			}
		}
		#endregion /* Pressing the Edit Description button END */

		#region /* Key A pressed */
		if (key_accept_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{

			#region /* Pressing the Delete button */
			if (menu == "level_editor_delete")
			&& (show_delete_button)
			{
				menu_delay = 3;
				menu = "level_editor_delete_no";
			}
			#endregion /* Pressing the Delete button END */

			else

			#region /* Pressing the No Delete button */
			if (menu == "level_editor_delete_no")
			{
				menu_delay = 3;
				if (show_delete_button)
				{
					menu = "level_editor_delete"
				}
				else
				{
					menu = "level_editor_selected_back";
				}
			}
			#endregion /* Pressing the No Delete button END */

		}
		#endregion /* Key A pressed END */

		#region /* Pressing the Create from Template button */
		if (key_accept_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 522 - 3, xx + 8 + 320, 226 * (column - scroll) + 522 - 3 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_create_from_template")
			{
				global.save_data_size_is_sufficient = true; /* Avoid Switch save-data API calls during Create menu transitions. */

				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = false; /* Disable Daily Build */
					file_found = "";
					file_load_timer = 0;
					level_find_pos = 0;
					scr_clear_thumbnail_sprites();
					menu_delay = 3;
					menu = "load_official_level_template";
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create from Template button END */

		#region /* Pressing the Create Daily Build button */
		if (daily_build_enabled)
		&& (key_accept_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (daily_build_enabled)
		&& (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, daily_build_y, xx + 8 + 320, daily_build_y + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_create_daily_build")
			{
				global.save_data_size_is_sufficient = true; /* Avoid Switch save-data API calls during Create menu transitions. */
				if (global.save_data_size_is_sufficient)
				{
					creating_daily_build = true; /* Enable Daily Build */
					menu = "level_editor_enter_name_ok";
					menu_delay = 3;
					keyboard_string = "";
					can_input_level_name = true;
				}
				else
				{
					menu_delay = 3;
					can_input_level_name = false;
					global.clicking_ok_input_screen = false;
				}
			}
		}
		#endregion /* Pressing the Create Daily Build button END */

		#region /* Pressing the Yes Delete button */
		if (key_accept_pressed)
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		|| (!hovering_over_level_editor_corner_menu)
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, xx + 8, 226 * (column - scroll) + 569 - 3, xx + 8 + 320, 226 * (column - scroll) + 569 - 3 + 42))
		&& (mouse_check_button_released(mb_left))
		&& (global.controls_used_for_navigation == "mouse")
		&& (!can_input_level_name)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "level_editor_delete_yes")
			{
				if (file_exists(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini"))
				{
					directory_destroy(game_save_id + "custom_levels/" + scr_get_custom_level_folder_name());
				}

				/* Deleting authored files keeps canonical and unresolved player history. */

				global.select_level_index--; /* Decrease the "select level index" so that the cursor isn't selecting a level that no longer exists */
				scr_load_custom_level_initializing();

				for(var i = 1; i <= global.max_players; i += 1)
				{
					can_input_player_name[i] = 2;
					player_accept_selection[i] = false;
				}

				global.go_to_menu_when_going_back_to_title = "level_editor_delete";
				can_navigate = true;
				menu_delay = 3;
				open_sub_menu = false;
				show_level_editor_corner_menu = true;
				scroll_to = floor(global.select_level_index / row); /* Scroll the view back to show the thumbnails */
				file_found = "";
				menu = "load_custom_level"; /* After deleting, go to load custom level menu */
			}
		}
		#endregion /* Pressing the Yes Delete button END */

	}
	#endregion /* Draw sub menu END */

}

/* Fit the visible card against the current thumbnail, clear of the fixed corner buttons. */
function scr_big_collectible_custom_panel_bounds(thumbnail_left, model = undefined, state = undefined, geometry = undefined)
{
	var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	var thumbnail_top = 226 * (floor(global.select_level_index / row) - scroll) + 247;
	var cursor_extent = scr_wave(10, 0, 1, 0);
	var corner_bottom = show_level_editor_corner_menu || (open_sub_menu && menu == "level_editor_play") ? 42 * (1 + global.enable_open_custom_folder + global.free_communication_available) : 0;
	var corner_right = 370 + 24 + max(sprite_get_xoffset(spr_menu_cursor), sprite_get_width(spr_menu_cursor) - sprite_get_xoffset(spr_menu_cursor));
	if (is_struct(geometry))
	{
		if (variable_struct_exists(geometry, "gui_width")) gui_width = geometry.gui_width;
		if (variable_struct_exists(geometry, "gui_height")) gui_height = geometry.gui_height;
		if (variable_struct_exists(geometry, "thumbnail_top")) thumbnail_top = geometry.thumbnail_top;
		if (variable_struct_exists(geometry, "cursor_extent")) cursor_extent = geometry.cursor_extent;
		if (variable_struct_exists(geometry, "corner_bottom")) corner_bottom = geometry.corner_bottom;
		if (variable_struct_exists(geometry, "corner_right")) corner_right = geometry.corner_right;
	}
	var frame_right = thumbnail_left + 390;
	var center_x = thumbnail_left + 195;
	var viewport_bottom = gui_height - 40;
	var fill_sprite = global.resource_pack_sprite_big_collectible;
	var outline_sprite = global.resource_pack_sprite_big_collectible_outline;
	var source_top = max(sprite_get_yoffset(fill_sprite), sprite_get_yoffset(outline_sprite));
	var source_bottom = max(sprite_get_height(fill_sprite) - sprite_get_yoffset(fill_sprite), sprite_get_height(outline_sprite) - sprite_get_yoffset(outline_sprite));
	var minimum_line_height = ceil((source_top + source_bottom) * 0.5) + 4;
	var available_tiers = 0;
	if (is_struct(model)) for (var tier = 0; tier <= 2; tier++) if (model.counts[tier] > 0 && model.unlocked[tier]) available_tiers++;
	var minimum_footer_height = available_tiers > 1 && minimum_line_height >= 64
		&& (!variable_struct_exists(model, "read_only") || !model.read_only) ? 22 : 0;
	var minimum_frame_top = max(8, corner_bottom + 3) + minimum_line_height + minimum_footer_height + 8 + 3 + cursor_extent;
	var bounds = {left:0, top:0, width:0, height:0, layout:undefined, visible:false, placement:"none",
		outer_left:0, outer_top:0, outer_right:0, outer_bottom:0, thumbnail_left:thumbnail_left, thumbnail_top:thumbnail_top,
		thumbnail_right:frame_right, thumbnail_center:center_x, corner_right:corner_right, corner_bottom:corner_bottom,
		minimum_frame_top:minimum_frame_top};
	if (!is_struct(model)) return bounds;
	var panel_scroll = is_struct(state) ? state.scroll : 0;
	var regions = [
		{left:8, right:gui_width - 8, top:8, bottom:min(viewport_bottom, thumbnail_top - 3), placement:"above", align:0},
		{left:corner_right + 3, right:gui_width - 8, top:8, bottom:min(viewport_bottom, thumbnail_top - 3), placement:"above_gutter", align:0},
		{left:max(8, frame_right + cursor_extent + 3), right:gui_width - 8, top:8, bottom:viewport_bottom, placement:"right", align:1},
		{left:8, right:min(gui_width - 8, thumbnail_left - cursor_extent - 3), top:8, bottom:viewport_bottom, placement:"left", align:-1}
	];
	var best_bounds = bounds;
	var best_visible_icons = -1;
	/* Prefer all authored content before using a constrained, whole-line viewport. */
	for (var pass = 0; pass < 2; pass++)
	for (var region_index = 0; region_index < array_length(regions); region_index++)
	{
		var region = regions[region_index];
		var capacity_width = min(370, region.right - region.left - 16);
		var safe_top = region.top;
		var safe_bottom = region.bottom;
		if (capacity_width < 48 || safe_bottom - safe_top < 28) continue;
		var fitted = undefined;
		var outer_left = 0;
		/* Fitted width determines whether the card intersects buttons or moving corner triangles. */
		for (var fit_pass = 0; fit_pass < 2; fit_pass++)
		{
			fitted = scr_big_collectible_selector_layout(model, 0, 0, capacity_width, max(1, safe_bottom - safe_top - 8), panel_scroll);
			var outer_width = fitted.width + 16;
			outer_left = region.align == 1 ? region.left : (region.align == -1 ? region.right - outer_width : center_x - outer_width * 0.5);
			outer_left = clamp(outer_left, region.left, max(region.left, region.right - outer_width));
			if (corner_bottom > 0 && outer_left < corner_right) safe_top = max(region.top, corner_bottom + 3);
			if (region.align == 0)
			{
				var intersects_left_triangle = outer_left < thumbnail_left + 32 - 2 * cursor_extent && outer_left + outer_width > thumbnail_left - cursor_extent;
				var intersects_right_triangle = outer_left < frame_right + cursor_extent && outer_left + outer_width > frame_right - 32 + 2 * cursor_extent;
				safe_bottom = min(viewport_bottom, thumbnail_top - 3 - ((intersects_left_triangle || intersects_right_triangle) ? cursor_extent : 0));
			}
		}
		var capacity_height = safe_bottom - safe_top - 8;
		if (capacity_height < 20) continue;
		fitted = scr_big_collectible_selector_layout(model, 0, 0, capacity_width, capacity_height, panel_scroll);
		if (fitted.visible_lines < 1 || (pass == 0 && fitted.max_scroll > 0)) continue;
		var readable_icon = false;
		for (var fitted_row = 0; fitted_row < array_length(fitted.rows); fitted_row++)
		{
			var row_icons = fitted.rows[fitted_row].icons;
			if (array_length(row_icons) > 0 && row_icons[0].scale >= 0.3) readable_icon = true;
		}
		if (!readable_icon) continue;
		var visible_icons = 0;
		for (var fitted_row = 0; fitted_row < array_length(fitted.rows); fitted_row++) visible_icons += array_length(fitted.rows[fitted_row].icons);
		if (pass == 1 && visible_icons <= best_visible_icons) continue;
		var outer_height = fitted.total_height + 8;
		var outer_top = region.align == 0 ? safe_bottom - outer_height : clamp(thumbnail_top, safe_top, max(safe_top, safe_bottom - outer_height));
		bounds = {left:0, top:0, width:0, height:0, layout:undefined, visible:false, placement:region.placement,
			outer_left:0, outer_top:0, outer_right:0, outer_bottom:0, thumbnail_left:thumbnail_left, thumbnail_top:thumbnail_top,
			thumbnail_right:frame_right, thumbnail_center:center_x, corner_right:corner_right, corner_bottom:corner_bottom,
			minimum_frame_top:minimum_frame_top};
		bounds.left = outer_left + 8;
		bounds.top = outer_top + 4;
		bounds.width = capacity_width;
		bounds.height = capacity_height;
		bounds.layout = scr_big_collectible_selector_layout(model, bounds.left, bounds.top, bounds.width, bounds.height, panel_scroll);
		bounds.outer_left = outer_left;
		bounds.outer_top = outer_top;
		bounds.outer_right = bounds.layout.right + 8;
		bounds.outer_bottom = bounds.layout.footer_bottom + 4;
		bounds.visible = true;
		bounds.placement = region.placement;
		if (pass == 0) return bounds;
		best_bounds = bounds;
		best_visible_icons = visible_icons;
	}
	return best_bounds;
}

/* On narrow windows, keep one usable line above the thumbnail when neither side can hold it. */
function scr_big_collectible_custom_panel_prepare(thumbnail_left)
{
	if (!open_sub_menu || menu != "level_editor_play" || global.select_level_index <= 0 || !can_navigate || can_input_level_name) return;
	if (!variable_instance_exists(id, "big_collectible_entry_cache")) big_collectible_entry_cache = scr_big_collectible_entry_cache_create();
	var tier_folder = string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index));
	var tier_data_path = game_save_id + "custom_levels/" + tier_folder + "/data/";
	scr_big_collectible_entry_cache_refresh(big_collectible_entry_cache, tier_data_path + "level_information.ini",
		tier_data_path + "object_placement_all.json", false, "", tier_folder, global.level_name);
	if (!scr_big_collectible_entry_has_rows(big_collectible_entry_cache.model)) return;
	var bounds = scr_big_collectible_custom_panel_bounds(thumbnail_left, big_collectible_entry_cache.model, big_collectible_entry_cache.state);
	if (!bounds.visible && bounds.thumbnail_top < bounds.minimum_frame_top)
	{
		scroll = min(scroll, floor(global.select_level_index / row) + (247 - bounds.minimum_frame_top) / 226);
	}
}

/* Entry previews are read-only snapshots. Refresh only while their target is visible. */
function scr_big_collectible_entry_cache_create()
{
	return {source_key:"", refreshed_at:0, model:undefined, state:scr_big_collectible_selector_create()};
}

function scr_big_collectible_entry_cache_refresh(cache, info_path, objects_path, is_official = false, official_id = "", folder_name = "", fallback_name = "")
{
	var source_key = info_path + "|" + objects_path + "|" + game_save_id + "|" + string(global.file) + "|" + string(global.difficulty);
	if (cache.source_key != source_key || current_time - cache.refreshed_at >= 1000)
	{
		cache.model = scr_big_collectible_preview_load(info_path, objects_path, is_official, official_id, folder_name, fallback_name);
		cache.source_key = source_key;
		cache.refreshed_at = current_time;
	}
}

function scr_big_collectible_entry_has_rows(model)
{
	if (!is_struct(model) || !model.ready) return false;
	for (var tier = 0; tier <= 2; tier++) if (model.counts[tier] > 0 && model.unlocked[tier]) return true;
	return false;
}

function scr_big_collectible_entry_draw(cache, left, top, width, height, player = 1, icon_scale_limit = 0.5)
{
	var previous_alpha = draw_get_alpha();
	var layout = scr_big_collectible_selector_layout(cache.model, left, top, width, height, cache.state.scroll, icon_scale_limit);
	draw_set_alpha(0.75);
	draw_roundrect_color_ext(left - 8, top - 4, layout.right + 8, layout.footer_bottom + 4, 16, 16, c_black, c_black, false);
	draw_set_alpha(previous_alpha);
	scr_big_collectible_selector_draw(cache.state, cache.model, left, top, width, height, 1, player, -1, icon_scale_limit);
}
