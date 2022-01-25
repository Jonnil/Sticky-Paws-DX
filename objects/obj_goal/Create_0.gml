if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
and (instance_exists(obj_background_brightness_gameplay))
{
	depth = obj_background_brightness_gameplay.depth - 1; /*Always put the depth above obj_background_brightness_gameplay*/
}
image_index = 0;
image_speed = 0;
trigger_ending = false;
trigger_demo_ending = false;
goal = false;
number_of_clears = 0;