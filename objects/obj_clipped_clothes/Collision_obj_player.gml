if (!fall)
{
	fall = true;
	
	#region /* If it's a clipped shirt, turn into the shirt falling */
	if (sprite_index == spr_clipped_shirt)
	{
		sprite_index = spr_shirt;
	}
	#endregion /* If it's a clipped shirt, turn into the shirt falling END */
	
	#region /* If it's clipped pants, turn into the pants falling */
	if (sprite_index == spr_clipped_pants)
	{
		sprite_index = spr_pants;
	}
	#endregion /* If it's clipped pants, turn into the pants falling END */
	
	#region /* If it's a clipped sock, turn into the sock falling */
	if (sprite_index == spr_clipped_sock)
	{
		sprite_index = spr_sock;
	}
	#endregion /* If it's a clipped sock, turn into the sock falling END */
	
	#region /* 1 Basic Collectible */
	with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
	{
		image_speed = 1;
		motion_set(90, 10);
		bounce_up = true;
	}
	#endregion /* 1 Basic Collectible END */
	
	#region /* Make clippers fly out */
	if (sprite_index == spr_sock)
	{
		with(instance_create_depth(x, y - 16, 0, obj_clipper))
		{
			motion_set(90 + random_range(- 10, + 10), random_range(5, 10));
		}
	}
	else
	{
		with(instance_create_depth(x + 16, y - 16, 0, obj_clipper))
		{
			motion_set(45, random_range(5, 10));
		}
		with(instance_create_depth(x - 16, y - 16, 0, obj_clipper))
		{
			motion_set(135, random_range(5, 10));
		}
	}
	#endregion /* Make clippers fly out END */
}