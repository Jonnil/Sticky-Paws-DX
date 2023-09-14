if (global.actually_play_edited_level == false)
&& (global.play_edited_level == false)
{
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	var cam_width = camera_get_view_width(view_camera[0]);
	var cam_height = camera_get_view_height(view_camera[0]);
	draw_set_alpha(0.99);
	draw_rectangle_color(cam_x - 999, cam_y - 999, 0, cam_y + cam_height, c_black, c_black, c_black, c_black, false); /* Left Black Rectangle */
	draw_rectangle_color(1, cam_y - 999, cam_x + cam_width + 999, 0, c_black, c_black, c_black, c_black, false);  /* Top Black Rectangle */
	draw_rectangle_color(0, y - 16, obj_level_width.x - 16, cam_y + cam_height, c_black, c_black, c_black, c_black, false); /* Bottom Black Rectangle */
	draw_set_alpha(1);
	draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_white, 1);
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (y < 1080 + 16)
&& (global.actually_play_edited_level == false)
&& (global.play_edited_level == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y + 32, l10n_text("Height") + ": " + string(bbox_top), global.default_text_size, c_black, c_red, 1);
	scr_draw_text_outlined(x, y + 64, l10n_text("Warning! Level height shorter than normal"), global.default_text_size * 0.75, c_black, c_red, 1);
}
else
if (global.actually_play_edited_level == false)
&& (global.play_edited_level == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y + 32, l10n_text("Height") + ": " + string(bbox_top), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */