function scr_scale_background()
{
	
	#region /* Scale Background */
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_1")), custom_background1_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_1")), custom_background1_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_2")), custom_background2_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_2")), custom_background2_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_3")), custom_background3_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_3")), custom_background3_y_scale);
	layer_background_xscale(layer_background_get_id(layer_get_id("Background_4")), custom_background4_x_scale);
	layer_background_yscale(layer_background_get_id(layer_get_id("Background_4")), custom_background4_y_scale);
	#endregion /* Scale Background END */
	
}