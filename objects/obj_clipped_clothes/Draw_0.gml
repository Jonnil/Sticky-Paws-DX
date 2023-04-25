draw_self();
image_speed = 0.1;
if (place_meeting(x, y, obj_player))
and (fall == false)
{
	fall = true;
	
	#region /* If it's a clipped shirt, turn into the shirt falling */
	if (asset_get_type("spr_clipped_shirt") == asset_sprite)
	and (sprite_index = spr_clipped_shirt)
	and (asset_get_type("spr_shirt") == asset_sprite)
	{
		sprite_index = spr_shirt;
	}
	#endregion /* If it's a clipped shirt, turn into the shirt falling END */
	
	#region /* If it's clipped pants, turn into the pants falling */
	if (asset_get_type("spr_clipped_pants") == asset_sprite)
	and (sprite_index = spr_clipped_pants)
	and (asset_get_type("spr_pants") == asset_sprite)
	{
		sprite_index = spr_pants;
	}
	#endregion /* If it's clipped pants, turn into the pants falling END */
	
	#region /* If it's a clipped sock, turn into the sock falling */
	if (asset_get_type("spr_clipped_sock") == asset_sprite)
	and (sprite_index = spr_clipped_sock)
	and (asset_get_type("spr_sock") == asset_sprite)
	{
		sprite_index = spr_sock;
	}
	#endregion /* If it's a clipped sock, turn into the sock falling END */
	
	#region /* 1 Basic Collectible */
	if (asset_get_type("obj_basic_collectible") == asset_object)
	{
		with(instance_create_depth(x, bbox_top, 0, obj_basic_collectible))
		{
			image_speed = 1;
			motion_set(90, 10);
			bounce_up = true;
		}
	}
	#endregion /* 1 Basic Collectible END */
	
	#region /* Make clippers fly out */
	if (asset_get_type("obj_clipper") == asset_object)
	{
		if (asset_get_type("spr_sock") == asset_sprite)
		and (sprite_index = spr_sock)
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
	}
	#endregion /* Make clippers fly out END */
}
if (fall == true)
{
	if (!position_meeting(x, bbox_bottom + 1, obj_wall))
	and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
	and (x > camera_get_view_x(view_camera[view_current]))
	and (x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	{
		gravity = 0.5;
		if (vspeed <+ 1)
		{
			vspeed = +1;
		}
		image_yscale = 1;
	}
	else
	{
		gravity = 0;
		vspeed = 0;
		if (position_meeting(x, bbox_bottom + 1, obj_wall))
		{
			image_yscale = 0.5;
		}
	}
}

#region /* Limit vertical falling speed */
if (vspeed > 20)
{
	vspeed = +20;
}
#endregion /* Limit vertical falling speed END */