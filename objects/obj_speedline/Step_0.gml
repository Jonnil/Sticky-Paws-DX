image_alpha-= 0.02;
if (asset_get_type("spr_speedline") == asset_sprite)
and (sprite_index = spr_speedline)
{
	image_xscale-= 0.02;
	image_yscale-= 0.02;
}
if (image_alpha < 0)
{
	instance_destroy();
}