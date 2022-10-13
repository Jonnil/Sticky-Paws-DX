draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, image_blend, image_alpha);

if (brick_particle == true)
{
	#region /* Set the gravity */
	gravity_direction = 270;
	gravity = 0.5;
	#endregion /* Set the gravity END */
	
	#region /* Destroy outside view */
	if (x < camera_get_view_x(view_camera[view_current]))
	or (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	or(y < camera_get_view_y(view_camera[view_current]))
	or(y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	{
		instance_destroy();
	}
	#endregion /* Destroy outside view END */
	
	if (hspeed < 0)
	{
		image_angle += 10;
	}
	if (hspeed > 0)
	{
		image_angle -= 10;
	}
}
if (brick_particle = false)
	and (asset_get_type("obj_player") == asset_object)
	{
		if (position_meeting(bbox_left + 3, bbox_bottom + 1, instance_nearest(x, y, obj_player)))
			or (position_meeting(bbox_right - 3, bbox_bottom + 1, instance_nearest(x, y, obj_player)))
		or (place_meeting(x, y - 16, instance_nearest(x, y, obj_player)))
		and (instance_nearest(x, y, obj_player).ground_pound == true)
		or (place_meeting(bbox_left - 4, y, instance_nearest(x, y, obj_player)))
		and (instance_nearest(x, y, obj_player).dive == true)
		or (place_meeting(bbox_right + 4, y, instance_nearest(x, y, obj_player)))
		and (instance_nearest(x, y, obj_player).dive == true)
		{
			with(instance_nearest(x, y, obj_player))
			{
				if (key_down)
				{
					ground_pound = true;
				}
				else
				{
					ground_pound = false;
				}
				dive = false;
				vspeed = +4;
			}
			if (asset_get_type("obj_block_break") == asset_object)
			{
				instance_create_depth(x, y - 32, 0, obj_block_break);
			}
		}
	}