if (place_meeting(x, bbox_bottom + 8, obj_enemy))
&& (other.vspeed < 0)
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
{
	break_cardboard = true;
	break_cardboard_source_x = other.x;
	break_cardboard_source_speed = other.speed;
}