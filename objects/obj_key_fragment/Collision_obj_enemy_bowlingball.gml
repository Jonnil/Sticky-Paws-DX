#region /* Touch Enemy Bowlingball */
if (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
&& (!bounce_up)
{
	collect_key_fragment = true;
}
#endregion /* Touch Enemy Bowlingball END */
