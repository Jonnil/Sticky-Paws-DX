if (follow_player != noone)
&& (what_key >= 2)
&& (instance_number(obj_key_follow) >= 2)
&& (instance_exists(nearest_key))
{
	if (follow_player.hspeed < 0)
	|| (follow_player.image_xscale < 0)
	{
		xx = nearest_key.x + 30;
	}
	else
	if (follow_player.hspeed > 0)
	|| (follow_player.image_xscale > 0)
	{
		xx = nearest_key.x - 30;
	}
	yy = nearest_key.y;
	
	x = lerp(x, xx, 0.25);
	y = lerp(y, yy, 0.25);
}
else
if (follow_player != noone)
&& (instance_exists(follow_player))
{
	if (follow_player.hspeed < 0)
	|| (follow_player.image_xscale < 0)
	{
		xx = follow_player.x + 30;
	}
	else
	if (follow_player.hspeed > 0)
	|| (follow_player.image_xscale > 0)
	{
		xx = follow_player.x - 30;
	}
	yy = follow_player.y;
	
	x = lerp(x, xx, 0.25);
	y = lerp(y, yy, 0.25);
}
else
{
	instance_change(obj_key, true);
}