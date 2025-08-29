if (clear_rate != "closed")
&& (instance_exists(obj_player_map))
&& (obj_player_map.move_delay >= 3)
&& (obj_player_map.x != x || obj_player_map.y != y)
{
	obj_player_map.move_delay = 0;
	obj_player_map.can_enter_level = 0;
	obj_player_map.x = x;
	obj_player_map.y = y;
}
