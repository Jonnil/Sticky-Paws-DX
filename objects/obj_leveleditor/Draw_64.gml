if (global.actually_play_edited_level == false)
{
	
	if (quit_level_editor == false)
	{
		
		#region /* List of Placable Objects */
		if (quit_level_editor <= 0)
		{
			draw_set_alpha(selected_menu_alpha);
			draw_rectangle_color(0, 0, display_get_gui_width(), 128 + 64, c_black, c_black, c_black, c_black, false);
		}
		
		if (global.world_editor == false)
		&& (quit_level_editor <= 0)
		&& (selected_menu_alpha > 0)
		{
			order_index = 0;
			unlock_index = 0;
			
			#region /* Terrain Objects */
			if (current_object_category == "terrain")
			{
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL, true, spr_wall, spr_wall, 0, 1, 0, c_white,,,,,"Default Wall");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_DIRT, true, spr_wall_dirt, spr_wall, + 100, 1, 0, c_white,,,,,"Dirt");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_GLASS, true, spr_wall_glass, spr_wall, + 100, 1, 0, c_white,,,,,"Glass");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_GRASS, true, spr_wall_grass, spr_wall, + 100, 1, 0, c_white,,,,,"Grass");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_GRAVEL, true, spr_wall_gravel, spr_wall, + 100, 1, 0, c_white,,,,,"Gravel");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_METAL, true, spr_wall_metal, spr_wall, + 100, 1, 0, c_white,,,,,"Metal");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_STONE, true, spr_wall_stone, spr_wall, + 100, 1, 0, c_white,,,,,"Stone");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_WOOD, true, spr_wall_wood, spr_wall, + 100, 1, 0, c_white,,,,,"Wood");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BLACK_WALL, true, spr_black_wall, spr_wall, + 100, 1, 0, c_white,,,,,"Black Wall");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SPIKES, true, spr_spikes, spr_wall, + 100, 1, 0, c_white,,,,,"Spikes");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM, true, spr_semisolid_platform, spr_wall, + 100, 1, 0, c_white,,,,,"Semisolid Platform");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BRICK_BLOCK, true, spr_brick_block, spr_wall, + 100, 1, 0, c_white,,,,,"Lamp Block", "Can be destroyed by player jumping underneath them if there is no items inside\nClick on a placed Lamp Block to set its item!");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, true, spr_question_block, spr_wall, + 100, 1, 0, c_white,,,,,"? Block", "Can't be destroyed by player jumping underneath them\nClick on a placed ? Block to set its item!");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_HARD_BLOCK, true, spr_hard_block, spr_wall, + 100, 1, 0, c_white,,,,,"Hard Block");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_FALLING_BLOCK, true, spr_falling_block, spr_wall, + 100, 1, 0, c_white,,,,,"Falling Block", "Falls shortly after you stand on them for too long");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG, true, spr_falling_block_long, spr_cardboard, + 100, 1, 0, c_white, 0, -16,,,"Falling Block Long", "Falls shortly after you stand on them for too long");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK, true, spr_falling_block, spr_wall, + 100, 1, 0, c_white,,,,,"Instant Falling Block", "Falls shortly after you stand on them for too long", 1);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG, true, spr_falling_block_long, spr_cardboard, + 100, 1, 0, c_white, 0, -16,,,"Instant Falling Block Long", "Falls shortly after you stand on them for too long", 1);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK, true, spr_falling_block, spr_wall, + 100, 1, 0, c_white,,,,,"Wood Falling Block", "Falls shortly after you stand on them for too long", 2);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG, true, spr_falling_block_long, spr_cardboard, + 100, 1, 0, c_white, 0, -16,,,"Wood Falling Block Long", "Falls shortly after you stand on them for too long", 2);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK, true, spr_falling_block, spr_wall, + 100, 1, 0, c_white,,,,,"Stone Falling Block", "Falls shortly after you stand on them for too long", 3);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG, true, spr_falling_block_long, spr_cardboard, + 100, 1, 0, c_white, 0, -16,,,"Stone Falling Block Long", "Falls shortly after you stand on them for too long", 3);
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, true, spr_cloud_block, spr_wall, + 100, 1, 0, c_white,,,,,"Cloud Block");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ICE_BLOCK, true, spr_ice_block, spr_wall, + 100, 1, 0, c_white,,,,,"Ice Block");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL, true, spr_enemy_only_wall, spr_wall, + 100, 1, 0, c_white,,,,,"Enemy Only Wall", "Only enemies can collide with this wall. Player will pass trough");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK, true, spr_cardboard_block, spr_wall, + 100, 1, 0, c_white,,,,,"Carbdoard Block");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CARDBOARD, true, spr_cardboard, spr_cardboard, + 100, 0.75, 0, c_white, 0, -8,,,"Cardboard");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, true, spr_cardboard_long, spr_cardboard_long, + 100, 0.5, 0, c_white, 0, -16,,,"Long Cardboard");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_MELON_BLOCK, true, spr_melon_block, spr_wall, + 100, 1, 0, c_white,,,,,"Melon Block", "Can only be destroyed with a ground-pound");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BOSS_BARRIER, true, spr_boss_barrier, spr_wall, + 100, 1, 0, c_white,,,,,"Boss Barrier", "This block dissapears when Mousette is defeated");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_EYE_BLOCK, true, global.resource_pack_sprite_eye_block, spr_wall, + 100, 1, 0, c_white,,,,,"Eye Block", "This block is only solid when it can see its prey");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1, true, spr_appear_block, spr_wall, + 100, 1, 0, c_yellow,,,,,"Appear Block 1", "This block appears and disappears in cycles");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2, true, spr_appear_block, spr_wall, + 100, 1, 0, c_aqua,,,,,"Appear Block 2", "This block appears and disappears in cycles");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3, true, spr_appear_block, spr_wall, + 100, 1, 0, c_red,,,,,"Appear Block 3", "This block appears and disappears in cycles");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4, true, spr_appear_block, spr_wall, + 100, 1, 0, c_purple,,,,,"Appear Block 4", "This block appears and disappears in cycles");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5, true, spr_appear_block, spr_wall, + 100, 1, 0, c_lime,,,,,"Appear Block 5", "This block appears and disappears in cycles");
			}
			#endregion /* Terrain Objects END */
			
			#region /* Decoration Objects */
			if (current_object_category == "decoration")
			{
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ARROW_SIGN, false, spr_arrow_sign, spr_wall, + 100, 1, 0, c_white,,,,,"Arrow Sign");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BIRD, true, spr_bird, spr_wall, + 100, 1, 0, c_white,,,,,"Bird");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SIGN_CROUCH, true, spr_sign_crouch, spr_wall, + 100, 0.5, 0, c_white,,,,,"Tutorial Signs", "Teach the player what abilities they have");
			}
			#endregion /* Decoration Objects END */
			
			#region /* Item Objects */
			if (current_object_category == "item")
			{
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, true, global.resource_pack_sprite_basic_collectible, spr_wall, + 100, 1, 0, c_white,,,,,"Fish", "One of the most fundemental objects to include in a level!\nFish usually come in small groups and can also be used to indicate a path");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, false, global.resource_pack_sprite_big_collectible, spr_wall, + 100, 1, 0, c_white,,,,,"Big Fish", "A collectible that can be a good way to make your level more fun");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_HEART, true, spr_heart, spr_wall, + 100, 1, 0, c_white,,,,,"Heart Balloon", "Gives you one extra hit");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP, true, global.resource_pack_sprite_invincibility_powerup, spr_wall, + 100, 1, 0, c_white,,,,,"Invincibility", "Temporarily turns you invincible.\nDuring the power-up's duration you become invulnerable to enemy attacks\nand will defeat almost any enemy you collide with!");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ONE_UP, true, sprite_lives_icon, spr_wall, + 100, 1, 0, c_white,,,,,"Extra Life", "Adds 1 extra life to the life counter");
			}
			#endregion /* Item Objects END */
			
			#region /* Enemy Objects */
			if (current_object_category == "enemy")
			{
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BASIC_ENEMY, true, sprite_basic_enemy, spr_wall, + 100, 1, 0, c_white,,,,,"Rat");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL, true, sprite_enemy_bowlingball, spr_wall, + 100, 1, 0, c_white,,,,,"Bowlingball Rat");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY, true, sprite_big_stationary_enemy, spr_wall, + 100, 1, 0, c_white,,,,,"Big Rat");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BOSS, false, spr_boss_stand, spr_wall, + 100, 0.5, 0, c_white,,,,,"Mousette");
			}
			#endregion /* Enemy Objects END */
			
			#region /* Gizmo Objects */
			if (current_object_category == "gizmo")
			{
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BLASTER, true, global.resource_pack_sprite_blaster, spr_wall, + 100, 1, 0, c_white, -16,,,,"Rat Blaster");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_DOOR, false, spr_door, spr_wall, + 100, 1, 0, c_white, -16,,,,"Door", "Teleports you to another area when player enters door");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WARP_BOX, false, spr_warp_box, spr_wall, + 100, 1, 0, c_white,,,,,"Warp Box", "Instantly teleports you to another area\nRegular Warp Boxes can be used many times\nBroken Warp Boxes dissapears after one use");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SPRING, false, spr_spring, spr_wall, + 100, 1, 0, c_white,,,,,"Spring");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_LADDER, true, spr_ladder, spr_wall, + 100, 1, 0, c_white,,,,,"Ladder");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CHECKPOINT, false, spr_checkpoint, spr_wall, + 100, 1, 0, c_white, -32,,,,"Checkpoint");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK, true, spr_spikes_emerge_block, spr_wall, + 100, 1, 0, c_white,,,,,"Emerging Spikes");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ONEWAY, false, spr_oneway, spr_wall, + 100, 1, 0, c_white, -16,,,,"One-Way Wall");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, true, spr_bump_in_ground, spr_wall, + 100, 1, 0, c_white, -16,,,,"Bump in Ground");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, true, spr_wall_jump_panel, spr_wall, + 100, 1.5, 0, c_white, 0, +16,,,"Wall Jump Panel", "When a character doesn't have the wall jump ability lets even these characters wall jump");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL, true, spr_wall_climb_panel, spr_wall, + 100, 1.5, 0, c_white, 0, +16,,,"Wall Climb Panel", "When a character doesn't have the wall climb ability lets even these characters wall climb");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, true, spr_horizontal_rope, spr_wall, + 100, 1, 0, c_white,,,,,"Horizontal Rope");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WATER, false, spr_water_surface, spr_wall, + 100, 1, 0, c_white,,,,,"Water");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_LAVA, false, spr_lava_surface, spr_wall, + 100, 1, 0, c_white,,,,,"Lava");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER, true, spr_air_bubbles_spawner, spr_wall, + 100, 1, 0, c_white,,,,,"Air Bubbles", "Some characters needs air when swimming underwater");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW, false, spr_water_level_change_slow, spr_wall, + 100, 1, 0, c_white,,,,,"Change Water Level Slow");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST, false, spr_water_level_change_fast, spr_wall, + 100, 1, 0, c_white,,,,,"Change Water Level Fast");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER, false, spr_water_level_change_faster, spr_wall, + 100, 1, 0, c_white,,,,,"Change Water LEvel Faster");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, true, spr_clipped_shirt, spr_wall, + 100, 1, 0, c_white,,,,,"Clipped Clothes");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BUCKET, true, spr_bucket, spr_wall, + 100, 1, 0, c_white,,,,,"Bucket", "Let clothes drop into the bucket to get rewards");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, false, spr_artwork_collection, spr_wall, + 100, 1, 0, c_white,,,,,"Artwork Collection");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_SIGN_READABLE, false, spr_sign_readable, spr_wall, + 100, 1, 0, c_white,,,,,"Readable Sign", "Click on the placed sign in the editor to edit what it should say!");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_RING, false, spr_ring, spr_wall, + 100, 1, 0, c_white,,,,,"Ring", "Swing with long tongue on this ring");
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, false, global.resource_pack_sprite_cake, spr_wall, + 100, 1, 0, c_white,,,,, "Cake Rat", "This rat stole your cake! Let the player try to catch them before the end of the level\nThe player will chase this rat until the very end of the game");
			}
			#endregion /* Gizmo Objects END */
			
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 114 + 64, l10n_text(current_object_name), global.default_text_size * 0.75, noone, c_white, selected_menu_alpha);
			
			total_number_of_objects = order_index - 1; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
			if (selected_object > total_number_of_objects)
			{
				selected_object = total_number_of_objects;
				selected_object_menu_actual_x =- 100 *total_number_of_objects;
			}
		}
		else
		if (global.world_editor == false)
		&& (quit_level_editor <= 0)
		&& (selected_menu_alpha > 0)
		{
			total_number_of_objects = 6; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
			if (selected_object == 0)
			{
				place_object = WORLD_OBJECT_ID.ID_WALL;
				can_make_place_brush_size_bigger = true;
				sprite_index = spr_wall;
				mask_index = spr_wall;
			}
			if (selected_object == 1)
			{
				place_object = WORLD_OBJECT_ID.ID_LEVEL;
				can_make_place_brush_size_bigger = false;
				draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 0.5);
				draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 0.5);
				sprite_index = spr_noone; 
				mask_index = spr_wall;
			}
			if (selected_object == 2)
			{
				place_object = WORLD_OBJECT_ID.ID_EXIT;
				can_make_place_brush_size_bigger = false;
				sprite_index = spr_map_exit;
				mask_index = spr_wall;
			}
			if (selected_object == 3)
			{
				place_object = WORLD_OBJECT_ID.ID_RIGHT_DOWN;
				can_make_place_brush_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 4)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_RIGHT;
				can_make_place_brush_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 5)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_LEFT;
				can_make_place_brush_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 6)
			{
				place_object = WORLD_OBJECT_ID.ID_LEFT_DOWN;
				can_make_place_brush_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
		}
		
		#region /* Draw an arrow pointing to currently selected object */
		if (selected_menu_alpha > 0)
		{
			draw_set_alpha(selected_menu_alpha);
			draw_set_color(c_white);
			draw_arrow(display_get_gui_width() * 0.5, 16 - 8 + 64 + scr_wave(0, -8, 1), display_get_gui_width() * 0.5, 16 + 8 + 64 + scr_wave(0, -8, 1), 30);
			draw_arrow(display_get_gui_width() * 0.5, 110 - 16 + 8 + 64 + scr_wave(0, 8, 1), display_get_gui_width() * 0.5, 110 - 16 - 8 + 64 + scr_wave(0, 8, 1), 30);
			draw_set_alpha(1);
		}
		#endregion /* Draw an arrow pointing to currently selected object END */
		
		#endregion /* List of Placable Objects END */
		
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		scr_draw_text_outlined(16, 32, l10n_text("View X") + ": " + string(round(camera_get_view_x(view_camera[0]))) + "\n" + l10n_text("View Y") + ": " + string(round(camera_get_view_y(view_camera[0]))), global.default_text_size, c_black, c_white, 1);
		
		/* Draw a cursor in the center of the screen, so level designer can visually see where the center of the screen is */
		if (modify_object_menu == false)
		{
			draw_circle_color(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 3, c_black, c_white, false);
		}
		
		if (selected_menu_alpha < 0.1)
		{
			
			#region /* At top of screen, show part limit */
			if (global.part_limit >= 4000)
			{
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1));
			}
			else
			{
				global.part_limit_text_alpha = lerp(global.part_limit_text_alpha, 0, 0.05);
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 80, l10n_text("Part Limit") + ": " + string(global.part_limit) + "/4000", global.default_text_size, c_black, c_white, global.part_limit_text_alpha);
			}
			#endregion /* At top of screen, show part limit END */
			
			#region /* At top of screen, show entity limit */
			if (global.part_limit_entity >= 100)
			{
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_red, scr_wave(0, 1, 1));
			}
			else
			{
				global.part_limit_entity_text_alpha = lerp(global.part_limit_entity_text_alpha, 0, 0.05);
				draw_set_halign(fa_middle);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 112, l10n_text("Entity Limit") + ": " + string(global.part_limit_entity) + "/100", global.default_text_size, c_black, c_white, global.part_limit_entity_text_alpha);
			}
			#endregion /* At top of screen, show entity limit END */
			
		}
		else
		{
			global.part_limit_text_alpha = 0;
			global.part_limit_entity_text_alpha = 0;
		}
		
		if (erase_mode)
		{
			var width = 10;
			draw_set_alpha(0.5);
			draw_rectangle_color(0, width + 1, width, get_window_height - (width + 1), c_blue, c_blue, c_blue, c_blue, false); /* Left */
			draw_rectangle_color(get_window_width - width, 0, room_width * 2, get_window_height - (width + 1), c_blue, c_blue, c_blue, c_blue, false); /* Right */
			draw_rectangle_color(0, 0, get_window_width - (width + 1), width, c_blue, c_blue, c_blue, c_blue, false); /* Top */
			draw_rectangle_color(0, get_window_height - width, display_get_gui_width(), display_get_gui_height(), c_blue, c_blue, c_blue, c_blue, false); /* Bottom */
			draw_set_alpha(1);
		}
		
		#region /* Pause Menu */
		if (pause)
		&& (quit_level_editor <= 0)
		{
			welcome_to_level_editor = 0; /* Close the help menu when pausing the game */
			
			#region /* Make Background Darker */
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			#endregion /* Make Background Darker END */
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			
			#region /* Make the menu invisible when entering the options menu */
			if (menu == "continue")
			|| (menu == "options")
			|| (menu == "level_editor_options")
			|| (menu == "generate_level_map")
			|| (menu == "open_custom_levels_folder")
			|| (menu == "level_editor_upload")
			|| (menu == "quit")
			{
				
				#region /* Only quit the pause menu when you're in the first pause menu */
				if (keyboard_check_pressed(vk_escape))
				|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
				|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
				|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
				|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
				|| (gamepad_button_check_pressed(4, gp_start))
				|| (key_b_pressed)
				{
					if (input_key == false)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
				#endregion /* Only quit the pause menu when you're in the first pause menu END */
				
				#region /* Show what version of the game the level was first created in */
				/* This should make it easier to port old levels to new game versions */
				/* Showing the original version number makes it easier to pinpoint what changes happened from one version to another */
				if (global.level_name != "")
				{
					ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				}
				if (ini_key_exists("info", "first_created_on_version"))
				{
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					if (string_digits(ini_read_string("info", "first_created_on_version", "v" + string(scr_get_build_date()))) < string_digits(scr_get_build_date()))
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32 - 32, l10n_text("Level made in old version"), global.default_text_size * 0.75, c_black, c_white, 1);
					}
					else
					if (string_digits(ini_read_string("info", "first_created_on_version", "v" + string(scr_get_build_date()))) > string_digits(scr_get_build_date()))
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32 - 32, l10n_text("Level made in new version"), global.default_text_size * 0.75, c_black, c_white, 1);
					}
					scr_draw_text_outlined(get_window_width * 0.5, get_window_height - 32, l10n_text("First created on version") + ": " + ini_read_string("info", "first_created_on_version", "v" + string(scr_get_build_date())), global.default_text_size, c_black, c_white, 1);
				}
				ini_close();
				#endregion /* Show what version of the game the level was first created in END */
			
				#region /* Draw if level have been Clear Checked on top of screen */
				ini_open(working_directory + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
				
				var clear_check = ini_read_string("info", "clear_check", false);
				
				if (clear_check)
				&& (ini_key_exists("info", "clear_check"))
				{
					draw_set_halign(fa_left);
					draw_set_valign(fa_middle);
					scr_draw_text_outlined(64, 32, string(l10n_text("Clear Checked")), global.default_text_size * scr_wave(1, 1.1, 1, 0), c_white, c_black, 1);
					draw_sprite_ext(spr_checkpoint, 1, 32, 32, scr_wave(0.4, 0.5, 1, 0), scr_wave(0.4, 0.5, 1, 0), 0, c_white, 1);
				}
				ini_close();
				#endregion /* Draw if level have been Clear Checked on top of screen END */
				
				in_settings = false;
				
				#region /* If menu is on continue */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 - 126, l10n_text("Continue"), "continue", noone);
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 - 126 + 21, 1, 1, 0, c_white, 1);
				
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 - 126, get_window_width * 0.5 + 185, get_window_height * 0.5 -84))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
				}
				if (menu == "continue")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "quit";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "options";
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu_delay = 3;
							quit_level_editor = false;
							can_input_level_name = false;
							pause = false;
						}
					}
				}
				#endregion /* If menu is on continue END */
			
				#region /* If menu is on options */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 -84, l10n_text("Options"), "options", noone);
				draw_sprite_ext(spr_icons_cogwheel, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 -84 + 21, 1, 1, 0, c_white, 1);
			
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 -84, get_window_width * 0.5 + 185, get_window_height * 0.5 - 42))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					quit_level_editor = false;
					can_input_level_name = false;
					pause = true;
					can_navigate = true;
					in_settings = true;
					can_navigate_settings_sidebar = true;
					menu = noone;
					menu_delay = 3;
				}
			
				if (menu == "options")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "continue";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "level_editor_options";
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							quit_level_editor = false;
							can_input_level_name = false;
							pause = true;
							can_navigate = true;
							in_settings = true;
							can_navigate_settings_sidebar = true;
							menu = noone;
							menu_delay = 3;
						}
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
				#endregion /* If menu is on options END */
				
				#region /* If menu is on level editor options */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 -42, l10n_text("Level Options"), "level_editor_options", "back_level_editor_options");
				
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 -42, get_window_width * 0.5 + 185, get_window_height * 0.5))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					quit_level_editor = false;
					can_input_level_name = false;
					pause = true;
					can_navigate = true;
					in_settings = false;
					can_navigate_settings_sidebar = false;
					menu = "back_level_editor_options";
					menu_delay = 3;
				}
				
				if (menu == "level_editor_options")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "options";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						if (global.enable_options_for_pc)
						{
							menu = "generate_level_map";
						}
						else
						{
							menu = "level_editor_upload";
						}
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							quit_level_editor = false;
							can_input_level_name = false;
							pause = true;
							can_navigate = true;
							in_settings = false;
							can_navigate_settings_sidebar = false;
							menu = "back_level_editor_options";
							menu_delay = 3;
						}
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
				#endregion /* If menu is on level editor options END */
				
				#region /* If menu is on generate level map */
				if (global.enable_options_for_pc)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Generate Level Map"), "generate_level_map", "generate_level_map_yes");
					
					if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42))
					&& (global.controls_used_for_menu_navigation == "mouse")
					&& (mouse_check_button_pressed(mb_left))
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map_yes";
					}
					if (menu == "generate_level_map")
					&& (can_input_level_name == false)
					{
						if (key_up)
						&& (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu_delay = 3;
							menu = "level_editor_options";
						}
						else
						if (key_down)
						&& (menu_delay == 0 && menu_joystick_delay == 0)
						&& (show_level_editor_corner_menu)
						{
							menu_delay = 3;
							menu = "open_custom_levels_folder";
						}
						if (key_a_pressed)
						|| (keyboard_check_pressed(vk_enter))
						{
							if (menu_delay == 0 && menu_joystick_delay == 0)
							{
								menu_delay = 3;
								quit_level_editor = false;
								can_input_level_name = false;
								pause = true;
								menu = "generate_level_map_yes";
							}
						}
						if (key_b_pressed)
						&& (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu_delay = 3;
							quit_level_editor = false;
							can_input_level_name = false;
							pause = false;
							can_navigate = false;
						}
					}
				}
				#endregion /* If menu is on generate level map END */
				
				#region /* Open Custom Levels Folder */
				if (global.enable_options_for_pc)
				{
					draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("Open Custom Levels Folder"), "open_custom_levels_folder", "open_custom_levels_folder");
					draw_sprite_ext(spr_icons_folder, 0, get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1);
					if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, get_window_width * 0.5 - 185 + 371, get_window_height * 0.5 + 42 + 41))
					&& (global.controls_used_for_menu_navigation == "mouse")
					&& (mouse_check_button_released(mb_left))
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					|| (menu == "open_custom_levels_folder")
					&& (key_a_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						if (global.level_name != "")
						{
							scr_open_folder(game_save_id + "\custom_levels\\" + string(global.level_name))
						}
					}
					if (menu == "open_custom_levels_folder")
					&& (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "generate_level_map";
					}
					if (menu == "open_custom_levels_folder")
					&& (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						can_navigate = true;
						menu = "level_editor_upload";
					}
				}
				#endregion /* Open Custom Levels Folder END */
			
				#region /* If menu is on upload */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, l10n_text("Upload"), "level_editor_upload", "level_editor_upload");
				draw_sprite_ext(spr_icons_upload, 0, get_window_width * 0.5 - 185 + 16, get_window_height * 0.5 + 42 + 42 + 21, 1, 1, 0, c_white, 1);
				if (menu == "level_editor_upload")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					&& (show_level_editor_corner_menu)
					{
						menu_delay = 3;
						if (global.enable_options_for_pc)
						{
							menu = "open_custom_levels_folder";
						}
						else
						{
							menu = "level_editor_options";
						}
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "quit";
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
				#endregion /* If menu is on upload END */
			
				#region /* If menu is on quit */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, l10n_text("Save and Quit"), "quit", noone);
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42 + 42 + 42))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (key_a_pressed)
				&& (menu == "quit")
				&& (can_input_level_name == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				|| (keyboard_check_pressed(vk_enter))
				&& (menu == "quit")
				&& (can_input_level_name == false)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = true;
					can_input_level_name = false;
					pause = false;
				}
				if (menu == "quit")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "level_editor_upload";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "continue";
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = false;
						can_navigate = false;
					}
				}
				#endregion /* If menu is on quit END */
			
			}
			else
			if (menu == "generate_level_map_yes")
			|| (menu == "generate_level_map_no")
			{
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				
				#region /* Draw the path for saving full level map */
				if (global.enable_options_for_pc)
				{
					scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192, l10n_text("A map of the whole level will be generated and saved in"), global.default_text_size, c_black, c_white, 1);
					if (get_window_width <= 1350)
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(global.level_name) + "\\full_level_map_" + string(global.level_name) + ".png", "\\", "/"), global.default_text_size * 0.75, c_black, c_white, 1);
					}
					else
					{
						scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192 + 32, string_replace_all(string(game_save_id) + "\custom_levels\\" + string(global.level_name) + "\\full_level_map_" + string(global.level_name) + ".png", "\\", "/"), global.default_text_size, c_black, c_white, 1);
					}
				}
				else
				{
					scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192, l10n_text("A map of the whole level will be generated and saved"), global.default_text_size, c_black, c_white, 1);
				}
				#endregion /* Draw the path for saving full level map END */
				
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192 + 64, l10n_text("With this map, you can then use it in a drawing program,"), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192 + 96, l10n_text("as the base to make the background and foreground layers."), global.default_text_size, c_black, c_white, 1);
				scr_draw_text_outlined(get_window_width * 0.5, get_window_height * 0.5 - 192 + 160, l10n_text("Do you want to generate a level map?"), global.default_text_size, c_black, c_white, 1);
				
				#region /* If menu is on generate level map yes */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5, l10n_text("Yes"), "generate_level_map_yes", "generate_level_map_yes");
				
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = false;
					global.full_level_map_screenshot = true;
				}
				if (menu == "generate_level_map_yes")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "generate_level_map_no";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "generate_level_map_no";
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							/* Disable the backgrounds when getting full level map */
							layer_background_visible(layer_background_get_id("Background"), false);
							layer_background_visible(layer_background_get_id("Background_2"), false);
							layer_background_visible(layer_background_get_id("Background_3"), false);
							layer_background_visible(layer_background_get_id("Background_4"), false);
							menu_delay = 3;
							quit_level_editor = false;
							can_input_level_name = false;
							pause = false;
							global.full_level_map_screenshot = true;
						}
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map";
					}
				}
				#endregion /* If menu is on generate level map yes END */
				
				#region /* If menu is on generate level map no */
				draw_menu_button(get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, l10n_text("No"), "generate_level_map_no", "generate_level_map");
				draw_sprite_ext(spr_icons_back, 0, get_window_width * 0.5 - 185 + 20, get_window_height * 0.5 + 42 + 21, 1, 1, 0, c_white, 1);
				
				if (point_in_rectangle(cursor_x, cursor_y, get_window_width * 0.5 - 185, get_window_height * 0.5, get_window_width * 0.5 + 185, get_window_height * 0.5 + 42 + 42))
				&& (global.controls_used_for_menu_navigation == "mouse")
				&& (mouse_check_button_pressed(mb_left))
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					menu_delay = 3;
					quit_level_editor = false;
					can_input_level_name = false;
					pause = true;
					menu = "generate_level_map";
				}
				if (menu == "generate_level_map_no")
				&& (can_input_level_name == false)
				{
					if (key_up)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "generate_level_map_yes";
					}
					else
					if (key_down)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						menu = "generate_level_map_yes";
					}
					if (key_a_pressed)
					|| (keyboard_check_pressed(vk_enter))
					{
						if (menu_delay == 0 && menu_joystick_delay == 0)
						{
							menu_delay = 3;
							quit_level_editor = false;
							can_input_level_name = false;
							pause = true;
							menu = "generate_level_map";
						}
					}
					if (key_b_pressed)
					&& (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						quit_level_editor = false;
						can_input_level_name = false;
						pause = true;
						menu = "generate_level_map";
					}
				}
				#endregion /* If menu is on generate level map no END */
			
			}
			#endregion /* Make the menu invisible when entering the options menu END */
			
			scr_draw_upload_level_menu();
			
			#region /* PLAYER 1 INPUT LEVEL NAME NOW */
			if (menu == "input_level_name")
			&& (can_input_level_name)
			{
				
				#region /* Press enter when done typing */
				if (keyboard_check_pressed(vk_enter))
				|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
				{
					if (menu_delay == 0 && menu_joystick_delay == 0)
					{
						menu_delay = 3;
						can_input_level_name = false;
						quit_level_editor = false;
						pause = true;
						menu = "enter_level_name";
					}
				}
				#endregion /* Press enter when done typing END */
				
				#region /* Make Background Darker */
				draw_set_alpha(0.5);
				draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				#endregion /* Make Background Darker END */
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				
				#region /* Inputed Name Text */
				if (name_enter_blink< 1)
				{
					scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5, "Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: " + string(level_name) + "|", global.default_text_size, c_black, c_white, 1);
				}
				else
				{
					scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 -400 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5, "Type a name on the keyboard for level name\nPress Enter when done typing\n \nLevel Name: " + string(level_name), global.default_text_size, c_black, c_white, 1);
				}
				#endregion /* Inputed Name Text END */
				
				#region /* Limit Name Input Length for Level Name */
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 - 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 + 100, "Limit: " + string(string_length(level_name)) + "/32", global.default_text_size, c_black, c_white, 1);
				level_name = keyboard_string;
				if (string_length(level_name) > 32)
				{
					keyboard_string = string_copy(level_name, 1, 32);
				}
				#endregion /* Limit Name Input Length for Level Name END */
				
				name_enter_blink+= 0.05;
				if (name_enter_blink > 1.5)
				{
					name_enter_blink = 0;
				}
			}
			#endregion /* PLAYER 1 INPUT LEVEL NAME NOW END */
			
		}
		#endregion /* Pause Menu END */
		
		if (pause)
		{
			scr_options_menu(); /* Options */
			scr_options_level_editor(); /* Level Editor Options */
		}
		
		#region /* Hover over icons reveals the icons */
		
		#region /* Make bottom row of icons appear if mouse is hovering at bottom screen */
		if (drag_object == false)
		&& (instance_exists(obj_level_player1_start))
		&& (obj_level_player1_start.drag_object == false)
		&& (instance_exists(obj_level_player2_start))
		&& (obj_level_player2_start.drag_object == false)
		&& (instance_exists(obj_level_player3_start))
		&& (obj_level_player3_start.drag_object == false)
		&& (instance_exists(obj_level_player4_start))
		&& (obj_level_player4_start.drag_object == false)
		&& (instance_exists(obj_level_end))
		&& (obj_level_end.drag_object == false)
		{
			if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64))
			|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
			|| (global.always_show_level_editor_buttons)
			{
				if (show_icons_at_bottom == false)
				{
					show_icons_at_bottom = true;
				}
			}
			else
			if (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64))
			&& (!point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
			&& (global.always_show_level_editor_buttons == false)
			{
				if (show_icons_at_bottom)
				{
					show_icons_at_bottom = false;
				}
			}
		}
		#endregion /* Make bottom row of icons appear if mouse is hovering at bottom screen END */
		
		#region /* Make undo and redo icons appear if mouse is hovering at right screen */
		if (undo_and_redo_buttons_enabled)
		&& (drag_object == false)
		&& (instance_exists(obj_level_player1_start))
		&& (obj_level_player1_start.drag_object == false)
		&& (instance_exists(obj_level_player2_start))
		&& (obj_level_player2_start.drag_object == false)
		&& (instance_exists(obj_level_player3_start))
		&& (obj_level_player3_start.drag_object == false)
		&& (instance_exists(obj_level_player4_start))
		&& (obj_level_player4_start.drag_object == false)
		&& (instance_exists(obj_level_end))
		&& (obj_level_end.drag_object == false)
		{
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 8, 0, room_width * 2, display_get_gui_height()))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				if (show_undo_redo_icons == false)
				{
					show_undo_redo_icons = true;
				}
			}
			else
			if (point_in_rectangle(cursor_x, cursor_y, 0, 0, display_get_gui_width() - 128, display_get_gui_height()))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				if (show_undo_redo_icons)
				{
					show_undo_redo_icons = false;
				}
			}
		}
		#endregion /* Make undo and redo icons appear if mouse is hovering at right screen END */
		
		#region /* Make top row of icons appear if mouse is hovering at top screen */
		if (drag_object == false)
		&& (instance_exists(obj_level_player1_start))
		&& (obj_level_player1_start.drag_object == false)
		&& (instance_exists(obj_level_player2_start))
		&& (obj_level_player2_start.drag_object == false)
		&& (instance_exists(obj_level_player3_start))
		&& (obj_level_player3_start.drag_object == false)
		&& (instance_exists(obj_level_player4_start))
		&& (obj_level_player4_start.drag_object == false)
		&& (instance_exists(obj_level_end))
		&& (obj_level_end.drag_object == false)
		{
			if (point_in_rectangle(cursor_x, cursor_y, - 32, - 64, display_get_gui_width() + 32, + 64))
			|| (global.always_show_level_editor_buttons)
			{
				if (show_icons_at_top == false)
				{
					show_icons_at_top = true;
				}
			}
			else
			if (point_in_rectangle(cursor_x, cursor_y, - 32, + 64, display_get_gui_width() + 32, display_get_gui_height() + 64))
			{
				if (show_icons_at_top)
				{
					show_icons_at_top = false;
				}
			}
		}
		#endregion /* Make top row of icons appear if mouse is hovering at top screen END */
		
		#endregion /* Hover over icons reveals the icons END */
		
		#region /* Show icons at bottom of screen */
		if (show_icons_at_bottom)
		&& (drag_object == false)
		&& (pause == false)
		|| (global.always_show_level_editor_buttons)
		&& (drag_object == false)
		&& (pause == false)
		{
			icons_at_bottom_y = lerp(icons_at_bottom_y, 0, 0.1);
		}
		else
		{
			icons_at_bottom_y = lerp(icons_at_bottom_y, + 100, 0.1);
		}
		#endregion /* Show icons at bottom of screen END */
		
		#region /* Show undo and redo icons to the right of screen */
		if (show_undo_redo_icons)
		{
			undo_redo_icons_y = lerp(undo_redo_icons_y, 0, 0.1);
		}
		else
		{
			undo_redo_icons_y = lerp(undo_redo_icons_y, + 200, 0.1);
		}
		#endregion /* Show undo and redo icons to the right of screen END */
		
		#region /* Level Editor Icons */
		
		#region /* Play Level Button */
		draw_sprite_ext(spr_menu_button_play, 0, play_level_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		
		#region /* Draw Play Key */
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			scr_draw_gamepad_buttons(button_play, play_level_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_keyboard_keys, key_play, play_level_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		#endregion /* Draw Play key END */
		
		if (pressing_play_timer > 0)
		{
			scr_draw_circular_bar(play_level_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, pressing_play_timer, frames_until_playtest_from_start, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding play key */
			scr_draw_circular_bar(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, pressing_play_timer, frames_until_playtest_from_start, c_red, 20, 1, 6); /* Draw a circular bar that fills when holding play key */
		}
		
		if (point_in_rectangle(cursor_x, cursor_y, play_level_icon_x - 32 + 1, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_bottom)
		&& (pause == false)
		{
			tooltip = l10n_text("Play level");
			show_tooltip += 2;
			draw_set_alpha(0.5);
			draw_rectangle_color(play_level_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, play_level_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		#endregion /* Play Level Button END */
		
		#region /* Show text in bottom right of screen what the current custom level name is. This will make it less confusing what level you are editing */
		if (set_difficulty_mode == false)
		{
			if (global.enable_difficulty_selection_settings == false)
			|| (global.enable_difficutly_layers_in_level_editor == false)
			{
				var level_name_x_offset = 20;
			}
			else
			{
				var level_name_x_offset = 66;
			}
			
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() - level_name_x_offset, display_get_gui_height() - 16, string(level_name_masked), global.default_text_size, c_black, c_white, 1);
		}
		#endregion /* Show text in bottom right of screen what the current custom level name is. This will make it less confusing what level you are editing END */
		
		#region /* Place brush icons */
		if (place_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size == 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size == 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size == 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size == 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (place_brush_size >= 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (place_brush_size == 0)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 0, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size == 1)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 1, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size == 2)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 2, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size == 3)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 3, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size == 4)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 4, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (place_brush_size == 5)
		&& (erase_mode == false)
		&& (fill_mode == false)
		{
			draw_sprite_ext(spr_leveleditor_icons, 5, place_brush_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		
		#region /* Draw Brush Key */
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			if (fill_mode == false)
			&& (erase_mode == false)
			{
				scr_draw_gamepad_buttons(button_change_draw_size, place_brush_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
			else
			{
				scr_draw_gamepad_buttons(button_draw, place_brush_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
		}
		else
		{
			if (fill_mode == false)
			&& (erase_mode == false)
			{
				draw_sprite_ext(spr_keyboard_keys, key_change_draw_size, place_brush_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, key_draw, place_brush_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
		}
		#endregion /* Draw Brush key END */
		
		#region /* Click Pen */
		if (point_in_rectangle(cursor_x, cursor_y, place_brush_icon_x - 32 + 1, display_get_gui_height() - 64, place_brush_icon_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_bottom)
		&& (pause == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(place_brush_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, place_brush_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = l10n_text("Paintbrush tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (place_brush_size == 0)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 1;
					erase_brush_size = 1;
				}
				else
				if (place_brush_size == 1)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 2;
					erase_brush_size = 2;
				}
				else
				if (place_brush_size == 2)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 3;
					erase_brush_size = 3;
				}
				else
				if (place_brush_size == 3)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 4;
					erase_brush_size = 4;
				}
				else
				if (place_brush_size == 4)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 5;
					erase_brush_size = 5;
				}
				else
				if (place_brush_size == 5)
				&& (fill_mode == false)
				&& (erase_mode == false)
				{
					place_brush_size = 0;
					erase_brush_size = 0;
				}
				else
				if (place_brush_size == 0)
				{
					place_brush_size = 0;
					erase_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size == 1)
				{
					place_brush_size = 1;
					erase_brush_size = 1;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size == 2)
				{
					place_brush_size = 2;
					erase_brush_size = 2;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size == 3)
				{
					place_brush_size = 3;
					erase_brush_size = 3;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size == 4)
				{
					place_brush_size = 4;
					erase_brush_size = 4;
					fill_mode = false;
					erase_mode = false;
				}
				else
				if (place_brush_size == 5)
				{
					place_brush_size = 5;
					erase_brush_size = 5;
					fill_mode = false;
					erase_mode = false;
				}
				else
				{
					place_brush_size = 0;
					erase_brush_size = 0;
					fill_mode = false;
					erase_mode = false;
				}
			}
		}
		#endregion /* Click Pen END */
		
		#endregion /* Place brush icons END */
		
		#region /* Erase icons */
		if (erase_brush_size <= 0)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size == 1)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size == 2)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size == 3)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size == 4)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		else
		if (erase_brush_size == 5)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
		}
		if (erase_brush_size == 0)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 6, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size == 1)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 7, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size == 2)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 8, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size == 3)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 9, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size == 4)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 10, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		else
		if (erase_brush_size == 5)
		&& (erase_mode)
		{
			draw_sprite_ext(spr_leveleditor_icons, 11, erase_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		
		#region /* Draw Eraser Key */
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			if (erase_mode)
			{
				scr_draw_gamepad_buttons(button_change_erase_size, erase_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
			else
			{
				scr_draw_gamepad_buttons(button_erase, erase_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
		}
		else
		{
			if (erase_mode)
			{
				draw_sprite_ext(spr_keyboard_keys, key_change_erase_size, erase_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, key_erase, erase_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
		}
		#endregion /* Draw Eraser key END */
		
		#region /* Click Erase */
		if (point_in_rectangle(cursor_x, cursor_y, erase_icon_x - 32 + 1, display_get_gui_height() - 64, erase_icon_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_bottom)
		&& (pause == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(erase_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, erase_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = l10n_text("Erase tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (erase_mode == false)
				{
					erase_mode = true;
					fill_mode = false;
				}
				else
				if (erase_brush_size == 0)
				{
					erase_brush_size = 1;
					place_brush_size = 1;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size == 1)
				{
					erase_brush_size = 2;
					place_brush_size = 2;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size == 2)
				{
					erase_brush_size = 3;
					place_brush_size = 3;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size == 3)
				{
					erase_brush_size = 4;
					place_brush_size = 4;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size == 4)
				{
					erase_brush_size = 5;
					place_brush_size = 5;
					fill_mode = false;
					erase_mode = true;
				}
				else
				if (erase_brush_size == 5)
				{
					erase_brush_size = 0;
					place_brush_size = 0;
					fill_mode = false;
					erase_mode = true;
				}
			}
		}
		#endregion /* Click Erase END */
		
		#endregion /* Erase icons END */
		
		#region /* Fill icon */
		if (fill_mode)
		&& (erase_mode == false)
		&& (difficulty_layer == 0)
		{
			if (fill_mode_type == "fill")
			{
				draw_sprite_ext(spr_leveleditor_icon_fill, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			if (fill_mode_type == "horizontal")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			if (fill_mode_type == "vertical")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_white, 1);
			}
		}
		else
		{
			if (fill_mode_type == "fill")
			{
				draw_sprite_ext(spr_leveleditor_icon_fill, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			else
			if (fill_mode_type == "horizontal")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			else
			if (fill_mode_type == "vertical")
			{
				draw_sprite_ext(spr_leveleditor_icons, 12, fill_icon_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_dkgray, 1);
			}
		}
		
		#region /* Draw Eraser Key */
		if (gamepad_is_connected(global.player_slot[1]))
		&& (global.controls_used_for_menu_navigation == "controller")
		|| (global.always_show_gamepad_buttons)
		{
			if (fill_mode)
			{
				scr_draw_gamepad_buttons(button_change_fill_type, fill_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
			else
			{
				scr_draw_gamepad_buttons(button_fill, fill_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, c_white, 1);
			}
		}
		else
		{
			if (fill_mode)
			{
				draw_sprite_ext(spr_keyboard_keys, key_change_fill_type, fill_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_keyboard_keys, key_fill, fill_icon_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
			}
		}
		#endregion /* Draw Eraser key END */
		
		#region /* Click Fill */
		if (point_in_rectangle(cursor_x, cursor_y, fill_icon_x - 32 + 1, display_get_gui_height() - 64, fill_icon_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_bottom)
		&& (pause == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(fill_icon_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, fill_icon_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			tooltip = l10n_text("Fill tool");
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				if (fill_mode == false)
				{
					erase_mode = false;
					fill_mode = true;
				}
				else
				if (fill_mode_type == "fill")
				{
					erase_mode = false;
					fill_mode_type = "horizontal";
					fill_mode = true;
				}
				else
				if (fill_mode_type == "horizontal")
				{
					erase_mode = false;
					fill_mode_type = "vertical";
					fill_mode = true;
				}
				else
				if (fill_mode_type == "vertical")
				{
					erase_mode = false;
					fill_mode_type = "fill";
					fill_mode = true;
				}
			}
		}
		#endregion /* Click Fill END */
		
		#endregion /* Fill icon END */
		
		#region /* Hide Buttons - Always show level editor buttons toggle */
		if (global.always_show_level_editor_buttons == false)
		{
			draw_sprite_ext(spr_menu_cursor, 0, always_show_level_editor_buttons_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 270, c_white, 1);
		}
		else
		if (global.always_show_level_editor_buttons)
		{
			draw_sprite_ext(spr_menu_cursor, 0, always_show_level_editor_buttons_x, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 90, c_white, 1);
		}
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("T"), always_show_level_editor_buttons_x + 20, display_get_gui_height() - 32 + icons_at_bottom_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		if (point_in_rectangle(cursor_x, cursor_y, always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_bottom)
		&& (pause == false)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64 + icons_at_bottom_y, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (global.always_show_level_editor_buttons)
			{
				tooltip = l10n_text("Hide buttons");
			}
			else
			if (global.always_show_level_editor_buttons == false)
			{
				tooltip = l10n_text("Lock buttons");
			}
			show_tooltip += 2;
		}
		if (mouse_check_button_pressed(mb_left))
		&& (point_in_rectangle(cursor_x, cursor_y, always_show_level_editor_buttons_x - 32 + 1, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64 - 1))
		&& (global.controls_used_for_menu_navigation == "mouse")
		|| (keyboard_check_pressed(ord("T")))
		{
			global.always_show_level_editor_buttons = not global.always_show_level_editor_buttons;
			ini_open(working_directory + "config.ini");
			ini_write_real("config", "always_show_level_editor_buttons", global.always_show_level_editor_buttons);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		#endregion /* Hide Buttons - Always show level editor buttons toggle END */
		
		#region /* Show Undo icon */
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 17, display_get_gui_width() - 96 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Show Undo icon END */
		
		#region /* Show Redo icon */
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (mouse_check_button(mb_left))
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 18, display_get_gui_width() - 32 + undo_redo_icons_y, display_get_gui_height() - 96, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Show Redo icon */
		
		#region /* Set difficulty layer */
		if (global.enable_difficulty_selection_settings)
		&& (global.enable_difficutly_layers_in_level_editor)
		&& (set_difficulty_mode)
		{
			#region /* Easy */
			if (difficulty_layer == 1)
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 20, display_get_gui_width() - 224, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /* Easy END */
			
			#region /* Normal */
			if (difficulty_layer == 2)
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 21, display_get_gui_width() - 160, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /* Normal END */
			
			#region /* Hard */
			if (difficulty_layer == 3)
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			}
			else
			{
				draw_sprite_ext(spr_leveleditor_icons, 22, display_get_gui_width() - 96, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_dkgray, 1);
			}
			#endregion /* Hard END */
			
			#region /* Set Difficulty Mode / Back */
			draw_sprite_ext(spr_leveleditor_icons, 24, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
			#endregion /* Set Difficulty Mode / Back END */
			
		}
		else
		if (global.enable_difficulty_selection_settings)
		&& (global.enable_difficutly_layers_in_level_editor)
		{
			draw_sprite_ext(spr_leveleditor_icons, 19, display_get_gui_width() - 32, display_get_gui_height() - 32 + icons_at_bottom_y, 1, 1, 0, c_white, 1);
		}
		#endregion /* Set difficulty layer END */
		
		#region /* Show icons at top of screen */
		if (show_icons_at_top)
		&& (pause == false)
		{
			icons_at_top_y = lerp(icons_at_top_y, - 1, 0.1);
		}
		else
		{
			icons_at_top_y = lerp(icons_at_top_y, - 100, 0.1);
		}
		
		grid_button_x = display_get_gui_width() - 288;
		var zoom_out_button_x = display_get_gui_width() - 224;
		var zoom_reset_button_x = display_get_gui_width() - 160;
		var zoom_in_button_x = display_get_gui_width() - 96;
		var help_button_x = display_get_gui_width() - 32;
		
		#region /* Show Grid */
		if (show_grid)
		{
			draw_sprite_ext(spr_leveleditor_icons, 13, grid_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(display_get_gui_width() - 80, 80 + icons_at_top_y, l10n_text("Grid X") + ": " + string(global.grid_hsnap), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() - 80, 110 + icons_at_top_y, l10n_text("Grid Y") + ": " + string(global.grid_vsnap), global.default_text_size, c_black, c_white, 1);
			if (global.grid_hsnap < 32)
			&& (global.grid_vsnap < 32)
			{
				scr_draw_text_outlined(display_get_gui_width() - 80, 135 + icons_at_top_y, l10n_text("Under default grid size!"), global.default_text_size, c_black, c_white, 1);
			}
			else
			if (global.grid_hsnap > 32)
			&& (global.grid_vsnap > 32)
			{
				scr_draw_text_outlined(display_get_gui_width() - 80, 135 + icons_at_top_y, l10n_text("Above default grid size!"), global.default_text_size, c_black, c_white, 1);
			}
			draw_sprite_ext(spr_menu_button_up_down, 0, display_get_gui_width() - 32, 80 + icons_at_top_y + 16, 1, 1, 0, c_white, 1);
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32 + 2, display_get_gui_width() + 64, 80 + icons_at_top_y + 16))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			{
				global.grid_hsnap ++;
				global.grid_vsnap ++;
			}
			else
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32))
			&& (global.controls_used_for_menu_navigation == "mouse")
			&& (mouse_check_button_pressed(mb_left))
			{
				if (global.grid_hsnap > 1)
				|| (global.grid_vsnap > 1)
				{
					global.grid_hsnap --;
					global.grid_vsnap --;
				}
			}
			scr_draw_text_outlined(display_get_gui_width() - 16, 32 + 140 + icons_at_top_y, l10n_text("X") + ": " + string(x) + " " + l10n_text("Y") + ": " + string(y), global.default_text_size, c_black, c_white, 1);
			scr_draw_text_outlined(display_get_gui_width() - 16, 32 + 190 + icons_at_top_y, l10n_text("View width") + ": " + string(camera_get_view_width(view_camera[0])) + " " + l10n_text("View height") + ": " + string(camera_get_view_height(view_camera[0])), global.default_text_size * 0.5, c_black, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 13, grid_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
		}
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("G"), grid_button_x + 20, + 32 + icons_at_top_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		#endregion /* Show Grid END */
		
		#region /* Zoom Out */
		if (zoom_out)
		{
			draw_sprite_ext(spr_leveleditor_icons, 14, zoom_out_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 14, zoom_out_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Zoom Out END */
		
		#region /* Zoom Reset */
		if (zoom_reset)
		{
			draw_sprite_ext(spr_leveleditor_icons, 15, zoom_reset_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 15, zoom_reset_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Zoom Reset END */
		
		#region /* Zoom In */
		if (zoom_in)
		{
			draw_sprite_ext(spr_leveleditor_icons, 16, zoom_in_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons, 16, zoom_in_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
		}
		#endregion /* Zoom In END */
		
		#region /* Help Button */
		if (welcome_to_level_editor > 0)
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, help_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_set_halign(fa_center);
			scr_draw_text_outlined(help_button_x, + 32 + icons_at_top_y, "?", global.default_text_size * 2, c_black, c_red, 1);
			draw_sprite_ext(spr_arrow_swirly, menu_cursor_index, help_button_x - 32, + 132 + icons_at_top_y + scr_wave(0, 16, 1), 1, 1, 180, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, help_button_x, + 32 + icons_at_top_y, 1, 1, 0, c_dkgray, 1);
			draw_set_halign(fa_center);
			scr_draw_text_outlined(help_button_x, + 32 + icons_at_top_y, "?", global.default_text_size * 2, c_black, c_red, 1);
		}
		if (global.controls_used_for_menu_navigation != "controller")
		{
			draw_sprite_ext(spr_keyboard_keys, ord("H"), help_button_x + 20, + 32 + icons_at_top_y + 20, 0.4, 0.4, 0, c_white, 1);
		}
		#endregion /* Help Button END */
		
		#endregion /* Show icons at top of screen END */
		
		#endregion /* Level Editor Icons */
		
		#region /* Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons */
		if (show_tooltip >= 100)
		{
			draw_rectangle_color(cursor_x + 16, cursor_y - 16, cursor_x + 240, cursor_y + 16, c_white, c_white, c_white, c_white, false);
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			scr_draw_text_outlined(cursor_x + 24, cursor_y, string(tooltip), global.default_text_size, c_white, c_black, 1);
		}
		if (show_tooltip > 100)
		{
			show_tooltip = 100;
		}
		if (show_icons_at_bottom == false)
		|| (mouse_check_button(mb_any))
		|| (keyboard_check(vk_anykey))
		{
			show_tooltip = 0;
		}
		#endregion /* Show Tooltip when hovering over icon, this code needs to be after the show icons code so it appears above the icons END */
		
		#region /* Undo and Redo icons */
		if (show_undo_redo_icons)
		{
			
			#region /* Click Undo icon */
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				tooltip = "Undo";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				{
					current_undo_value --;
				}
			}
			#endregion /* Click Undo icon END */
			
			else
			
			#region /* Click Redo icon */
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				tooltip = "Redo";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				{
					current_undo_value ++;
				}
			}
			#endregion /* Click Redo icon END */
			
		}
		#endregion /* Undo and Redo icons END */
		
		if (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			show_tooltip = 0;
		}
		
		#region /* Click icons at bottom of screen */
		if (show_icons_at_bottom)
		&& (pause == false)
		{
			
			#region /* Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard */
			if (global.enable_difficulty_selection_settings)
			&& (global.enable_difficutly_layers_in_level_editor)
			{
				
				#region /* Easy */
				if (set_difficulty_mode)
				&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width() - 192, display_get_gui_height() + 64))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					tooltip = "Show only objects in easy";
					show_tooltip += 2;
					if (mouse_check_button_pressed(mb_left))
					{
						difficulty_layer = 1;
						fill_mode = false;
						erase_mode = false;
						set_difficulty_mode = true;
						if (instance_exists(obj_leveleditor_placed_object))
						{
							with (obj_leveleditor_placed_object)
							{
								scr_make_sprite_transparent_setting_difficulty_levels();
							}
						}
					}
				}
				#endregion /* Easy END */
				
				#region /* Normal */
				if (set_difficulty_mode)
				&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 192, display_get_gui_height() - 64, display_get_gui_width() - 128, display_get_gui_height() + 64))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					tooltip = "Show only objects in normal";
					show_tooltip += 2;
					if (mouse_check_button_pressed(mb_left))
					{
						difficulty_layer = 2;
						fill_mode = false;
						erase_mode = false;
						set_difficulty_mode = true;
						if (instance_exists(obj_leveleditor_placed_object))
						{
							with (obj_leveleditor_placed_object)
							{
								scr_make_sprite_transparent_setting_difficulty_levels();
							}
						}
					}
				}
				#endregion /* Normal END */
				
				#region /* Hard */
				if (set_difficulty_mode)
				&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 64, display_get_gui_width() - 64, display_get_gui_height() + 64))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					tooltip = "Show only objects in hard";
					show_tooltip += 2;
					if (mouse_check_button_pressed(mb_left))
					{
						difficulty_layer = 3;
						fill_mode = false;
						erase_mode = false;
						set_difficulty_mode = true;
						if (instance_exists(obj_leveleditor_placed_object))
						{
							with (obj_leveleditor_placed_object)
							{
								scr_make_sprite_transparent_setting_difficulty_levels();
							}
						}
					}
				}
				#endregion /* Hard END */
				
				#region /* Set Difficulty Mode / Back */
				if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
				&& (global.controls_used_for_menu_navigation == "mouse")
				{
					tooltip = "Set what objects should appear on what difficulty";
					show_tooltip += 2;
					if (mouse_check_button_pressed(mb_left))
					{
						fill_mode = false;
						erase_mode = false;
						if (set_difficulty_mode)
						{
							set_difficulty_mode = false;
							difficulty_layer = 0;
						}
						else
						{
							set_difficulty_mode = true;
						}
						var time_source = time_source_create(time_source_game, 2, time_source_units_frames, function() /*For some reason the script needs to play after a bit of delay, otherwise it doesn't do anything when clicking back*/
						{
							if (instance_exists(obj_leveleditor_placed_object))
							{
								with (obj_leveleditor_placed_object)
								{
									scr_make_sprite_transparent_setting_difficulty_levels();
								}
							}
						}
						, [], 1);
						time_source_start(time_source);
					}
				}
				#endregion /* Set Difficulty Mode / Back */
				
			}
			#endregion /* Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard END */
			
		}
		#endregion /* Click icons at bottom of screen END */
		
		#region /* Click icons at top of screen */
		
		#region /* Object Categories Icons */
		var icons_object_category_terrain_x = display_get_gui_width() * 0.5 - 64 - 64;
		var icons_object_category_decoration_x = display_get_gui_width() * 0.5 - 64;
		var icons_object_category_item_x = display_get_gui_width() * 0.5;
		var icons_object_category_enemy_x = display_get_gui_width() * 0.5 + 64;
		var icons_object_category_gizmo_x = display_get_gui_width() * 0.5 + 64 + 64;
		
		if (current_object_category == "terrain")
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, icons_object_category_terrain_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icons_object_category_terrain_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			var category_title = l10n_text("Terrain");
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, icons_object_category_terrain_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
			draw_sprite_ext(global.resource_pack_sprite_tileset_default, 0, icons_object_category_terrain_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
		}
		if (current_object_category == "decoration")
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, icons_object_category_decoration_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_arrow_sign, 0, icons_object_category_decoration_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			var category_title = l10n_text("Decoration");
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 0, icons_object_category_decoration_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
			draw_sprite_ext(spr_arrow_sign, 0, icons_object_category_decoration_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
		}
		if (current_object_category == "item")
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 1, icons_object_category_item_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 1, icons_object_category_item_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			var category_title = l10n_text("Item");
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 1, icons_object_category_item_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
			draw_sprite_ext(global.resource_pack_sprite_basic_collectible, 1, icons_object_category_item_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
		}
		if (current_object_category == "enemy")
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 2, icons_object_category_enemy_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(global.resource_pack_sprite_basic_enemy, 2, icons_object_category_enemy_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			var category_title = l10n_text("Enemy");
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 2, icons_object_category_enemy_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
			draw_sprite_ext(global.resource_pack_sprite_basic_enemy, 2, icons_object_category_enemy_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
		}
		if (current_object_category == "gizmo")
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 3, icons_object_category_gizmo_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_spring, 3, icons_object_category_gizmo_x, 32 + icons_at_top_y, 1, 1, 0, c_white, 1);
			var category_title = l10n_text("Gizmo");
		}
		else
		{
			draw_sprite_ext(spr_leveleditor_icons_empty, 3, icons_object_category_gizmo_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
			draw_sprite_ext(spr_spring, 3, icons_object_category_gizmo_x, 32 + icons_at_top_y, 1, 1, 0, c_gray, 1);
		}
		
		if (selected_menu_alpha > 0)
		{
			draw_set_halign(fa_right);
			scr_draw_text_outlined(icons_object_category_terrain_x - 42, 32, category_title, global.default_text_size, c_black, c_white, selected_menu_alpha);
		}
		
		if (point_in_rectangle(cursor_x, cursor_y, icons_object_category_terrain_x - 32, 0 + icons_at_top_y, icons_object_category_terrain_x + 32, + 64 + icons_at_top_y))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(icons_object_category_terrain_x - 32, 0 + icons_at_top_y, icons_object_category_terrain_x + 32, 64 + icons_at_top_y, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				selected_menu_alpha = 2;
				current_object_category = "terrain";
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, icons_object_category_decoration_x - 32, 0 + icons_at_top_y, icons_object_category_decoration_x + 32, + 64 + icons_at_top_y))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(icons_object_category_decoration_x - 32, 0 + icons_at_top_y, icons_object_category_decoration_x + 32, 64 + icons_at_top_y, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				selected_menu_alpha = 2;
				current_object_category = "decoration";
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, icons_object_category_item_x - 32, 0 + icons_at_top_y, icons_object_category_item_x + 32, + 64 + icons_at_top_y))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(icons_object_category_item_x - 32, 0 + icons_at_top_y, icons_object_category_item_x + 32, 64 + icons_at_top_y, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				selected_menu_alpha = 2;
				current_object_category = "item";
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, icons_object_category_enemy_x - 32, 0 + icons_at_top_y, icons_object_category_enemy_x + 32, + 64 + icons_at_top_y))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(icons_object_category_enemy_x - 32, 0 + icons_at_top_y, icons_object_category_enemy_x + 32, 64 + icons_at_top_y, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				selected_menu_alpha = 2;
				current_object_category = "enemy";
			}
		}
		else
		if (point_in_rectangle(cursor_x, cursor_y, icons_object_category_gizmo_x - 32, 0 + icons_at_top_y, icons_object_category_gizmo_x + 32, + 64 + icons_at_top_y))
		&& (global.controls_used_for_menu_navigation == "mouse")
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(icons_object_category_gizmo_x - 32, 0 + icons_at_top_y, icons_object_category_gizmo_x + 32, 64 + icons_at_top_y, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
			if (mouse_check_button_pressed(mb_left))
			&& (global.controls_used_for_menu_navigation == "mouse")
			{
				selected_menu_alpha = 2;
				current_object_category = "gizmo";
			}
		}
		#endregion /* Object Categories Icons END */
		
		#region /* Click Toggle Grid */
		if (point_in_rectangle(cursor_x, cursor_y, grid_button_x - 32, - 64, grid_button_x + 32, + 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_top)
		&& (pause == false)
		{
			tooltip = "Toggle Grid";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			{
				show_grid = not show_grid;
			}
		}
		#endregion /* Click Toggle Grid END */
		
		#region /* Click Zoom Out */
		if (keyboard_check(global.player_[inp.key][1][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][1][1][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][2][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][2][1][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][3][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][3][1][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][4][1][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][4][1][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][1][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][1][2][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][2][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][2][2][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][3][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][3][2][action.zoom_in]))
		|| (keyboard_check(global.player_[inp.key][4][2][action.zoom_out]))
		&& (!keyboard_check(global.player_[inp.key][4][2][action.zoom_in]))
		|| (point_in_rectangle(cursor_x, cursor_y, zoom_out_button_x - 32, - 64, zoom_out_button_x + 32, + 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_top)
		&& (mouse_check_button(mb_left))
		{
			tooltip = "Zoom Out";
			show_tooltip += 2;
			zoom_out = true;
		}
		else
		{
			zoom_out = false;
		}
		#endregion /* Click Zoom Out END */
		
		#region /* Click Reset Zoom */
		if (keyboard_check(vk_control))
		&& (keyboard_check(vk_enter))
		&& (!keyboard_check(187))
		&& (!keyboard_check(189))
		|| (point_in_rectangle(cursor_x, cursor_y, zoom_reset_button_x - 32, - 64, zoom_reset_button_x + 32, + 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_top)
		&& (mouse_check_button(mb_left))
		{
			tooltip = "Reset Zoom";
			show_tooltip += 2;
			zoom_reset = true
		}
		else
		{
			zoom_reset = false;
		}
		#endregion /* Click Reset Zoom END */
		
		#region /* Click Zoom In */
		if (keyboard_check(global.player_[inp.key][1][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][1][1][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][2][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][2][1][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][3][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][3][1][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][4][1][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][4][1][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][1][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][1][2][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][2][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][2][2][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][3][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][3][2][action.zoom_out]))
		|| (keyboard_check(global.player_[inp.key][4][2][action.zoom_in]))
		&& (!keyboard_check(global.player_[inp.key][4][2][action.zoom_out]))
		|| (point_in_rectangle(cursor_x, cursor_y, zoom_in_button_x - 32, - 64, zoom_in_button_x + 32, + 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_top)
		&& (mouse_check_button(mb_left))
		{
			tooltip = "Zoom In";
			show_tooltip += 2;
			zoom_in = true;
		}
		else
		{
			zoom_in = false;
		}
		#endregion /* Click Zoom In END */
		
		#region /* Click Help Button */
		if (point_in_rectangle(cursor_x, cursor_y, help_button_x - 32, - 64, help_button_x + 32, + 64))
		&& (global.controls_used_for_menu_navigation == "mouse")
		&& (show_icons_at_top)
		&& (pause == false)
		&& (modify_object_menu == false)
		|| (keyboard_check_pressed(ord("H")))
		&& (pause == false)
		&& (modify_object_menu == false)
		{
			modify_object_menu = false;
			tooltip = "Help";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			|| (keyboard_check_pressed(ord("H")))
			{
				welcome_to_level_editor = not welcome_to_level_editor;
			}
		}
		#endregion /* Click Help Button END */
		
		#endregion /* Click icons at top of screen END */
		
		#region /* Autosave Warning Text */
		draw_set_halign(fa_center);
		var autosave_text = "";
		var autosave_text_color = c_white;
		if (autosave_timer < (60 * 3))
		{
			var autosave_text_color = c_lime;
			autosave_text = l10n_text("Autosaved!"); /* After game has autosaved, tell player that the autosave was successful */
		}
		else
		if (autosave_timer >= 18000 - 1)
		{
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
			autosave_text = l10n_text("Autosaving..."); /* Game will probably stutter when autosaving, so display text that the game is currently autosaving */
		}
		else
		if (autosave_timer > 18000 - (60 * 10)) /* Warn player that there will be a autosave by counting down from 10 */
		{
			var autosave_countdown = ceil((autosave_timer - 18000) / -60);
			autosave_text = l10n_text("Autosave in " + string(autosave_countdown));
		}
		if (autosave_text != "")
		{
			scr_draw_text_outlined(display_get_gui_width() * 0.5, 100, autosave_text, global.default_text_size * 2, c_black, autosave_text_color, 1);
			var autosave_countdown = ceil((autosave_timer - 18000) / -60);
			if (autosave_text == l10n_text("Autosave in " + string(autosave_countdown)))
			{
				if (global.controls_used_for_menu_navigation == "controller")
				{
					scr_draw_gamepad_buttons(gp_start, display_get_gui_width() * 0.5 - 16 - (string_width(l10n_text("Cancel Autosave")) * 0.5), 164, 0.6, c_white, 1);
				}
				else
				{
					draw_sprite_ext(spr_keyboard_keys, vk_escape, display_get_gui_width() * 0.5 - 16 - (string_width(l10n_text("Cancel Autosave")) * 0.5), 164, 0.6, 0.6, 0, c_white, 1);
				}
				scr_draw_text_outlined(display_get_gui_width() * 0.5, 164, ": " + l10n_text("Cancel Autosave"), global.default_text_size, c_black, autosave_text_color, 1);
				if (keyboard_check_pressed(vk_escape))
				|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
				{
					pause = false;
					autosave_timer = 60 * 3 + 1;
				}
			}
		}
		#endregion /* Autosave Warning Text END */
		
		/* Welcome to Level Editor screen */
		scr_draw_welcome_to_level_editor_menu();
		
		#region /* Object Specific Help */
		/* At the bottom of the screen, you can view help for specific objects that you have currently selected */
		if (object_help_description != "")
		|| (welcome_to_level_editor > 0)
		&& (object_help_description != "")
		{
			if (welcome_to_level_editor > 0)
			{
				object_help_description_alpha = 1;
			}
			else
			{
				object_help_description_alpha = clamp(selected_menu_alpha, 0, 1);
			}
			draw_set_alpha(object_help_description_alpha * 0.5);
			draw_roundrect_color_ext(display_get_gui_width() * 0.5 - (string_width(object_help_description) * 0.41), display_get_gui_height() - 34 - string_height(l10n_text(object_help_description)), display_get_gui_width() * 0.5 + (string_width(object_help_description) * 0.41), display_get_gui_height() - 4, 50, 50, c_black, c_black, false);
			draw_set_alpha(1);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - 28 - string_height(l10n_text(object_help_description)), l10n_text(current_object_name) + ":", global.default_text_size * 0.9, c_black, c_white, object_help_description_alpha);
			scr_draw_text_outlined(display_get_gui_width() * 0.5, display_get_gui_height() - string_height(l10n_text(object_help_description)), l10n_text(object_help_description), global.default_text_size, c_black, c_white, object_help_description_alpha);
			draw_set_valign(fa_middle);
		}
		#endregion /* Object Specific Help END */
		
		if (global.controls_used_for_menu_navigation != "controller")
		&& (!navigate_camera_with_arrowkeys)
		&& (modify_object_menu == false)
		{
			scr_draw_mouse_cursor_sprite();
		}
	}
}

if (menu == "caution_online_back")
|| (menu == "caution_online_do_not_show")
|| (menu == "caution_online_proceed")
{
	scr_draw_caution_online();
}
if (menu == "upload_rules_back")
|| (menu == "upload_rules_do_not_show")
|| (menu == "upload_rules")
{
	scr_draw_upload_rules();
}

scr_debug_screen();

if (pause)
{
	scr_draw_cursor_mouse();
}