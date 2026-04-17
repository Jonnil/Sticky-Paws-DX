function scr_open_folder(dname)
{
	if (global.enable_open_custom_folder)
	{
		menu_delay = 60 * 5;
		var folder_path = string(dname);
		var shell_path = folder_path;

		if (os_type == os_windows)
		{
			folder_path = string_replace_all(folder_path, "/", "\\");
			shell_path = string_replace_all(folder_path, "\"", "\"\"");
		}
		else
		if (os_type == os_macosx)
		{
			folder_path = string_replace_all(folder_path, "\\", "/");
			shell_path = string_replace_all(folder_path, "\"", "\\\"");
		}
		else
		if (os_type == os_linux)
		{
			folder_path = string_replace_all(folder_path, "\\", "/");
			shell_path = string_replace_all(folder_path, "\"", "\\\"");
		}

		if (!directory_exists(folder_path))
		{
			directory_create(folder_path);
		}

		if (directory_exists(folder_path))
		{
			if (os_type == os_windows)
			{
				execute_shell("explorer", "\"" + shell_path + "\"");
			}
			else
			if (os_type == os_macosx)
			{
				execute_shell("open", "\"" + shell_path + "\"");
			}
			else
			if (os_type == os_linux)
			{
				execute_shell("xdg-open", "\"" + shell_path + "\"");
			}
		}

		if (instance_exists(obj_open_folder_text))
		{
			with(obj_open_folder_text)
			{
				open_folder_string = string(folder_path);
				obj_open_folder_text.close = false;
			}
		}
		else
		{
			with(instance_create_depth(x, y, 0, obj_open_folder_text))
			{
				open_folder_string = string(folder_path);
			}
		}
	}
}
