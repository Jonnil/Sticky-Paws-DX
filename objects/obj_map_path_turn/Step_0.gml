if (global.show_collision_mask = false)
{
	visible = false;
}
else
{
	visible = true;
}

if (delay > 0)
{
	delay -= 1;
}

if (image_angle = 90)
or (image_angle = -270)
{
	image_angle	= 90;
	turn = 1;
}

if (image_angle = 180)
or (image_angle = -180)
{
	image_angle	= 180;
	turn = 2;
}

if (image_angle = 270)
or (image_angle = -90)
{
	image_angle	= 270;
	turn = 3;
}