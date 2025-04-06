function scr_parallax_scrolling_background()
{
    /* Have this script in End Step, so that the background scrolling can keep up with a moving camera */
	
    var current_view_camera = view_camera[view_current];
    var view_x = camera_get_view_x(current_view_camera);
    var view_y = camera_get_view_y(current_view_camera);
	
    #region /* Parallax Scrolling Background */
    for (var i = 1; i <= 4; i++)
	{
        var layer_name = "Background_" + string(i);
        var layer_id = layer_get_id(layer_name);
        var x_parallax = custom_background_x_parallax[i];
        var y_parallax = custom_background_y_parallax[i];
        var x_offset = custom_background_x_offset[i];
        var y_offset = custom_background_y_offset[i];
		var layer_x_pos = view_x / x_parallax + x_offset;
		var layer_y_pos = view_y / y_parallax + y_offset;
		
        layer_x(layer_id, layer_x_pos);
        layer_y(layer_id, layer_y_pos);
    }
    #endregion /* Parallax Scrolling Background END */
	
}