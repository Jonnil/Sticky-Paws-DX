/// @description obj_sync_missing_translation_batch Async - HTTP Event
/* Use the new bulk response handler */
scr_handle_sync_translation_response_bulk(request_id, global.missing_translation_queue);
/* Destroy the object after handling the response */
instance_destroy();