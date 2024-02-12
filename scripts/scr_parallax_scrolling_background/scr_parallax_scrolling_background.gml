function scr_parallax_scrolling_background()
{
	/* Have this script in End Step, so that the background scrolling can keep up with a moving camera */
	
	#region /* Parallax Scrolling Background */
	for (var i = 1; i <= 4; i++) {
		var layer_name = "Background_" + string(i);
	    var layer_id = layer_get_id(layer_name);
	    var x_parallax = custom_background_x_parallax[i];
	    var y_parallax = custom_background_y_parallax[i];
	    var x_offset = custom_background_x_offset[i];
	    var y_offset = custom_background_y_offset[i];
	    layer_x(layer_id, camera_get_view_x(view_camera[view_current]) / x_parallax + x_offset);
	    layer_y(layer_id, camera_get_view_y(view_camera[view_current]) / y_parallax + y_offset);
	}
	#endregion /* Parallax Scrolling Background END */
	
}