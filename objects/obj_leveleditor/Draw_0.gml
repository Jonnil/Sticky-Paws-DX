if (!global.actually_play_edited_level)
{
	if (place_meeting(x, y, obj_leveleditor_placed_object))
	&& (instance_nearest(x, y, obj_leveleditor_placed_object).draw_rotate_arrow)
	{
		var draw_rotate_arrow_scale = scr_wave(0.5, 0.4, 0.5, 0);
		switch(instance_nearest(x, y, obj_leveleditor_placed_object).object)
		{
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT:
			case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME:
				draw_sprite_ext(spr_rotate_arrow, image_index, x, y, draw_rotate_arrow_scale, draw_rotate_arrow_scale, instance_nearest(x, y, obj_leveleditor_placed_object).draw_angle + 90, image_blend, image_alpha);
				break;
			default:
				draw_sprite_ext(spr_rotate_arrow, image_index, x, y, draw_rotate_arrow_scale, draw_rotate_arrow_scale, instance_nearest(x, y, obj_leveleditor_placed_object).draw_angle, image_blend, image_alpha);
		}
	}
	
	#region /* Draw where player will do playtesting from */
	if (global.sprite_player_stand[4] > 0) /* Display Player 4 behind Player 3 */
	&& (quit_level_editor == false)
	{
		if (pressing_play_timer > 0)
		&& (global.player_can_play[4])
		{
			var sprite_player_stand_x = view_center_x;
			var sprite_player_stand_y = view_center_y;
		}
		else
		{
			var sprite_player_stand_x = obj_level_player4_start.x;
			var sprite_player_stand_y = obj_level_player4_start.y;
		}
		draw_sprite_ext(global.sprite_player_stand[4], 0, obj_level_player4_start.x, obj_level_player4_start.y, 1, 1, 0, c_white, 0.5);
	}
	if (global.sprite_player_stand[3] > 0) /* Display Player 3 on top of Player 4 */
	&& (quit_level_editor == false)
	{
		if (pressing_play_timer > 0)
		&& (global.player_can_play[3])
		{
			var sprite_player_stand_x = view_center_x;
			var sprite_player_stand_y = view_center_y;
		}
		else
		{
			var sprite_player_stand_x = obj_level_player3_start.x;
			var sprite_player_stand_y = obj_level_player3_start.y;
		}
		draw_sprite_ext(global.sprite_player_stand[3], 0, obj_level_player3_start.x, obj_level_player3_start.y, 1, 1, 0, c_white, 0.5);
	}
	if (global.sprite_player_stand[2] > 0) /* Display Player 2 on top of Player 3 */
	&& (quit_level_editor == false)
	{
		if (pressing_play_timer > 0)
		&& (global.player_can_play[2])
		{
			var sprite_player_stand_x = view_center_x;
			var sprite_player_stand_y = view_center_y;
		}
		else
		{
			var sprite_player_stand_x = obj_level_player2_start.x;
			var sprite_player_stand_y = obj_level_player2_start.y;
		}
		draw_sprite_ext(global.sprite_player_stand[2], 0, obj_level_player2_start.x, obj_level_player2_start.y, 1, 1, 0, c_white, 0.5);
	}
	if (global.sprite_player_stand[1] > 0) /* Display Player 1 on top of Player 2 */
	&& (quit_level_editor == false)
	{
		if (pressing_play_timer > 0)
		&& (global.player_can_play[1])
		{
			var sprite_player_stand_x = view_center_x;
			var sprite_player_stand_y = view_center_y;
		}
		else
		{
			var sprite_player_stand_x = obj_level_player1_start.x;
			var sprite_player_stand_y = obj_level_player1_start.y;
		}
		draw_sprite_ext(global.sprite_player_stand[1], 0, sprite_player_stand_x, sprite_player_stand_y, 1, 1, 0, c_white, 0.5);
	}
	#endregion /* Draw where player will do playtesting from END */
	
	draw_rectangle_color(0, 0, obj_level_width.x - 16, obj_level_height.y -16, c_red, c_red, c_red, c_red, true);  /* Border around entire level */
	
	#region /* Draw Grid */
	if (quit_level_editor <= 0)
	&& (show_grid)
	{
		var grid_offset = 16; /* If the grid should have an offset from the top_left corner of the screen, normally this should be 16 */
		draw_set_alpha(0.5);
		
		#region /* Draw Horizontal Line in the Grid */
		for(var i = 0; i < obj_level_width.x; i += global.grid_hsnap)
		{
			draw_line_color(i + grid_offset - 1, - 16 + grid_offset - 1, i + grid_offset - 1, obj_level_height.y + 16 + grid_offset - 1, c_black, c_black);
			draw_line_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, obj_level_height.y + 16 + grid_offset, c_white, c_white);
		}
		#endregion /* Draw Horizontal Line in the Grid END */
		
		#region /* Draw Vertical Line in the Grid */
		for(var i = 0; i < obj_level_height.y; i += global.grid_vsnap)
		{
			draw_line_color(- 16 + grid_offset - 1, i + grid_offset - 1, obj_level_width.x + 16 + grid_offset - 1, i + grid_offset - 1, c_black, c_black);
			draw_line_color(- 16 + grid_offset, i + grid_offset, obj_level_width.x + 16 + grid_offset, i + grid_offset, c_white, c_white);
		}
		#endregion /* Draw Vertical Line in the Grid END */
		
	}
	
	#endregion /* Draw Grid END */
	
	#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
	if (!pause)
	{
		
		#region /* Zoom Out */
		if (zoom_out)
		{
			if (cam_width < room_width)
			&& (cam_height < room_height)
			{
				
			}
			else
			{
				draw_rectangle_color(0, 0, cam_x + 8, room_height, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(cam_x + cam_width - 8, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(0, 0, room_width, cam_y + 8, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(0, cam_y + cam_height - 8, room_width, room_height, c_red, c_red, c_red, c_red, false);
			}
		}
		#endregion /* Zoom Out END */
		
		else
		
		#region /* Zoom In */
		if (zoom_in)
		{
			if (cam_width > 696)
			&& (cam_height > 368)
			{
				
			}
			else
			{
				draw_rectangle_color(0, 0, cam_x + 1, room_height, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(cam_x + cam_width - 1, 0, room_width, room_height, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(0, 0, room_width, cam_y + 1, c_red, c_red, c_red, c_red, false);
				draw_rectangle_color(0, cam_y + cam_height - 1, room_width, room_height, c_red, c_red, c_red, c_red, false);
			}
		}
		#endregion /* Zoom In END */
		
	}
	#endregion /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END */
	
	#region /* Select Object Menu */
	if (quit_level_editor <= 0)
	{
		if (global.world_editor)
		{
			draw_sprite_ext(spr_wall, 0, view_center_x + selected_object_menu_x, cam_y + 64, 1, 1, 0, c_white, selected_menu_alpha);
			draw_sprite_ext(spr_level_ring, 0, view_center_x + selected_object_menu_x + 64, cam_y + 64, 1, 1, 0, c_yellow, selected_menu_alpha);
			draw_sprite_ext(spr_level, 0, view_center_x + selected_object_menu_x + 64, cam_y + 64, 1, 1, 0, c_black, selected_menu_alpha);
			draw_sprite_ext(spr_map_exit, 0, view_center_x + selected_object_menu_x + 64 * 2, cam_y + 64, 1, 1, 0, c_white, selected_menu_alpha);
			draw_sprite_ext(spr_map_turn_right_down, 0,	view_center_x + selected_object_menu_x + 64 * 3, cam_y + 64, 1, 1, 0, c_white, selected_menu_alpha);
			draw_sprite_ext(spr_map_turn_right_down, 0,	view_center_x + selected_object_menu_x + 64 * 4, cam_y + 64, 1, 1, 90, c_white, selected_menu_alpha);
			draw_sprite_ext(spr_map_turn_right_down, 0,	view_center_x + selected_object_menu_x + 64 * 5, cam_y + 64, 1, 1, 180, c_white, selected_menu_alpha);
			draw_sprite_ext(spr_map_turn_right_down, 0,	view_center_x + selected_object_menu_x + 64 * 6, cam_y + 64, 1, 1, 270, c_white, selected_menu_alpha);
		}
	}
	#endregion /* Select Object Menu END */
	
	#region /* Position the Cursor */
	if (quit_level_editor <= 0)
	{
		
		#region /* Fill Cursor */
		if (fill_mode)
		&& (erase_mode == false)
		&& (!scroll_view)
		&& (!place_meeting(x, y, obj_level_player1_start))
		&& (!place_meeting(x, y, obj_level_player2_start))
		&& (!place_meeting(x, y, obj_level_player3_start))
		&& (!place_meeting(x, y, obj_level_player4_start))
		&& (!place_meeting(x, y, obj_level_end))
		{
			if (!place_meeting(x, y, obj_leveleditor_placed_object))
			&& (sprite_index >= 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
			}
			draw_set_alpha(1);
		}
		#endregion /* Fill Cursor END */
		
		else
		
		#region /* Erase Cursor */
		if (erase_mode)
		&& (!scroll_view)
		&& (!pause)
		{
			draw_set_alpha(0.5);
			{
				if (erase_brush_size == 5)
				{
					draw_rectangle_color(x - 80, y - 80, x + 112, y + 112, c_red, c_red, c_red, c_red, false);
				}
				else
				if (erase_brush_size == 4)
				{
					draw_rectangle_color(x - 80, y - 80, x + 80, y + 80, c_red, c_red, c_red, c_red, false);
				}
				else
				if (erase_brush_size == 3)
				{
					draw_rectangle_color(x - 48, y - 48, x + 80, y + 80, c_red, c_red, c_red, c_red, false);
				}
				else
				if (erase_brush_size == 2)
				{
					draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
				}
				else
				if (erase_brush_size == 1)
				{
					draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_red, c_red, c_red, c_red, false);
				}
				else
				{
					draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_red, c_red, c_red, c_red, false);
				}
			}
			draw_set_alpha(1);
		}
		#endregion /* Erase Cursor END */
		
		else
		
		#region /* Default Cursor */
		if (!scroll_view)
		&& (!drag_object)
		&& (!fill_mode)
		&& (!pause)
		{
			if (!place_meeting(x, y, obj_leveleditor_placed_object))
			&& (sprite_index >= 0)
			{
				draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.2);
			}
			
			if (can_make_place_brush_size_bigger)
			&& (sprite_index >= 0)
			{
				if (!place_meeting(x + 32, y, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 32, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x + 32, y + 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 1){draw_sprite_ext(sprite_index, image_index, x, y + 32, 1, 1, 0, c_white, 0.2);}
				
				if (!place_meeting(x + 32, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x + 32, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 2){draw_sprite_ext(sprite_index, image_index, x - 32, y + 32, 1, 1, 0, c_white, 0.2);}
				
				if (!place_meeting(x + 64, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 64, y, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 64, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y + 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 64, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 64, y + 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 32, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x + 32, y + 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x, y + 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 3){draw_sprite_ext(sprite_index, image_index, x - 32, y + 64, 1, 1, 0, c_white, 0.2);}
				
				if (!place_meeting(x + 64, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 64, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 32, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x + 32, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 32, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y + 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 4){draw_sprite_ext(sprite_index, image_index, x - 64, y + 64, 1, 1, 0, c_white, 0.2);}
				
				if (!place_meeting(x + 96, y - 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y - 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 96, y - 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y - 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 96, y, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 96, y + 32, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 32, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 96, y + 64, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 64, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 96, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 96, y + 96, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 64, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 64, y + 96, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x + 32, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x + 32, y + 96, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x, y + 96, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 32, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x - 32, y + 96, 1, 1, 0, c_white, 0.2);}
				if (!place_meeting(x - 64, y + 96, obj_leveleditor_placed_object)) && (obj_leveleditor.place_brush_size >= 5){draw_sprite_ext(sprite_index, image_index, x - 64, y + 96, 1, 1, 0, c_white, 0.2);}
			}
			
			#region /* Draw a rectangle around the placable objects */
			if (place_brush_size == 5)
			&& (can_make_place_brush_size_bigger)
			{
				draw_rectangle_color(x - 80, y - 80, x + 112, y + 112, c_black, c_black, c_black, c_black, true);
			}
			else
			if (place_brush_size == 4)
			&& (can_make_place_brush_size_bigger)
			{
				draw_rectangle_color(x - 80, y - 80, x + 80, y + 80, c_black, c_black, c_black, c_black, true);
			}
			else
			if (place_brush_size == 3)
			&& (can_make_place_brush_size_bigger)
			{
				draw_rectangle_color(x - 48, y - 48, x + 80, y + 80, c_black, c_black, c_black, c_black, true);
			}
			else
			if (place_brush_size == 2)
			&& (can_make_place_brush_size_bigger)
			{
				draw_rectangle_color(x - 48, y - 48, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
			}
			else
			if (place_brush_size == 1)
			&& (can_make_place_brush_size_bigger)
			{
				draw_rectangle_color(x - 16, y - 16, x + 48, y + 48, c_black, c_black, c_black, c_black, true);
			}
			else
			{
				if (mask_index == spr_2x2_block)
				{
					draw_rectangle_color(x - 24, y - 24, x + 24, y + 24, c_black, c_black, c_black, c_black, true);
				}
				else
				{
					draw_rectangle_color(x - 16, y - 16, x + 16, y + 16, c_black, c_black, c_black, c_black, true);
				}
			}
			#endregion /* Draw a rectangle around the placable objects END */
			
		}
		#endregion /* Default Cursor END */
		
		if (global.controls_used_for_navigation == "gamepad")
		|| (navigate_camera_with_arrowkeys)
		{
			scr_draw_mouse_cursor_sprite();
		}
		
	}
	#endregion /* Position the Cursor END */
	
	#region /* Pause virtual key */
	if (os_type == os_ios)
	|| (os_type == os_android)
	{
		virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /* Pause virtual key */
		if (keyboard_check(vk_escape))
		{
			draw_sprite_ext(spr_virtual_key_pause, 0, cam_x + 1100 - 64, cam_y + 32, 0.9, 0.9, 0, c_gray, 0.5);
		}
		else
		{
			draw_sprite_ext(spr_virtual_key_pause, 0, cam_x + 1100 - 64, cam_y + 32, 1, 1, 0, c_white, 0.5);
		}
	}
	#endregion /* Pause virtual key END */
	
}