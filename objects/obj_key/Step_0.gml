if (follow_player != noone)
&& (instance_exists(follow_player))
{
	if (follow_player.hspeed < 0)
	{
		xx = follow_player.x + 32;
	}
	else
	if (follow_player.hspeed > 0)
	{
		xx = follow_player.x - 32;
	}
	yy = follow_player.y;
	
	x = lerp(x, xx, 0.1);
	y = lerp(y, yy, 0.1);
}