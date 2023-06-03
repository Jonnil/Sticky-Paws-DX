if (global.actually_play_edited_level == false)
{
	if (id > other.id)
	&& (drag_object == false)
	&& (other.drag_object == false)
	&& (other.object == object)
	&& (other.x == x)
	&& (other.y == y)
	&& (position_meeting(x, y, other))
	{
		with(other)
		{
			instance_destroy();
		}
	}
}