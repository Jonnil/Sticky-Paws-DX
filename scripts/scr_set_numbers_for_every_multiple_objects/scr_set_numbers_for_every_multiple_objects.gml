function scr_set_numbers_for_every_multiple_objects()
{
	
	#region /* Set checkpoint numbers for every checkpoint */
	instance_activate_object(obj_checkpoint);
	for(checkpoint_number = 0;
	checkpoint_number < instance_number(obj_checkpoint) + 1;
	checkpoint_number += 1)
	{
		if (instance_exists(obj_camera))
		and (instance_number(obj_checkpoint) >= checkpoint_number)
		{
			with (instance_nth_nearest(0, 0, obj_checkpoint, checkpoint_number))
			{
				checkpoint_number = obj_camera.checkpoint_number;
			}
		}
	}
	#endregion /* Set checkpoint numbers for every checkpoint END */
	
	#region /* Set big collectible numbers for every big collectible */
	instance_activate_object(obj_big_collectible_number);
	for(big_collectible = 0;
	big_collectible < instance_number(obj_big_collectible_number) + 1;
	big_collectible += 1)
	{
		if (instance_exists(obj_camera))
		and (instance_number(obj_big_collectible_number) >= big_collectible)
		{
			with (instance_nth_nearest(0, 0, obj_big_collectible_number, big_collectible))
			{
				big_collectible = obj_camera.big_collectible;
			}
		}
	}
	#endregion /* Set big collectible numbers for every big collectible END */
	
}