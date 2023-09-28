function scr_draw_level_editor_placable_object(var_selected_object, var_place_object_id, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_scroll_x, var_scale, var_rotation, var_color, var_scroll_y = 0, var_x_offset = 0, alpha_offset = 1, add_order_index = 1, object_description = "")
{
	var y_offset = 128;
	if (unlocked_object[var_place_object_id] >= true)
	{
		if (selected_object == var_selected_object)
		{
			place_object = var_place_object_id; /* The Object ID, as example this enum: LEVEL_OBJECT_ID.id_wall */
			can_make_place_brush_size_bigger = var_can_make_place_brush_size_bigger;
			sprite_index = var_sprite_index; /* This changes the obj_leveleditor sprite, so you see it underneath the cursor */
			mask_index = var_mask_index; /* This changes the obj_leveleditor mask. Object mask when placing it, so it doesn't get placed over other objects */
			
			var var_scale_modify = 1.25;
			current_object_description = object_description;
		}
		else
		{
			var var_scale_modify = 1;
		}
		draw_sprite_ext(var_sprite_index, 0, (display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object + var_x_offset, y_offset + var_scroll_y, var_scale * var_scale_modify, var_scale * var_scale_modify, var_rotation, var_color, selected_menu_alpha * alpha_offset);
		if (unlocked_object[var_place_object_id] == 1)
		&& (global.show_new_items_notification)
		{
			scr_draw_text_outlined((display_get_gui_width() * 0.5) + selected_object_menu_x + var_scroll_x * var_selected_object, y_offset, l10n_text("New"), global.default_text_size + scr_wave(-0.1, 0, 1, 0), c_white, c_red, selected_menu_alpha * alpha_offset);
		}
		order_index += add_order_index; /* Add to this variable after each "scr draw level editor placable object" so whenever you add more objects to the list of placable objects, you don't have to change these numbers manually*/
	}
}