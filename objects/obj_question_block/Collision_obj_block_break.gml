#region /* Collision Event with block break mask */
if (bounce_up == false)
and (asset_get_type("obj_player") == asset_object)
and (asset_get_type("obj_wall") == asset_object)
{
	if (asset_get_type("obj_block_break") == asset_object)
	and (place_meeting(x, y, obj_block_break)) /* This object is a hurtbox, for blocks. So when this block comes in contact with this object, it will break */
	and (variable_instance_exists(obj_block_break, "can_break_other_blocks"))
	and (instance_nearest(x, y, obj_block_break).can_break_other_blocks == true)
	{
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
#endregion /* Collision Event with block break mask END */