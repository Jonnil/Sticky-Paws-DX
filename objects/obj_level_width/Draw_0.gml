y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2;

key_a = (gamepad_button_check(0, gp_face1)) or(keyboard_check(global.player1_key_jump));
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))
or(keyboard_check_pressed(global.player1_key_jump));
key_a_released = (gamepad_button_check_released(0, gp_face1))
or(keyboard_check_released(global.player1_key_jump));
key_b = (gamepad_button_check(0, gp_face2))
or(keyboard_check(global.player1_key_sprint));
draw_set_alpha(0.5);
draw_rectangle_colour(x-16, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_line_width_colour(x-16, 0, x-16, room_height, 2, c_black, c_black);
draw_self();

#region /*Drag Object*/
if (asset_get_type("obj_leveleditor") == asset_object)
and(instance_exists(obj_leveleditor))
and(obj_leveleditor.pause = false)
{
	if (!keyboard_check(vk_space))
	and(!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		or(key_a_pressed)
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
	#region /*Drag the object*/
	if (drag_object = true)
	{
		x = obj_leveleditor.x;
	}
	#endregion /*Drag the object END*/
	
	#region /*Release the object*/
	if (mouse_check_button_released(mb_left))
	or(key_a_released)
	{
		if (drag_object = true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
	#endregion /*Release the object END*/
}

#endregion /*Drag Object END*/

if drag_release_timer > 0
{
	drag_release_timer -= 1;
}
else
{
	if drag_object = 0.5
	{
		drag_object = false;
		//move_snap(32, 32);
	}
}

#region /*Make sure the level end isn't outside of the level, this code has to be after the drag object code*/
if (x < 1920-16)
{
	x = 1920-16;
}
if (x > room_width)
{
	x = room_width;
}
#endregion /*Make sure the level end isn't outside of the level, this code has to be after the drag object code END*/

if (global.play_edited_level = true)
or(global.actually_play_edited_level = true)
{
	if (global.actually_play_edited_level = true)
	{
		global.play_edited_level = true;
	}
	room_width = bbox_left;
	instance_destroy();
}