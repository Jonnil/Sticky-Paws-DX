if (place_meeting(x, y + 1, obj_enemy))
&& (other.vspeed < 0)
&& (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
{
	alarm[1] = 1; /* Break cardboard */
	break_cardboard_source_x = other.x;
	break_cardboard_source_speed = other.speed;
}