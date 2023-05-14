x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5;

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
and (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		or (obj_leveleditor.key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				if (drag_object < true)
				{
					drag_object = true;
					obj_leveleditor.drag_object = true;
				}
			}
		}
	}
	#region /* Drag the object */
	if (drag_object == true)
	{
		y = obj_leveleditor.y;
	}
	#endregion /* Drag the object END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	or (obj_leveleditor.key_a_released)
	{
		if (drag_object == true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
	#endregion /* Release the object END */
}

#endregion /* Drag Object END */

if drag_release_timer > 0
{
	drag_release_timer -= 1;
}
else
{
	if drag_object = 0.5
	{
		drag_object = false;
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (y > room_height)
{
	y = room_height;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level == true)
or (global.actually_play_edited_level == true)
{
	instance_create_depth(x, y, 0, obj_water_level);
	instance_destroy();
}

if (instance_exists(obj_level_height))
and (drag_object == false)
and (obj_level_height.drag_object == false)
and (obj_level_height.y = y)
{
	y += 32;
}