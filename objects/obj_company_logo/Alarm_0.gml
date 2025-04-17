/* Update online status first */
scr_switch_update_online_status(false);

/* Get the os type name for debugging */
show_debug_message("[Debug OS Type] Current OS type: " + string(scr_os_type_to_string(false, true)) + "\n");

/* Then set default language */
scr_set_default_language(false);