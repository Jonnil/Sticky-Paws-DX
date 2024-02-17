if (!bounce_up) {
	if (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
	&& (!collision_line(x, y, other.x, other.y, obj_semisolid_platform, false, true)) {
		follow_player = true;
	}
}