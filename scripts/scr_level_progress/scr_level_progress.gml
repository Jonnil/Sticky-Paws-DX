/* Names are presentation. Online IDs and authored local UIDs own player progress. */
function scr_level_progress_context(is_official, official_id, online_id, authored_uid, folder, legacy_name, fresh_identity = false)
{
	online_id = string_upper(string_trim(string(online_id)));
	var key = is_official ? scr_normalize_official_level_id(official_id)
		: (online_id != "" ? "online_" + online_id : (authored_uid != "" ? "local_" + authored_uid : "local_folder_" + folder));
	return {key:key, section:key, path:game_save_id + "save_file/" + (is_official ? "file" + string(global.file) + ".ini"
		: (online_id != "" ? "online_level_progress.ini" : "custom_level_save.ini")),
		collectible_section:is_official ? "BigCollectibles_official_" + key : key,
		online_id:online_id, uid:authored_uid, folder:folder, legacy_name:legacy_name,
		official:is_official, profile:game_save_id, fresh_identity:fresh_identity};
}

function scr_level_progress_current()
{
	var official = global.character_select_in_this_menu == "main_game";
	var folder = official ? "" : scr_get_custom_level_folder_name();
	if (variable_global_exists("level_progress_context") && is_struct(global.level_progress_context))
	{
		var context = global.level_progress_context;
		if (context.official == official && context.profile == game_save_id
		&& (official ? (context.key == scr_get_active_official_level_id()
			&& context.path == game_save_id + "save_file/file" + string(global.file) + ".ini") : context.folder == folder))
		{
			if (!official && context.uid != global.big_collectible_level_id)
				return scr_level_progress_context(false, "", context.online_id, global.big_collectible_level_id, folder, context.legacy_name, context.fresh_identity);
			return context;
		}
	}
	return scr_level_progress_context(official, official ? scr_get_active_official_level_id() : "", "",
		global.big_collectible_level_id, folder, global.level_name);
}

function scr_level_progress_path() { return scr_level_progress_current().path; }
function scr_level_progress_section() { return scr_level_progress_current().section; }

function scr_level_progress_decode(value, fallback = undefined)
{
	try
	{
		if (string_pos("b64:", value) == 1) value = base64_decode(string_delete(value, 1, 4));
		return json_parse(value);
	}
	catch (exception) { return fallback; }
}

function scr_level_progress_backup(path)
{
	if (!file_exists(path)) return true;
	var backup_path = path + ".pre_id_v1.bak";
	if (file_exists(backup_path)) return true;
	try { file_copy(path, backup_path); }
	catch (exception) { return false; }
	return file_exists(backup_path);
}

function scr_level_progress_sections(path)
{
	var sections = [];
	if (!file_exists(path)) return sections;
	var file = file_text_open_read(path);
	while (!file_text_eof(file))
	{
		var line = string_trim(file_text_read_string(file));
		file_text_readln(file);
		if (string_char_at(line, 1) == "[" && string_char_at(line, string_length(line)) == "]")
			array_push(sections, string_copy(line, 2, string_length(line) - 2));
	}
	file_text_close(file);
	return sections;
}

function scr_level_progress_bindings_read()
{
	var registry = {};
	var path = game_save_id + "save_file/online_level_progress.ini";
	var keys = scr_big_collectible_online_saved_keys(path, "ProgressBindings");
	if (!file_exists(path)) return registry;
	ini_open(path);
	for (var index = 0; index < array_length(keys); index++)
	{
		var entry = scr_level_progress_decode(ini_read_string("ProgressBindings", keys[index], ""));
		try
		{
			if (!is_struct(entry) || !is_string(entry.target) || !is_array(entry.names)
			|| !is_string(entry.uid) || !is_string(entry.folder) || (!is_real(entry.metadata) && !is_bool(entry.metadata))) continue;
			var registry_key = keys[index];
			if (string_pos("online_", registry_key) == 1 && entry.target != registry_key) continue;
			if (string_pos("catalogue_online_", registry_key) == 1
			&& entry.target != string_delete(registry_key, 1, string_length("catalogue_"))) continue;
			if (!variable_struct_exists(entry, "historical")) entry.historical = false;
			if (!is_real(entry.historical) && !is_bool(entry.historical)) continue;
			if (!variable_struct_exists(entry, "historical_names")) entry.historical_names = [];
			if (!is_array(entry.historical_names)) continue;
			if (!variable_struct_exists(entry, "fresh_identity")) entry.fresh_identity = false;
			if (!is_real(entry.fresh_identity) && !is_bool(entry.fresh_identity)) continue;
			if (!variable_struct_exists(entry, "local_aliases_frozen")) entry.local_aliases_frozen = false;
			if (!is_real(entry.local_aliases_frozen) && !is_bool(entry.local_aliases_frozen)) continue;
			var valid_names = true;
			for (var name_index = 0; name_index < array_length(entry.names); name_index++) if (!is_string(entry.names[name_index])) valid_names = false;
			for (var name_index = 0; name_index < array_length(entry.historical_names); name_index++) if (!is_string(entry.historical_names[name_index])) valid_names = false;
			if (valid_names) variable_struct_set(registry, keys[index], entry);
		}
		catch (exception) { /* A malformed registry entry cannot establish ownership. */ }
	}
	ini_close();
	return registry;
}

function scr_level_progress_binding_add(registry, context, metadata = true, historical = false)
{
	if (context.official) return;
	var registry_key = (metadata ? "" : "catalogue_") + context.key;
	var existing = variable_struct_exists(registry, registry_key);
	var old_key = "local_folder_" + context.folder;
	var entry = existing ? variable_struct_get(registry, registry_key)
		: {version:1, target:context.key, names:[], uid:context.uid, folder:context.folder, metadata:metadata, historical:false, historical_names:[], fresh_identity:false, local_aliases_frozen:false};
	if (!variable_struct_exists(entry, "local_aliases_frozen")) entry.local_aliases_frozen = false;
	/* Freeze local legacy aliases at adoption. A later title is only conflict evidence. */
	if (metadata && context.online_id == "" && !entry.local_aliases_frozen)
	{
		var previous = existing ? entry : (variable_struct_exists(registry, old_key) ? variable_struct_get(registry, old_key) : undefined);
		if (!context.fresh_identity)
		{
			if (is_struct(previous))
			{
				if (variable_struct_exists(previous, "local_aliases_frozen") && previous.local_aliases_frozen)
				{
					entry.historical_names = [];
					for (var alias_index = 0; alias_index < array_length(previous.historical_names); alias_index++)
						array_push(entry.historical_names, previous.historical_names[alias_index]);
				}
				else if (array_length(previous.names) > 0) entry.historical_names = [previous.names[0]];
			}
			else
			{
				if (context.legacy_name != "") array_push(entry.historical_names, context.legacy_name);
				if (context.folder != "" && !array_contains(entry.historical_names, context.folder)) array_push(entry.historical_names, context.folder);
			}
		}
		entry.local_aliases_frozen = true;
	}
	entry.historical = historical || (variable_struct_exists(entry, "historical") && entry.historical);
	entry.fresh_identity = entry.fresh_identity || context.fresh_identity;
	if (historical && context.legacy_name != "" && !array_contains(entry.historical_names, context.legacy_name)) array_push(entry.historical_names, context.legacy_name);
	if (context.uid != "") entry.uid = context.uid;
	if (context.folder != "") entry.folder = context.folder;
	entry.metadata = metadata;
	if (context.legacy_name != "" && !array_contains(entry.names, context.legacy_name)) array_push(entry.names, context.legacy_name);
	if (metadata && context.folder != "" && !array_contains(entry.names, context.folder)) array_push(entry.names, context.folder);
	variable_struct_set(registry, registry_key, entry);
	/* An authored UID replaces the same local folder fallback, rather than creating a competing owner. */
	if (metadata && context.online_id == "" && context.uid != "" && variable_struct_exists(registry, old_key))
	{
		var previous = variable_struct_get(registry, old_key);
		previous.target = context.key;
		variable_struct_set(registry, old_key, previous);
	}
}

function scr_level_progress_binding_unique(registry, context, legacy_name, uid = "")
{
	var known = false;
	var names = variable_struct_get_names(registry);
	for (var index = 0; index < array_length(names); index++)
	{
		var entry = variable_struct_get(registry, names[index]);
		var matches = uid != "" ? (variable_struct_exists(entry, "uid") && entry.uid == uid) : array_contains(entry.names, legacy_name);
		if (!matches) continue;
		if (entry.target != context.key) return false;
		if (variable_struct_exists(entry, "metadata") && entry.metadata) known = true;
	}
	return known;
}

function scr_level_progress_bindings_store(registry)
{
	var path = game_save_id + "save_file/online_level_progress.ini";
	if (!directory_exists(game_save_id + "save_file")) directory_create(game_save_id + "save_file");
	if (!scr_level_progress_backup(path)) return false;
	scr_save_ini_open(path, false);
	var names = variable_struct_get_names(registry);
	for (var index = 0; index < array_length(names); index++)
	{
		var value = "b64:" + base64_encode(json_stringify(variable_struct_get(registry, names[index])));
		if (ini_read_string("ProgressBindings", names[index], "") != value)
		{
			scr_save_metadata_stamp_open(path, true, false, true);
			ini_write_string("ProgressBindings", names[index], value);
		}
	}
	ini_close();
	return true;
}

/* Read metadata before opening a player save. No caller leaves an INI open here. */
function scr_level_progress_from_info(info_path, folder)
{
	if (!file_exists(info_path)) return undefined;
	ini_open(info_path);
	var online_id = ini_read_string("info", "level_id", "");
	var uid = ini_read_string("info", "big_collectible_level_id", "");
	var legacy_name = ini_read_string("info", "level_name", folder);
	var supported = ini_read_real("info", "tier_format_version", 0) <= 1;
	var fresh_identity = ini_read_real("info", "progress_identity_fresh", false);
	ini_close();
	if (!supported) return undefined;
	return scr_level_progress_context(false, "", online_id, uid, folder, legacy_name, fresh_identity);
}

function scr_level_progress_collect_bindings(registry)
{
	var contexts = [];
	var roots = [game_save_id, temp_directory];
	for (var root_index = 0; root_index < array_length(roots); root_index++)
	{
		var root = roots[root_index] + "custom_levels/";
		var folder = file_find_first(root + "*", fa_directory);
		while (folder != "")
		{
			var context = scr_level_progress_from_info(root + folder + "/data/level_information.ini", folder);
			if (is_struct(context)) { scr_level_progress_binding_add(registry, context); array_push(contexts, context); }
			folder = file_find_next();
		}
		file_find_close();
	}
	/* Previous trusted snapshots retain bindings after temporary downloads disappear. */
	var path = game_save_id + "save_file/online_level_progress.ini";
	var sections = scr_level_progress_sections(path);
	if (file_exists(path))
	{
		ini_open(path);
		for (var section_index = 0; section_index < array_length(sections); section_index++)
		{
			var section = sections[section_index];
			if (string_pos("BigCollectibleOnline_", section) != 1) continue;
			var online_id = string_delete(section, 1, 21);
			for (var difficulty = 0; difficulty <= 2; difficulty++)
			{
				var data = scr_level_progress_decode(ini_read_string(section, "d" + string(difficulty), ""));
				if (!scr_level_progress_snapshot_valid(data)) continue;
				if (data.version == 2 && data.progress_key != "online_" + string_upper(online_id)) continue;
				var uid = variable_struct_exists(data, "authored_uid") ? data.authored_uid : "";
				if (uid == "" && variable_struct_exists(data, "level_key") && string_pos("custom_", data.level_key) == 1) uid = string_delete(data.level_key, 1, 7);
				var context = scr_level_progress_context(false, "", online_id, uid, "", data.legacy_name);
				scr_level_progress_binding_add(registry, context, true, data.version == 1);
				array_push(contexts, context);
			}
		}
		ini_close();
	}
	return contexts;
}

/* Catalogue titles can establish a conflict, never authorize a name-only import. */
function scr_level_progress_note_catalogue(level_id, title)
{
	if (global.big_collectible_test_override || global.doing_clear_check_level || global.doing_clear_check_character) return;
	var registry = scr_level_progress_bindings_read();
	var context = scr_level_progress_context(false, "", level_id, "", "", title);
	scr_level_progress_binding_add(registry, context, false);
	scr_level_progress_bindings_store(registry);
}

function scr_level_progress_import_source(context, source_path, source_section)
{
	if (context.path == source_path && context.section == source_section) return;
	var marker = "legacy_import_" + sha1_string_utf8(source_path + "|" + source_section);
	if (file_exists(context.path))
	{
		ini_open(context.path);
		var imported = ini_read_real(context.section, marker, false);
		ini_close();
		if (imported) return;
	}
	var keys = scr_big_collectible_online_saved_keys(source_path, source_section);
	if (array_length(keys) == 0) return;
	var values = {};
	var scalar_keys = ["level_score", "number_of_clears", "number_of_defeats", "zero_defeats", "lives_until_assist"];
	var time_keys = ["timeattack_realmillisecond", "timeattack_millisecond", "timeattack_second", "timeattack_minute"];
	var checkpoint_keys = ["checkpoint_x", "checkpoint_y", "checkpoint_direction", "checkpoint_what_player", "checkpoint_big_collectible_tier",
		"checkpoint_millisecond", "checkpoint_second", "checkpoint_minute", "checkpoint_realmillisecond"];
	ini_open(source_path);
	for (var index = 0; index < array_length(keys); index++)
	{
		var key = keys[index];
		if (scr_level_progress_is_collectible_key(key)
		|| array_contains(scalar_keys, key) || array_contains(time_keys, key) || array_contains(checkpoint_keys, key))
			variable_struct_set(values, key, ini_read_real(source_section, key, 0));
	}
	ini_close();
	if (!scr_level_progress_backup(context.path)) return;
	scr_save_ini_open(context.path);
	var names = variable_struct_get_names(values);
	for (var index = 0; index < array_length(names); index++)
	{
		var key = names[index];
		var value = variable_struct_get(values, key);
		if (scr_level_progress_is_collectible_key(key))
			ini_write_real(context.section, key, ini_read_real(context.section, key, false) || value);
		else if (array_contains(scalar_keys, key)) ini_write_real(context.section, key, max(value, ini_read_real(context.section, key, 0)));
	}
	var complete_time = true;
	for (var index = 0; index < array_length(time_keys); index++) if (!variable_struct_exists(values, time_keys[index])) complete_time = false;
	if (complete_time)
	{
		var value = values.timeattack_realmillisecond;
		if (value > 2 && value < ini_read_real(context.section, "timeattack_realmillisecond", 999999999))
		{
			for (var index = 0; index < array_length(time_keys); index++)
				if (variable_struct_exists(values, time_keys[index])) ini_write_real(context.section, time_keys[index], variable_struct_get(values, time_keys[index]));
		}
	}
	/* Preserve zero values and a coherent checkpoint bundle. An existing bundle wins. */
	if (!ini_key_exists(context.section, "checkpoint_x") && !ini_key_exists(context.section, "checkpoint_y")
	&& variable_struct_exists(values, "checkpoint_x") && variable_struct_exists(values, "checkpoint_y"))
	{
		for (var index = 0; index < array_length(checkpoint_keys); index++)
			if (variable_struct_exists(values, checkpoint_keys[index])) ini_write_real(context.section, checkpoint_keys[index], variable_struct_get(values, checkpoint_keys[index]));
	}
	ini_write_real(context.section, marker, true);
	ini_write_real(context.section, "progress_schema", 2);
	ini_close();
}

function scr_level_progress_migrate(context, registry)
{
	if (context.official) return;
	var custom_path = game_save_id + "save_file/custom_level_save.ini";
	var online_path = game_save_id + "save_file/online_level_progress.ini";
	if (context.online_id != "")
	{
		/* Existing ID-addressed badges are known achievements, never proof of item ownership. */
		if (file_exists(online_path))
		{
			ini_open(online_path);
			var finished = ini_read_real("finished_downloaded_level", context.online_id, 0);
			var zero_defeats = ini_read_real("zero_defeats_downloaded_level", context.online_id, 0);
			ini_close();
			if ((finished > 0 || zero_defeats > 0) && scr_level_progress_backup(context.path))
			{
				scr_save_ini_open(context.path, false);
				var previous_finished = ini_read_real(context.section, "finished_status", 0);
				var previous_zero_defeats = ini_read_real(context.section, "zero_defeats", 0);
				if (finished > previous_finished || zero_defeats > previous_zero_defeats)
					scr_save_metadata_stamp_open(context.path, true, false, true);
				if (finished > previous_finished) ini_write_real(context.section, "finished_status", finished);
				if (zero_defeats > previous_zero_defeats) ini_write_real(context.section, "zero_defeats", zero_defeats);
				ini_close();
			}
		}
		var exact_sections = ["online_" + context.online_id, context.online_id, "BigCollectibles_custom_" + context.online_id];
		for (var index = 0; index < array_length(exact_sections); index++)
		{
			scr_level_progress_import_source(context, custom_path, exact_sections[index]);
			scr_level_progress_import_source(context, online_path, exact_sections[index]);
		}
	}
	if (context.uid != "" && scr_level_progress_binding_unique(registry, context, "", context.uid))
		scr_level_progress_import_source(context, custom_path, "BigCollectibles_custom_" + context.uid);
	var binding_names = variable_struct_get_names(registry);
	for (var binding_index = 0; binding_index < array_length(binding_names); binding_index++)
	{
		var entry = variable_struct_get(registry, binding_names[binding_index]);
		if (entry.target != context.key || !entry.metadata || (context.online_id == "" && entry.fresh_identity)) continue;
		for (var name_index = 0; name_index < array_length(entry.names); name_index++)
		{
			var legacy_name = entry.names[name_index];
			if (!array_contains(entry.historical_names, legacy_name)) continue;
			if (!scr_level_progress_binding_unique(registry, context, legacy_name)) continue;
			scr_level_progress_import_source(context, custom_path, legacy_name);
			scr_level_progress_import_source(context, online_path, legacy_name);
			scr_level_progress_import_source(context, game_save_id + "custom_level_save.ini", legacy_name);
		}
	}
	if (context.online_id == "" && context.uid != "" && !context.fresh_identity
	&& variable_struct_exists(registry, context.key))
	{
		var entry = variable_struct_get(registry, context.key);
		if (array_contains(entry.historical_names, context.folder) && scr_level_progress_binding_unique(registry, context, context.folder))
			scr_level_progress_import_source(context, custom_path, "local_folder_" + context.folder);
	}
}

function scr_level_progress_prepare(context)
{
	if (context.official || global.big_collectible_test_override || global.doing_clear_check_level || global.doing_clear_check_character) return;
	if (!scr_level_progress_backup(context.path)) return;
	var registry = scr_level_progress_bindings_read();
	scr_level_progress_binding_add(registry, context);
	if (!scr_level_progress_bindings_store(registry)) return;
	scr_level_progress_migrate(context, registry);
}

function scr_level_progress_bootstrap()
{
	if (variable_global_exists("level_progress_bootstrap_profile") && global.level_progress_bootstrap_profile == game_save_id) return;
	global.level_progress_bootstrap_profile = game_save_id;
	var registry = scr_level_progress_bindings_read();
	var contexts = scr_level_progress_collect_bindings(registry);
	if (!scr_level_progress_bindings_store(registry)) return;
	for (var index = 0; index < array_length(contexts); index++) scr_level_progress_migrate(contexts[index], registry);
}

function scr_level_progress_unresolved(context)
{
	if (context.online_id == "" && context.fresh_identity) return false;
	var registry = scr_level_progress_bindings_read();
	if (context.legacy_name != "")
	{
		var historical = false;
		if (variable_struct_exists(registry, context.key))
		{
			var binding = variable_struct_get(registry, context.key);
			historical = historical || array_contains(binding.historical_names, context.legacy_name);
		}
		if (!historical || !scr_level_progress_binding_unique(registry, context, context.legacy_name))
		{
			var legacy_keys = scr_big_collectible_online_saved_keys(game_save_id + "save_file/custom_level_save.ini", context.legacy_name);
			for (var index = 0; index < array_length(legacy_keys); index++) if (scr_level_progress_is_collectible_key(legacy_keys[index])) return true;
		}
	}
	var names = variable_struct_get_names(registry);
	for (var index = 0; index < array_length(names); index++)
	{
		var entry = variable_struct_get(registry, names[index]);
		if (entry.target != context.key) continue;
		for (var name_index = 0; name_index < array_length(entry.names); name_index++)
		{
			var legacy_name = entry.names[name_index];
			var proven = array_contains(entry.historical_names, legacy_name);
			if (proven && scr_level_progress_binding_unique(registry, context, legacy_name)) continue;
			var keys = scr_big_collectible_online_saved_keys(game_save_id + "save_file/custom_level_save.ini", legacy_name);
			for (var key_index = 0; key_index < array_length(keys); key_index++)
				if (scr_level_progress_is_collectible_key(keys[key_index])) return true;
		}
	}
	return false;
}

function scr_level_progress_online_badge(level_id, zero_hits = false)
{
	var path = game_save_id + "save_file/online_level_progress.ini";
	if (!file_exists(path)) return 0;
	level_id = string_upper(string(level_id));
	ini_open(path);
	var value = max(ini_read_real("online_" + level_id, zero_hits ? "zero_defeats" : "finished_status", 0),
		ini_read_real(zero_hits ? "zero_defeats_downloaded_level" : "finished_downloaded_level", level_id, 0));
	ini_close();
	return value;
}

function scr_level_progress_snapshot_valid(data)
{
	try
	{
		if (!is_struct(data) || (data.version != 1 && data.version != 2) || !is_string(data.legacy_name)
		|| !is_array(data.counts) || array_length(data.counts) != 3
		|| !is_array(data.valid) || array_length(data.valid) != 3 || !is_array(data.items) || array_length(data.items) != 3) return false;
		if (data.version == 1 && (!is_string(data.level_key) || string_pos("custom_", data.level_key) != 1)) return false;
		if (data.version == 2 && (!is_string(data.progress_key) || string_pos("online_", data.progress_key) != 1
		|| !is_string(data.authored_uid) || !is_string(data.folder))) return false;
		for (var tier = 0; tier <= 2; tier++)
		{
			if (!is_array(data.items[tier]) || !is_real(data.counts[tier]) || data.counts[tier] < 0
			|| (!is_real(data.valid[tier]) && !is_bool(data.valid[tier])) || data.counts[tier] != array_length(data.items[tier])) return false;
			var seen = {};
			for (var index = 0; index < array_length(data.items[tier]); index++)
			{
				var item = data.items[tier][index];
				if (!is_struct(item) || !is_string(item.collectible_id) || !is_real(item.legacy_slot)
				|| item.legacy_slot < 0 || item.legacy_slot != floor(item.legacy_slot)) return false;
				if (item.collectible_id == "") continue;
				if (data.valid[tier] && variable_struct_exists(seen, item.collectible_id)) return false;
				variable_struct_set(seen, item.collectible_id, true);
			}
		}
		return true;
	}
	catch (exception) { return false; }
}

function scr_level_progress_is_collectible_key(key)
{
	if (string_pos("big_collectible", key) == 1)
	{
		var suffix = string_delete(key, 1, 15);
		return suffix != "" && string_digits(suffix) == suffix && real(suffix) > 0;
	}
	return string_length(key) > 6 && string_copy(key, 1, 4) == "tier"
		&& string_pos(string_char_at(key, 5), "012") > 0 && string_char_at(key, 6) == "_";
}
