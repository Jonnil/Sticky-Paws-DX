function scr_value_range_map(input, in_lower, in_upper, out_lower, out_upper)
{
	/* Outputs the result of the conversion, according to the specified input range and output range */
	var return_value = (input - in_lower) * (out_upper - out_lower) / (in_upper - in_lower) + out_lower;
	return (return_value)
}