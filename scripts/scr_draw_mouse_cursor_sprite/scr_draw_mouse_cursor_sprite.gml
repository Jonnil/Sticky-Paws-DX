function scr_draw_mouse_cursor_sprite()
{
	mouse_use_grab_cursor = false;
	
	var position_meeeting_draggable_objects = (position_meeting(x, y, obj_leveleditor_placed_object)
	|| position_meeting(x, y, obj_level_player1_start)
	|| position_meeting(x, y, obj_level_player2_start)
	|| position_meeting(x, y, obj_level_player3_start)
	|| position_meeting(x, y, obj_level_player4_start)
	|| position_meeting(x, y, obj_level_end));
	
	#region /* Change mouse cursor. Draw mouse cursor for menu navigation */
	
	#region /* Scroll mouse cursor */
	if (scroll_view)
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_red, 1);
	}
	else
	if (keyboard_check(vk_space))
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Scroll mouse cursor END */
	
	else
	
	#region /* Grab mouse cursor */
	if (position_meeeting_draggable_objects
	&& !mouse_check_button(mb_left)
	&& !mouse_check_button(mb_right)
	&& !drag_object
	&& !obj_level_player1_start.drag_object
	&& !obj_level_player2_start.drag_object
	&& !obj_level_player3_start.drag_object
	&& !obj_level_player4_start.drag_object
	&& obj_level_end.drag_object == false
	&& !erase_mode
	&& !set_difficulty_mode
	&& !pause
	&& !point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)
	&& !point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)
	&& !point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		mouse_use_grab_cursor = true;
		draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	else
	if (position_meeeting_draggable_objects)
	&& (drag_object)
	&& (!set_difficulty_mode)
	&& (!pause)
	|| (obj_level_end.drag_object)
	&& (!pause)
	&& (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	&& (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	&& (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		mouse_use_grab_cursor = true;
		draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Grab mouse cursor END */
	
	else
	
	#region /* Default mouse cursor */
	if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	&& (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	&& (pause)
	{
		draw_sprite_ext(spr_cursor, erase_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Default mouse cursor END */
	
	else
	
	#region /* Erase mouse cursor */
	if (erase_mode)
	&& (!pause)
	&& (key_a_hold)
	&& (level_editor_menu == "")
	|| (erase_mode)
	&& (!pause)
	&& (key_b_hold)
	&& (level_editor_menu == "")
	|| (erase_mode)
	&& (!pause)
	&& (mouse_check_button(mb_left))
	&& (level_editor_menu == "")
	|| (erase_mode)
	&& (!pause)
	&& (mouse_check_button(mb_right))
	&& (level_editor_menu == "")
	{
		draw_sprite_ext(spr_cursor_erase, erase_size, cursor_x + random_range(-2, +2), cursor_y + random_range(-2, +2), 1, 1, +90, c_white, 1);
	}
	else
	if (erase_mode)
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_erase, erase_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Erase mouse cursor END */
	
	else
	
	#region /* Fill mouse cursor */
	if (fill_mode)
	&& (fill_mode_type == "fill")
	&& (!drag_object)
	&& (!erase_mode)
	&& (!set_difficulty_mode)
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_fill_full, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill mouse cursor END */
	
	else
	
	#region /* Fill Horizontal mouse cursor */
	if (fill_mode)
	&& (fill_mode_type == "horizontal")
	&& (!drag_object)
	&& (!erase_mode)
	&& (!set_difficulty_mode)
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill Horizontal mouse cursor END */
	
	else
	
	#region /* Fill Vertical mouse cursor */
	if (fill_mode)
	&& (fill_mode_type == "vertical")
	&& (!drag_object)
	&& (!erase_mode)
	&& (!set_difficulty_mode)
	&& (!pause)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 90, c_white, 1);
	}
	#endregion /* Fill Vertical mouse cursor END */
	
	else
	
	#region /* Brush mouse cursor */
	if (!pause)
	{
		draw_sprite_ext(spr_cursor_brush, place_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Brush mouse cursor END */
	
	#endregion /* Change mouse cursor. Draw mouse cursor for menu navigation END */
	
}