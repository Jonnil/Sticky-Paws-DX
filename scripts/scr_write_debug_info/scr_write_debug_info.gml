/// Legacy unrestricted diagnostics are deliberately retired in player source.
/// No globals, paths, INI bodies or exception text enter a report through here.
function scr_write_debug_info()
{
    return false;
}
