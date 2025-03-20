/// @function scr_debug_os_type()
/// @description Outputs a debug message showing the current OS type and a human-readable description.
function scr_debug_os_type()
{
	var os_description = "";
	
	switch (os_type)
	{
		case os_windows:      os_description = "Windows OS"; break;
		case os_gxgames:      os_description = "GX.games"; break;
		case os_linux:        os_description = "Linux"; break;
		case os_macosx:       os_description = "macOS X"; break;
		case os_ios:          os_description = "iOS (iPhone, iPad, iPod Touch)"; break;
		case os_tvos:         os_description = "Apple tvOS"; break;
		case os_android:      os_description = "Android"; break;
		case os_ps4:          os_description = "Sony PlayStation 4"; break;
		case os_ps5:          os_description = "Sony PlayStation 5"; break;
		case os_gdk:
		case os_xboxseriesxs: os_description = "Microsoft GDK (Xbox One and Xbox Series X/S)"; break;
		case os_switch:       os_description = "Nintendo Switch"; break;
		case os_unknown:      os_description = "Unknown OS"; break;
		default:              os_description = "Unrecognized OS"; break;
	}
	
	show_debug_message("[scr_debug_os_type] Current OS type: " + string(os_type) + " (" + os_description + ")");
}