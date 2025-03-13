/// @description obj_sync_missing_translation_batch Alarm 0 Event
/* For bulk mode, flush the entire missing key queue */
/* Only proceed if there is at least one key */
if (ds_list_size(global.missing_translation_queue) <= 0)
{
	show_debug_message("[obj_sync_missing_translation_batch] No missing translation keys to sync.");
	instance_destroy();
}
else
{
	/* Send all keys in one request */
	request_id = scr_initialize_sync_translation_bulk(global.missing_translation_queue);
	if (request_id == false)
	{
		instance_destroy();
	}
}