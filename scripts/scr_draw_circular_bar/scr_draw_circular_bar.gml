/// @desc scr_draw_circular_bar(x, y, value, max, colour, radius, transparency, width)
/// @arg x
/// @arg y
/// @arg value
/// @arg max
/// @arg colour
/// @arg radius
/// @arg transparency
/// @arg width

function scr_draw_circular_bar(xx, yy, value, max_value, colour = c_black, radius = 20, transparency = 0.8, width = 6)
{
	if (value > 0)
	{ /* no point even running if there is nothing to display, also stops /0 */
		var i, len, tx, ty, val;
		var numberofsections = 60; /* there is no draw_get_circle_precision() else I would use that here */
		var sizeofsection = 360 / numberofsections;
		val = (value / max_value) * numberofsections;
		if (val > 1)
		{ /* HTML5 version doesnt like triangle with only 2 sides */
			var piesurface = surface_create(radius * 2, radius * 2);
			draw_set_colour(colour);
			draw_set_alpha(transparency);
			surface_set_target(piesurface);
			draw_clear_alpha(c_blue, 0.7);
			draw_clear_alpha(c_black, 0);
			draw_primitive_begin(pr_trianglefan);
			draw_vertex(radius, radius);
			
			for(i = 0; i <= val; i ++)
			{
				len = (i * sizeofsection) +90; /* the 90 here is the starting angle */
				tx = lengthdir_x(radius, len);
				ty = lengthdir_y(radius, len);
				draw_vertex(radius + tx, radius + ty);
			}
			draw_primitive_end();
			draw_set_alpha(1);
			gpu_set_blendmode(bm_subtract);
			draw_set_colour(c_black);
			draw_circle(radius - 1, radius - 1, radius - width, false);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			draw_surface(piesurface, xx - radius, yy - radius);
			surface_free(piesurface);
		}
	}
}