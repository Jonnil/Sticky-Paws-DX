#region /* Touch Player */
if (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
&& (!bounce_up)
{
	collect_key_fragment = true;
}
#endregion /* Touch Player END */