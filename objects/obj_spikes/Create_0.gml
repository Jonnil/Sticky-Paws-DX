depth = +9;
image_index = random(10);

#region /* If enemies are disabled, replace this object with ground object */
if (global.assist_enable)
&& (!global.assist_enable_spikes)
{
	instance_create_depth(x, y, 0, obj_ground);
	instance_destroy();
}
#endregion /* If enemies are disabled, replace this object with ground object END */
