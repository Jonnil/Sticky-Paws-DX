if (x < obj_camera.view_x_center + 980)
&& (x > obj_camera.view_x_center - 980)
&& (y < obj_camera.view_y_center + 980)
&& (y > obj_camera.view_y_center - 980)
{
	if (place_meeting(x - 1, y, obj_wall))
	&& (!place_meeting(x + 1, y, obj_wall))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, + 1, 1, 0, c_white, 1);
	}
	else
	if (place_meeting(x + 1, y, obj_wall))
	&& (!place_meeting(x - 1, y, obj_wall))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, - 1, 1, 0, c_white, 1);
	}
	else
	if (place_meeting(x + 1, y, obj_wall))
	&& (place_meeting(x - 1, y, obj_wall))
	&& (!place_meeting(x + 1, y, obj_spikes_emerge))
	&& (!place_meeting(x - 1, y, obj_spikes_emerge))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, + 1, 1, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, x, y, - 1, 1, 0, c_white, 1);
	}
}