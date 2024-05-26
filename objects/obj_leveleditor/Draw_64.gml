if (!global.actually_play_edited_level)
&& (!global.play_edited_level)
{
	
	if (quit_level_editor == 0)
	{
		
		#region /* Show a pause button on screen when using the mouse */
		if (!pause && !in_modify_object_menu && global.controls_used_for_navigation == "mouse")
		{
			pause_button_y = display_get_gui_height() - 64 - 42 + icon_at_bottom_y;
			draw_menu_button_sprite(spr_menu_button, display_get_gui_width() - 185, pause_button_y,,, 0.5, 1, 185, 42, l10n_text("Pause"), "pause", "pause");
		}
		#endregion /* Show a pause button on screen when using the mouse END */
		
		scr_draw_list_of_placable_objects(); /* List of Placable Objects */
		
		/* Draw a cursor in the center of the screen, so level designer can visually see where the center of the screen is */
		if (!modify_object_menu)
		{
			draw_circle_color(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 3, c_black, c_white, false);
		}
		
		if (selected_menu_alpha < 0.1)
		{
			
			#region /* At top of screen, show part limit */
			if (global.part_limit >= 4000)
			{
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1));
			}
			else
			{
				global.part_limit_text_alpha = lerp(global.part_limit_text_alpha, 0, 0.05);
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_white, global.part_limit_text_alpha);
			}
			#endregion /* At top of screen, show part limit END */
			
			#region /* At top of screen, show entity limit */
			if (global.part_limit_entity >= 100)
			{
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1));
			}
			else
			{
				global.part_limit_entity_text_alpha = lerp(global.part_limit_entity_text_alpha, 0, 0.05);
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_white, global.part_limit_entity_text_alpha);
			}
			#endregion /* At top of screen, show entity limit END */
			
		}
		else
		{
			global.part_limit_text_alpha = 0;
			global.part_limit_entity_text_alpha = 0;
		}
		
		if (erase_mode)
		{
			var width = 10;
			draw_set_alpha(0.5);
			draw_rectangle_color(0, width + 1, width, get_window_height - (width + 1), c_blue, c_blue, c_blue, c_blue, false); /* Left */
			draw_rectangle_color(get_window_width - width, 0, get_window_width + width, get_window_height - (width + 1), c_blue, c_blue, c_blue, c_blue, false); /* Right */
			draw_rectangle_color(0, 0, get_window_width - (width + 1), width, c_blue, c_blue, c_blue, c_blue, false); /* Top */
			draw_rectangle_color(0, get_window_height - width, display_get_gui_width(), display_get_gui_height(), c_blue, c_blue, c_blue, c_blue, false); /* Bottom */
			draw_set_alpha(1);
		}
		
		scr_draw_level_editor_pause_menu(); /* Draw Level Editor Pause Menu */
		
		scr_draw_all_level_editor_icon(); /* Draw All Level Editor Icons */
		
		#region /* Show Tooltip when hovering over icon, this code needs to be after the show icon code so it appears above the icon */
		if (global.controls_used_for_navigation == "mouse")
		&& (show_tooltip >= 50)
		{
			draw_roundrect_color_ext(cursor_x + 18, cursor_y - 18, cursor_x + 242, cursor_y + 18, 50, 50, c_black, c_black, false);
			draw_roundrect_color_ext(cursor_x + 16, cursor_y - 16, cursor_x + 240, cursor_y + 16, 50, 50, c_white, c_white, false);
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(cursor_x + 24, cursor_y, string(tooltip), global.default_text_size, c_white, c_black, 1);
		}
		if (show_tooltip > 50)
		{
			show_tooltip = 50;
		}
		if (!show_icon_at_bottom)
		|| (mouse_check_button(mb_any))
		|| (keyboard_check(vk_anykey))
		{
			show_tooltip = 0;
		}
		#endregion /* Show Tooltip when hovering over icon, this code needs to be after the show icon code so it appears above the icon END */
		
		#region /* Click icon at top of screen */
		
		#region /* Object Categories Icons */
		var icon_object_category_terrain_x = display_get_gui_width() * 0.5 - 64 - 64;
		var icon_object_category_decoration_x = display_get_gui_width() * 0.5 - 64;
		var icon_object_category_item_x = display_get_gui_width() * 0.5;
		var icon_object_category_enemy_x = display_get_gui_width() * 0.5 + 64;
		var icon_object_category_gizmo_x = display_get_gui_width() * 0.5 + 64 + 64;
		
		var icon_object_category_daily_build_standard_x = display_get_gui_width() * 0.5 - 32;
		var icon_object_category_daily_build_featured_x = display_get_gui_width() * 0.5 + 32;
		
		var category_title = "";
		
		if (!if_daily_build)
		{
			if (current_object_category == "terrain")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 0, icon_object_category_terrain_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icon_object_category_terrain_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Terrain");
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 0, icon_object_category_terrain_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icon_object_category_terrain_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
			if (current_object_category == "decoration")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 0, icon_object_category_decoration_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_arrow_sign, 0, icon_object_category_decoration_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Decoration");
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 0, icon_object_category_decoration_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(spr_arrow_sign, 0, icon_object_category_decoration_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
			if (current_object_category == "item")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 1, icon_object_category_item_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 1, icon_object_category_item_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Item");
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 1, icon_object_category_item_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 1, icon_object_category_item_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
			if (current_object_category == "enemy")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 2, icon_object_category_enemy_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(global.resource_pack_sprite_basic_enemy, 2, icon_object_category_enemy_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Enemy");
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 2, icon_object_category_enemy_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(global.resource_pack_sprite_basic_enemy, 2, icon_object_category_enemy_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
			if (current_object_category == "gizmo")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_gizmo_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_spring, 3, icon_object_category_gizmo_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Gizmo");
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_gizmo_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(spr_spring, 3, icon_object_category_gizmo_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
		}
		
		if (if_daily_build)
		{
			if (current_object_category == "daily_build_standard")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_daily_build_standard_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icon_object_category_daily_build_standard_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				var category_title = l10n_text("Standard");
				draw_set_halign(fa_left);
				scr_draw_text_outlined(10, 10, l10n_text("These items are always unlocked"), global.default_text_size * 0.7, c_black, c_white, selected_menu_alpha);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_daily_build_standard_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icon_object_category_daily_build_standard_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
			}
			if (current_object_category == "daily_build_featured")
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_daily_build_featured_x, 32 + icon_at_top_y, 1, 1, 0, c_white, 1);
				draw_sprite_ext(spr_icon_featured, 0, icon_object_category_daily_build_featured_x, 32 + icon_at_top_y, 0.75, 0.75, 0, c_white, 1);
				var category_title = l10n_text("Featured");
				draw_set_halign(fa_left);
				scr_draw_text_outlined(10, 10, l10n_text("These are the featured items for today"), global.default_text_size * 0.7, c_black, c_white, selected_menu_alpha);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icon_empty, 3, icon_object_category_daily_build_featured_x, 32 + icon_at_top_y, 1, 1, 0, c_gray, 1);
				draw_sprite_ext(spr_icon_featured, 0, icon_object_category_daily_build_featured_x, 32 + icon_at_top_y, 0.75, 0.75, 0, c_gray, 1);
			}
		}
		
		if (selected_menu_alpha > 0)
		{
			draw_set_halign(fa_right);
			scr_draw_text_outlined(icon_object_category_terrain_x - 42, 32, string(category_title), global.default_text_size, c_black, c_white, selected_menu_alpha);
		}
		
		#region /* Navigate Category Icons */
		if (!if_daily_build)
		{
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_terrain_x - 32 + 1, icon_at_top_y, icon_object_category_terrain_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "terrain")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_terrain_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_terrain_x - 32, icon_at_top_y, icon_object_category_terrain_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "terrain")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "terrain";
					level_editor_menu = "select_object_menu";
				}
			}
			else
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_decoration_x - 32 + 1, icon_at_top_y, icon_object_category_decoration_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "decoration")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_decoration_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_decoration_x - 32, icon_at_top_y, icon_object_category_decoration_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "decoration")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "decoration";
					level_editor_menu = "select_object_menu";
				}
			}
			else
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_item_x - 32 + 1, icon_at_top_y, icon_object_category_item_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "item")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_item_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_item_x - 32, icon_at_top_y, icon_object_category_item_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "item")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "item";
					level_editor_menu = "select_object_menu";
				}
			}
			else
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_enemy_x - 32 + 1, icon_at_top_y, icon_object_category_enemy_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "enemy")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_enemy_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_enemy_x - 32, icon_at_top_y, icon_object_category_enemy_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "enemy")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "enemy";
					level_editor_menu = "select_object_menu";
				}
			}
			else
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_gizmo_x - 32 + 1, icon_at_top_y, icon_object_category_gizmo_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "gizmo")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_gizmo_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_gizmo_x - 32, icon_at_top_y, icon_object_category_gizmo_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "gizmo")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "gizmo";
					level_editor_menu = "select_object_menu";
				}
			}
		}
		else
		if (if_daily_build)
		{
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_daily_build_standard_x - 32 + 1, icon_at_top_y, icon_object_category_daily_build_standard_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "daily_build_standard")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_daily_build_standard_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_daily_build_standard_x - 32, icon_at_top_y, icon_object_category_daily_build_standard_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "daily_build_standard")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "daily_build_standard";
					level_editor_menu = "select_object_menu";
				}
			}
			else
			if (global.controls_used_for_navigation == "mouse")
			&& (point_in_rectangle(cursor_x, cursor_y, icon_object_category_daily_build_featured_x - 32 + 1, icon_at_top_y, icon_object_category_daily_build_featured_x + 32, + 64 + icon_at_top_y))
			|| (level_editor_menu == "daily_build_featured")
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, icon_object_category_daily_build_featured_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
				draw_set_alpha(0.5);
				draw_rectangle_color(icon_object_category_daily_build_featured_x - 32, icon_at_top_y, icon_object_category_daily_build_featured_x + 32, 64 + icon_at_top_y, c_white, c_white, c_white, c_white, false);
				draw_set_alpha(1);
				if (global.controls_used_for_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "daily_build_featured")
				&& (key_a_pressed)
				{
					menu_delay = 3;
					show_selected_menu = true;
					current_object_category = "daily_build_featured";
					level_editor_menu = "select_object_menu";
				}
			}
		}
		#endregion /* Navigate Category Icons END */
		
		#endregion /* Object Categories Icons END */
		
		#region /* Click Toggle Grid */
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, - 64 + 1, grid_button_x + 32, + 64))
		&& (show_icon_at_top)
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (level_editor_menu == "grid")
		{
			tooltip = "Toggle Grid";
			show_tooltip += 2;
			
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, grid_button_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(grid_button_x - 32, - 64, grid_button_x + 32, + 64, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			
			if (mouse_check_button_pressed(mb_left))
			|| (level_editor_menu == "grid")
			&& (key_a_pressed)
			{
				show_grid = !show_grid;
			}
		}
		#endregion /* Click Toggle Grid END */
		
		#region /* Click Zoom Out */
		if (keyboard_check(global.player_[inp.key][1][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][1][1][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][2][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][2][1][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][3][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][3][1][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][4][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][4][1][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][1][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][1][2][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][2][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][2][2][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][3][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][3][2][action.zoom_in]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][4][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][4][2][action.zoom_in]))
		{
			zoom_out = true;
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, zoom_out_button_x - 32 + 1, - 64, zoom_out_button_x + 32, + 64))
		&& (show_icon_at_top)
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (level_editor_menu == "zoom_out")
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			tooltip = "Zoom Out";
			show_tooltip += 2;
			
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, zoom_out_button_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(zoom_out_button_x - 32, - 64, zoom_out_button_x + 32, + 64, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			
			if (mouse_check_button(mb_left))
			|| (level_editor_menu == "zoom_out")
			&& (key_a_hold)
			{
				zoom_out = true;
			}
			else
			{
				zoom_out = false;
			}
		}
		else
		{
			zoom_out = false;
		}
		#endregion /* Click Zoom Out END */
		
		#region /* Click Reset Zoom */
		if (keyboard_check(vk_control))
		&& (keyboard_check(vk_enter))
		&& (!keyboard_check(187))
		&& (!keyboard_check(189))
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			zoom_reset = true
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, zoom_reset_button_x - 32 + 1, - 64, zoom_reset_button_x + 32, + 64))
		&& (show_icon_at_top)
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (level_editor_menu == "zoom_reset")
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			tooltip = "Reset Zoom";
			show_tooltip += 2;
			
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, zoom_reset_button_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(zoom_reset_button_x - 32, - 64, zoom_reset_button_x + 32, + 64, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			
			if (keyboard_check(vk_control))
			&& (keyboard_check(vk_enter))
			&& (!keyboard_check(187))
			&& (!keyboard_check(189))
			|| (mouse_check_button(mb_left))
			|| (level_editor_menu == "zoom_reset")
			&& (key_a_hold)
			{
				zoom_reset = true
			}
			else
			{
				zoom_reset = false;
			}
		}
		else
		{
			zoom_reset = false;
		}
		#endregion /* Click Reset Zoom END */
		
		#region /* Click Zoom In */
		if (keyboard_check(global.player_[inp.key][1][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][1][1][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][2][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][2][1][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][3][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][3][1][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][4][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][4][1][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][1][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][1][2][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][2][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][2][2][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][3][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][3][2][action.zoom_out]))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (keyboard_check(global.player_[inp.key][4][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][4][2][action.zoom_out]))
		{
			zoom_in = true;
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, zoom_in_button_x - 32 + 1, - 64, zoom_in_button_x + 32, + 64))
		&& (show_icon_at_top)
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (level_editor_menu == "zoom_in")
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			tooltip = "Zoom In";
			show_tooltip += 2;
			
			draw_sprite_ext(spr_menu_cursor, menu_cursor_index, zoom_in_button_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
			draw_set_alpha(0.5);
			draw_rectangle_color(zoom_in_button_x - 32, - 64, zoom_in_button_x + 32, + 64, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			
			if (mouse_check_button(mb_left))
			|| (level_editor_menu == "zoom_in")
			&& (key_a_hold)
			{
				zoom_in = true;
			}
			else
			{
				zoom_in = false;
			}
		}
		else
		{
			zoom_in = false;
		}
		#endregion /* Click Zoom In END */
		
		#region /* Click Help Button */
		if (global.first_time_opened_level_editor) /* When you have created a new level, open the help menu */
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			welcome_to_level_editor = 1;
			level_editor_menu = "help_open";
		}
		else
		if (keyboard_check_pressed(ord("H")))
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			menu_delay = 3;
			welcome_to_level_editor = !welcome_to_level_editor;
			if (welcome_to_level_editor != 0)
			&& (level_editor_menu != "")
			{
				level_editor_menu = "help_open";
			}
			else
			if (level_editor_menu != "")
			{
				level_editor_menu = "help";
			}
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, help_button_x - 32 + 1, - 64, help_button_x + 32, + 64))
		&& (show_icon_at_top)
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (!modify_object_menu)
		|| (level_editor_menu == "help")
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (!modify_object_menu)
		&& (welcome_to_level_editor == 0)
		{
			modify_object_menu = false;
			tooltip = "Help";
			show_tooltip += 2;
			
			if (welcome_to_level_editor == 0)
			{
				draw_sprite_ext(spr_menu_cursor, menu_cursor_index, help_button_x, icon_at_top_y + 80, 1, 1, 90, c_white, 1);
			}
			draw_set_alpha(0.5);
			draw_rectangle_color(help_button_x - 32, - 64, help_button_x + 32, + 64, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			
			if (mouse_check_button_pressed(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (level_editor_menu == "help")
			&& (key_a_pressed)
			&& (welcome_to_level_editor == 0)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				level_editor_menu = "help_open";
				welcome_to_level_editor = !welcome_to_level_editor;
			}
		}
		#endregion /* Click Help Button END */
		
		#endregion /* Click icon at top of screen END */
		
		#region /* Autosave Warning Text */
		draw_set_halign(fa_center);
		var autosave_text = "";
		var autosave_text_color = c_white;
		if (autosave_timer < (60 * 3))
		{
			var autosave_text_color = c_lime;
			autosave_text = l10n_text("Autosaved!"); /* After game has autosaved, tell player that the autosave was successful */
		}
		else
		if (autosave_timer >= 18000 - 1)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			autosave_text = l10n_text("Autosaving..."); /* Game will probably stutter when autosaving, so display text that the game is currently autosaving */
		}
		else
		if (autosave_timer > 18000 - (60 * 10)) /* Warn player that there will be a autosave by counting down from 10 */
		{
			var autosave_countdown = ceil((autosave_timer - 18000) / -60);
			autosave_text = l10n_text("Autosave in " + string(autosave_countdown));
		}
		if (autosave_text != "")
		{
			draw_set_alpha(0.75);
			draw_roundrect_color_ext(display_get_gui_width() * 0.5 - 300, 50, display_get_gui_width() * 0.5 + 300, 200, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, string(autosave_text), global.default_text_size * 2, c_black, autosave_text_color, 1);
			var autosave_countdown = ceil((autosave_timer - 18000) / -60);
			if (autosave_text == l10n_text("Autosave in " + string(autosave_countdown)))
			{
				if (global.controls_used_for_navigation == "gamepad")
				|| (global.always_show_gamepad_buttons)
				{
					scr_draw_gamepad_buttons(gp_start, display_get_gui_width() * 0.5 - 16 - (string_width(l10n_text("Cancel Autosave")) * 0.5), 164, 0.6, c_white, 1, 1, 1, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, vk_escape, display_get_gui_width() * 0.5 - 16 - (string_width(l10n_text("Cancel Autosave")) * 0.5), 164, 0.6, 0.6, 0, c_white, 1);
				}
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 164, ": " + l10n_text("Cancel Autosave"), global.default_text_size, c_black, autosave_text_color, 1);
				if (keyboard_check_pressed(vk_escape))
				|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
				{
					pause = false;
					autosave_timer = 60 * 3 + 1;
				}
			}
		}
		#endregion /* Autosave Warning Text END */
		
		scr_draw_welcome_to_level_editor_menu(); /* Welcome to Level Editor screen */
		
		#region /* Object Specific Help */
		/* At the bottom of the screen, you can view help for specific objects that you have currently selected */
		if (object_help_description != "")
		|| (welcome_to_level_editor > 0)
		&& (object_help_description != "")
		{
			if (welcome_to_level_editor > 0)
			{
				object_help_description_alpha = 1;
			}
			else
			{
				object_help_description_alpha = clamp(selected_menu_alpha, 0, 1);
			}
			draw_set_alpha(object_help_description_alpha * 0.9);
			draw_roundrect_color_ext(display_get_gui_width() * 0.5 - (string_width(object_help_description) * 0.43), display_get_gui_height() - 34 - string_height(l10n_text(object_help_description)), display_get_gui_width() * 0.5 + (string_width(object_help_description) * 0.43), display_get_gui_height() - 4, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 28 - string_height(l10n_text(object_help_description)), l10n_text(current_object_name) + ":", global.default_text_size * 0.9, c_black, c_white, object_help_description_alpha);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - string_height(l10n_text(object_help_description)), l10n_text(object_help_description), global.default_text_size, c_black, c_white, object_help_description_alpha);
			draw_set_valign(fa_middle);
		}
		#endregion /* Object Specific Help END */
		
		if (global.controls_used_for_navigation != "gamepad")
		&& (!navigate_camera_with_arrowkeys)
		&& (!modify_object_menu)
		{
			scr_draw_mouse_cursor_sprite();
		}
	}
}

if (menu == "caution_online_back")
|| (menu == "caution_online_do_not_show")
|| (menu == "caution_online_proceed")
|| (menu == "caution_online_network_service_unavailable")
{
	scr_draw_caution_online();
}
if (menu == "upload_rules_back")
|| (menu == "upload_rules_do_not_show")
|| (menu == "upload_rules")
{
	scr_draw_upload_rules();
}

scr_draw_darken_screen_when_window_is_unfocused();

if (pause)
|| (in_modify_object_menu)
{
	scr_draw_cursor_mouse();
}

scr_debug_screen();