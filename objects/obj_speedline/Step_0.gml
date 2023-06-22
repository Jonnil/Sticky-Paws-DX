image_alpha -= 0.02;
if (sprite_index == spr_speedline)
{
	image_xscale -= 0.02;
	image_yscale -= 0.02;
}
if (image_alpha < 0)
{
	instance_destroy();
}