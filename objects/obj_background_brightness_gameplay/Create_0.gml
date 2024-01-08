background_brightness_lerp = global.background_brightness_gameplay;

depth = +50;
if (instance_exists(obj_foreground1))
{
	depth = obj_foreground1.depth - 1; /* Always put the depth above obj_foreground1 */
}