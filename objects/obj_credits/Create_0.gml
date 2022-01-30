depth = -10000;
image_speed = 0;
image_index = 0;
image_alpha = 0;
x = window_get_width()/ 2;
y = window_get_height()/ 2;
end_credits = false;
time = 0;
yy = window_get_height();
alpha = 0;
black_background_alpha = 0;
skip = 0;

iris_xscale = 32;
iris_yscale = 32;
iris_zoom = 0;
menu_delay = 0;

#region /*Change the logo to different designs during specific times and dates*/
if (current_month = 12)
{
	if (global.resourcepack_sprite_title_logo_christmas > noone)
	{
		sprite_index = global.resourcepack_sprite_title_logo_christmas;
	}
	else
	if (global.resourcepack_sprite_title_logo > noone)
	{
		sprite_index = global.resourcepack_sprite_title_logo;
	}
	else
	{
		sprite_index = spr_wall;
	}
}
else
{
	if (global.resourcepack_sprite_title_logo > noone)
	{
		sprite_index = global.resourcepack_sprite_title_logo;
	}
	else
	{
		sprite_index = spr_wall;
	}
}
#endregion /*Change the logo to different designs during specific times and dates END*/