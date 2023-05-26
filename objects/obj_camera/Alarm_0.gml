sprite_lives_icon = scr_initialize_custom_character_select_sprite("lives_icon", sprite_lives_icon, camera_player, camera_selected_skin);

if (global.create_level_from_template)
{
	global.create_level_from_template = 2;
}

if (instance_exists(obj_player_map))
{
	x = obj_player_map.x;
	y = obj_player_map.y;
	xx = obj_player_map.x;
	yy = obj_player_map.y;
}
else
{
	xx = x;
	yy = y;
}

#region /* Set big collectible numbers for every big collectible */
for(big_collectible = 0;big_collectible < instance_number(obj_big_collectible_number) + 1;big_collectible += 1)
{
	if (instance_number(obj_big_collectible_number) >= big_collectible)
	{
		with (instance_nth_nearest(global.level_player_1_start_x, global.level_player_1_start_y, obj_big_collectible_number, big_collectible))
		{
			big_collectible = obj_camera.big_collectible;
		}
	}
}
#endregion /* Set big collectible numbers for every big collectible END */