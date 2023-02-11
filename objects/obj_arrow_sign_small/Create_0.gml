depth = 11;
yy = y;
time = 0;
second_x = x;
second_y = y;

if (asset_get_type("spr_arrow_sign_small") == asset_sprite)
{
	sprite_index = spr_arrow_sign_small;
}
else
{
	image_blend = c_blue;
}
image_xscale = 0.5;
image_yscale = 0.5;

alarm_set(0, 1);