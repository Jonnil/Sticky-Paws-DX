#region /*Set screen size*/
//camera_set_view_border(view_camera[view_current], camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current])); /*View Border*/

camera_set_view_border(view_camera[view_current], 1920, 1080); /*View Border*/

//if (window_get_width()<=1920)
//and(window_get_height()<=1080)
//{
//	camera_set_view_size(view_camera[view_current], window_get_width(), window_get_height());
//}
//else
//if (window_get_width()>1920)
//and(window_get_width()<=1080)
//{
//	camera_set_view_size(view_camera[view_current], 1920, window_get_height());
//}
//else
//if (window_get_width()<=1920)
//and(window_get_height()>1080)
//{
//	camera_set_view_size(view_camera[view_current], window_get_width(), 1080);
//}
//else
//{
	camera_set_view_size(view_camera[view_current], 1920, 1080);
//}

if (asset_get_type("obj_leveleditor")==asset_object)
and(!instance_exists(obj_leveleditor))
{
	camera_set_view_target(view_camera[view_current], self);
}
display_set_gui_size(window_get_width(), window_get_height());
#endregion /*Set screen size END*/

#region /*Pause Screenshot*/
if (global.pause_screenshot > noone)
{
	draw_sprite_ext(global.pause_screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
}
#endregion /*Pause Screenshot END*/

#region /*Darker Background*/
draw_set_alpha(0.5);
draw_rectangle_color(0, 0, room_width, room_height, c_red, c_blue, c_blue, c_red, false);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
#endregion /*Darker Background End*/