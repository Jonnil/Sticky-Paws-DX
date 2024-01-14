if (other.invincible_timer > 0 && !assist_invincible) {
	invincible_timer = other.invincible_timer;
}

if (global.players_can_collide)
&& (y >= other.y) {
	if (hspeed < 0) /* If you are going left */
	&& (other.hspeed > 0) { /* And other is going right */
		hspeed = 0;
		x ++; /* Push yourself right */
		other.hspeed = 0;
		other.x --; /* Push other left */
	}
	else
	if (hspeed > 0) /* If you are going right */
	&& (other.hspeed < 0) { /* And other is going left */
		hspeed = 0;
		x --; /* Push yourself left*/
		other.hspeed = 0;
		other.x ++; /* Push other right */
	}
	else
	if (hspeed < 0) /* If you are going left */
	&& (other.hspeed == 0) { /* And other is standing still */
		if (hspeed < -0.1) {
			hspeed = -0.1;
		}
		other.x --;
	}
	else
	if (hspeed > 0) /* If you are going right */
	&& (other.hspeed == 0) { /* And other is standing still */
		if (hspeed > +0.1) {
			hspeed = +0.1;
		}
		other.x ++;
	}
	if (hspeed == 0) /* If you are standing still */
	&& (other.hspeed < 0) { /* And other is going left */
		if (other.hspeed < -0.1) {
			other.hspeed = -0.1;
		}
		x --;
	}
	else
	if (hspeed == 0) /* If you are standing still */
	&& (other.hspeed > 0) { /* And other is going right */
		if (other.hspeed > +0.1) {
			other.hspeed = +0.1;
		}
		x ++;
	}
	
	
	
	//else
	//if (hspeed == 0) /* If you are standing still */
	//&& (other.hspeed <> 0) /* And other is going either left or right */
	//&& (!place_meeting(x - 1, y, obj_wall))
	//&& (!place_meeting(x + 1, y, obj_wall))
	//{
	//	hspeed = 0;
	//	x += other.hspeed;
	//}
	//else
	//if (hspeed <> 0) /* If you are going either left or right */
	//&& (other.hspeed == 0) /* And other is standing still */
	//{
	//	if (hspeed < -0.1)
	//	{
	//		hspeed = -0.1;
	//	}
	//	else
	//	if (hspeed > +0.1)
	//	{
	//		hspeed = +0.1;
	//	}
	//}
}

#region /* Interaction with other players */
if (!in_water) {
	
	#region /* Jump on other players heads */
	if (place_meeting(x, y + 1, other))
	&& (!place_meeting(x, y - 1, obj_wall))
	&& (y < other.y - 1)
	&& (vspeed > 0)
	&& (ground_pound == 0)
	&& (!stick_to_wall) {
		ground_pound = false;
		dive = false;
		midair_jumps_left = number_of_jumps;
		draw_xscale = 0.75;
		draw_yscale = 1.5;
		if (key_jump_hold) {
			vspeed = -higher_jump_height;
		}
		else {
			vspeed = -8;
		}
		with(other) {
			draw_xscale = 1.5;
			draw_yscale = 0.75;
		}
	}
	#endregion /* Jump on other players heads END */
	
}
#endregion /* Interaction with other players END */