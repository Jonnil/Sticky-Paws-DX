function scr_initialize_camera()
{
	
	#region /* Resolution */
	#macro resolution_width 960
	#macro resolution_height 540
	#macro resolution_scale 1
	
	#macro camera_smooth 0.1
	#endregion /* Resolution END */
	
	#region /* Create camera */
	camera = camera_create_view(0, 0, resolution_width, resolution_height);
	
	view_set_camera(0, camera);
	#endregion /* Create camera END */
	
}