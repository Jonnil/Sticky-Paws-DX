if (asset_get_type("obj_level") == asset_object)
&& (instance_exists(obj_level))
&& (instance_nearest(x, y, obj_level).clear_rate = "clear")
{
	instance_destroy();
}