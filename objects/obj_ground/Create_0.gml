depth = 12;
tile = 0;

look_outward = 17;
same_object = obj_ground;

ground_surface = 0;
/*
0 = default
1 = dirt
2 = glass
3 = grass
4 = gravel
5 = metal
6 = stone
7 = wood*/

image_speed=0;

if (y <= 0)
and (!instance_place(x, y-1, obj_ground))
{
	instance_create_depth(x, y-32, 0, obj_wall);
}

alarm_set(0, 1);