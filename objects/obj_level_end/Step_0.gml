#region /* Drag Object */
if (instance_exists(obj_leveleditor))
&& (!obj_leveleditor.pause)
{
	if (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	&& (!obj_leveleditor.hovering_over_icon)
	{
		if (mouse_check_button_pressed(mb_left))
		|| (obj_leveleditor.key_a_pressed)
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
	if (drag_object)
	{
		x = obj_leveleditor.x;
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

if drag_release_timer > 0
{
	drag_release_timer--;
}
else
{
	if drag_object = 0.5
	{
		drag_object = false;
		move_snap(global.grid_hsnap, global.grid_vsnap);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < 16)
{
	x = 16;
}
if (y < 16)
{
	y = 16;
}
if (instance_exists(obj_level_width) && x > obj_level_width.x - 32)
{
	x = obj_level_width.x - 32;
}
if (instance_exists(obj_level_height) && y > obj_level_height.y - 32)
{
	y = obj_level_height.y - 32;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level)
|| (global.actually_play_edited_level)
{
	instance_create_depth(x, y - 256 + 32, 0, obj_goal);
	instance_destroy();
}
