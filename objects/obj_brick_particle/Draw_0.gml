depth = -100;

#region /* Set the gravity */
gravity_direction = 270;
gravity = 0.5;
#endregion /* Set the gravity END */

#region /* Destroy outside view */
if (x < camera_get_view_x(view_camera[view_current]) - sprite_width)
or(x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + sprite_width)
or(y < camera_get_view_y(view_camera[view_current]) - sprite_height)
or(y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + sprite_height)
{
	instance_destroy();
}
#endregion /* Destroy outside view END */

if (hspeed < 0)
{
	image_angle += 10;
}
if (hspeed > 0)
{
	image_angle -= 10;
}

draw_sprite_ext(sprite_index, image_index, x, y, 0.5, 0.5, image_angle, image_blend, image_alpha);

mask_index = noone;