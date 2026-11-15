/* Player-file provenance is separate from authored content and level identity. */
function scr_save_metadata_file(path)
{
	var normalized = string_replace_all(string(path), "\\", "/");
	var save_root = string_replace_all(string(game_save_id), "\\", "/");
	if (save_root != "" && string_pos(save_root, normalized) == 1)
		normalized = string_delete(normalized, 1, string_length(save_root));
	var names = ["config.ini", "file1.ini", "file2.ini", "file3.ini", "file4.ini", "file5.ini", "file6.ini",
		"custom_level_save.ini", "online_level_progress.ini"];
	for (var index = 0; index < array_length(names); index++)
	{
		if (normalized == "save_file/" + names[index])
			return {name:names[index], format:index >= 7 ? 2 : 1, config:index == 0};
	}
	return undefined;
}

function scr_save_metadata_version_supported(key, supported)
{
	if (!ini_key_exists("SaveInfo", key)) return true;
	var value = string_trim(ini_read_string("SaveInfo", key, ""));
	/* Native ini_write_real serializes integral values as decimals such as 1.000000. */
	var decimal_position = string_pos(".", value);
	if (decimal_position > 0)
	{
		if (decimal_position == 1 || decimal_position == string_length(value)) return false;
		var whole = string_copy(value, 1, decimal_position - 1);
		var fraction = string_delete(value, 1, decimal_position);
		if (string_digits(whole) != whole || string_digits(fraction) != fraction || real(fraction) != 0) return false;
		value = whole;
	}
	return value != "" && string_digits(value) == value && real(value) <= supported;
}

function scr_save_metadata_write_string(key, value)
{
	if (!ini_key_exists("SaveInfo", key) || ini_read_string("SaveInfo", key, "") != value)
		ini_write_string("SaveInfo", key, value);
}

function scr_save_metadata_allowed(file)
{
	return file.config || !((variable_global_exists("big_collectible_test_override") && global.big_collectible_test_override)
		|| (variable_global_exists("doing_clear_check_level") && global.doing_clear_check_level)
		|| (variable_global_exists("doing_clear_check_character") && global.doing_clear_check_character));
}

function scr_save_metadata_backup(path)
{
	var backup_path = path + ".pre_metadata_v1.bak";
	if (file_exists(backup_path)) return true;
	try { file_copy(path, backup_path); }
	catch (exception)
	{
		show_debug_message("[SaveInfo] Metadata adoption skipped: backup failed.");
		return false;
	}
	if (file_exists(backup_path)) return true;
	show_debug_message("[SaveInfo] Metadata adoption skipped: backup was not created.");
	return false;
}

/* Uses the caller's native INI handle. It never opens or commits another file. */
function scr_save_metadata_stamp_open(path, existed, played = false, written = false)
{
	var file = scr_save_metadata_file(path);
	if (!is_struct(file)) return;
	if (!scr_save_metadata_allowed(file)) return;
	/* Preserve unknown higher schemas. Ordinary gameplay writes remain unchanged. */
	if (!scr_save_metadata_version_supported("metadata_version", 1)
	|| !scr_save_metadata_version_supported("save_format_version", file.format)) return;
	if (existed && !ini_key_exists("SaveInfo", "metadata_version") && !scr_save_metadata_backup(path)) return;
	var version = scr_get_build_date(true, true);
	var build = scr_get_build_date();
	if (!ini_key_exists("SaveInfo", "metadata_version") || ini_read_real("SaveInfo", "metadata_version", 0) != 1)
		ini_write_real("SaveInfo", "metadata_version", 1);
	if (!ini_key_exists("SaveInfo", "save_format_version") || ini_read_real("SaveInfo", "save_format_version", 0) != file.format)
		ini_write_real("SaveInfo", "save_format_version", file.format);
	if (!ini_key_exists("SaveInfo", "first_created_game_version"))
		ini_write_string("SaveInfo", "first_created_game_version", existed ? "unknown" : version);
	if (!ini_key_exists("SaveInfo", "first_seen_game_version"))
		ini_write_string("SaveInfo", "first_seen_game_version", version);
	if (played)
	{
		scr_save_metadata_write_string("last_played_game_version", version);
		scr_save_metadata_write_string("last_played_build", build);
	}
	if (written)
	{
		scr_save_metadata_write_string("last_written_game_version", version);
		scr_save_metadata_write_string("last_written_build", build);
	}
}

/* Replace writer opens only. Read-only previews keep using native ini_open. */
function scr_save_ini_open(path, written = true)
{
	var existed = file_exists(path);
	ini_open(path);
	var file = scr_save_metadata_file(path);
	scr_save_metadata_stamp_open(path, existed, is_struct(file) && file.config, written);
}

function scr_save_metadata_play(path)
{
	var file = scr_save_metadata_file(path);
	if (!is_struct(file)) return;
	if (!scr_save_metadata_allowed(file)) return;
	var existed = file_exists(path);
	ini_open(path);
	scr_save_metadata_stamp_open(path, existed, true, false);
	ini_close(); /* The existing save lifecycle commits Switch data. */
}

function scr_save_metadata_session()
{
	if (!variable_global_exists("save_metadata_sessions")) global.save_metadata_sessions = {};
	var profile = string(game_save_id);
	if (os_type == os_switch && variable_global_exists("switch_active_account_id"))
		profile += "|switch:" + string(global.switch_active_account_id);
	if (variable_struct_exists(global.save_metadata_sessions, profile)) return;
	variable_struct_set(global.save_metadata_sessions, profile, true);
	var names = ["config.ini", "file1.ini", "file2.ini", "file3.ini", "file4.ini", "file5.ini", "file6.ini",
		"custom_level_save.ini", "online_level_progress.ini"];
	for (var index = 0; index < array_length(names); index++)
	{
		var path = game_save_id + "save_file/" + names[index];
		if (!file_exists(path)) continue; /* Observing a profile does not create unused slots. */
		if (!scr_save_metadata_allowed(scr_save_metadata_file(path))) continue;
		ini_open(path);
		scr_save_metadata_stamp_open(path, true, index == 0, false);
		ini_close();
	}
}
