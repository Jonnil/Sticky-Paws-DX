/* zip_save reports success as zero, unlike buffer_save_async. */
if (!ds_map_exists(async_load, "id") || async_load[? "id"] != request_id) exit;

var export_state = scr_capture_mode_obs_setup_state();
export_state.busy = false;
if (async_load[? "status"] == 0 && file_exists(export_path))
{
	export_state.path = export_path;
	export_state.message = l10n_text("Saved. Open the folder, extract the ZIP, and read READ ME FIRST.txt.");
}
else
{
	export_state.message = l10n_text("Could not save the OBS setup. Check free disk space and try again.");
}
instance_destroy();
