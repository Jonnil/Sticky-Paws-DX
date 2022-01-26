background_brightness_lerp = global.background_brightness_gameplay;

#region /*Create Foreground Layer 1*/
if (asset_get_type("obj_foreground1") == asset_object)
and (!instance_exists(obj_foreground1))
{
	instance_create_depth(0, 0, 0, obj_foreground1);
}
#region /*Create Foreground Layer 1 END*/

if (asset_get_type("obj_foreground1") == asset_object)
and (instance_exists(obj_foreground1))
{
	depth = obj_foreground1.depth - 1; /*Always put the depth above obj_foreground1*/
}