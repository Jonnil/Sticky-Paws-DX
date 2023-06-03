#region /* Path Turning */

/* 
right down = 0
up right = 1
up left = 2
left down = 3
 */

if (distance_to_point(other.x, other.y) < 3)
&& (delay == 0)
{
	
	#region /* Touch Map Turn Right Down */
	if (other.turn == 0) /* Right Down = 0 */
	{
		if (abs(hspeed) > 0)
		{
			hspeed = 0;
			vspeed = + move_speed;
			x = other.x;
			y = other.y;
		}
		else
		if (abs(vspeed) > 0)
		{
			hspeed = + move_speed;
			vspeed = 0;
			x = other.x;
			y = other.y;
		}
	}
	#endregion /* Touch Map Turn Right Down END */
	
	else
	
	#region /* Touch Map Turn Up Right */
	if (other.turn == 1) /* Up Right = 1 */
	{
		if (abs(hspeed) > 0)
		{
			hspeed = 0;
			vspeed = - move_speed;
			x = other.x;
			y = other.y;
		}
		else
		if (abs(vspeed) > 0)
		{
			hspeed = + move_speed;
			vspeed = 0;
			x = other.x;
			y = other.y;
		}
	}
	#endregion /* Touch Map Turn Up Right END */
	
	else
	
	#region /* Touch Map Turn Up Left */
	if (other.turn = 2) /* Up Left = 2 */
	{
		if (abs(hspeed) > 0)
		{
			hspeed = 0;
			vspeed = - move_speed;
			x = other.x;
			y = other.y;
		}
		else
		if (abs(vspeed) > 0)
		{
			hspeed = - move_speed;
			vspeed = 0;
			x = other.x;
			y = other.y;
		}
	}
	#endregion /* Touch Map Turn Up Left END */
	
	else
	
	#region /* Touch Map Turn Left Down */
	if (other.turn = 3) /* Left Down = 3 */
	{
		if (abs(hspeed) > 0)
		{
			hspeed = 0;
			vspeed = + move_speed;
			x = other.x;
			y = other.y;
		}
		else
		if (abs(vspeed) > 0)
		{
			hspeed = - move_speed;
			vspeed = 0;
			x = other.x;
			y = other.y;
		}
	}
	#endregion /* Touch Map Turn Left Down END */
	
	delay = 1;
}
#endregion /* Path Turning END */
