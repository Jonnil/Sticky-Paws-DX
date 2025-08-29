if (place_meeting(x, y - 8, other))
{
	if (other.ground_pound >= 1)
	{
		scr_different_items_inside(bbox_top);
		instance_destroy();
	}
}
