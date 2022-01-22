if (other.invincible > 0)
and (assist_invincible = false)
{
	invincible =other.invincible;
}

if (global.players_can_collide = true)
{
	if (hspeed < 0)
	and (other.hspeed > 0)
	{
		hspeed = 0;
		x +=1;
		other.hspeed = 0;
		other.x-=1;
	}
	else
	if (hspeed > 0)
	and (other.hspeed < 0)
	{
		hspeed = 0;
		x-=1;
		other.hspeed = 0;
		other.x +=1;
	}
	else
	if (other.hspeed<>0)
	and (hspeed = 0)
	and (!place_meeting(x - 1, y, obj_wall))
	and (!place_meeting(x + 1, y, obj_wall))
	{
		hspeed = 0;
		x +=other.hspeed;
	}
	if (hspeed<-1)
	{
		hspeed =-1;
	}
	else
	if (hspeed > + 1)
	{
		hspeed = +1;
	}
}