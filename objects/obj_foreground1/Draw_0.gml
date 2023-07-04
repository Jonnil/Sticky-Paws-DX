#region /* Update Foreground1 */
if (global.custom_foreground1 > noone)
&& (global.enable_foreground_layer1)
&& (global.full_level_map_screenshot == false)
{
	draw_sprite_ext(global.custom_foreground1, image_index, x_offset, y_offset, 1, 1, 0, c_white, image_alpha);
}
#endregion /* Update Foreground1 END */