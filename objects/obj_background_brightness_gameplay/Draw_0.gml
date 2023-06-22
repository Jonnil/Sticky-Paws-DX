x = camera_get_view_x(view_camera[view_current]);
y = camera_get_view_y(view_camera[view_current]);

#region /* Background Brightness in Gameplay Options */
background_brightness_lerp = lerp(background_brightness_lerp, global.background_brightness_gameplay, 0.1);
if (background_brightness_lerp < 0)
{
	draw_set_alpha(abs(background_brightness_lerp));
	draw_rectangle_color(- 32, - 32, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
else
if (background_brightness_lerp > 0)
{
	draw_set_alpha(abs(background_brightness_lerp));
	draw_rectangle_color(- 32, - 32, room_width * 2, room_height * 2, c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}
#endregion /* Background Brightness in Gameplay Options END */