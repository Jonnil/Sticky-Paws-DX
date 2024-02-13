#region /* Path Turning */
/* 
right down = 0
up right = 1
up left = 2
left down = 3
 */

#region /* Touch Map Turn Right Down */
if (other.turn == 0) { /* Right Down = 0 */
	if (abs(hspeed) > 0 && other.delay == 0) {
		hspeed = 0;
		vspeed = + move_speed;
		x = other.x;
		y = other.y + move_speed;
		with(other) {
			delay = 5;
		}
	}
	else if (abs(vspeed) > 0 && other.delay == 0) {
		hspeed = + move_speed;
		vspeed = 0;
		x = other.x + move_speed;
		y = other.y;
		with(other) {
			delay = 5;
		}
	}
}
#endregion /* Touch Map Turn Right Down END */

else

#region /* Touch Map Turn Up Right */
if (other.turn == 1) { /* Up Right = 1 */
	if (abs(hspeed) > 0 && other.delay == 0) {
		hspeed = 0;
		vspeed = -move_speed;
		x = other.x;
		y = other.y - move_speed;
		with(other) {
			delay = 5;
		}
	}
	else if (abs(vspeed) > 0 && other.delay == 0) {
		hspeed = + move_speed;
		vspeed = 0;
		x = other.x + move_speed;
		y = other.y;
		with(other) {
			delay = 5;
		}
	}
}
#endregion /* Touch Map Turn Up Right END */

else

#region /* Touch Map Turn Up Left */
if (other.turn = 2) { /* Up Left = 2 */
	if (abs(hspeed) > 0 && other.delay == 0) {
		hspeed = 0;
		vspeed = -move_speed;
		x = other.x;
		y = other.y - move_speed;
		with(other) {
			delay = 5;
		}
	}
	else if (abs(vspeed) > 0 && other.delay == 0) {
		hspeed = - move_speed;
		vspeed = 0;
		x = other.x - move_speed;
		y = other.y;
		with(other) {
			delay = 5;
		}
	}
}
#endregion /* Touch Map Turn Up Left END */

else

#region /* Touch Map Turn Left Down */
if (other.turn = 3) { /* Left Down = 3 */
	if (abs(hspeed) > 0 && other.delay == 0) {
		hspeed = 0;
		vspeed = + move_speed;
		x = other.x;
		y = other.y + move_speed;
		with(other) {
			delay = 5;
		}
	}
	else if (abs(vspeed) > 0 && other.delay == 0) {
		hspeed = - move_speed;
		vspeed = 0;
		x = other.x - move_speed;
		y = other.y;
		with(other) {
			delay = 5;
		}
	}
}
#endregion /* Touch Map Turn Left Down END */

#endregion /* Path Turning END */