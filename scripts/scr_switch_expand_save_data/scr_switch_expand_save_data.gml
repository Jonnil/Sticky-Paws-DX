function scr_switch_expand_save_data(desired_save_size_mib = 16, desired_journal_size_mib = 8)
{

	#region /* Switch Save Data Handling */
	if (os_type == os_switch)
	{
		if (!scr_switch_has_account_id(global.switch_active_account_id))
		{
			scr_switch_capture_preselected_user(false);
		}

		var _active_account_id = scr_switch_has_account_id(global.switch_active_account_id)
			? global.switch_active_account_id
			: -1;

		if (!scr_switch_has_account_id(_active_account_id))
		{
			global.save_data_size_is_sufficient = false;

			with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
			{
				above_gui = true;
				score_up = "No active Switch account for save data";
				show_debug_message(string(score_up));
			}

			return;
		}

		/* Release safety default:
		Do not unmount/remount and resize save data during interactive flows unless explicitly enabled. */
		if (!variable_global_exists("allow_runtime_switch_save_resize")
		|| !global.allow_runtime_switch_save_resize)
		{
			var _minimum_free_bytes = 8 * 1024 * 1024; /* Keep at least 8 MiB free by default. */
			if (variable_global_exists("switch_save_preflight_min_free_bytes"))
			{
				_minimum_free_bytes = max(0, real(global.switch_save_preflight_min_free_bytes));
			}

			var _account_idx = _active_account_id;
			var _current_sizes = switch_save_data_get_size(_account_idx);
			var _used_bytes = 0;
			var _allocated_data_bytes = 0;
			var _have_valid_size_info = is_array(_current_sizes)
			&& array_length(_current_sizes) == 2;

			if (_have_valid_size_info)
			{
				_allocated_data_bytes = max(0, real(_current_sizes[0]));
			}
			else
			{
				/* If we cannot query save data allocation, fail safe and block write-heavy actions. */
				global.save_data_size_is_sufficient = false;
			}

			if (_have_valid_size_info)
			{
				var _save_root = normalize_path_seps(game_save_id);
				if (directory_exists(_save_root))
				{
					/* Iterative walk avoids nested file_find_* usage issues. */
					var _pending_dirs = ds_list_create();
					ds_list_add(_pending_dirs, _save_root);

					while (ds_list_size(_pending_dirs) > 0)
					{
						var _last_idx = ds_list_size(_pending_dirs) - 1;
						var _dir_path = ds_list_find_value(_pending_dirs, _last_idx);
						ds_list_delete(_pending_dirs, _last_idx);

						var _file_name = file_find_first(normalize_path_seps(_dir_path + "/*"), fa_archive);
						while (_file_name != "")
						{
							var _file_path = normalize_path_seps(_dir_path + "/" + _file_name);
							if (file_exists(_file_path))
							{
								var _file_buffer = file_bin_open(_file_path, 0);
								if (_file_buffer != -1)
								{
									_used_bytes += file_bin_size(_file_buffer);
									file_bin_close(_file_buffer);
								}
							}

							_file_name = file_find_next();
						}
						file_find_close();

						var _sub_dir_name = file_find_first(normalize_path_seps(_dir_path + "/*"), fa_directory);
						while (_sub_dir_name != "")
						{
							if (_sub_dir_name != "."
							&& _sub_dir_name != "..")
							{
								ds_list_add(_pending_dirs, normalize_path_seps(_dir_path + "/" + _sub_dir_name));
							}

							_sub_dir_name = file_find_next();
						}
						file_find_close();
					}

					ds_list_destroy(_pending_dirs);
				}

				var _free_bytes = max(0, _allocated_data_bytes - _used_bytes);
				global.save_data_size_is_sufficient = (_free_bytes >= _minimum_free_bytes);
			}

			static _logged_runtime_resize_disabled = false;
			if (!_logged_runtime_resize_disabled)
			{
				show_debug_message("[scr_switch_expand_save_data] Runtime save resize is disabled for stability. Using preflight save-budget checks instead.");
				_logged_runtime_resize_disabled = true;
			}

			static _last_preflight_log_time = -999999;
			if (current_time - _last_preflight_log_time > 3000)
			{
				show_debug_message("[scr_switch_expand_save_data] save_preflight allocated=" + string(_allocated_data_bytes) + " used=" + string(_used_bytes) + " min_free=" + string(_minimum_free_bytes) + " sufficient=" + string(global.save_data_size_is_sufficient));
				_last_preflight_log_time = current_time;
			}

			if (!global.save_data_size_is_sufficient)
			{
				static _last_insufficient_notice_time = -999999;
				if (current_time - _last_insufficient_notice_time > 1250)
				{
					with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
					{
						above_gui = true;
						score_up = "Not enough free save data space";
						show_debug_message(string(score_up));
					}
					_last_insufficient_notice_time = current_time;
				}
			}

			return;
		}

		show_debug_message("See if you need to expand save data");

		global.save_data_size_is_sufficient = true; /* Set this variable to true at first */
		var account_idx = _active_account_id; /* Active account id */
		var current_sizes = 0;
		var max_sizes = 0;
		var success = 0;
		var success_save_data_size = 0;
		var success_save_data_journal_size = 0;
		current_sizes = switch_save_data_get_size(account_idx); /* Game crashes on other platforms, because it thinks this is a function that doesn't exist */
		max_sizes = switch_save_data_get_max_size(); /* Game crashes on other platforms, because it thinks this is a function that doesn't exist */

		/* Retrieve current save data size and journal size */
		if (array_length(current_sizes) == 2)
		{
			var save_data_size = current_sizes[0];
			var journal_size = current_sizes[1];
			show_debug_message("Current Save Data Size: " + string(save_data_size) + " bytes");
			show_debug_message("Current Journal Size: " + string(journal_size) + " bytes");

			/* Retrieve maximum save data size and journal size */
			if (array_length(max_sizes) == 2)
			{
				var max_save_data_size = max_sizes[0];
				var max_journal_size = max_sizes[1];
				show_debug_message("Max Save Data Size: " + string(max_save_data_size) + " bytes");
				show_debug_message("Max Journal Size: " + string(max_journal_size) + " bytes");

				/* Check if available save data size is not enough */
				if (save_data_size < max_save_data_size)
				{

					#region /* Calculate the new desired save data and journal sizes */
					switch_save_data_unmount(); /* Unmount save data before setting save data size, otherwise you can't expand the save data size */
					if (desired_save_size_mib > 0) /* desired_save_size_mib = How much MiB save data size should grow to. 4MiB, 8MiB, 16MiB, and 24MiB are valid numbers to use */
					&& (desired_journal_size_mib > 0) /* desired_journal_size_mib = How much MiB save data journal size should grow to. 4MiB, 8MiB, 16MiB, and 24MiB are valid numbers to use */
					{
						success_save_data_size = desired_save_size_mib * 1024 * 1024;
						success_save_data_journal_size = desired_journal_size_mib * 1024 * 1024;
					}
					else
					if (desired_save_size_mib > 0)
					&& (desired_journal_size_mib == 0)
					{
						success_save_data_size = desired_save_size_mib * 1024 * 1024;
						success_save_data_journal_size = 0;
					}
					else
					if (desired_save_size_mib == 0)
					&& (desired_journal_size_mib > 0)
					{
						success_save_data_size = 0;
						success_save_data_journal_size = desired_journal_size_mib * 1024 * 1024;
					}
					else
					{
						success_save_data_size = 0;
						success_save_data_journal_size = 0;
					}
					#endregion /* Calculate the new desired save data and journal sizes END */

					success = switch_save_data_set_size(account_idx, success_save_data_size, success_save_data_journal_size); /* Expand save data size. Game crashes on other platforms, because it thinks this is a function that doesn't exist */

					#region /* Rest of success code */
					switch_save_data_mount(account_idx); /* Don't forget to mount the save data again after expanding save data size */
					if (success)
					{
						show_debug_message("Save data size expanded successfully");
						global.save_data_size_is_sufficient = true; /* Save data size is now sufficient */
					}
					else
					{
						with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
						{
							above_gui = true;
							score_up = "Failed to expand save data size";
							show_debug_message(string(score_up));
						}
						global.save_data_size_is_sufficient = false; /* Tell player that save data is full */
					}
					#endregion /* Rest of success code END */

				}
				else
				{
					show_debug_message("Save data size is sufficient");
					global.save_data_size_is_sufficient = true; /* Save data size was already sufficient */
				}
			}
			else
			{
				with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
				{
					above_gui = true;
					score_up = "Failed to retrieve max save data sizes";
					show_debug_message(string(score_up));
				}
				global.save_data_size_is_sufficient = false;
			}
		}
		else
		{
			with(instance_create_depth(display_get_gui_width() * 0.5, display_get_gui_height() * 0.5, 0, obj_score_up))
			{
				above_gui = true;
				score_up = "Failed to retrieve current save data sizes";
				show_debug_message(string(score_up));
			}
			global.save_data_size_is_sufficient = false;
		}
	}
	else
	{
		global.save_data_size_is_sufficient = true; /* Default to true for every other OS type */
	}
	#endregion /* Switch Save Data Handling */

}
