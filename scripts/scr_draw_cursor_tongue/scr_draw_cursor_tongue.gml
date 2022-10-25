function scr_draw_cursor_tongue(cursor_x = x, cursor_y = y, what_player_object = obj_camera.player1)
{
	
	#region /* Tongue aim should always be above everything, it represents the mouse cursor */
	depth = -99999;
	if (instance_exists(obj_camera))
	and (instance_exists(what_player_object))
	and (what_player_object.allow_tongue == true)
	{
		if (what_player_object.can_tongue == true) /* If you're able to use the tongue */
		and (what_player_object.climb == false)
		and (what_player_object.horizontal_rope_climb == false)
		{
			draw_set_alpha(1); /* Don't make the cursor transparent */
		}
		else /* If you're not able to use the tongue */
		{
			draw_set_alpha(0.5); /* Make the cursor transparent when you can't use your tongue */
		}
		
		#region /* Draw aim cursor with lines */
		draw_line_width_color(cursor_x - 10, cursor_y, cursor_x - 2, cursor_y, 2, c_red, c_red);
		draw_line_width_color(cursor_x + 2, cursor_y, cursor_x + 10, cursor_y, 2, c_red, c_red);
		draw_line_width_color(cursor_x, cursor_y - 10, cursor_x, cursor_y - 2, 2, c_red, c_red);
		draw_line_width_color(cursor_x, cursor_y + 2, cursor_x, cursor_y + 10, 2, c_red, c_red);
		draw_set_alpha(1);
		#endregion /* Draw aim cursor with lines END */
		
	}
	#endregion /* Tongue aim should always be above everything, it represents the mouse cursor END */
	
}