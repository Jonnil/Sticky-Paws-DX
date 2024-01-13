if (other.invincible_timer > 0)
&& (!assist_invincible)
{
	invincible_timer = other.invincible_timer;
}

if (global.players_can_collide)
{
	if (hspeed < 0)
	&& (other.hspeed > 0)
	{
		hspeed = 0;
		x ++;
		other.hspeed = 0;
		other.x --;
	}
	else
	if (hspeed > 0)
	&& (other.hspeed < 0)
	{
		hspeed = 0;
		x --;
		other.hspeed = 0;
		other.x ++;
	}
	else
	if (other.hspeed <> 0)
	&& (hspeed == 0)
	&& (!place_meeting(x - 1, y, obj_wall))
	&& (!place_meeting(x + 1, y, obj_wall))
	{
		hspeed = 0;
		x += other.hspeed;
	}
	if (hspeed <- 1)
	{
		hspeed = - 1;
	}
	else
	if (hspeed > +1)
	{
		hspeed = +1;
	}
}

#region /* Interaction with other players */
if (!in_water)
{
			
	#region /* Jump on other players heads */
	if (position_meeting(x, bbox_bottom + 1, other))
	&& (!place_meeting(x, y - 1, obj_wall))
	&& (vspeed > 0)
	&& (ground_pound == 0)
	&& (!stick_to_wall)
	{
		ground_pound = false;
		dive = false;
		midair_jumps_left = number_of_jumps;
		draw_xscale = 0.75;
		draw_yscale = 1.5;
		if (key_jump_hold)
		{
			vspeed = -higher_jump_height;
		}
		else
		{
			vspeed = -8;
		}
		with(other)
		{
			draw_xscale = 1.5;
			draw_yscale = 0.75;
		}
	}
	#endregion /* Jump on other players heads END */
	
}
#endregion /* Interaction with other players END */