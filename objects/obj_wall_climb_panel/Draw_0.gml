if (x > camera_get_view_x(view_camera[view_current]))
and (x < camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]))
and (y > camera_get_view_y(view_camera[view_current]))
and (y < camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current]))
{
	if (place_meeting(x-1, y, obj_wall))
	and (!place_meeting(x+1, y, obj_wall))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, +1, 1, 0, c_white, 1);
	}
	else
	if (place_meeting(x+1, y, obj_wall))
	and (!place_meeting(x-1, y, obj_wall))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, -1, 1, 0, c_white, 1);
	}
	else
	if (place_meeting(x+1, y, obj_wall))
	and (place_meeting(x-1, y, obj_wall))
	and (!place_meeting(x+1, y, obj_spikes_emerge))
	and (!place_meeting(x-1, y, obj_spikes_emerge))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, +1, 1, 0, c_white, 1);
		draw_sprite_ext(sprite_index, image_index, x, y, -1, 1, 0, c_white, 1);
	}
	else
	{
		instance_destroy();
	}
}