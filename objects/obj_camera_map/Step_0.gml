scr_set_screen_size();

scr_zoom_camera_controls();

x = lerp(x, xx, 0.1);
y = lerp(y, yy, 0.1);
	
#region /* World Map Camera */
if (asset_get_type("obj_player_map") == asset_object)
and (instance_exists(obj_player_map))
{
	xx = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).x;
	yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).y;
}
#endregion /* World Map Camera END */
