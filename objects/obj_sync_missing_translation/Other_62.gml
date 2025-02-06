/* obj_sync_missing_translation Async - HTTP Event */
scr_handle_sync_translation_response(request_id, object_translation_key); /* Call script to handle response */

/* Destroy Object After Handling */
instance_destroy();