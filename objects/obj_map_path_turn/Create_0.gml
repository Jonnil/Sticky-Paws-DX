depth = -2;
delay = 0;
turn = 0;
/*
right down = 0
up right = 1
up left = 2
left down = 3
*/

if (image_angle = 90)
|| (image_angle = -270)
{
	image_angle    = 90;
	turn = 1;
}

if (image_angle = 180)
|| (image_angle = -180)
{
	image_angle    = 180;
	turn = 2;
}

if (image_angle = 270)
|| (image_angle = -90)
{
	image_angle    = 270;
	turn = 3;
}
