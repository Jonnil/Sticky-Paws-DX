enter_blink = (enter_blink + 1) % 61;

if (clear_rate == "enter")
{
	image_alpha = 1;
	level_color = (enter_blink > room_speed / 4) ? c_red : c_white;
}
else if (clear_rate == "clear")
{
	image_alpha = 1;
	if (big_collectible1 && big_collectible2 && big_collectible3 && big_collectible4 && big_collectible5)
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