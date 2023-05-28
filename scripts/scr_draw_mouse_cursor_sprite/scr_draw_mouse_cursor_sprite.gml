function scr_draw_mouse_cursor_sprite()
{
	
	#region /* Change mouse cursor. Draw mouse cursor for menu navigation */
	
	#region /* Scroll mouse cursor */
	if (scroll_view)
	and (pause == false)
	and (asset_get_type("spr_cursor_scroll") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor_scroll, 1, cursor_x, cursor_y, 1, 1, 0, c_red, 1);
	}
	else
	if (asset_get_type("spr_cursor_scroll") == asset_sprite)
	and (keyboard_check(vk_space))
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_scroll, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Scroll mouse cursor END */
	
	else
	
	#region /* Grab mouse cursor */
	if (asset_get_type("spr_cursor_grab") == asset_sprite)
	and (position_meeting(mouse_x, mouse_y, obj_leveleditor_placed_object))
	and (!mouse_check_button(mb_left))
	and (!mouse_check_button(mb_right))
	and (drag_object == false)
	and (instance_exists(obj_level_player1_start))
	and (obj_level_player1_start.drag_object == false)
	and (instance_exists(obj_level_player2_start))
	and (obj_level_player2_start.drag_object == false)
	and (instance_exists(obj_level_player3_start))
	and (obj_level_player3_start.drag_object == false)
	and (instance_exists(obj_level_player4_start))
	and (obj_level_player4_start.drag_object == false)
	and (instance_exists(obj_level_end))
	and (obj_level_end.drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	else
	if (position_meeting(mouse_x, mouse_y, obj_leveleditor_placed_object))
	and (drag_object)
	and (set_difficulty_mode == false)
	and (pause == false)
	and (instance_exists(obj_level_player1_start))
	and (obj_level_player1_start.drag_object == false)
	and (instance_exists(obj_level_player2_start))
	and (obj_level_player2_start.drag_object == false)
	and (instance_exists(obj_level_player3_start))
	and (obj_level_player3_start.drag_object == false)
	and (instance_exists(obj_level_player4_start))
	and (obj_level_player4_start.drag_object == false)
	and (pause == false)
	or (instance_exists(obj_level_end))
	and (obj_level_end.drag_object)
	and (pause == false)
	and (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (!point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	{
		draw_sprite_ext(spr_cursor_grab, 1, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Grab mouse cursor END */
	
	else
	
	#region /* Default mouse cursor */
	if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, 0, display_get_gui_width(), 64))
	and (asset_get_type("spr_cursor") == asset_sprite)
	or (pause)
	and (asset_get_type("spr_cursor") == asset_sprite)
	{
		draw_sprite_ext(spr_cursor, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Default mouse cursor END */
	
	else
	
	#region /* Erase mouse cursor */
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode)
	and (pause == false)
	and (key_a_hold)
	or (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode)
	and (pause == false)
	and (key_b_hold)
	or (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode)
	and (pause == false)
	and (mouse_check_button(mb_left))
	or (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode)
	and (pause == false)
	and (mouse_check_button(mb_right))
	{
		draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x + random_range(-2, +2), cursor_y + random_range(-2, +2), 1, 1, +90, c_white, 1);
	}
	else
	if (asset_get_type("spr_cursor_erase") == asset_sprite)
	and (erase_mode)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_erase, erase_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Erase mouse cursor END */
	
	else
	
	#region /* Fill mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode)
	and (fill_mode_type == "fill")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill_full, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill mouse cursor END */
	
	else
	
	#region /* Fill Horizontal mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode)
	and (fill_mode_type == "horizontal")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Fill Horizontal mouse cursor END */
	
	else
	
	#region /* Fill Vertical mouse cursor */
	if (asset_get_type("spr_cursor_fill") == asset_sprite)
	and (fill_mode)
	and (fill_mode_type == "vertical")
	and (drag_object == false)
	and (erase_mode == false)
	and (set_difficulty_mode == false)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_fill, 0, cursor_x, cursor_y, 1, 1, 90, c_white, 1);
	}
	#endregion /* Fill Vertical mouse cursor END */
	
	else
	
	#region /* Brush mouse cursor */
	if (asset_get_type("spr_cursor_brush") == asset_sprite)
	and (pause == false)
	{
		draw_sprite_ext(spr_cursor_brush, place_brush_size, cursor_x, cursor_y, 1, 1, 0, c_white, 1);
	}
	#endregion /* Brush mouse cursor END */
	
	#endregion /* Change mouse cursor. Draw mouse cursor for menu navigation END */
	
}