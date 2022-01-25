background_brightness_lerp = global.background_brightness_gameplay;
if (asset_get_type("obj_foreground1") == asset_object)
and (instance_exists(obj_foreground1))
{
	depth = obj_foreground1.depth - 1; /*Always put the depth above obj_foreground1*/
}