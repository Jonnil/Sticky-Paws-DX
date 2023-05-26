function scr_draw_level_editor_placable_object(var_selected_object, var_place_object_id, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_scroll_x, var_scale, var_rotation, var_color, var_scroll_y = 0, var_x_offset = 0, alpha_offset = 1, add_order_index = 1, object_description = "")
{
	//if (unlocked_object[unlock_index] >= true)
	if (unlocked_object[var_place_object_id] >= true)
	{
		if (selected_object == var_selected_object)
		{
			place_object = var_place_object_id; /* The Object ID, as example this enum: level_object_id.id_wall */
			can_make_place_brush_size_bigger = var_can_make_place_brush_size_bigger;
			sprite_index = var_sprite_index; /* This changes the obj_leveleditor sprite, so you see it underneath the cursor */
			mask_index = var_mask_index; /* This changes the obj_leveleditor mask. Object mask when placing it, so it doesn't get placed over other objects */
			
			draw_sprite_ext(var_sprite_index, 0,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + selected_object_menu_x + var_scroll_x * var_selected_object + var_x_offset,
			camera_get_view_y(view_camera[view_current]) + 64 + var_scroll_y, var_scale * 1.25, var_scale * 1.25, var_rotation, var_color, selected_menu_alpha * alpha_offset);
			draw_set_halign(fa_center);draw_set_valign(fa_middle);scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5, camera_get_view_y(view_camera[view_current]) + 114, l10n_text(object_description), global.default_text_size * 0.75, c_black, c_white, selected_menu_alpha);
		}
		else
		{
			draw_sprite_ext(var_sprite_index, 0,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + selected_object_menu_x + var_scroll_x * var_selected_object + var_x_offset,
			camera_get_view_y(view_camera[view_current]) + 64 + var_scroll_y, var_scale, var_scale, var_rotation, var_color, selected_menu_alpha * alpha_offset);
		}
		//if (unlocked_object[unlock_index])
		if (unlocked_object[var_place_object_id])
		and (global.show_new_items_notification)
		{
			draw_set_halign(fa_center);
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + selected_object_menu_x + var_scroll_x * var_selected_object,
			camera_get_view_y(view_camera[view_current]) + 64, l10n_text("New"), global.default_text_size + scr_wave(-0.3, -0.2, 1, 0), c_white, c_red, selected_menu_alpha * alpha_offset);
		}
		order_index += add_order_index; /* Add to this variable after each "scr draw level editor placable object" so whenever you add more objects to the list of placable objects, you don't have to change these numbers manually*/
	}
	//unlock_index += add_order_index;
}