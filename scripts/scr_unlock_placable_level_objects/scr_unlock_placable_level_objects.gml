/// @function scr_unlock_placable_level_objects(default_unlock)
/// @description
/// Unlocks placeable objects in the level editor based on the game's save data.
/// Some objects are always unlocked by default, while others require unlocking
/// through gameplay or a daily randomized unlock system.
///
/// If `default_unlock` is set to `true`, all objects will be unlocked for debugging purposes.
/// Otherwise, it will load the player's unlocked objects from the save file.
///
/// The function also handles a "Daily Build" mode where a random selection of
/// objects is unlocked each day, ensuring a fresh experience.
///
/// **Key Features:**
/// - Loads the date the level was first created to determine daily unlocks.
/// - Ensures that some core objects are always unlocked.
/// - Reads unlock data from the save file for persistent progression.
/// - Supports a debugging mode to unlock all objects instantly.
/// - Implements a daily randomized unlock system for fresh level editor content.
/// - Handles paired objects (e.g., unlocking one also unlocks its counterpart).
///
/// @param default_unlock Change to true to unlock every object for debugging, otherwise set this to false
function scr_unlock_placable_level_objects(default_unlock = false)
{
	var always_unlock = true; /* Some objects should always be unlocked from the start */

	#region /* All the objects that should be always unlocked in Level Editor */
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRASS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GRASS, always_unlock); /* Always Unlocked */
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_STONE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_STONE, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BRICK_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BRICK_BLOCK, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_QUESTION_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_CLOUD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BIRD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIRD, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_CROUCH] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SIGN_CROUCH, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_ENEMY, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_LADDER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_LADDER, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_CHECKPOINT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CHECKPOINT, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, always_unlock);
	unlocked_object[LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, always_unlock);
	#endregion /* All the objects that should be always unlocked in Level Editor END */

	#region /* Create a list of all items */
	var all_items = ds_list_create();
	/* Add all other items here... */
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_DIRT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_GLASS);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_GRAVEL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_METAL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_WOOD);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BLACK_WALL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_SPIKES);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_HARD_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_FALLING_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ICE_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_10_BULK_COLLECTIBLE);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_30_BULK_COLLECTIBLE);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_50_BULK_COLLECTIBLE);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_KEY_FRAGMENT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_HEART);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ONE_UP);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_TWO_UP);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_THREE_UP);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ENEMY_BULLET_LEFT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ENEMY_BULLET_RIGHT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BOSS);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ENEMY_VENGEFUL_SPIRIT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BLASTER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_KEY);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_DOOR);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_DOOR_LOCKED);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WARP_BOX);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_SPRING);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ARROW_SIGN);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_ONEWAY);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_MELON_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WATER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_LAVA);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BREATHABLE_WATER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BUCKET);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BUSH);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_BOSS_BARRIER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_EYE_BLOCK);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_SIGN_READABLE);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_RING);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5);
	ds_list_add(all_items, LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND);
	#endregion /* Create a list of all items END */

	#region /* Unlock placable level objects */
	if (!if_daily_build)
	{

		/* Read all the objects that should be unlocked */
		for (var i = 0; i < ds_list_size(all_items); i++)
		{
			var item_to_unlock = ds_list_find_value(all_items, i);
			unlocked_object[item_to_unlock] = ini_read_real("Unlock Placable Objects", item_to_unlock, default_unlock);
		}

	}
	else
	if (if_daily_build)
	{

		/* Set all the "unlocked object" variables to be false by default, so that they are all initialized before doing anything */
		for (var k = 0; k < ds_list_size(all_items); k++)
		{
			var item_to_unlock = ds_list_find_value(all_items, k);
			unlocked_object[item_to_unlock] = false;
		}

		#region /* All the objects that should be randomly unlocked in Daily Build */

		#region /* Load what date this level was first created in */
		ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		var year = ini_read_real("info", "first_created_on_date_year", date_get_year(date_current_datetime()));
		var month = ini_read_real("info", "first_created_on_date_month", date_get_month(date_current_datetime()));
		var day = ini_read_real("info", "first_created_on_date_day", date_get_day(date_current_datetime()));
		ini_close();
		#endregion /* Load what date this level was first created in END */

		/* First, run code for setting a seed for each day */
		var seed = string(year) + string(month) + string(day);
		random_set_seed(seed);

		/* Determine the number of items to unlock (random between "min items" and "max items") */
		var min_items = 5;
		var max_items = 9;
		var num_items_to_unlock = irandom_range(min_items, max_items);

		#region /* Select random items and unlcok the selected items */

		/* Select random items */
		var unlocked_items = ds_list_create(); /* Create a list to store unlocked items */
		for (var i = 0; i < num_items_to_unlock; i++)
		{
			var random_index = irandom(ds_list_size(all_items) - 1);
			var selected_item = ds_list_find_value(all_items, random_index);
			ds_list_add(unlocked_items, selected_item);
			ds_list_delete(all_items, random_index); /* Remove the selected item from the list to avoid duplicates */
		}

		/* Unlock the selected items */
		ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");

		for (var j = 0; j < ds_list_size(unlocked_items); j++)
		{
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

		ini_close();
		ds_list_destroy(unlocked_items); /* Clean up */

		#endregion /* Select random items and unlcok the selected items END */

		#endregion /* All the objects that should be randomly unlocked in Daily Build END */

	}
	#endregion /* Unlock placable level objects END */

	ini_close();

}
