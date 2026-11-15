function scr_big_collectible_tiers_initialize()
{
	global.big_collectible_tiers_enabled = false;
	global.big_collectible_tier_format_unsupported = false;
	global.big_collectible_level_id = "";
	global.big_collectible_active_tier = 0;
	global.big_collectible_requested_tier = -1;
	if (!variable_global_exists("big_collectible_tier_choices")) global.big_collectible_tier_choices = {};
	global.big_collectible_test_override = false;
	global.big_collectible_tier_counts = [0, 0, 0];
	global.big_collectible_tier_owned = [0, 0, 0];
	global.big_collectible_tier_items = [[], [], []];
	global.big_collectible_tier_valid = [false, false, false];
	global.big_collectible_tier_unlocked = [false, false, false];
	global.big_collectible_run_key = "";
	global.big_collectible_progress_section = "";
	global.big_collectible_run_ids = [];
	global.level_progress_context = undefined;
	scr_save_metadata_session();
	scr_level_progress_bootstrap();
}

function scr_big_collectible_new_id()
{
	return string(current_time) + "_" + string(irandom(2147483646));
}

function scr_big_collectible_is_source(object_id, inside_id = 0)
{
	/* Old level files may store numeric object IDs as strings. */
	if (is_string(object_id) && object_id != "" && string_digits(object_id) == object_id) object_id = real(object_id);
	if (is_string(inside_id) && inside_id != "" && string_digits(inside_id) == inside_id) inside_id = real(inside_id);
	return object_id == LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE
		|| object_id == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE
		|| object_id == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE
		|| object_id == LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE
		|| inside_id == LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE
		|| inside_id == "big_collectible";
}

function scr_big_collectible_source_difficulty(source)
{
	return (global.difficulty <= 0 && source.easy)
		|| (global.difficulty == 1 && source.normal)
		|| (global.difficulty >= 2 && source.hard);
}

function scr_big_collectible_tiers_seed_legacy_ids()
{
	if (global.big_collectible_tiers_enabled) return;
	instance_activate_all();
	var start_inst = instance_find(obj_level_player1_start, 0);
	var start_x = instance_exists(start_inst) ? start_inst.x : global.level_player_start_x[1];
	var start_y = instance_exists(start_inst) ? start_inst.y : global.level_player_start_y[1];
	var sources = [];
	with (obj_leveleditor_placed_object)
	{
		if (scr_big_collectible_is_source(object, item_inside) && big_collectible_tier == 0)
		{
			array_push(sources, id);
		}
	}
	var aliases = {};
	for (var index = 0; index < array_length(sources); index++)
	{
		variable_struct_set(aliases, string(sources[index]), [0, 0, 0]);
	}
	for (var difficulty = 0; difficulty <= 2; difficulty++)
	{
		var ordered = ds_priority_create();
		for (var index = 0; index < array_length(sources); index++)
		{
			var source = sources[index];
			var available = difficulty == 0 ? source.easy : (difficulty == 1 ? source.normal : source.hard);
			if (!available) continue;
			/* Match the old number marker's 32 by 32 mask distance. */
			var nearest_x = clamp(start_x, source.x - 16, source.x + 15);
			var nearest_y = clamp(start_y, source.y - 16, source.y + 15);
			ds_priority_add(ordered, source, point_distance(start_x, start_y, nearest_x, nearest_y));
		}
		var slot = 1;
		while (!ds_priority_empty(ordered))
		{
			var source = ds_priority_delete_min(ordered);
			var slots = variable_struct_get(aliases, string(source));
			slots[difficulty] = slot++;
			variable_struct_set(aliases, string(source), slots);
		}
		ds_priority_destroy(ordered);
	}
	for (var index = 0; index < array_length(sources); index++)
	{
		var source = sources[index];
		if (source.big_collectible_id != "") continue;
		var slots = variable_struct_get(aliases, string(source));
		source.big_collectible_id = "legacy_e" + string(slots[0]) + "_n" + string(slots[1])
			+ "_h" + string(slots[2]) + "_" + scr_big_collectible_new_id();
	}
	global.big_collectible_tiers_enabled = true;
	if (global.big_collectible_level_id == "") global.big_collectible_level_id = scr_big_collectible_new_id();
	scr_big_collectible_set_progress_section();
	scr_level_progress_prepare(scr_level_progress_current());
	if (!global.big_collectible_test_override)
	{
		scr_save_ini_open(scr_big_collectible_save_path(), false);
		for (var index = 0; index < array_length(sources); index++)
		{
			var source = sources[index];
			scr_big_collectible_materialize_legacy_ownership(source.big_collectible_id);
		}
		ini_close(); /* Snapshot existing per-difficulty ownership. The existing save lifecycle commits Switch data. */
	}
}

function scr_big_collectible_save_path()
{
	return scr_level_progress_path();
}

function scr_big_collectible_set_progress_section()
{
	global.level_progress_context = scr_level_progress_current();
	global.big_collectible_progress_section = global.level_progress_context.collectible_section;
	return global.level_progress_context.key;
}

/* The caller opens the existing player save at an opt-in or level-load boundary. */
function scr_big_collectible_materialize_legacy_ownership(collectible_id)
{
	if (global.big_collectible_test_override || collectible_id == "") return;
	for (var difficulty_index = 0; difficulty_index <= 2; difficulty_index++)
	{
		var legacy_slot = scr_big_collectible_legacy_slot(collectible_id, difficulty_index);
		if (legacy_slot <= 0) continue;
		var key = scr_big_collectible_progress_key(0, collectible_id) + "_legacy_d" + string(difficulty_index);
		if (!ini_key_exists(global.big_collectible_progress_section, key))
		{
			scr_save_metadata_stamp_open(scr_big_collectible_save_path(), true, false, true);
			ini_write_real(global.big_collectible_progress_section, key,
				ini_read_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), false));
		}
	}
}

function scr_big_collectible_progress_key(tier, collectible_id)
{
	return "tier" + string(tier) + "_" + string(collectible_id);
}

function scr_big_collectible_legacy_slot(collectible_id, difficulty_index = -1)
{
	var difficulty = difficulty_index < 0 ? global.difficulty : difficulty_index;
	var value = string(collectible_id);
	if (string_pos("legacy_", value) != 1) return 0;
	var parts = string_split(value, "_");
	if (array_length(parts) >= 5 && string_char_at(parts[1], 1) == "e")
	{
		var part_index = difficulty <= 0 ? 1 : (difficulty == 1 ? 2 : 3);
		var suffix = string_delete(parts[part_index], 1, 1);
		if (suffix == "" || string_digits(suffix) != suffix) return 0;
		var slot = floor(real(suffix));
		return max(0, slot);
	}
	var suffix = string_delete(value, 1, 7);
	if (suffix == "" || string_digits(suffix) != suffix) return 0;
	var slot = floor(real(suffix));
	return max(0, slot);
}

function scr_big_collectible_read_owned(tier, collectible_id, legacy_slot = 0)
{
	if (global.big_collectible_test_override) return false;
	var owned = ini_read_real(global.big_collectible_progress_section,
		scr_big_collectible_progress_key(tier, collectible_id), false);
	if (tier == 0 && legacy_slot > 0)
	{
		var difficulty_index = global.difficulty <= 0 ? 0 : (global.difficulty == 1 ? 1 : 2);
		var migration_key = scr_big_collectible_progress_key(0, collectible_id) + "_legacy_d" + string(difficulty_index);
		var legacy_owned = ini_key_exists(global.big_collectible_progress_section, migration_key)
			? ini_read_real(global.big_collectible_progress_section, migration_key, false)
			: ini_read_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), false);
		owned = owned || legacy_owned;
	}
	return owned;
}

function scr_big_collectible_tier_complete(tier)
{
	return tier >= 0 && tier <= 2
		&& global.big_collectible_tier_valid[tier]
		&& global.big_collectible_tier_counts[tier] > 0
		&& global.big_collectible_tier_owned[tier] == global.big_collectible_tier_counts[tier];
}

function scr_big_collectible_refresh_unlocks()
{
	var prerequisites_complete = true;
	global.big_collectible_tier_unlocked = [false, false, false];
	for (var tier = 0; tier <= 2; tier++)
	{
		/* Empty tiers are absent. They are never awarded completion. */
		if (global.big_collectible_tier_counts[tier] <= 0) continue;
		global.big_collectible_tier_unlocked[tier] = prerequisites_complete && global.big_collectible_tier_valid[tier];
		prerequisites_complete = prerequisites_complete && scr_big_collectible_tier_complete(tier);
	}
}

function scr_big_collectible_tier_available(tier)
{
	if (tier < 0 || tier > 2 || global.big_collectible_tier_counts[tier] <= 0) return false;
	/* Isolated editor tests expose only the authored tier being inspected. */
	if (global.big_collectible_test_override) return tier == global.big_collectible_active_tier;
	return global.big_collectible_tier_unlocked[tier];
}

function scr_big_collectible_next_start_tier()
{
	if (global.big_collectible_test_override || global.doing_clear_check_level || global.doing_clear_check_character) return global.big_collectible_active_tier;
	var requested = scr_big_collectible_selection_read(scr_big_collectible_runtime_selection_key());
	if (requested >= 0 && scr_big_collectible_tier_available(requested)) return requested;
	var next_tier = 0;
	for (var tier = 0; tier <= 2; tier++)
	{
		if (scr_big_collectible_tier_available(tier)) next_tier = tier;
	}
	return next_tier;
}

function scr_big_collectible_tiers_reset_run()
{
	global.big_collectible_run_key = "";
	global.big_collectible_run_ids = [];
	global.how_many_big_collectible_collected = 0;
	for (var slot = 1; slot < array_length(global.big_collectible_already_collected); slot++)
	{
		global.big_collectible_already_collected[slot] = false;
	}
}

function scr_big_collectible_tier_request(tier)
{
	if (!scr_big_collectible_tier_available(tier)) return false;
	if (global.big_collectible_test_override || global.doing_clear_check_level || global.doing_clear_check_character) return false;
	var selection_key = scr_big_collectible_runtime_selection_key();
	variable_struct_set(global.big_collectible_tier_choices, selection_key, tier);
	global.big_collectible_requested_tier = tier;
	return true;
}

function scr_big_collectible_tiers_begin()
{
	var info_path = global.character_select_in_this_menu == "main_game"
		? scr_get_official_level_file_path("", "data", "level_information.ini")
		: global.use_temp_or_working + "custom_levels/" + scr_get_custom_level_folder_name() + "/data/level_information.ini";
	global.big_collectible_tiers_enabled = false;
	global.big_collectible_level_id = "";
	var online_id = "";
	var legacy_name = global.level_name;
	var fresh_identity = false;
	var start_x = global.level_player_start_x[1];
	var start_y = global.level_player_start_y[1];
	if (file_exists(info_path))
	{
		ini_open(info_path);
		global.big_collectible_level_id = ini_read_string("info", "big_collectible_level_id", "");
		global.big_collectible_tiers_enabled = ini_read_real("info", "big_collectible_tiers", false);
		online_id = string_upper(ini_read_string("info", "level_id", ""));
		legacy_name = ini_read_string("info", "level_name", global.level_name);
		fresh_identity = ini_read_real("info", "progress_identity_fresh", false);
		start_x = ini_read_real("info", "level_player1_start_x", start_x);
		start_y = ini_read_real("info", "level_player1_start_y", start_y);
		ini_close();
	}
	with (obj_leveleditor_placed_object)
	{
		if (scr_big_collectible_is_source(object, item_inside) && (big_collectible_tier > 0 || big_collectible_id != ""))
		{
			global.big_collectible_tiers_enabled = true;
		}
	}
	if (global.big_collectible_tiers_enabled && global.big_collectible_level_id == "")
	{
		/* Legacy online IDs remain stable across downloaded updates and renames. */
		global.big_collectible_level_id = online_id != "" ? online_id : "folder_" + scr_get_custom_level_folder_name();
	}
	global.level_progress_context = scr_level_progress_context(global.character_select_in_this_menu == "main_game",
		global.character_select_in_this_menu == "main_game" ? scr_get_active_official_level_id() : "", online_id,
		global.big_collectible_level_id, scr_get_custom_level_folder_name(), legacy_name, fresh_identity);
	if (global.actually_play_edited_level && !global.big_collectible_test_override
	&& !global.doing_clear_check_level && !global.doing_clear_check_character)
		scr_save_metadata_play(global.level_progress_context.path);
	scr_level_progress_prepare(global.level_progress_context);
	var level_key = scr_big_collectible_set_progress_section();
	global.big_collectible_tier_counts = [0, 0, 0];
	global.big_collectible_tier_owned = [0, 0, 0];
	global.big_collectible_tier_items = [[], [], []];
	global.big_collectible_tier_valid = [true, true, true];
	var seen = [{}, {}, {}];
	var ordered_sources = [ds_priority_create(), ds_priority_create(), ds_priority_create()];
	scr_save_ini_open(scr_big_collectible_save_path(), false);
	with (obj_leveleditor_placed_object)
	{
		var source_is_collectible = scr_big_collectible_is_source(object, item_inside);
		if (source_is_collectible && big_collectible_tier == 0)
		{
			scr_big_collectible_materialize_legacy_ownership(big_collectible_id);
		}
		if (source_is_collectible && scr_big_collectible_source_difficulty(id))
		{
			var tier = clamp(floor(real(big_collectible_tier)), 0, 2);
			global.big_collectible_tier_counts[tier]++;
			var key = string(big_collectible_id);
			if ((key == "" && global.big_collectible_tiers_enabled)
			|| (key != "" && variable_struct_exists(seen[tier], key)))
			{
				global.big_collectible_tier_valid[tier] = false;
			}
			if (key != "") variable_struct_set(seen[tier], key, true);
			var nearest_x = clamp(start_x, x - 16, x + 15);
			var nearest_y = clamp(start_y, y - 16, y + 15);
			ds_priority_add(ordered_sources[tier], key, point_distance(start_x, start_y, nearest_x, nearest_y));
		}
	}
	for (var tier = 0; tier <= 2; tier++)
	{
		var slot = 0;
		while (!ds_priority_empty(ordered_sources[tier]))
		{
			var key = ds_priority_delete_min(ordered_sources[tier]);
			slot++;
			var legacy_slot = tier == 0 ? (key == "" ? slot : scr_big_collectible_legacy_slot(key)) : 0;
			var owned = !global.big_collectible_test_override && (key != ""
				? scr_big_collectible_read_owned(tier, key, legacy_slot)
				: ini_read_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), false));
			array_push(global.big_collectible_tier_items[tier], {collectible_id:key, legacy_slot:legacy_slot, owned:owned});
			if (owned) global.big_collectible_tier_owned[tier]++;
		}
		ds_priority_destroy(ordered_sources[tier]);
		global.big_collectible_tier_valid[tier] = global.big_collectible_tier_valid[tier]
			&& global.big_collectible_tier_counts[tier] > 0;
	}
	ini_close();
	scr_big_collectible_refresh_unlocks();
	scr_big_collectible_online_snapshot_store(online_id);
	if (!global.actually_play_edited_level && !global.big_collectible_test_override) return;
	var run_key = scr_big_collectible_save_path() + "|" + level_key + "|d" + string(global.difficulty)
		+ (global.big_collectible_test_override ? "_test" : "_play");
	if (global.big_collectible_run_key != run_key)
	{
		var selection_key = scr_big_collectible_runtime_selection_key();
		var requested = scr_big_collectible_selection_read(selection_key);
		if (global.big_collectible_test_override)
		{
			requested = global.big_collectible_requested_tier;
			if (requested < 0) requested = global.big_collectible_active_tier;
		}
		else if (global.doing_clear_check_level || global.doing_clear_check_character) requested = -1;
		else if (requested >= 0 && !scr_big_collectible_tier_available(requested))
		{
			variable_struct_remove(global.big_collectible_tier_choices, selection_key);
			requested = -1;
		}
		var active = 0;
		if (global.big_collectible_tiers_enabled && !global.doing_clear_check_level && !global.doing_clear_check_character)
		{
			if (global.big_collectible_test_override && requested >= 0 && requested <= 2)
			{
				active = requested;
			}
			else if (requested >= 0 && scr_big_collectible_tier_available(requested))
			{
				active = requested;
			}
			else
			{
				for (var tier = 0; tier <= 2; tier++)
				{
					if (scr_big_collectible_tier_available(tier)) active = tier;
				}
			}
		}
		global.big_collectible_active_tier = active;
		global.big_collectible_requested_tier = -1;
		scr_big_collectible_tiers_reset_run();
		global.big_collectible_run_key = run_key;
	}
}

function scr_big_collectible_copy_source(target)
{
	target.big_collectible_tier = variable_instance_exists(self, "big_collectible_tier") ? big_collectible_tier : 0;
	target.big_collectible_id = variable_instance_exists(self, "big_collectible_id") ? big_collectible_id : "";
	target.big_collectible_marker = variable_instance_exists(self, "big_collectible_marker") ? big_collectible_marker : noone;
	if (variable_instance_exists(self, "big_collectible")) target.big_collectible = big_collectible;
	if (variable_instance_exists(self, "big_collectible_legacy_slot")) target.big_collectible_legacy_slot = big_collectible_legacy_slot;
}

function scr_big_collectible_create_marker(source_owner = noone)
{
	var marker = instance_create_depth(x, y, 0, obj_big_collectible_number);
	scr_big_collectible_copy_source(marker);
	if (instance_exists(source_owner))
	{
		scr_big_collectible_copy_source(source_owner);
		source_owner.big_collectible_marker = marker;
		marker.big_collectible_owner = source_owner;
	}
	global.max_big_collectible = instance_number(obj_big_collectible_number);
	return marker;
}

function scr_big_collectible_assign_numbers()
{
	/* One spatial pass preserves numbering in every untagged legacy level. */
	var count = instance_number(obj_big_collectible_number);
	var markers = ds_priority_create();
	with (obj_big_collectible_number)
	{
		ds_priority_add(markers, id, distance_to_point(global.level_player_start_x[1], global.level_player_start_y[1]));
	}
	ini_open(scr_big_collectible_save_path());
	global.how_many_big_collectible_collected = 0;
	for (var slot = 1; slot <= count; slot++)
	{
		var marker = ds_priority_delete_min(markers);
		marker.big_collectible = slot;
		var legacy_slot = 0;
		if (marker.big_collectible_tier == 0)
		{
			legacy_slot = marker.big_collectible_id == "" ? slot : scr_big_collectible_legacy_slot(marker.big_collectible_id);
		}
		marker.big_collectible_legacy_slot = legacy_slot;
		var owned = false;
		if (!global.big_collectible_test_override)
		{
			owned = marker.big_collectible_id != ""
				? scr_big_collectible_read_owned(marker.big_collectible_tier, marker.big_collectible_id, legacy_slot)
				: ini_read_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), false);
		}
		global.big_collectible[slot] = owned;
		hud_show_big_collectible_blink[slot] = 0;
		var run_item_key = scr_big_collectible_run_item_key(marker.big_collectible_tier, marker.big_collectible_id, legacy_slot);
		global.big_collectible_already_collected[slot] = array_contains(global.big_collectible_run_ids, run_item_key);
		if (global.big_collectible_already_collected[slot]) global.how_many_big_collectible_collected++;
		if (instance_exists(marker.big_collectible_owner))
		{
			var owner = marker.big_collectible_owner;
			owner.big_collectible = slot;
			owner.big_collectible_marker = marker;
			owner.big_collectible_legacy_slot = legacy_slot;
		}
	}
	ini_close();
	ds_priority_destroy(markers);
	global.max_big_collectible = count;
}

function scr_big_collectible_run_item_key(tier, collectible_id, legacy_slot)
{
	return string(tier) + "_" + (collectible_id != "" ? string(collectible_id) : "slot_" + string(legacy_slot));
}

function scr_big_collectible_record_run_pickup(tier, collectible_id, legacy_slot)
{
	var key = scr_big_collectible_run_item_key(tier, collectible_id, legacy_slot);
	if (!array_contains(global.big_collectible_run_ids, key)) array_push(global.big_collectible_run_ids, key);
}

function scr_big_collectible_record_pickup(slot, tier, collectible_id, legacy_slot)
{
	if (global.big_collectible_test_override || !global.actually_play_edited_level
	|| global.doing_clear_check_level || global.doing_clear_check_character) return;
	scr_save_ini_open(scr_big_collectible_save_path());
	var owned = collectible_id != ""
		? scr_big_collectible_read_owned(tier, collectible_id, legacy_slot)
		: ini_read_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), false);
	if (collectible_id != "")
	{
		ini_write_real(global.big_collectible_progress_section, scr_big_collectible_progress_key(tier, collectible_id), true);
	}
	if (tier == 0 && legacy_slot > 0)
	{
		ini_write_real(scr_level_progress_section(), "big_collectible" + string(legacy_slot), true);
	}
	ini_close(); /* The existing save lifecycle commits Switch data. */
	if (tier == 0 && !owned)
	{
		scr_save_ini_open(global.character_select_in_this_menu == "main_game" ? scr_big_collectible_save_path() : game_save_id + "save_file/custom_level_save.ini");
		ini_write_real("Player", "total_big_collectibles", ini_read_real("Player", "total_big_collectibles", 0) + 1);
		if (global.character_select_in_this_menu == "main_game")
		{
			scr_set_stat_achievement("TOTAL_BIG_COLLECTIBLE", ini_read_real("Player", "total_big_collectibles", 0));
		}
		ini_close();
	}
	if (!owned) global.big_collectible_tier_owned[tier]++;
	var items = global.big_collectible_tier_items[tier];
	for (var item_index = 0; item_index < array_length(items); item_index++)
	{
		var item = items[item_index];
		if ((collectible_id != "" && item.collectible_id == collectible_id)
		|| (collectible_id == "" && item.collectible_id == "" && item.legacy_slot == legacy_slot))
		{
			item.owned = true;
			break;
		}
	}
	scr_big_collectible_refresh_unlocks();
}
