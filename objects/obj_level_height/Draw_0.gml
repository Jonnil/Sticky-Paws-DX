#region /* Draw black rectangle outside level border */
if (!global.actually_play_edited_level)
&& (!global.play_edited_level)
{
	var cam_x = camera_get_view_x(view_get_camera(0));
	var cam_y = camera_get_view_y(view_get_camera(0));
	var cam_width = camera_get_view_width(view_get_camera(0));
	var cam_height = camera_get_view_height(view_get_camera(0));
	draw_set_alpha(0.75); /* Make the level border transparent */
	draw_rectangle_color(cam_x - 999, cam_y - 999, 0, cam_y + cam_height, c_black, c_black, c_black, c_black, false); /* Left Black Rectangle */
	draw_rectangle_color(1, cam_y - 999, cam_x + cam_width + 999, 0, c_black, c_black, c_black, c_black, false);  /* Top Black Rectangle */
	draw_rectangle_color(0, y - 16, obj_level_width.x - 16, cam_y + cam_height, c_black, c_black, c_black, c_black, false); /* Bottom Black Rectangle */
	draw_set_alpha(1);
}
#endregion /* Draw black rectangle outside level border END */

#region /* When dragging this object, show arrows telling player they can move this object in specific direction */
if (drag_object)
{
	draw_set_color(c_white);
	draw_arrow(x, y, x, y - scr_wave(32, 64, 1), 32);
	draw_arrow(x, y, x, y + scr_wave(32, 64, 1), 32);
}
#endregion /* When dragging this object, show arrows telling player they can move this object in specific direction END */

draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_white, 1);

if (!global.actually_play_edited_level)
&& (!global.play_edited_level)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x - 32, y, l10n_text("Height") + ": " + string(bbox_top), global.default_text_size, c_black, c_white, 1);
}
draw_set_halign(fa_center);
