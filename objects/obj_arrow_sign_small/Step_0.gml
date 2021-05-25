image_angle = point_direction(x, y, angle_x, angle_y);

y = lerp(y, yy, 0.001);
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

if (global.assist_enable = true)
and (global.assist_guiding_arrows = true)
{
	visible = true;
}
else
{
	visible = false;
}