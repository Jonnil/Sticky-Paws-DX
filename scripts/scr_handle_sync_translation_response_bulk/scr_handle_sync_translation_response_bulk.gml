/// @function scr_handle_sync_translation_response_bulk(request_id, translation_keys)
/// @description Handles the server response for a bulk missing translation keys sync.
/// If successful, clears the global missing keys queue.
function scr_handle_sync_translation_response_bulk(request_id, translation_keys)
{
	#region /* Async HTTP: Bulk Missing Translation Keys */
	if (async_load[? "id"] == request_id)
	{
		var status_code = async_load[? "status"];
		if (status_code == 0)
		{
			show_debug_message("[TranslationSync] Bulk sync success. Clearing local queue now.");
			ds_list_clear(global.missing_translation_queue);
		}
		else
		{
			show_debug_message("[TranslationSync] Bulk sync error. status=" + string(status_code) 
				+ " => Keeping local queue to retry later.");
		}
		instance_destroy();
	}
	#endregion
}
