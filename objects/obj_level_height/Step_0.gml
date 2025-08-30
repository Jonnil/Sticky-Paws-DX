if (y < 0)
{
	y = 0;
}

x = camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) * 0.5;

if (x < 16)
{
	x = 16;
}

if (instance_exists(obj_level_width))
&& (x > obj_level_width.x)
{
	x = obj_level_width.x;
}

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
&& (!obj_leveleditor.pause)
{
	if (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		|| (obj_leveleditor.key_a_pressed)
		{
			if (place_meeting(x, y, obj_leveleditor))
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
	if (drag_object)
	&& (instance_exists(obj_leveleditor))
	&& (obj_leveleditor.y > 100)
	{
		y = obj_leveleditor.y;
	}
	#endregion /* Drag the object END */

	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	|| (obj_leveleditor.key_a_released)
	{
		if (drag_object)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
	#endregion /* Release the object END */

}
#endregion /* Drag Object END */

if (drag_release_timer > 0)
{
	drag_release_timer--;
}
else
{
	if (drag_object = 0.5)
	{
		drag_object = false;
	}
}

if (global.play_edited_level)
|| (global.actually_play_edited_level)
{
	room_height = bbox_top;
	instance_destroy();
}
