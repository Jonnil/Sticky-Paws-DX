function scr_draw_level_editor_placable_object(var_selected_object, var_place_object_id, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_scroll_x, var_scale, var_rotation, var_color, var_scroll_y = 0, var_x_offset = 0, alpha_offset = 1, add_order_index = 1)
{
	if (unlocked_object[unlock_index] == true)
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
		}
		else
		{
			draw_sprite_ext(var_sprite_index, 0,
			camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + selected_object_menu_x + var_scroll_x * var_selected_object + var_x_offset,
			camera_get_view_y(view_camera[view_current]) + 64 + var_scroll_y, var_scale, var_scale, var_rotation, var_color, selected_menu_alpha * alpha_offset);
		}
		order_index += add_order_index; /* Add to this variable after each "scr draw level editor placable object" so whenever you add more objects to the list of placable objects, you don't have to change these numbers manually*/
	}
	unlock_index += add_order_index;
}