function scr_zoom_camera_controls()
{
	/*This script uses draw functions so only use it in draw events*/
	var zoom_speed = 0.015;
	zoom_lerp = lerp(zoom_lerp, global.zoom, 0.1);
	global.zoom = clamp(global.zoom, 0.2, 1);
	camera_set_view_size(view_camera[view_current], camera_get_view_width(view_camera[view_current]) * zoom_lerp, camera_get_view_height(view_camera[view_current]) * zoom_lerp);
	
	if (keyboard_check(vk_add))
	and (!keyboard_check(vk_subtract))
	or (mouse_wheel_up())
	and (!mouse_wheel_down())
	{
		if (zoom_lerp > 0.2)
		{
			global.zoom -= zoom_speed;
			ini_open("config.ini");
			ini_write_real("config", "zoom", global.zoom);
			ini_close();
		}
		else
		{
			draw_rectangle_color (0, 0, camera_get_view_x(view_camera[view_current]) +1,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])-1, 0,room_width,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (0, 0,room_width,camera_get_view_y(view_camera[view_current]) +1,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current])-1,room_width,room_height,c_red,c_red,c_red,c_red,false);
		}
	}
	if (keyboard_check(vk_subtract))
	and (!keyboard_check(vk_add))
	or (mouse_wheel_down())
	and (!mouse_wheel_up())
	{
		if (zoom_lerp < 1)
		{
			global.zoom += zoom_speed;
			ini_open("config.ini");
			ini_write_real("config", "zoom", global.zoom);
			ini_close();
		}
		else
		{
			draw_rectangle_color (0, 0, camera_get_view_x(view_camera[view_current]) +8,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current])-8, 0,room_width,room_height,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (0, 0,room_width,camera_get_view_y(view_camera[view_current]) +8,c_red,c_red,c_red,c_red,false);
			draw_rectangle_color (0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current])-8,room_width,room_height,c_red,c_red,c_red,c_red,false);
		}
	}
}