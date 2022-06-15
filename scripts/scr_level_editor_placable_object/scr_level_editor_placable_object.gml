/// @desc scr_level_editor_placable_object(var_selected_object, var_place_object, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_x, var_scale, var_rotation, var_color)
/// @arg var_selected_object
/// @arg var_place_object
/// @arg var_can_make_place_brush_size_bigger
/// @arg var_sprite_index
/// @arg var_mask_index
/// @arg var_x
/// @arg var_scale
/// @arg var_rotation
/// @arg var_color

function scr_level_editor_placable_object(var_selected_object, var_place_object, var_can_make_place_brush_size_bigger, var_sprite_index, var_mask_index, var_x, var_scale, var_rotation, var_color)
{
	if (selected_object = var_selected_object)
	{
		place_object = var_place_object;
		can_make_place_brush_size_bigger = var_can_make_place_brush_size_bigger;
		sprite_index = var_sprite_index;
		mask_index = var_mask_index;
	}
	draw_sprite_ext(var_sprite_index, 0,
	camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + selected_object_menu_x + var_x,
	camera_get_view_y(view_camera[view_current]) + 64, var_scale, var_scale, var_rotation, var_color, selected_menu_alpha);
}