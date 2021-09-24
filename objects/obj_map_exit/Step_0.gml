visible = false;
if (asset_get_type("obj_level") == asset_object)
and (instance_exists(obj_level))
and (instance_nearest(x,y,obj_level).clear_rate = "clear")
{
	instance_destroy();
}