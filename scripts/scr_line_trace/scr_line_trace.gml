function scr_line_trace( x_start, y_start, x_end, y_end, offset, object = obj_wall)
{
	
	var hit =
	{
		instance: instance_place(x_end, y_end, object),
		x_hit: x_end,
		y_hit: y_end
	}
	
	var length = point_distance( x_start, y_start, x_end, y_end);
	for(var i = 0; i < length; i += 1)
	{
		var x_current = lerp( x_start, x_end, scr_value_range_map( i, 0, length, 0, 1));
		var y_current = lerp( y_start, y_end, scr_value_range_map( i, 0, length, 0, 1));
		
		hit =
		{
			instance: instance_place(x_current, y_current, object),
			x_hit: lerp( x_start, x_end, scr_value_range_map( i-offset, 0, length, 0, 1)),
			y_hit: lerp( y_start, y_end, scr_value_range_map( i-offset, 0, length, 0, 1))
		}
		
		if (hit.instance != noone)
		{
			break;
		}
	}
	return (hit);
}