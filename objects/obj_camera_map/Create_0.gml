/*Seperate world map camera object from the normal level camera*/
/*Exclusively used on the world map*/
/*So no conflicting code from the normal camera is running*/

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

#region /*Smooth the camera out even more*/
view_wview_lerp = 0;
view_hview_lerp = 0;
#endregion /*Smooth the camera out even more END*/

zoom_lerp = global.zoom_world_map;
zoom_border_lerp = 0;
