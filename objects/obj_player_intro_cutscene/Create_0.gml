image_index = 0;
image_speed = 0;
cutscene_time = 0;
if (asset_get_type("obj_camera")==asset_object)
and (!instance_exists(obj_camera))
{
	instance_create_depth(x, y, 0, obj_camera);
}

walljump = false;
sticktowall = false;
climb = false;
spring = false;

#region /*If player object is present, destroy the player object*/
if (asset_get_type("obj_player")==asset_object)
and (instance_exists(obj_player))
{
	with(obj_player)
	{
		instance_destroy();
	}
}
#endregion /*If player object is present, destroy the player object END*/