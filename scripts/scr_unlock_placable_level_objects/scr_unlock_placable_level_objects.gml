function scr_unlock_placable_level_objects() {
	
	var default_unlock = false; /* Change to true to unlock every object for debugging, otherwise set this to false */
	var always_unlock = true; /* Some objects should always be unlocked from the start */
	
	#region /* Load what date this level was first created in */
	ini_open(game_save_id + "custom_levels/" + global.level_name + "/data/level_information.ini");
	var year = ini_read_real("info", "first_created_on_date_year", date_get_year(date_current_datetime()));
	var month = ini_read_real("info", "first_created_on_date_month", date_get_month(date_current_datetime()));
	var day = ini_read_real("info", "first_created_on_date_day", date_get_day(date_current_datetime()));
	ini_close();
	#endregion /* Load what date this level was first created in END */
	
	#region /* All the objects that should be always unlocked in Level Editor */
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRASS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GRASS, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_STONE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_STONE, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BRICK_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BRICK_BLOCK, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_QUESTION_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_CLOUD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BIRD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIRD, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_CROUCH] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SIGN_CROUCH, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_ENEMY, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_LADDER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_LADDER, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_CHECKPOINT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CHECKPOINT, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, always_unlock); /* Always Unlocked */
	#endregion /* All the objects that should be always unlocked in Level Editor END */
	
	#region /* Set all the "unlcoked object" variables to be false by default, so that they are all initialized before doing anything */
	//unlocked_object[LEVEL_OBJECT_ID.ID_WALL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_DIRT] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GLASS] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRAVEL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_METAL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_WOOD] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BLACK_WALL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_HARD_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ICE_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_HEART] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ONE_UP] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BOSS] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BLASTER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_DOOR] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WARP_BOX] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_SPRING] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ARROW_SIGN] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_ONEWAY] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_MELON_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WATER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_LAVA] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BREATHABLE_WATER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BUSH] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_BOSS_BARRIER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_READABLE] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_RING] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4] = false;
	unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5] = false;
	#endregion /* Set all the "unlcoked object" variables to be false by default, so that they are all initialized before doing anything END */
	
	#region /* Unlock placable level objects */
	if (!if_daily_build) {
		
		#region /* Read all the objects that should be unlocked */
		//unlocked_object[LEVEL_OBJECT_ID.ID_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_DIRT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_DIRT, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GLASS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GLASS, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRAVEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GRAVEL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_METAL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_METAL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_WOOD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_WOOD, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BLACK_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BLACK_WALL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPIKES, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_HARD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HARD_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_FALLING_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ICE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ICE_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_HEART] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HEART, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ONE_UP] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ONE_UP, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BOSS, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BLASTER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BLASTER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_DOOR] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_DOOR, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WARP_BOX] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WARP_BOX, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPRING] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPRING, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ARROW_SIGN] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ARROW_SIGN, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_ONEWAY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ONEWAY, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_MELON_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_MELON_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_LAVA] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_LAVA, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BREATHABLE_WATER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BREATHABLE_WATER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUCKET, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BUSH] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUSH, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS_BARRIER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BOSS_BARRIER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_READABLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SIGN_READABLE, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_RING] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_RING, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4, default_unlock);
		unlocked_object[LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5, default_unlock);
		#endregion /* Read all the objects that should be unlocked END */
		
	}
	else
	if (if_daily_build) {
		
		#region /* All the objects that should be randomly unlocked in Daily Build */
		
		/* First, run code for setting a seed for each day */
		var seed = string(year) + string(month) + string(day);
		random_set_seed(seed);
		
		/* Determine the number of items to unlock (random between "min items" and "max items") */
		var min_items = 5;
		var max_items = 9;
		var num_items_to_unlock = irandom_range(min_items, max_items);
		show_message("num_items_to_unlock: " + string(num_items_to_unlock));
		
		/* Create a list of all items */
		var all_items = ds_list_create();
		var all_items = [
		    /* Add all other items here... */
			//LEVEL_OBJECT_ID.ID_WALL,
			LEVEL_OBJECT_ID.ID_WALL_DIRT,
			LEVEL_OBJECT_ID.ID_WALL_GLASS,
		    LEVEL_OBJECT_ID.ID_WALL_GRAVEL,
			LEVEL_OBJECT_ID.ID_WALL_METAL,
			LEVEL_OBJECT_ID.ID_WALL_WOOD,
			LEVEL_OBJECT_ID.ID_BLACK_WALL,
			LEVEL_OBJECT_ID.ID_SPIKES,
			LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM,
			LEVEL_OBJECT_ID.ID_HARD_BLOCK,
			LEVEL_OBJECT_ID.ID_FALLING_BLOCK,
			LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG,
			LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK,
			LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG,
			LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK,
			LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG,
			LEVEL_OBJECT_ID.ID_ICE_BLOCK,
			LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL,
			LEVEL_OBJECT_ID.ID_HEART,
			LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP,
			LEVEL_OBJECT_ID.ID_ONE_UP,
			LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL,
			LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY,
			LEVEL_OBJECT_ID.ID_BOSS,
			LEVEL_OBJECT_ID.ID_BLASTER,
			LEVEL_OBJECT_ID.ID_DOOR,
			LEVEL_OBJECT_ID.ID_WARP_BOX,
			LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE,
			LEVEL_OBJECT_ID.ID_SPRING,
			LEVEL_OBJECT_ID.ID_ARROW_SIGN,
			LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK,
			LEVEL_OBJECT_ID.ID_ONEWAY,
			LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK,
			LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL,
			LEVEL_OBJECT_ID.ID_MELON_BLOCK,
			LEVEL_OBJECT_ID.ID_WATER,
			LEVEL_OBJECT_ID.ID_LAVA,
			LEVEL_OBJECT_ID.ID_BREATHABLE_WATER,
			LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER,
			LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW,
			LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST,
			LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER,
			LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT,
			LEVEL_OBJECT_ID.ID_BUCKET,
			LEVEL_OBJECT_ID.ID_BUSH,
			LEVEL_OBJECT_ID.ID_BOSS_BARRIER,
			LEVEL_OBJECT_ID.ID_EYE_BLOCK,
			LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY,
			LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER,
			LEVEL_OBJECT_ID.ID_SIGN_READABLE,
			LEVEL_OBJECT_ID.ID_RING,
			LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1,
			LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2,
			LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3,
			LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4,
			LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5
		];
		
		#region /* Select random items and unlcok the selected items */
		
		/* Select random items */
		var unlocked_items = ds_list_create(); /* Create a list to store unlocked items */
		for (var i = 0; i < num_items_to_unlock; i++) {
			var random_index = irandom(array_length(all_items) - 1);
			var selected_item = all_items[random_index];
			ds_list_add(unlocked_items, selected_item);
			show_message("ds_list_add(unlocked_items: " + string(unlocked_items) + ", selected_item: " + string(selected_item) + ");");
			array_delete(all_items, random_index, 1); /* Remove the selected item from the list to avoid duplicates */
		}
		
		/* Unlock the selected items */
		for (var j = 0; j < ds_list_size(unlocked_items); j++) {
			var item_to_unlock = ds_list_find_value(unlocked_items, j);
			unlocked_object[item_to_unlock] = max(ini_read_real("Unlock Placable Objects", item_to_unlock, 1), 1); /* Assuming unlocked_object is a map or array to store unlocked items */
		}
		
		#region /* Some objects work in pairs, so if one of the objects are unlocked that has a pair, then unlock the other one as well */
		if (unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] != 0)
		|| (unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] != 0)
		{
			unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] = max(ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, 1), 1);
			unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] = max(ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUCKET, 1), 1);
		}
		if (unlocked_object[LEVEL_OBJECT_ID.ID_BOSS_BARRIER] != 0)
		{
			unlocked_object[LEVEL_OBJECT_ID.ID_BOSS] = max(ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BOSS, 1), 1);
		}
		#endregion /* Some objects work in pairs, so if one of the objects are unlocked that has a pair, then unlock the other one as well END */
		
		ds_list_destroy(unlocked_items); /* Clean up */
		
		#endregion /* Select random items and unlcok the selected items END */
		
		#endregion /* All the objects that should be randomly unlocked in Daily Build END */
		
	}
	#endregion /* Unlock placable level objects END */
	
	ini_close();
	
}