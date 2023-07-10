if (instance_exists(obj_background_brightness_gameplay))
{
	depth = obj_background_brightness_gameplay.depth - 1; /* Always put the depth above obj_background_brightness_gameplay */
}
image_index = 0;
image_speed = 0;
trigger_ending = false;
trigger_demo_ending = false;
goal = false;
number_of_clears = 0;

if (instance_exists(obj_checkpoint))
{
	with(instance_nearest(x, y, obj_checkpoint))
	{
		last_checkpoint = true; /*Tell the player if the checkpoint they are activating is the last checkpoint in the level, the checkpoint cosest to the goal*/
	}
}