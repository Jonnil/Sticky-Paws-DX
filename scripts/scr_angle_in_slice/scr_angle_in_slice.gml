function scr_angle_in_slice(_angle, _center, _half_width)
{
	/* Returns true if _angle is within _half_width degrees of _center */
	/* Uses angle_difference so 359° correctly matches 0° */

	return abs(angle_difference(_angle, _center)) <= _half_width;
}