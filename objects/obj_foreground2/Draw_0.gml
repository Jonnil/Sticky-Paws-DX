#region /* Update Foreground1 */
if (sprite_exists(global.custom_foreground2))
&& (global.enable_foreground_layer2)
&& (global.full_level_map_screenshot == false)
{
	draw_sprite_ext(global.custom_foreground2, image_index, x_offset, y_offset, 1, 1, 0, c_white, image_alpha);
}
#endregion /* Update Foreground1 END */