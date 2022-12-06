depth = -10000;
image_speed = 0;
image_index = 0;
image_alpha = 0;
x = window_get_width() / 2;
y = window_get_height() / 2;
end_credits = false;
time = 0;
yy = window_get_height();
alpha = 0;
black_background_alpha = 0;
skip = 0;

iris_xscale = 32;
iris_yscale = 32;
iris_zoom = 0;
menu = "";
menu_delay = 0;
menu_cursor_index = 0;

#region /* Show Title Logo first during credits */
if (global.title_logo_index > noone)
{
	sprite_index = global.title_logo_index;
}
else
{
	sprite_index = spr_noone;
}
#endregion /* Show Title Logo first during credits END */