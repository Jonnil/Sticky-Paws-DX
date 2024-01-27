scr_set_character_folder(camera_player, camera_selected_skin);
sprite_lives_icon = scr_initialize_character_sprite("lives_icon", sprite_lives_icon);

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