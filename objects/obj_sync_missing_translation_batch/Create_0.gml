/// @description obj_sync_missing_translation_batch Create Event
/* Initialize an empty DS list to hold multiple keys */
if (!variable_global_exists("missing_translation_queue")
|| !is_undefined(global.missing_translation_queue))
{
	global.missing_translation_queue = ds_list_create();
}
request_id = -1;

/* Trigger an alarm to flush the queue after a short delay */
alarm[0] = 3;
