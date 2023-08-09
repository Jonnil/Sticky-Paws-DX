function scr_parallax_scrolling_background()
{
	/* Have this script in End Step, so that the background scrolling can keep up with a moving camera */
	
	#region /* Parallax Scrolling Background */
	layer_x(layer_get_id("Background"), camera_get_view_x(view_camera[view_current]) / custom_background1_x_parallax + custom_background1_x_offset);
	layer_y(layer_get_id("Background"), camera_get_view_y(view_camera[view_current]) / custom_background1_y_parallax + custom_background1_y_offset);
	layer_x(layer_get_id("Background_2"), camera_get_view_x(view_camera[view_current]) / custom_background2_x_parallax + custom_background2_x_offset);
	layer_y(layer_get_id("Background_2"), camera_get_view_y(view_camera[view_current]) / custom_background2_y_parallax + custom_background2_y_offset);
	layer_x(layer_get_id("Background_3"), camera_get_view_x(view_camera[view_current]) / custom_background3_x_parallax + custom_background3_x_offset);
	layer_y(layer_get_id("Background_3"), camera_get_view_y(view_camera[view_current]) / custom_background3_y_parallax + custom_background3_y_offset);
	layer_x(layer_get_id("Background_4"), camera_get_view_x(view_camera[view_current]) / custom_background4_x_parallax + custom_background4_x_offset);
	layer_y(layer_get_id("Background_4"), camera_get_view_y(view_camera[view_current]) / custom_background4_y_parallax + custom_background4_y_offset);
	#endregion /* Parallax Scrolling Background END */
	
}