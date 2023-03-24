if (x < (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + sprite_width)
and (x > camera_get_view_x(view_camera[view_current]) - sprite_width)
and (y < (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + sprite_height)
and (y > camera_get_view_y(view_camera[view_current]) - sprite_height)
{
	draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);
}