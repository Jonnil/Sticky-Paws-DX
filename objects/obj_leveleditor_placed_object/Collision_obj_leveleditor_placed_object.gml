if (id > other.id)
and (drag_object == false)
and (other.drag_object == false)
and (other.object == object)
and (position_meeting(x, y, other))
{
	with(other)
	{
		instance_destroy();
	}
}