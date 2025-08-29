/// @function scr_os_type_to_string(filename_friendly, include_os_type_info)
/// @description Converts os_type constant to a readable or filename-safe string.
/// If filename_friendly is true, the result will be lowercase with underscores and no special characters.
/// If include_os_type_info is true, the string includes the os_type value.
function scr_os_type_to_string(filename_friendly = false, include_os_type_info = true)
{
	var label = "";

	switch (os_type)
	{
		case os_windows:        label = filename_friendly ? "windows" : "Windows"; break;
		case os_gxgames:        label = filename_friendly ? "gx_games" : "GX.games"; break;
		case os_linux:            label = filename_friendly ? "linux" : "Linux"; break;
		case os_macosx:            label = filename_friendly ? "macos" : "macOS"; break;
		case os_ios:            label = filename_friendly ? "ios" : "iOS"; break;
		case os_tvos:            label = filename_friendly ? "tvos" : "tvOS"; break;
		case os_android:        label = filename_friendly ? "android" : "Android"; break;
		case os_ps4:            label = filename_friendly ? "ps4" : "PlayStation 4"; break;
		case os_ps5:            label = filename_friendly ? "ps5" : "PlayStation 5"; break;
		case os_gdk:            label = filename_friendly ? "xbox_gdk" : "Xbox GDK"; break;
		case os_xboxseriesxs:    label = filename_friendly ? "xbox_series_xs" : "Xbox Series X|S"; break;
		case os_switch:            label = filename_friendly ? "switch" : "Nintendo Switch"; break;
		case os_unknown:        label = filename_friendly ? "unknown" : "Unknown"; break;
		default:                label = filename_friendly ? "unrecognized_os" : "Unrecognized OS"; break;
	}

	if (include_os_type_info)
	{
		if (filename_friendly)
		{
			label += "_os_type_" + string(os_type);
		}
		else
		{
			label += " (os_type=" + string(os_type) + ")";
		}
	}

	return label;
}
