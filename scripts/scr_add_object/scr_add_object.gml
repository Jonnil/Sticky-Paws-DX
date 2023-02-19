function add_object(var_place_object_id, var_sprite_index, var_subimage, var_mask_index, var_scale, var_rotation, var_color, var_alpha, var_text, var_content_icon, var_bigger_brush, var_scroll_pixel_offset)
{
	ds_grid_resize(global.object_grid, ds_grid_width(global.object_grid), ds_grid_height(global.object_grid) + 1);
	
	ds_grid_add(global.object_grid, 0, ds_grid_height(global.object_grid) - 1, var_place_object_id)
	ds_grid_add(global.object_grid, 1, ds_grid_height(global.object_grid) - 1, var_sprite_index)
	ds_grid_add(global.object_grid, 2, ds_grid_height(global.object_grid) - 1, var_subimage)
	ds_grid_add(global.object_grid, 3, ds_grid_height(global.object_grid) - 1, var_mask_index)
	ds_grid_add(global.object_grid, 4, ds_grid_height(global.object_grid) - 1, var_scale)
	ds_grid_add(global.object_grid, 5, ds_grid_height(global.object_grid) - 1, var_rotation)
	ds_grid_add(global.object_grid, 6, ds_grid_height(global.object_grid) - 1, var_color)
	ds_grid_add(global.object_grid, 7, ds_grid_height(global.object_grid) - 1, var_alpha)
	ds_grid_add(global.object_grid, 8, ds_grid_height(global.object_grid) - 1, var_text)
	ds_grid_add(global.object_grid, 9, ds_grid_height(global.object_grid) - 1, var_content_icon)
	ds_grid_add(global.object_grid, 10, ds_grid_height(global.object_grid) - 1, var_bigger_brush)
	ds_grid_add(global.object_grid, 11, ds_grid_height(global.object_grid) - 1, var_scroll_pixel_offset)
}