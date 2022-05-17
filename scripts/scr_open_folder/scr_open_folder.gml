// implementation
function scr_open_folder(dname)
{
	if (global.enable_open_custom_folder = true)
	{
		menu_delay = 60 * 5;
		var escapedfolder = string_replace_all(dname, "\"", "\\\"");
		if (os_type = os_windows)
		{
			execute_shell("cmd", "explorer \"" + escapedfolder + "\"");
		}
		else
		if (os_type = os_macosx)
		{
			execute_shell("open", "\"" + escapedfolder + "\"");
		}
		else
		if (os_type = os_linux)
		{
			execute_shell("xdg-mime", "\"" + escapedfolder + "\"");
		}
		if (instance_exists(obj_open_folder_text))
		{
			with(obj_open_folder_text)
			{
				open_folder_string = string(escapedfolder);
				obj_open_folder_text.close = false;
			}
		}
		else
		{
			with(instance_create_depth(x, y, 0, obj_open_folder_text))
			{
				open_folder_string = string(escapedfolder);
			}
		}
	}
}