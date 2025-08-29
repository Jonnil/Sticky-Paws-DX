function normalize_path_seps(path)
{
	/* Pick the right & wrong separators once */
	static s_sep    = (os_type == os_windows || os_type == os_gdk) ? "\\" : "/";
	static s_badsep    = (os_type == os_windows || os_type == os_gdk) ? "/"  : "\\";

	/* First, replace all "bad" with the desired sep */
	var out = string_replace_all(path, s_badsep, s_sep);

	/* Now collapse any double (or longer) runs of the correct sep */
	var double_sep = s_sep + s_sep;

	/* As long as we still see "//" (or "\\"), replace them with single */
	while (string_pos(double_sep, out) > 0)
	{
		out = string_replace_all(out, double_sep, s_sep);
	}

	return out;
}
