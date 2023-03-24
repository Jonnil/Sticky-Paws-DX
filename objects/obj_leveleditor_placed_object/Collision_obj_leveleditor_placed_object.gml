if (global.actually_play_edited_level == false)
{
	if (id > other.id)
	and (drag_object == false)
	and (other.drag_object == false)
	and (other.object == object)
	and (other.x == x)
	and (other.y == y)
	and (position_meeting(x, y, other))
	{
		with(other)
		{
			instance_destroy();
		}
	}
}