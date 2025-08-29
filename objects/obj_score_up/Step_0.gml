if (time < 5)
{
	y = lerp(y, ystart + 5, 0.1);
	image_xscale = lerp(image_xscale, 2, 0.15);
	image_yscale = lerp(image_yscale, 2, 0.15);
}
else
{
	y = lerp(y, ystart - 32, 0.1);
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = lerp(image_yscale, 1, 0.1);
}
time++;
if (time > 120)
{
	image_alpha = lerp(image_alpha, 0, 0.1);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
