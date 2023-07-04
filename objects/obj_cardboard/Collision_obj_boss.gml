if (place_meeting(bbox_left - 8, y, obj_boss))
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
|| (place_meeting(bbox_right + 8, y, obj_boss))
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
{
	break_cardboard = true;
	break_cardboard_source_x = other.x;
	break_cardboard_source_speed = other.speed;
}