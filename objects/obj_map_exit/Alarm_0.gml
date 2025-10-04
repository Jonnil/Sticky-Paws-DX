if (instance_exists(obj_level))
&& (instance_nearest(x, y, obj_level).clear_rate = "clear")
&& (global.demo_enable
&& instance_nearest(x, y, obj_level).level < global.demo_number_of_levels
|| !global.demo_enable)
{
	instance_destroy();
}
