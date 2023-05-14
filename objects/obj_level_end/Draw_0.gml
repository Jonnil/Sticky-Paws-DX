var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

if (asset_get_type("spr_goal") == asset_sprite)
{
	draw_sprite_ext(spr_goal, 0, x, y - 256, 1, 1, 0, c_white, 1);
}
if (asset_get_type("spr_level_end") == asset_sprite)
{
	draw_sprite_ext(spr_level_end, 0, x, y, 1, 1, 0, c_white, 0.5);
}

#region /* Drag Object */
if (instance_number(obj_leveleditor) > 0)
and (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
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
		x = obj_leveleditor.x;
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
		move_snap(32, 32);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (x < 32)
{
	x = 32;
}
if (x < 0 + sprite_width - 32)
{
	x = 0 + sprite_width - 32;
}
if (x > room_width - sprite_width + 16)
{
	x = room_width - sprite_width + 16;
}
if (y < 32)
{
	y = 32;
}
if (y > room_height)
{
	y = room_height;
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level == true)
or (global.actually_play_edited_level == true)
{
	instance_create_depth(x, y - 256, 0, obj_goal);
	instance_destroy();
}