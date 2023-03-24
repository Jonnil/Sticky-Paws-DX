if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(camera_get_view_x(view_camera[0]), y - 16, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_blue, c_blue, c_blue, c_blue, false);
	draw_set_alpha(1);
	if (asset_get_type("spr_level_height") == asset_sprite)
	{
		draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_blue, 1);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y + 32, l10n_text("Water Height") + " : " + string(bbox_top), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */