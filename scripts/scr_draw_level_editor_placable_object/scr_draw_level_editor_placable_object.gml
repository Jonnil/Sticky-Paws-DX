function scr_draw_level_editor_placable_object(var_selected_object, var_place_object_id, var_can_make_place_size_bigger, var_sprite_index, var_mask_index, var_scroll_x, var_scale, var_rotation, var_color, var_scroll_y = 0, var_x_offset = 0, alpha_offset = 1, add_order_index = 1, object_name = "", object_description = "", var_image_index = 0)
{
	var half_gui_width = display_get_gui_width() * 0.5;
	var menu_x_offset = selected_object_menu_x + var_scroll_x * var_selected_object;
	var draw_x = half_gui_width + menu_x_offset + var_x_offset;
	var is_selected = (selected_object == var_selected_object);
	
	if (unlocked_object[var_place_object_id] >= true) {
		if (draw_x > 0 && draw_x < display_get_gui_width()) /* Additional check to ensure that the graphics are within the display width */
		{
			var var_scale_modify = is_selected ? 1.25 : 1;
			if (is_selected) {
				current_object_name = object_name;
				object_help_description = object_description;
				can_make_place_size_bigger = var_can_make_place_size_bigger;
				sprite_index = var_sprite_index;
				place_object = var_place_object_id; /* Set the currently selected object ID */
			}
			var y_offset = 128;
			var hover_offset = 49;
			
			/* Hover mouse over object icon and click to select */
			if (global.controls_used_for_navigation == "mouse" &&
			point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), draw_x - hover_offset, y_offset - hover_offset, draw_x + hover_offset, y_offset + hover_offset))
			{
				draw_set_alpha(selected_menu_alpha * scr_wave(0.25, 0.5, 1));
				var wave = scr_wave(0, 3, 2);
				draw_roundrect_color_ext(draw_x - hover_offset - wave, y_offset - hover_offset - wave, draw_x + hover_offset + wave, y_offset + hover_offset + wave, 50, 50, c_white, c_white, false);
				draw_set_alpha(1);
				if (mouse_check_button_pressed(mb_left)) {
					selected_object = var_selected_object;
					selected_object_menu_actual_x = var_selected_object * -100;
				}
			}
			draw_sprite_ext(var_sprite_index, var_image_index, draw_x, y_offset + var_scroll_y, var_scale * var_scale_modify, var_scale * var_scale_modify, var_rotation, var_color, selected_menu_alpha * alpha_offset);
			
			/* If you have recently unlocked a new object, indicate that to the player */
			if (unlocked_object[var_place_object_id] == 1 && global.show_new_items_notification) {
				draw_circle_color(half_gui_width + menu_x_offset + 16, y_offset - 16, 3 + scr_wave(0, 3, 1, 0), c_red, c_red, false);
			}
		}
		order_index += add_order_index;
	}
}