function scr_draw_cursor_tongue()
{
	
	#region /* Tongue aim should always be above everything, it represents the mouse cursor */
	if (allow_tongue == true)
	{
		if (can_tongue == true) /* If you're able to use the tongue */
		and (climb == false)
		and (horizontal_rope_climb == false)
		{
			draw_set_alpha(1); /* Don't make the cursor transparent */
		}
		else /* If you're not able to use the tongue */
		{
			draw_set_alpha(0.5); /* Make the cursor transparent when you can't use your tongue */
		}
		
		var cx = mouse_x;
		var cy = mouse_y;
		
		draw_text(cx, cy, string(mouse_x) + " " + string(mouse_y));
		
		#region /* Draw aim cursor with lines */
		draw_line_width_color(cx - 10, cy, cx - 2, cy, 2, c_red, c_red);
		draw_line_width_color(cx + 2, cy, cx + 10, cy, 2, c_red, c_red);
		draw_line_width_color(cx, cy - 10, cx, cy - 2, 2, c_red, c_red);
		draw_line_width_color(cx, cy + 2, cx, cy + 10, 2, c_red, c_red);
		draw_set_alpha(1);
		#endregion /* Draw aim cursor with lines END */
		
	}
	#endregion /* Tongue aim should always be above everything, it represents the mouse cursor END */
	
}