if (instance_exists(obj_player_map))
{
	if (clear_rate != "closed")
	&& (obj_player_map.menu_delay == 0)
	{
		obj_player_map.menu_delay = 3;
		obj_player_map.can_enter_level = 0;
		obj_player_map.x = x;
		obj_player_map.y = y;
	}
}