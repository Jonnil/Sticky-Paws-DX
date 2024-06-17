var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
&& (!obj_leveleditor.pause)
{
	if (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
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
	&& (instance_exists(obj_leveleditor))
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
}
#endregion /* Release the object END */

#endregion /* Drag Object END */

if (drag_release_timer > 0)
{
	drag_release_timer --;
}
else
{
	if (drag_object == 0.5)
	{
		drag_object = false;
		move_snap(global.grid_hsnap, global.grid_vsnap);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < sprite_width - 32)
{
	x = sprite_width - 32
}
if (x > room_width)
{
	x = room_width;
}
if (y < 64)
{
	y = 64
}
if (y > room_height)
{
	y = room_height;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

scr_load_level_checkpoint();

if (instance_exists(obj_camera))
{
	instance_destroy(); /* Destroy the level player 1 start if player 1 has spawned in the level */
}