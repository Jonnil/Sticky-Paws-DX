sprite_lives_icon = scr_initialize_custom_character_select_sprite("lives_icon", sprite_lives_icon, camera_player, camera_selected_skin);

if (global.create_level_from_template = true)
{
	global.create_level_from_template = 2;
}

if (asset_get_type("obj_player_map") == asset_object)
and (instance_exists(obj_player_map))
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
