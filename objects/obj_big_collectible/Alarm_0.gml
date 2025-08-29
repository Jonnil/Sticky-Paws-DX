#region /* Make sure the big collectible number object is actually underneath when this object spawns */
if (bounce_up)
&& (instance_exists(obj_big_collectible_number))
{
	with(instance_nearest(x, y, obj_big_collectible_number))
	{
		x = instance_nearest(x, y, obj_big_collectible).x;
		y = instance_nearest(x, y, obj_big_collectible).y;
	}
}
#endregion /* Make sure the big collectible number object is actually underneath when this object spawns END */
