x = camera_get_view_x(view_camera[view_current]);
y = camera_get_view_y(view_camera[view_current]);

#region /* Background Brightness in Gameplay Options */
background_brightness_lerp = lerp(background_brightness_lerp, global.background_brightness_gameplay, 0.05);

if (background_brightness_lerp < 0)
{
	var color = c_black;
}
else
{
	var color = c_white;
}

draw_set_alpha(abs(background_brightness_lerp));
draw_rectangle_color(x - room_width, y - room_height, room_width + camera_get_view_width(view_camera[view_current]) + 32, room_height + camera_get_view_height(view_camera[view_current]) + 32, color, color, color, color, false);
draw_set_alpha(1);
#endregion /* Background Brightness in Gameplay Options END */