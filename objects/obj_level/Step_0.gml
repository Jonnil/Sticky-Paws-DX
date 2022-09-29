enter_blink += 1;
if (enter_blink > 60)
{
	enter_blink = 0;
}

if (clear_rate = "enter")
{
	image_alpha = 1;
	if (enter_blink > room_speed / 4)
	{
		level_color = c_red;
	}
	else
	{
		level_color = c_white;
	}
}
else
if (clear_rate = "clear")
{
	image_alpha = 1;
	if (big_collectible1 = true)
	and (big_collectible2 = true)
	and (big_collectible3 = true)
	and (big_collectible4 = true)
	and (big_collectible5 = true)
	{
		level_color = c_yellow;
		level_perfect = true;
	}
	else
	{
		level_color = c_blue;
	}
}
else
{
	image_alpha = 0.1;
	level_color = c_black; /* Closed */
}