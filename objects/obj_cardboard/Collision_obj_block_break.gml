if (place_meeting(x, y, obj_block_break))
{
	break_cardboard = true;
	break_cardboard_source_x = other.x;
	break_cardboard_source_speed = instance_nearest(x, y, obj_player).speed;
}