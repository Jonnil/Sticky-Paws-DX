if (global.actually_play_edited_level == false)
{
	if (place_meeting(x, y, obj_leveleditor_placed_object))
	&& (instance_nearest(x, y, obj_leveleditor_placed_object).draw_rotate_arrow == true)
	{
		var draw_rotate_arrow_scale = scr_wave(0.5, 0.4, 0.5, 0);
		switch(instance_nearest(x, y, obj_leveleditor_placed_object).object)
		{
			case level_object_id.id_spikes_emerge_block:
			case level_object_id.id_spikes_emerge_block_offset_time:
			case level_object_id.id_spikes_emerge_block_down:
			case level_object_id.id_spikes_emerge_block_down_offset_time:
			case level_object_id.id_spikes_emerge_block_left:
			case level_object_id.id_spikes_emerge_block_left_offset_time:
			case level_object_id.id_spikes_emerge_block_right:
			case level_object_id.id_spikes_emerge_block_right_offset_time:
				draw_sprite_ext(spr_rotate_arrow, image_index, x, y, draw_rotate_arrow_scale, draw_rotate_arrow_scale, instance_nearest(x, y, obj_leveleditor_placed_object).draw_angle + 90, image_blend, image_alpha);
				break;
			default:
				draw_sprite_ext(spr_rotate_arrow, image_index, x, y, draw_rotate_arrow_scale, draw_rotate_arrow_scale, instance_nearest(x, y, obj_leveleditor_placed_object).draw_angle, image_blend, image_alpha);
		}
	}
	
	#region /* Draw a cursor in the center of the screen, so level designer can visually see where the center of the screen is */
	if (quit_level_editor == false)
	{
		draw_circle_color(view_center_x, view_center_y, 3, c_black, c_white, false);
	}
	#endregion /* Draw a cursor in the center of the screen, so level designer can visually see where the center of the screen is END */
	
	#region /* Draw where player will do playtesting from */
	if (global.sprite_player_stand[4] > 0) /* Display Player 4 behind Player 3 */
	&& (quit_level_editor == false)
	{
		if (pressing_play_timer > 0)
		&& (global.player4_can_play)
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
		&& (global.player3_can_play)
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
		&& (global.player2_can_play)
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
		&& (global.player1_can_play)
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
	
	draw_set_alpha(0.5);
	draw_rectangle_color(cam_x - 999, cam_y - 999, 0, cam_y + cam_height, c_black, c_black, c_black, c_black, false); /* Left Black Rectangle */
	draw_rectangle_color(1, cam_y - 999, cam_x + cam_width + 999, 0, c_black, c_black, c_black, c_black, false);  /* Top Black Rectangle */
	draw_set_alpha(1);
	
	draw_rectangle_color(0, 0, obj_level_width.x - 16, obj_level_height.y -16, c_red, c_red, c_red, c_red, true);  /* Border around entire level */
	
	if (quit_level_editor <= 0)
	{
		draw_set_alpha(selected_menu_alpha);
		draw_rectangle_color(cam_x, cam_y, cam_x + cam_width, cam_y + 128, c_black, c_black, c_black, c_black, false);
	}
	
	#region /* List of Placable Objects */
	if (global.world_editor == false)
	&& (quit_level_editor <= 0)
	&& (selected_menu_alpha > 0)
	{
		order_index = 0;
		unlock_index = 0;
		
		#region /* Terrain Objects */
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall, true, spr_wall, spr_wall, 0, 1, 0, c_white,,,,,"Default Wall");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_dirt, true, spr_wall_dirt, spr_wall, + 64, 1, 0, c_white,,,,,"Dirt");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_glass, true, spr_wall_glass, spr_wall, + 64, 1, 0, c_white,,,,,"Glass");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_grass, true, spr_wall_grass, spr_wall, + 64, 1, 0, c_white,,,,,"Grass");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_gravel, true, spr_wall_gravel, spr_wall, + 64, 1, 0, c_white,,,,,"Gravel");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_metal, true, spr_wall_metal, spr_wall, + 64, 1, 0, c_white,,,,,"Metal");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_stone, true, spr_wall_stone, spr_wall, + 64, 1, 0, c_white,,,,,"Stone");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_wood, true, spr_wall_wood, spr_wall, + 64, 1, 0, c_white,,,,,"Wood");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_black_wall, true, spr_black_wall, spr_wall, + 64, 1, 0, c_white,,,,,"Black Wall");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_spikes, true, spr_spikes, spr_wall, + 64, 1, 0, c_white,,,,,"Spikes");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_semisolid_platform, true, spr_semisolid_platform, spr_wall, + 64, 1, 0, c_white,,,,,"Semisolid Platform");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_brick_block, true, spr_brick_block, spr_wall, + 64, 1, 0, c_white,,,,,"Lamp Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_question_block, true, spr_question_block, spr_wall, + 64, 1, 0, c_white,,,,,"? Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_hard_block, true, spr_hard_block, spr_wall, + 64, 1, 0, c_white,,,,,"Hard Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_falling_block, true, spr_falling_block, spr_wall, + 64, 1, 0, c_white,,,,,"Falling Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_falling_block_long, true, spr_falling_block_long, spr_cardboard, + 64, 1, 0, c_white, 0, -16,,,"Falling Block Long");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_cloud_block, true, spr_cloud_block, spr_wall, + 64, 1, 0, c_white,,,,,"Cloud Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_ice_block, true, spr_ice_block, spr_wall, + 64, 1, 0, c_white,,,,,"Ice Block");
		#endregion /* Terrain Objects END */
		
		#region /* Item Objects */
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_basic_collectible, true, global.resource_pack_sprite_basic_collectible, spr_wall, + 64, 1, 0, c_white,,,,,"Fish");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_big_collectible, false, global.resource_pack_sprite_big_collectible, spr_wall, 64, 1, 0, c_white,,,,,"Big Fish");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_heart, true, spr_heart, spr_wall, + 64, 1, 0, c_white,,,,,"Heart Balloon - Gives you one extra hit");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_invincibility_powerup, true, global.resource_pack_sprite_invincibility_powerup, spr_wall, + 64, 1, 0, c_white,,,,,"Invincibility");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_one_up, true, sprite_lives_icon, spr_wall, + 64, 1, 0, c_white,,,,,"Extra Life");
		#endregion /* Item Objects END */
		
		#region /* Enemy Objects */
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_basic_enemy, true, sprite_basic_enemy, spr_wall, + 64, 1, 0, c_white,,,,,"Rat");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_enemy_bowlingball, true, sprite_enemy_bowlingball, spr_wall, + 64, 1, 0, c_white,,,,,"Bowlingball Rat");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_big_stationary_enemy, true, sprite_big_stationary_enemy, spr_wall, + 64, 1, 0, c_white,,,,,"Big Rat");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_boss, false, spr_boss_stand, spr_wall, + 64, 0.5, 0, c_white,,,,,"Mousette");
		#endregion /* Enemy Objects END */
		
		#region /* Gizmo Objects */
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_blaster, true, global.resource_pack_sprite_blaster, spr_wall, + 64, 1, 0, c_white, -16,,,,"Rat Blaster");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_door, false, spr_door, spr_wall, + 64, 1, 0, c_white, -16,,,,"Door");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_spring, false, spr_spring, spr_wall, + 64, 1, 0, c_white,,,,,"Spring");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_ladder, true, spr_ladder, spr_wall, + 64, 1, 0, c_white,,,,,"Ladder");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_arrow_sign, false, spr_arrow_sign, spr_wall, + 64, 1, 0, c_white,,,,,"Arrow Sign");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_checkpoint, false, spr_checkpoint, spr_wall, + 64, 1, 0, c_white, -32,,,,"Checkpoint");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_spikes_emerge_block, true, spr_spikes_emerge_block, spr_wall, + 64, 1, 0, c_white,,,,,"Emerging Spikes");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_oneway, false, spr_oneway, spr_wall, + 64, 1, 0, c_white, -16,,,,"One-Way Wall");
		#endregion /* Gizmo Objects END */
		
		#region /* Special Items */
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard_block, true, spr_cardboard_block, spr_wall, + 64, 1, 0, c_white,,,,,"Carbdoard Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard, true, spr_cardboard, spr_cardboard, + 64, 0.75, 0, c_white, 0, -8,,,"Cardboard");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_cardboard_long, true, spr_cardboard_long, spr_cardboard_long, + 64, 0.5, 0, c_white, 0, -16,,,"Long Cardboard");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_bump_in_ground, true, spr_bump_in_ground, spr_wall, + 64, 1, 0, c_white, -16,,,,"Bump in Ground");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_jump_panel, true, spr_wall_jump_panel, spr_wall, + 64, 1.5, 0, c_white, 0, +16,,,"Wall Jump Panel - When a character doesn't have the wall jump ability, lets even these characters wall jump");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_wall_climb_panel, true, spr_wall_climb_panel, spr_wall, + 64, 1.5, 0, c_white, 0, +16,,,"Wall Climb Panel - When a character doesn't have the wall climb ability, lets even these characters wall climb");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_melon_block, true, spr_melon_block, spr_wall, + 64, 1, 0, c_white,,,,,"Melon Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_horizontal_rope, true, spr_horizontal_rope, spr_wall, + 64, 1, 0, c_white,,,,,"Horizontal Rope");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_water, false, spr_water_surface, spr_wall, + 64, 1, 0, c_white,,,,,"Water");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_air_bubbles_spawner, true, spr_air_bubbles_spawner, spr_wall, + 64, 1, 0, c_white,,,,,"Air Bubbles - Some characters needs air when swimming underwater");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_slow, false, spr_water_level_change_slow, spr_wall, + 64, 1, 0, c_white,,,,,"Change Water Level Slow");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_fast, false, spr_water_level_change_fast, spr_wall, + 64, 1, 0, c_white,,,,,"Change Water Level Fast");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_water_level_change_faster, false, spr_water_level_change_faster, spr_wall, + 64, 1, 0, c_white,,,,,"Change Water LEvel Faster");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_clipped_shirt, true, spr_clipped_shirt, spr_wall, + 64, 1, 0, c_white,,,,,"Clipped Clothes");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_bucket, true, spr_bucket, spr_wall, + 64, 1, 0, c_white,,,,,"Bucket - Let clothes drop into the bucket to get rewards");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_bird, true, spr_bird, spr_wall, + 64, 1, 0, c_white,,,,,"Bird");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_sign_crouch, true, spr_sign_crouch, spr_wall, + 64, 0.5, 0, c_white,,,,,"Tutorial Signs");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_boss_barrier, true, spr_boss_barrier, spr_wall, + 64, 1, 0, c_white,,,,,"Boss Barrier - This block dissapears when Mousette is defeated");
		var num_cake_stealing_enemy = order_index; scr_draw_level_editor_placable_object(num_cake_stealing_enemy, level_object_id.id_cake_stealing_enemy, false, global.resource_pack_sprite_cake, spr_wall, + 64, 1, 0, c_white, -16, 0, 1, 0, "Cake Stealing Rat");scr_draw_level_editor_placable_object(num_cake_stealing_enemy, level_object_id.id_cake_stealing_enemy, false, sprite_basic_enemy, spr_wall, + 64, 1, 0, c_white);
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_artwork_collection, false, spr_artwork_collection, spr_wall, + 64, 1, 0, c_white,,,,,"Artwork Collection");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_eye_block, true, global.resource_pack_sprite_eye_block, spr_wall, + 64, 1, 0, c_white,,,,,"Eye Block");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_npc, false, spr_npc, spr_wall, + 64, 1, 0, c_white,,,,,"NPC - This object is unfinished!!!");
		scr_draw_level_editor_placable_object(order_index, level_object_id.id_ring, false, spr_ring, spr_wall, + 64, 1, 0, c_white,,,,,"Ring - Swing with long tongue on this ring");
		#endregion /* Special Items END */
		
		scr_draw_text_outlined(view_center_x, cam_y + 114, l10n_text(current_object_description), global.default_text_size * 0.75, noone, c_white, selected_menu_alpha);
		
		total_number_of_objects = order_index - 1; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
	}
	else
	if (global.world_editor == false)
	&& (quit_level_editor <= 0)
	&& (selected_menu_alpha > 0)
	{
		total_number_of_objects = 6; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
		if (selected_object == 0)
		{
			place_object = world_object_id.id_wall;
			can_make_place_brush_size_bigger = true;
			sprite_index = spr_wall;
			mask_index = spr_wall;
		}
		if (selected_object == 1)
		{
			place_object = world_object_id.id_level;
			can_make_place_brush_size_bigger = false;
			draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 0.5);
			draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 0.5);
			sprite_index = spr_noone; 
			mask_index = spr_wall;
		}
		if (selected_object == 2)
		{
			place_object = world_object_id.id_exit;
			can_make_place_brush_size_bigger = false;
			sprite_index = spr_map_exit;
			mask_index = spr_wall;
		}
		if (selected_object == 3)
		{
			place_object = world_object_id.id_right_down;
			can_make_place_brush_size_bigger = false;
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, c_white, 0.5);
			sprite_index = spr_noone;
			mask_index = spr_wall;
		}
		if (selected_object == 4)
		{
			place_object = world_object_id.id_up_right;
			can_make_place_brush_size_bigger = false;
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, c_white, 0.5);
			sprite_index = spr_noone;
			mask_index = spr_wall;
		}
		if (selected_object == 5)
		{
			place_object = world_object_id.id_up_left;
			can_make_place_brush_size_bigger = false;
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, c_white, 0.5);
			sprite_index = spr_noone;
			mask_index = spr_wall;
		}
		if (selected_object == 6)
		{
			place_object = world_object_id.id_left_down;
			can_make_place_brush_size_bigger = false;
			draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, c_white, 0.5);
			sprite_index = spr_noone;
			mask_index = spr_wall;
		}
	}
	#endregion /* List of Placable Objects END */
	
	#region /* Draw Grid */
	if (quit_level_editor <= 0)
	{
		var grid_offset = 16; /* If the grid should have an offset from the top_left corner of the screen, normally this should be 16 */
		draw_set_alpha(grid_alpha);
		
		#region /* Draw Horizontal Line in the Grid */
		for(var i = 0; i < cam_x + cam_width; i += global.grid_hsnap)
		{
			draw_line_color(i + grid_offset, - 16 + grid_offset, i + grid_offset, room_height + 16 + grid_offset, c_white, c_white);
		}
		#endregion /* Draw Horizontal Line in the Grid END */
		
		#region /* Draw Vertical Line in the Grid */
		for(var i = 0; i < cam_y + cam_height; i += global.grid_vsnap)
		{
			draw_line_color(- 16 + grid_offset, i + grid_offset, room_width + 16 + grid_offset, i + grid_offset, c_white, c_white);
		}
		#endregion /* Draw Vertical Line in the Grid END */
		
		draw_set_alpha(1);
	}
	
	#endregion /* Draw Grid END */
	
	#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
	if (pause == false)
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
		
		#region /* Draw an arrow pointing to currently selected object */
		draw_set_color(c_black);
		draw_set_alpha(selected_menu_alpha);
		draw_arrow(view_center_x, cam_y + 16 - 8, view_center_x, cam_y + 16 + 8, 40);
		draw_set_color(c_white);
		draw_arrow(view_center_x, cam_y + 16 - 8, view_center_x, cam_y + 16 + 8, 30);
		draw_set_color(c_black);
		draw_arrow(view_center_x, cam_y + 110 - 16 + 8, view_center_x, cam_y + 110 - 16 - 8, 40);
		draw_set_color(c_white);
		draw_arrow(view_center_x, cam_y + 110 - 16 + 8, view_center_x, cam_y + 110 - 16 - 8, 30);
		draw_set_alpha(1);
		#endregion /* Draw an arrow pointing to currently selected object END */
		
	}
	#endregion /* Select Object Menu END */
	
	#region /* Position the Cursor */
	if (quit_level_editor <= 0)
	{
		
		#region /* Fill Cursor */
		if (fill_mode)
		&& (erase_mode == false)
		&& (scroll_view == false)
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
		&& (scroll_view == false)
		&& (pause == false)
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
		if (scroll_view == false)
		&& (drag_object == false)
		&& (fill_mode == false)
		&& (pause == false)
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
		
		if (global.controls_used_for_menu_navigation == "controller")
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