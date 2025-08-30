#region /* Don't go outside view boundary */
var view_x = camera_get_view_x(view_get_camera(view_current));
var view_y = camera_get_view_y(view_get_camera(view_current));
var view_width = camera_get_view_width(view_get_camera(view_current));
var view_height = camera_get_view_height(view_get_camera(view_current));
x = clamp(x, view_x, view_x + view_width);
y = clamp(y, view_y, view_y + view_height);
#endregion /* Don't go outside view boundary END */
