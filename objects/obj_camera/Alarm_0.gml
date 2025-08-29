scr_set_character_folder(camera_player, camera_selected_skin);
ini_open(string(character_folder) + "/data/sprite_origin_point.ini");
sprite_lives_icon = scr_initialize_character_sprite("lives_icon", sprite_lives_icon);
ini_close(); /* Don't commit the save data on Switch, this is only temporary! */

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
