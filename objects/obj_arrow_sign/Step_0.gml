image_angle = point_direction(x, y, second_x, second_y);

y = lerp(y, yy, 0.01);
time += 1;
if (time > 0)
and (time < 100)
{
	yy = ystart - 16;
}
if (time > 100)
and (time < 200)
{
	yy = ystart + 16;
}
if (time > 200)
{
	time = 0;
}
if (global.assist_normal_arrows = true)
{
	visible = true;
}
else
{
	visible = false;
}