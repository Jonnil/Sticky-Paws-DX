image_angle = point_direction(x, y, angle_x, angle_y);

y = lerp(y, yy, 0.01);
time += 1;
if (time > 0)
and(time < 100)
{
	yy = ystart - 16;
}
if (time > 100)
and(time < 200)
{
	yy = ystart + 16;
}
if (time > 200)
{
	time = 0;
}
if (global.assist_guiding_arrows = 0)
or(global.assist_guiding_arrows = 1)
{
	visible = true;
}
else
{
	visible = false;
}