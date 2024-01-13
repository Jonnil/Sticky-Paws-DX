if (!global.actually_play_edited_level)
{
	if (id > other.id)
	&& (!drag_object)
	&& (!other.drag_object)
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