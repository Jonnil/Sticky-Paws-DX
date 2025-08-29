#region /* When editing a level, make the foreground transparent */
if (!global.play_edited_level)
{
	image_alpha = 0.5;
}
else
{
	image_alpha = 1;
}
#endregion /* When editing a level, make the foreground transparent END */

#region /* Update Foreground 1.5 */
if (sprite_exists(global.custom_foreground1_5))
&& (global.enable_foreground_layer_1_5)
&& (!global.full_level_map_screenshot)
{
	draw_sprite_ext(global.custom_foreground1_5, image_index, x_offset, y_offset, 1, 1, 0, c_white, image_alpha);
}
#endregion /* Update Foreground 1.5 END */
