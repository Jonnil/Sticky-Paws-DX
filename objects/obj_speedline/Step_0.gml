image_alpha-=0.02;
image_xscale-=0.02;
image_yscale-=0.02;
if (image_alpha<0)
or (image_xscale<0)
{
	instance_destroy();
}