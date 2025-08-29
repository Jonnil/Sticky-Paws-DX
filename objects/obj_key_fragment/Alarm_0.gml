#region /* Make sure the key fragment number object is actually underneath when this object spawns */
if (bounce_up)
&& (instance_exists(obj_key_fragment_number))
{
	with(instance_nearest(x, y, obj_key_fragment_number))
	{
		x = instance_nearest(x, y, obj_key_fragment).x;
		y = instance_nearest(x, y, obj_key_fragment).y;
	}
}
#endregion /* Make sure the key fragment number object is actually underneath when this object spawns END */
