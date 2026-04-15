function draw_menu_dropdown_item(string_text_item, x_position, y_position, variable_to_change, item_number, menu_index = "", default_option_text = "", dropdown_layout = undefined)
{
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var item_height = 36;
	var item_scale_y = 1;
	var item_text_scale = max(global.default_text_size * 1.125, 0.9);
	var item_badge_scale = max(global.default_text_size * 0.5, 0.42);

	if (dropdown_layout != undefined)
	{
		item_height = dropdown_layout.item_height;
		item_scale_y = dropdown_layout.item_scale_y;
		item_text_scale = dropdown_layout.item_text_scale;
		item_badge_scale = dropdown_layout.item_badge_scale;
	}

	var item_top = y_position + (item_height * item_number);
	var item_bottom = item_top + item_height;
	var item_center_y = item_top + (item_height * 0.5);
	var item_width = sprite_get_width(spr_menu_dropdown_item);
	var item_hovered = point_in_rectangle(mouse_get_x, mouse_get_y, x_position, item_top, x_position + item_width, item_bottom)
		&& (global.controls_used_for_navigation == "mouse");

	#region /* Show Item */
	if (string_text_item > "")
	{
		if (item_hovered)
		{
			if (variable_to_change == item_number)
			{
				draw_sprite_ext(spr_menu_dropdown_item, 1, x_position, item_center_y, 1, item_scale_y, 0, c_lime, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_dropdown_item, 0, x_position, item_center_y, 1, item_scale_y, 0, c_lime, 1);
			}
		}
		else
		{
			if (variable_to_change == item_number)
			{
				draw_sprite_ext(spr_menu_dropdown_item, 1, x_position, item_center_y, 1, item_scale_y, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_menu_dropdown_item, 0, x_position, item_center_y, 1, item_scale_y, 0, c_white, 1);
			}
		}
		#region /* Text inside the menu button */
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		scr_draw_text_outlined(x_position + (item_width * 0.5), item_center_y, string(string_text_item), item_text_scale, c_white, c_black, 1);
		#endregion /* Text inside the menu button END */

		if (default_option_text != ""
		&& string(string_text_item) == string(default_option_text))
		{
			var badge_text = l10n_text("Default");
			var badge_scale = item_badge_scale;
			var badge_width = max(58, (string_width(badge_text) * badge_scale) + 18);
			var badge_left = x_position + item_width - badge_width - 12;
			var badge_top = item_top + 6;
			draw_menu_default_badge(badge_left, badge_top, badge_text, badge_scale, badge_width);
		}

	}
	#endregion /* Show Item END */

	return(variable_to_change);
}
