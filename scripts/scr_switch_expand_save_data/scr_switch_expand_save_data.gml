function scr_switch_expand_save_data(desired_save_size_mib = 16, desired_journal_size_mib = 8)
{

	#region /* Switch Save Data Handling */
	if (os_type == os_switch)
	{
		show_debug_message("See if you need to expand save data");

		global.save_data_size_is_sufficient = true; /* Set this variable to true at first */
		var account_idx = 0; /* Account index */
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
					switch_save_data_mount(0); /* Don't forget to mount the save data again after expanding save data size */
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
