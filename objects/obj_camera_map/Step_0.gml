scr_set_screen_size();

scr_zoom_camera_controls();

x = lerp(x, xx, 0.1);
y = lerp(y, yy, 0.1);

#region /* Make sure player map is always present on the map screen */
instance_activate_object(obj_player_map);
instance_activate_object(obj_background_brightness_gameplay);
if (!instance_exists(obj_player_map))
{
	instance_create_depth(x, y, 0, obj_player_map);
}
#endregion /* Make sure player map is always present on the map screen END */

#region /* Delete camera if there happens to be more than 1 camera. Only run this code after creating player map */
if (instance_number(obj_camera_map) > 1)
{
	instance_destroy();
}
#endregion /* Delete camera if there happens to be more than 1 camera. Only run this code after creating player map END */

#region /* World Map Camera */
if (asset_get_type("obj_player_map") == asset_object)
&& (instance_exists(obj_player_map))
{
	xx = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).x;
	yy = instance_nearest(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]), y, obj_player_map).y;
}
#endregion /* World Map Camera END */
