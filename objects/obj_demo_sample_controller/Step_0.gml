x = follow_x;
y = follow_x;

if (instance_exists(obj_wall))
{
	raycast_info = raycast(x, y, angle, raycast_length, raycast_per_pixel, obj_wall);
}
