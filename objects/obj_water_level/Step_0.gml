if (breathable_water == true)
{
	image_alpha = 0.25;
}
else
{
	image_alpha = 0.5;
}

x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2;

if (water_level_change_speed == 0)
{
	if (y < water_level_change_new_y)
	{
		y += 1;
	}
	else
	if (y > water_level_change_new_y)
	{
		y -= 1;
	}
}
else
if (water_level_change_speed == 1)
{
	if (y < water_level_change_new_y)
	{
		y += 2;
	}
	else
	if (y > water_level_change_new_y)
	{
		y -= 2;
	}
}
else
if (water_level_change_speed = 2)
{
	if (y < water_level_change_new_y)
	{
		y += 4;
	}
	else
	if (y > water_level_change_new_y)
	{
		y -= 4;
	}
}

water_level_change_new_y_lerp = lerp(scr_wave(water_level_change_new_y_lerp, water_level_change_new_y_lerp -water_bob_distance, water_bob_speed, 0), y, 0.1);

image_xscale = room_width;
image_yscale = room_height;