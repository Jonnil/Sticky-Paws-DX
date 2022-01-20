draw_self();
if(instance_position(x, y+64, obj_wall))
or (instance_position(x, y + 32, obj_wall))
or (instance_position(x, y + 16, obj_wall))
{
	active = false;
}
else
{
	active = true;
}