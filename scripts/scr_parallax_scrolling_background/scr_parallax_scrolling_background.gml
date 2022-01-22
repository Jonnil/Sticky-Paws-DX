function scr_parallax_scrolling_background()
{
	
	#region /*Parallax Scrolling Background*/
	layer_x(layer_get_id("Background"),camera_get_view_x(view_camera[view_current])/custom_background_1_x_parallax + custom_background_1_x_offset);
	layer_y(layer_get_id("Background"),camera_get_view_y(view_camera[view_current])/custom_background_1_y_parallax + custom_background_1_y_offset);
	layer_x(layer_get_id("Background_2"),camera_get_view_x(view_camera[view_current])/custom_background_2_x_parallax + custom_background_2_x_offset);
	layer_y(layer_get_id("Background_2"),camera_get_view_y(view_camera[view_current])/custom_background_2_y_parallax + custom_background_2_y_offset);
	layer_x(layer_get_id("Background_3"),camera_get_view_x(view_camera[view_current])/custom_background_3_x_parallax + custom_background_3_x_offset);
	layer_y(layer_get_id("Background_3"),camera_get_view_y(view_camera[view_current])/custom_background_3_y_parallax + custom_background_3_y_offset);
	layer_x(layer_get_id("Background_4"),camera_get_view_x(view_camera[view_current])/custom_background_4_x_parallax + custom_background_4_x_offset);
	layer_y(layer_get_id("Background_4"),camera_get_view_y(view_camera[view_current])/custom_background_4_y_parallax + custom_background_4_y_offset);
	#endregion /*Parallax Scrolling Background END*/
	
}