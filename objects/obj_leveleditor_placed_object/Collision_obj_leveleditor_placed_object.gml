if (id > other.id)
and (other.drag_object == false)
and (other.object == object)
{
	with(other)
	{
		instance_destroy();
	}
}