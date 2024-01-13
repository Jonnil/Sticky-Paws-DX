function scr_draw_cursor_tongue(cursor_x = x, cursor_y = y, what_player_object = obj_camera.player1)
{
	if (instance_exists(obj_camera))
	&& (instance_exists(what_player_object))
	&& (what_player_object.allow_tongue)
	{
		if (what_player_object.can_tongue) /* If you're able to use the tongue */
		&& (what_player_object.climb == false)
		&& (what_player_object.!horizontal_rope_climb)
		{
			draw_set_alpha(1); /* Don't make the cursor transparent */
		}
		else /* If you're not able to use the tongue */
		{
			draw_set_alpha(0.5); /* Make the cursor transparent when you can't use your tongue */
		}
		
		#region /* Clamp mouse cursor so it's always within view */
		cursor_x = clamp(cursor_x, camera_get_view_x(obj_camera.camera), camera_get_view_x(obj_camera.camera) + camera_get_view_width(obj_camera.camera));
		cursor_y = clamp(cursor_y, camera_get_view_y(obj_camera.camera), camera_get_view_y(obj_camera.camera) + camera_get_view_height(obj_camera.camera));
		#endregion /* Clamp mouse cursor so it's always within view END */
		
		#region /* Draw aim cursor with lines */
		draw_line_width_color(cursor_x - 10, cursor_y, cursor_x - 2, cursor_y, 2, c_red, c_red);
		draw_line_width_color(cursor_x + 2, cursor_y, cursor_x + 10, cursor_y, 2, c_red, c_red);
		draw_line_width_color(cursor_x, cursor_y - 10, cursor_x, cursor_y - 2, 2, c_red, c_red);
		draw_line_width_color(cursor_x, cursor_y + 2, cursor_x, cursor_y + 10, 2, c_red, c_red);
		draw_set_alpha(1);
		#endregion /* Draw aim cursor with lines END */
		
	}
	
}