function scr_draw_list_of_placable_objects()
{
	
	#region /* List of Placable Objects */
	if (selected_menu_alpha > 0)
	{
		if (quit_level_editor <= 0)
		{
			draw_set_alpha(selected_menu_alpha);
			draw_rectangle_color(0, 0, display_get_gui_width(), 128 + 64, c_black, c_black, c_black, c_black, false);
		}
		if (!global.world_editor)
		&& (quit_level_editor <= 0)
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
				scr_draw_level_editor_placable_object(order_index, LEVEL_OBJECT_ID.ID_BUSH, true, spr_bush, spr_wall, + 100, 1, 0, c_white,,,,,"Bush");
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
				selected_object_menu_actual_x =- 100 * total_number_of_objects;
			}
		}
		else
		if (global.world_editor)
		&& (quit_level_editor <= 0)
		{
			total_number_of_objects = 6; /* This is the total number of objects you have in the list to let the level editor know (0 is counted as object number 1) */
			if (selected_object == 0)
			{
				place_object = WORLD_OBJECT_ID.ID_WALL;
				can_make_place_size_bigger = true;
				sprite_index = spr_wall;
				mask_index = spr_wall;
			}
			if (selected_object == 1)
			{
				place_object = WORLD_OBJECT_ID.ID_LEVEL;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_level_ring, 0, x, y, 1, 1, 0, c_yellow, 0.5);
				draw_sprite_ext(spr_level, 0, x, y, 1, 1, 0, c_black, 0.5);
				sprite_index = spr_noone; 
				mask_index = spr_wall;
			}
			if (selected_object == 2)
			{
				place_object = WORLD_OBJECT_ID.ID_EXIT;
				can_make_place_size_bigger = false;
				sprite_index = spr_map_exit;
				mask_index = spr_wall;
			}
			if (selected_object == 3)
			{
				place_object = WORLD_OBJECT_ID.ID_RIGHT_DOWN;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 0, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 4)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_RIGHT;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 90, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 5)
			{
				place_object = WORLD_OBJECT_ID.ID_UP_LEFT;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 180, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
			if (selected_object == 6)
			{
				place_object = WORLD_OBJECT_ID.ID_LEFT_DOWN;
				can_make_place_size_bigger = false;
				draw_sprite_ext(spr_map_turn_right_down, 0, x, y, 1, 1, 270, c_white, 0.5);
				sprite_index = spr_noone;
				mask_index = spr_wall;
			}
		}
		
		/* Draw an arrow pointing to currently selected object */
		draw_set_alpha(selected_menu_alpha);
		draw_set_color(c_white);
		draw_arrow(display_get_gui_width() * 0.5, 16 - 8 + 64 + scr_wave(0, -8, 1), display_get_gui_width() * 0.5, 16 + 8 + 64 + scr_wave(0, -8, 1), 30);
		draw_arrow(display_get_gui_width() * 0.5, 110 - 16 + 8 + 64 + scr_wave(0, 8, 1), display_get_gui_width() * 0.5, 110 - 16 - 8 + 64 + scr_wave(0, 8, 1), 30);
		draw_set_alpha(1);
	}
	#endregion /* List of Placable Objects END */
	
}