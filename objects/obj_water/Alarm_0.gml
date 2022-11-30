if (breathable_water == true)
{
	image_alpha = 0.25;
}
else
{
	image_alpha = 0.5;
}

image_xscale = (x - second_x - 32) / 32;
image_yscale = (y - second_y - 32) / 32;

x = (x + second_x) / 2;
y = (y + second_y) / 2;