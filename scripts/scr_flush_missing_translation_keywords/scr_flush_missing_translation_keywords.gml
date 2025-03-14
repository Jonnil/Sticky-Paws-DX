#region /* Script: scr_flush_missing_translation_keywords */
/* Sends all missing translation keys in global.missing_translation_queue to the server in one batch. */

function scr_flush_missing_translation_keywords()
{
	/* Safety checks */
	if (!variable_global_exists("missing_translation_queue"))
	{
		show_debug_message("[scr_flush_missing_translation_keywords] Warning: missing_translation_queue doesn't exist. Nothing to flush.");
		return;
	}
	if (ds_list_size(global.missing_translation_queue) == 0)
	{
		show_debug_message("[scr_flush_missing_translation_keywords] No missing translation keys to flush.");
		return;
	}
	
	/* If no network, skip */
	if (!os_is_network_connected())
	{
		show_debug_message("[scr_flush_missing_translation_keywords] Not connected to network. Will not flush missing keys now.");
		return;
	}
	
	/* Build a single JSON payload with all queued keys */
	var header_map = ds_map_create();
	ds_map_add(header_map, "Content-Type", "application/json");
	ds_map_add(header_map, "User-Agent", "gm_translation_logger_bulk");
	ds_map_add(header_map, "X-API-Key", global.api_key);
	
	var payload_map = ds_map_create();
	ds_map_add(payload_map, "game_name", global.game_name);
	
	/* Convert the DS list of missing keys into an array for JSON */
	var missing_keys_array = [];
	var queue_size = ds_list_size(global.missing_translation_queue);
	for (var i = 0; i < queue_size; i++)
	{
		array_push(missing_keys_array, global.missing_translation_queue[| i]);
	}
	ds_map_add(payload_map, "missing_keys", missing_keys_array);
	
	var post_data = json_encode(payload_map);
	ds_map_destroy(payload_map);
	
	var sync_translation_endpoint = "https://" + string(global.base_url) + "/sync_translation_bulk";
	
	var request_id = http_request(sync_translation_endpoint, "POST", header_map, post_data);
	ds_map_destroy(header_map);
	
	if (request_id == -1)
	{
		show_debug_message("[scr_flush_missing_translation_keywords] Bulk flush failed to initiate HTTP request. Keeping queue.");
		return;
	}
	
	/* Create an object to handle the response. We'll store the entire list so we can remove them if success */
	var batch_obj = instance_create_depth(x, y, 0, obj_sync_missing_translation_batch);
	if (instance_exists(batch_obj))
	{
		batch_obj.request_id = request_id;
		batch_obj.queued_keys = missing_keys_array; /* store for reference */
		show_debug_message("[scr_flush_missing_translation_keywords] Bulk flush request sent. Request ID: " + string(request_id));
	}
	else
	{
		show_debug_message("[scr_flush_missing_translation_keywords] Error: failed to create obj_sync_missing_translation_batch. Keeping queue.");
	}
}
#endregion /* Script: scr_flush_missing_translation_keywords END */