if (other.invincible_timer > 0)
&& (assist_invincible == false)
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