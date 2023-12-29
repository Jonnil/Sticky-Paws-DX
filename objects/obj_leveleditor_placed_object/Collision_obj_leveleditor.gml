#region /* Only run this code when placed object is colliding with the level editor cursor, so that there isn't that much code running in step event */
if (instance_exists(obj_leveleditor))
{
	var modify_object_menu = obj_leveleditor.modify_object_menu;
}

#region /* Drag Object */
if (other.set_difficulty_mode == false)
&& (delay > 1)
&& (modify_object_menu == false)
{
	
	#region /* Click on object to start drag */
	if (mouse_check_button_pressed(mb_left) || other.key_a_pressed)
	{
		var can_drag_object = !keyboard_check(vk_space)
		&& !keyboard_check(vk_enter)
		&& !mouse_check_button(mb_middle)
		&& !mouse_check_button(mb_right)
		&& !other.drag_object
		&& !other.fill_mode
		&& !other.erase_mode
		&& !other.pause
		&& !other.hovering_over_icon
		&& other.menu_delay == 0
		&& other.level_editor_menu == ""
		&& !place_meeting(x, y, obj_level_player1_start)
		&& !place_meeting(x, y, obj_level_player2_start)
		&& !place_meeting(x, y, obj_level_player3_start)
		&& !place_meeting(x, y, obj_level_player4_start)
		&& !position_meeting(x, y, obj_level_height)
		&& !position_meeting(x, y, obj_level_width)
		&& !position_meeting(x, y, obj_water_level_height)
		&& position_meeting(other.x, other.y, id);
		
		if (can_drag_object)
		{
			effect_create_above(ef_ring, x, y, 0, c_white);
			depth = -300;
			drag_object = true;
			drag_xstart = x;
			drag_ystart = y;
			other.drag_object = true;
		}
	}
	#endregion /* Click on object to start drag END */
	
}

#region /* Release the object */
if (mouse_check_button_released(mb_left))
|| (other.key_a_released)
{
	if (drag_object)
	{
		drag_release_timer = 3;
		drag_object = 0.5;
		other.drag_object = false;
		dragged_from_original_place = false;
		
		#region /* Reset depth to normal when releasing object */
		if (object == LEVEL_OBJECT_ID.ID_WATER)
		|| (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
		{
			depth = -20;
		}
		else
		if (object == LEVEL_OBJECT_ID.ID_LAVA)
		{
			depth = -18;
		}
		else
		{
			depth = -19;
		}
		#endregion /* Reset depth to normal when releasing object END */
		
	}
}
#endregion /* Release the object END */

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