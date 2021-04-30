depth = +9;
image_index = random(10);

#region /*If enemies are disabled, replace this object with ground object*/
if (global.enable_enemies=false)
{
	if (asset_get_type("obj_ground")==asset_object)
	{
		instance_change(obj_ground,true);
	}
}
#endregion /*If enemies are disabled, replace this object with ground object END*/