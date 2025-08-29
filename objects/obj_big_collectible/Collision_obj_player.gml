if (!bounce_up)
{
	if (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
	&& (!collision_line(x, y, other.x, other.y, obj_semisolid_platform, false, true))
	{
		follow_player = true;
	}
}

if (follow_player)
&& (other.horizontal_rope_climb
|| other.climb
|| other.midair_jumps_left >= other.number_of_jumps)
{
	collect_big_collectible = true; /* Collect big collectible when player is in certain states */
}
