// implementation
function scr_open_folder(dname)
{
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
}