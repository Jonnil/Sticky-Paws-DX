if (place_meeting(x, y, other))
and (drag_object == 0.5)
and (other.drag_object = false)
and (other.object = object)
{
	with(other)
	{
		instance_destroy();
	}
}