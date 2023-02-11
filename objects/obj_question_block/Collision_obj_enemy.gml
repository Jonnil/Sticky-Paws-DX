#region /* Collision Event with enemy */
if (bounce_up == false)
and (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
{
	if (asset_get_type("obj_enemy") == asset_object)
	and (instance_exists(obj_enemy))
	and (place_meeting(x, bbox_bottom, obj_enemy))
	and (instance_nearest(x, y, obj_enemy).vspeed < 0)
	and (can_be_hit_from_below == true)
	{
		if (asset_get_type("obj_enemy") == asset_object)
		and (instance_exists(obj_enemy))
		and (instance_nearest(x, y, obj_enemy).vspeed < 0)
		{
			instance_nearest(x, y, obj_enemy).vspeed = 0;
			if (asset_get_type("obj_block_break") == asset_object)
			{
				with(instance_create_depth(instance_nearest(x, y, obj_enemy).x, instance_nearest(x, y, obj_enemy).bbox_top - 18, 0, obj_block_break))
				{
					image_yscale = 0.1;
					if (variable_instance_exists(self, "can_break_other_blocks"))
					{
						can_break_other_blocks = true;
					}
				}
			}
		}
		if (empty = false)
		{
			if (instance_exists(obj_player))
			and (asset_get_type("scr_gamepad_vibration") == asset_script)
			{
				scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
			}
			bounce_up = true;
			if (asset_get_type("obj_block_break") == asset_object)
			{
				with(instance_create_depth(x, y - 32, 0, obj_block_break))
				{
					image_yscale = 0.1;
				}
			}
			
			scr_different_items_inside();
			
		}
	}
}
#endregion /* Collision Event with enemy END */