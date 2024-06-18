function scr_draw_level_editor_placable_object(v_selected_object, v_place_object_id, v_can_make_place_size_bigger, v_sprite_index, v_mask_index, v_scroll_x, v_scale, v_rotation, v_color, v_scroll_y = 0, v_x_offset = 0, alpha_offset = 1, add_order_index = 1, object_name = "", object_description = "", v_image_index = 0)
{
	var half_gui_width = display_get_gui_width() * 0.5;
	var menu_x_offset = select_object_menu_x + v_scroll_x * v_selected_object;
	var draw_x = half_gui_width + menu_x_offset + v_x_offset;
	var is_selected = (selected_object == v_selected_object);
	
	if (unlocked_object[v_place_object_id] >= true)
	{
		if (draw_x > 0 && draw_x < display_get_gui_width() || (initialize_recent_object_selected)) /* Additional check to ensure that the graphics are within the display width */
		{
			var v_scale_modify = is_selected ? 1.25 : 1;
			if (is_selected)
			{
				current_object_name = object_name;
				object_help_description = object_description;
				can_make_place_size_bigger = v_can_make_place_size_bigger;
				sprite_index = v_sprite_index;
				mask_index = v_mask_index;
				place_object = v_place_object_id; /* Set the currently selected object ID */
				initialize_recent_object_selected = false;
			}
			var y_offset = 128;
			var hover_offset = 49;
			
			/* Hover mouse over object icon and click to select */
			if (global.controls_used_for_navigation == "mouse" &&
			point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (half_gui_width + menu_x_offset) - hover_offset, y_offset - hover_offset, (half_gui_width + menu_x_offset) + hover_offset, y_offset + hover_offset))
			{
				draw_set_alpha(selected_menu_alpha * scr_wave(0.25, 0.5, 1));
				var wave = scr_wave(0, 3, 2);
				draw_roundrect_color_ext((half_gui_width + menu_x_offset) - hover_offset - wave, y_offset - hover_offset - wave, (half_gui_width + menu_x_offset) + hover_offset + wave, y_offset + hover_offset + wave, 50, 50, c_white, c_white, false);
				if (mouse_check_button_pressed(mb_left))
				{
					selected_object = v_selected_object;
					select_object_menu_actual_x = v_selected_object * -100;
				}
			}
			draw_set_alpha(selected_menu_alpha * alpha_offset);
			draw_sprite_ext(v_sprite_index, v_image_index, draw_x, y_offset + v_scroll_y, v_scale * v_scale_modify, v_scale * v_scale_modify, v_rotation, v_color, selected_menu_alpha * alpha_offset);
			
			if (object_text != "")
			{
				scr_draw_text_outlined(draw_x, y_offset + v_scroll_y, string(object_text), global.default_text_size * v_scale * v_scale_modify, c_white, c_black, selected_menu_alpha * alpha_offset);
			}
			
			/* If you have recently unlocked a new object, indicate that to the player */
			if (unlocked_object[v_place_object_id] == 1 && global.show_new_items_notification)
			{
				draw_circle_color(half_gui_width + menu_x_offset + 16, y_offset - 16, 3 + scr_wave(0, 3, 1, 0), c_red, c_red, false);
			}
			
			if (is_selected)
			&& (object_video_tutorial != "")
			{
				draw_menu_button(0, 0, l10n_text("Watch Tutorial") + " - " + (current_object_name), "watch_video_tutorial", "watch_video_tutorial_click",,selected_menu_alpha);
				draw_sprite_ext(global.resource_pack_sprite_logo_youtube, 0, 24, 20, 0.25, 0.25, 0, c_white, selected_menu_alpha);
				draw_set_halign(fa_left);
				scr_draw_text_outlined(10, 58, string(object_video_tutorial), global.default_text_size * 0.5, c_black, c_white, selected_menu_alpha);
				draw_set_halign(fa_center);
				if (menu == "watch_video_tutorial_click")
				{
					url_open(object_video_tutorial);
					menu = "watch_video_tutorial";
					menu_delay = 3;
				}
			}
		}
		order_index += add_order_index;
	}
}