raycast_info = noone;

raycast_length = 200;
raycast_per_pixel = 16;

angle = 90;

if (instance_exists(obj_player))
{
	follow_x = obj_player.x;
	follow_y = obj_player.y;
}
else
{
	follow_x = x;
	follow_y = y;
}
