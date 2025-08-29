depth = +21;
image_index = 0;
image_speed = 0;

if (instance_exists(obj_foreground1))
{
	depth = obj_foreground1.depth - 1; /* Always put the depth above obj_foreground1 */
}
