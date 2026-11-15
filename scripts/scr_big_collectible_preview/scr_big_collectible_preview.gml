/* Menu snapshots read authored files and ownership without creating gameplay objects. */
function scr_big_collectible_selection_key(level_key, save_path, difficulty)
{
	return save_path + "|" + level_key + "|d" + string(clamp(floor(difficulty), 0, 2));
}

function scr_big_collectible_selection_read(selection_key)
{
	if (!variable_global_exists("big_collectible_tier_choices")) global.big_collectible_tier_choices = {};
	return variable_struct_exists(global.big_collectible_tier_choices, selection_key)
		? variable_struct_get(global.big_collectible_tier_choices, selection_key) : -1;
}

function scr_big_collectible_runtime_selection_key()
{
	return scr_big_collectible_selection_key(scr_level_progress_current().key, scr_big_collectible_save_path(), global.difficulty);
}

function scr_big_collectible_preview_choose(model, tier)
{
	if (variable_struct_exists(model, "read_only") && model.read_only) return false;
	if (tier < 0 || tier > 2 || !model.unlocked[tier] || model.counts[tier] <= 0) return false;
	if (!variable_global_exists("big_collectible_tier_choices")) global.big_collectible_tier_choices = {};
	variable_struct_set(global.big_collectible_tier_choices, model.selection_key, tier);
	model.selected_tier = tier;
	return true;
}

function scr_big_collectible_preview_load(info_path, objects_path, is_official = false, official_id = "", folder_name = "", fallback_name = "")
{
	if (is_official) official_id = scr_normalize_official_level_id(official_id);
	var save_path = is_official ? game_save_id + "save_file/file" + string(global.file) + ".ini"
		: game_save_id + "save_file/custom_level_save.ini";
	var model = {key:info_path + "|" + save_path + "|" + string(global.difficulty), selection_key:"",
		counts:[0, 0, 0], owned_counts:[0, 0, 0], items:[[], [], []], unlocked:[false, false, false],
		valid:[false, false, false], selected_tier:-1, active_tier:-1, is_runtime:false,
		run_owned:[], run_collected:[], ready:false, error:"", level_key:""};
	if (!file_exists(info_path) || !file_exists(objects_path)) return model;
	var authored_uid = "";
	var online_id = "";
	var enabled = false;
	var legacy_name = fallback_name;
	var fresh_identity = false;
	var start_x = 0;
	var start_y = 0;
	ini_open(info_path);
	var supported = ini_read_real("info", "tier_format_version", 0) <= 1;
	authored_uid = ini_read_string("info", "big_collectible_level_id", "");
	online_id = string_upper(ini_read_string("info", "level_id", ""));
	enabled = ini_read_real("info", "big_collectible_tiers", false);
	fresh_identity = ini_read_real("info", "progress_identity_fresh", false);
	if (legacy_name == "") legacy_name = ini_read_string("info", "level_name", folder_name);
	start_x = ini_read_real("info", "level_player1_start_x", 0);
	start_y = ini_read_real("info", "level_player1_start_y", 0);
	ini_close();
	if (!supported) { model.error = "Unsupported tier format"; return model; }
	if (is_official) legacy_name = official_id;
	var text = "";
	var file = file_text_open_read(objects_path);
	while (!file_text_eof(file)) { text += file_text_read_string(file); file_text_readln(file); }
	file_text_close(file);
	var sources = [];
	try
	{
		var authored = json_parse(text);
		if (!is_array(authored)) { model.error = "Invalid level placements"; return model; }
		for (var index = 0; index < array_length(authored); index++)
		{
			var entry = authored[index];
			if (!is_struct(entry) || !variable_struct_exists(entry, "O")) continue;
			var object_id = real(entry.O);
			var inside_id = variable_struct_exists(entry, "I") ? entry.I : 0;
			if (!scr_big_collectible_is_source(object_id, inside_id)) continue;
			var tier = variable_struct_exists(entry, "T") ? clamp(floor(real(entry.T)), 0, 2) : 0;
			var identity = variable_struct_exists(entry, "C") ? string(entry.C) : "";
			if (tier > 0 || identity != "") enabled = true;
			var flag = global.difficulty <= 0 ? "E" : (global.difficulty == 1 ? "N" : "H");
			if (variable_struct_exists(entry, flag) && !real(variable_struct_get(entry, flag))) continue;
			var repeat_count = variable_struct_exists(entry, "L") ? max(0, floor(real(entry.L)) + 1) : 1;
			for (var repeat_index = 0; repeat_index < repeat_count; repeat_index++)
			{
				var collectible_id = identity;
				if (repeat_index > 0 && identity != "") collectible_id = "repeat_" + identity + "_" + string(repeat_index);
				var source_x = real(entry.X) + 32 * repeat_index;
				var source_y = real(entry.Y);
				var nearest_x = clamp(start_x, source_x - 16, source_x + 15);
				var nearest_y = clamp(start_y, source_y - 16, source_y + 15);
				array_push(sources, {tier:tier, collectible_id:collectible_id,
					distance:point_distance(start_x, start_y, nearest_x, nearest_y)});
			}
		}
	}
	catch (exception)
	{
		model.error = "Invalid level placements";
		return model;
	}
	var context = scr_level_progress_context(is_official, official_id, online_id, authored_uid, folder_name, legacy_name, fresh_identity);
	save_path = context.path;
	legacy_name = context.section;
	model.level_key = context.key;
	model.selection_key = scr_big_collectible_selection_key(context.key, save_path, global.difficulty);
	model.key = info_path + "|" + save_path + "|" + string(global.difficulty) + "|" + context.key;
	model.legacy_unresolved = !is_official && scr_level_progress_unresolved(context);
	model.online_status = online_id != "" ? scr_level_progress_online_badge(online_id) : 0;
	var section = context.collectible_section;
	var ordered = [ds_priority_create(), ds_priority_create(), ds_priority_create()];
	var seen = [{}, {}, {}];
	model.valid = [true, true, true];
	for (var index = 0; index < array_length(sources); index++)
	{
		var source = sources[index];
		var tier = source.tier;
		var identity = source.collectible_id;
		model.counts[tier]++;
		if ((identity == "" && enabled) || (identity != "" && variable_struct_exists(seen[tier], identity))) model.valid[tier] = false;
		if (identity != "") variable_struct_set(seen[tier], identity, true);
		ds_priority_add(ordered[tier], identity, source.distance);
	}
	var has_save = file_exists(save_path);
	if (has_save) ini_open(save_path);
	for (var tier = 0; tier <= 2; tier++)
	{
		var slot = 0;
		while (!ds_priority_empty(ordered[tier]))
		{
			var identity = ds_priority_delete_min(ordered[tier]);
			slot++;
			var legacy_slot = tier == 0 ? (identity == "" ? slot : scr_big_collectible_legacy_slot(identity)) : 0;
			var owned = false;
			if (has_save)
			{
				var key = scr_big_collectible_progress_key(tier, identity);
				if (identity != "") owned = ini_read_real(section, key, false);
				if (tier == 0 && legacy_slot > 0)
				{
					var migration_key = key + "_legacy_d" + string(clamp(floor(global.difficulty), 0, 2));
					var legacy_owned = identity != "" && ini_key_exists(section, migration_key)
						? ini_read_real(section, migration_key, false)
						: ini_read_real(legacy_name, "big_collectible" + string(legacy_slot), false);
					owned = owned || legacy_owned;
				}
			}
			array_push(model.items[tier], {collectible_id:identity, legacy_slot:legacy_slot, owned:owned});
			if (owned) model.owned_counts[tier]++;
		}
		ds_priority_destroy(ordered[tier]);
		model.valid[tier] = model.valid[tier] && model.counts[tier] > 0;
	}
	if (has_save) ini_close();
	var prerequisites_complete = true;
	for (var tier = 0; tier <= 2; tier++)
	{
		if (model.counts[tier] <= 0) continue;
		model.unlocked[tier] = prerequisites_complete && model.valid[tier];
		prerequisites_complete = prerequisites_complete && model.valid[tier] && model.owned_counts[tier] == model.counts[tier];
		if (model.unlocked[tier]) model.selected_tier = tier;
	}
	var choice = scr_big_collectible_selection_read(model.selection_key);
	if (choice >= 0 && choice <= 2 && model.unlocked[choice]) model.selected_tier = choice;
	model.ready = true;
	return model;
}

function scr_big_collectible_runtime_model()
{
	return {key:scr_big_collectible_runtime_selection_key(), counts:global.big_collectible_tier_counts,
		owned_counts:global.big_collectible_tier_owned, items:global.big_collectible_tier_items,
		unlocked:[scr_big_collectible_tier_available(0), scr_big_collectible_tier_available(1), scr_big_collectible_tier_available(2)],
		selected_tier:scr_big_collectible_next_start_tier(), active_tier:global.big_collectible_active_tier,
		is_runtime:true, run_owned:global.big_collectible, run_collected:global.big_collectible_already_collected};
}

/* Called once from the normal custom-level load boundary, after closing its save. */
function scr_big_collectible_online_snapshot_store(level_id)
{
	if (global.character_select_in_this_menu == "main_game" || !global.actually_play_edited_level
	|| global.big_collectible_test_override || global.doing_clear_check_level || global.doing_clear_check_character
	|| global.big_collectible_tier_format_unsupported) return;
	level_id = string_upper(string_trim(string(level_id)));
	if (level_id == "") return;
	var context = scr_level_progress_current();
	if (context.online_id != level_id || context.key != "online_" + level_id) return;
	var items = [[], [], []];
	for (var tier = 0; tier <= 2; tier++)
	{
		var sources = global.big_collectible_tier_items[tier];
		for (var index = 0; index < array_length(sources); index++)
		{
			var source = sources[index];
			array_push(items[tier], {collectible_id:source.collectible_id, legacy_slot:source.legacy_slot});
		}
	}
	/* Last-seen authored metadata contains no ownership. The ID-owned progress section stays authoritative. */
	var snapshot = "b64:" + base64_encode(json_stringify({version:2,
		progress_key:context.key, authored_uid:context.uid, folder:context.folder, legacy_name:context.legacy_name,
		counts:global.big_collectible_tier_counts, valid:global.big_collectible_tier_valid, items:items}));
	var section = "BigCollectibleOnline_" + level_id;
	var key = "d" + string(clamp(floor(global.difficulty), 0, 2));
	scr_save_ini_open(game_save_id + "save_file/online_level_progress.ini", false);
	if (ini_read_string(section, key, "") != snapshot)
	{
		scr_save_metadata_stamp_open(game_save_id + "save_file/online_level_progress.ini", true, false, true);
		ini_write_string(section, key, snapshot);
	}
	ini_close(); /* The existing save lifecycle performs platform commits. */
}

function scr_big_collectible_online_progress_model(level_id)
{
	return {key:"online_saved|" + level_id + "|" + game_save_id + "|" + string(global.difficulty), selection_key:"",
		counts:[0, 0, 0], owned_counts:[0, 0, 0], items:[[], [], []], unlocked:[false, false, false],
		valid:[false, false, false], selected_tier:-1, active_tier:-1, is_runtime:false,
		run_owned:[], run_collected:[], ready:false, error:"", level_key:"", read_only:true,
		total_known:false, saved_snapshot:false, legacy_unresolved:false, online_status:0};
}

/* Enumerate actual saved keys, rather than treating a highest slot as a total. */
function scr_big_collectible_online_saved_keys(path, section)
{
	var keys = [];
	if (!file_exists(path)) return keys;
	var file = file_text_open_read(path);
	var current_section = "";
	while (!file_text_eof(file))
	{
		var line = string_trim(file_text_read_string(file));
		file_text_readln(file);
		if (string_char_at(line, 1) == "[" && string_char_at(line, string_length(line)) == "]")
		{
			current_section = string_copy(line, 2, string_length(line) - 2);
		}
		else if (current_section == section)
		{
			var separator = string_pos("=", line);
			if (separator > 1) array_push(keys, string_trim(string_copy(line, 1, separator - 1)));
		}
	}
	file_text_close(file);
	return keys;
}

function scr_big_collectible_online_progress_load(level_id)
{
	level_id = string_upper(string_trim(string(level_id)));
	var model = scr_big_collectible_online_progress_model(level_id);
	if (level_id == "") return model;
	model.online_status = scr_level_progress_online_badge(level_id);
	var online_path = game_save_id + "save_file/online_level_progress.ini";
	var custom_path = game_save_id + "save_file/custom_level_save.ini";
	var snapshot_text = "";
	if (file_exists(online_path))
	{
		ini_open(online_path);
		snapshot_text = ini_read_string("BigCollectibleOnline_" + level_id,
			"d" + string(clamp(floor(global.difficulty), 0, 2)), "");
		ini_close();
	}
	var snapshot = scr_level_progress_decode(snapshot_text);
	if (!scr_level_progress_snapshot_valid(snapshot)) snapshot = undefined;
	if (is_struct(snapshot) && snapshot.version == 2 && snapshot.progress_key != "online_" + level_id) snapshot = undefined;
	var context = scr_level_progress_context(false, "", level_id,
		is_struct(snapshot) && snapshot.version == 2 ? snapshot.authored_uid : "",
		is_struct(snapshot) && snapshot.version == 2 ? snapshot.folder : "",
		is_struct(snapshot) ? snapshot.legacy_name : "");
	model.level_key = context.key;
	model.legacy_unresolved = scr_level_progress_unresolved(context);
	if (is_struct(snapshot))
	{
		model.level_key = context.key;
		model.counts = snapshot.counts;
		model.valid = snapshot.valid;
		model.total_known = true;
		model.saved_snapshot = true;
		var section = context.section;
		var has_save = file_exists(context.path);
		if (has_save) ini_open(context.path);
		var prerequisite = true;
		for (var tier = 0; tier <= 2; tier++)
		{
			for (var index = 0; index < array_length(snapshot.items[tier]); index++)
			{
				var source = snapshot.items[tier][index];
				var identity = string(source.collectible_id);
				var legacy_slot = real(source.legacy_slot);
				var owned = false;
				if (has_save)
				{
					var key = scr_big_collectible_progress_key(tier, identity);
					if (identity != "") owned = ini_read_real(section, key, false);
					if (tier == 0 && legacy_slot > 0)
					{
						var migration_key = key + "_legacy_d" + string(clamp(floor(global.difficulty), 0, 2));
						var legacy_owned = identity != "" && ini_key_exists(section, migration_key)
							? ini_read_real(section, migration_key, false)
							: ini_read_real(context.section, "big_collectible" + string(legacy_slot), false);
						owned = owned || legacy_owned;
					}
				}
				array_push(model.items[tier], {collectible_id:identity, legacy_slot:legacy_slot, owned:owned,
					ordinal:index + 1, ordinal_known:true});
				if (owned) model.owned_counts[tier]++;
			}
			if (model.counts[tier] <= 0) continue;
			model.unlocked[tier] = prerequisite && model.valid[tier];
			prerequisite = prerequisite && model.valid[tier] && model.owned_counts[tier] == model.counts[tier];
		}
		if (has_save) ini_close();
		model.ready = true;
		return model;
	}
	/* Old ID-addressed saves can prove earned items, but cannot prove missing items or totals. */
	var paths = [online_path, custom_path];
	var sections = ["online_" + level_id, "BigCollectibles_custom_" + level_id, level_id];
	for (var save_path_index = 0; save_path_index < array_length(paths); save_path_index++)
	{
		var path = paths[save_path_index];
		if (!file_exists(path)) continue;
		for (var section_index = 0; section_index < array_length(sections); section_index++)
		{
			var section = sections[section_index];
			var keys = scr_big_collectible_online_saved_keys(path, section);
			if (array_length(keys) == 0) continue;
			var seen = [{}, {}, {}];
			ini_open(path);
			for (var index = 0; index < array_length(keys); index++)
			{
				var key = keys[index];
				var tier = 0;
				var identity = "";
				var ordinal = 0;
				if (string_pos("big_collectible", key) == 1)
				{
					var suffix = string_delete(key, 1, 15);
					if (suffix == "" || string_digits(suffix) != suffix || real(suffix) <= 0) continue;
					ordinal = floor(real(suffix));
				}
				else if (string_pos("tier", key) == 1 && string_char_at(key, 6) == "_"
				&& string_pos(string_char_at(key, 5), "012") > 0)
				{
					tier = real(string_char_at(key, 5));
					identity = string_delete(key, 1, 6);
					var migration_suffix = "_legacy_d" + string(clamp(floor(global.difficulty), 0, 2));
					if (string_pos("_legacy_d", identity) > 0)
					{
						if (string_copy(identity, string_length(identity) - 9, 10) != migration_suffix) continue;
						identity = string_delete(identity, string_length(identity) - 9, 10);
					}
					if (identity == "") continue;
					if (tier == 0) ordinal = scr_big_collectible_legacy_slot(identity);
				}
				else continue;
				if (!ini_read_real(section, key, false)) continue;
				var item_key = ordinal > 0 ? "slot_" + string(ordinal) : identity;
				if (variable_struct_exists(seen[tier], item_key)) continue;
				variable_struct_set(seen[tier], item_key, true);
				array_push(model.items[tier], {collectible_id:identity, legacy_slot:ordinal, owned:true,
					ordinal:ordinal, ordinal_known:ordinal > 0});
				model.counts[tier]++;
				model.owned_counts[tier]++;
				model.unlocked[tier] = true;
			}
			ini_close();
			if (model.counts[0] + model.counts[1] + model.counts[2] > 0) { model.ready = true; return model; }
		}
	}
	return model;
}
