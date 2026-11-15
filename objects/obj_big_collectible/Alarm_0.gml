/* A direct source reference keeps overlapping tier placements independent. */
if (instance_exists(big_collectible_marker))
{
	big_collectible = big_collectible_marker.big_collectible;
	big_collectible_legacy_slot = big_collectible_marker.big_collectible_legacy_slot;
	if (bounce_up)
	{
		big_collectible_marker.x = x;
		big_collectible_marker.y = y;
	}
}
