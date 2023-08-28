if (place_meeting(bbox_left - 8, y, obj_boss))
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
|| (place_meeting(bbox_right + 8, y, obj_boss))
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
{
	alarm[1] = 1; /* Break cardboard */
	break_cardboard_source_x = other.x;
	break_cardboard_source_speed = other.speed;
}