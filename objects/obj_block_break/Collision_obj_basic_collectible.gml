if (other.bounce_up == false)
{
	with(other)
	{
		bounce_up = true;
		image_speed = 1;
		motion_set(90, 5);
	}
}