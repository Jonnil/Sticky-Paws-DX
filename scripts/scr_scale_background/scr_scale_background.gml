function scr_scale_background()
{
	
	#region /* Scale Background */
	layer_background_xscale(layer_background_get_id(layer_get_id("Background")), custom_background_1_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background")), custom_background_1_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_2")), custom_background_2_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_3")), custom_background_3_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_4")), custom_background_4_y_scale);
	#endregion /* Scale Background END */
	
}