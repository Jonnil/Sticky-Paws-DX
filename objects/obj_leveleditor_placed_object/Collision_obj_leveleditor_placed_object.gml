//if (drag_object == 0.5)
if (other.drag_object == false)
and (other.object == object)
{
	with(other)
	{
		instance_destroy();
	}
}