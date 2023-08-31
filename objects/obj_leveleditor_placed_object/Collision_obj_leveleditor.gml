#region /* Only run this code when placed object is colliding with the level editor cursor, so that there isn't that much code running in step event */
var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Drag Object */
if (instance_exists(obj_leveleditor))
&& (obj_leveleditor.set_difficulty_mode == false)
&& (delay > 1)
{
	
	#region /* Click on object to start drag */
	if (mouse_check_button_pressed(mb_left) || obj_leveleditor.key_a_pressed) {
		var can_drag_object = !keyboard_check(vk_space)
			&& !mouse_check_button(mb_middle)
			&& !mouse_check_button(mb_right)
			&& !obj_leveleditor.drag_object
			&& !obj_leveleditor.fill_mode
			&& !obj_leveleditor.erase_mode
			&& !obj_leveleditor.pause
			&& obj_leveleditor.menu_delay == 0
			&& !place_meeting(x, y, obj_level_player1_start)
			&& !place_meeting(x, y, obj_level_player2_start)
			&& !place_meeting(x, y, obj_level_player3_start)
			&& !place_meeting(x, y, obj_level_player4_start)
			&& !position_meeting(x, y, obj_level_height)
			&& !position_meeting(x, y, obj_level_width)
			&& !position_meeting(x, y, obj_water_level_height)
			&& !point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2) /* Can't place objects when clicking the bottom buttons */
			&& !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, - 64, get_window_width, + 64) /* Can't place objects when clicking the top buttons */
			&& !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32) /* Can't place objects when clicking the play button */
			&& position_meeting(obj_leveleditor.x, obj_leveleditor.y, id)
			&& !point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)
			&& !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, - 64, get_window_width, + 64);
		
		if (can_drag_object) {
			var can_place_difficulty_button = obj_leveleditor.set_difficulty_mode
			    ? !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 256, get_window_height - 64, get_window_width, room_height * 2) /* Can't place objects when clicking the bottom right buttons */
			    : !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height - 64, get_window_width, room_height * 2) /* Can't place objects when clicking the bottom right buttons */;
			
			if (can_place_difficulty_button) {
			    var can_place_up_down_button = obj_leveleditor.show_grid
			        ? !point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 32 - 32, 80 + 32 + 16 - 32, get_window_width + 64, 80 + 32 + 16 + 32) /* Up and down buttons when grid is on */
			        : true;
				
			    if (can_place_up_down_button) {
			        effect_create_above(ef_ring, x, y, 0, c_white);
			        depth = -300;
					drag_object = true;
			        drag_xstart = x;
			        drag_ystart = y;
			        obj_leveleditor.drag_object = true;
			    }
			}
		}
	}
	#endregion /* Click on object to start drag END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	|| (obj_leveleditor.key_a_released)
	{
		if (drag_object)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
			dragged_from_original_place = false;
			
			#region /* Reset depth to normal when releasing object */
			if (object == LEVEL_OBJECT_ID.ID_WATER)
			|| (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
			|| (object == LEVEL_OBJECT_ID.ID_WATER_SURFACE)
			{
				depth = -20;
			}
			else
			{
				depth = -19;
			}
			#endregion /* Reset depth to normal when releasing object END */
			
		}
	}
	#endregion /* Release the object END */
}

if (drag_release_timer > 0)
{
	drag_release_timer --;
}
else
if (drag_object == 0.5)
{
	drag_object = false;
	dragged_from_original_place = false;
}

if (drag_xstart != x)
|| (drag_ystart != y)
{
	dragged_from_original_place = true;
}
#endregion /* Drag Object END */

#endregion /* Only run this code when placed object is colliding with the level editor cursor, so that there isn't that much code running in step event END */