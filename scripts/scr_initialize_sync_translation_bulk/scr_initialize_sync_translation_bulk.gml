/// @function scr_initialize_sync_translation_bulk(translation_keys)
/// @description Sends a bulk HTTP POST request with an array of missing translation keys.
function scr_initialize_sync_translation_bulk(translation_keys)
{
	// Check a flag to disable file logging (e.g., on Nintendo Switch)
	if (global.enable_translation_file_logging)
	{
		/* Validate that we have at least one key */
		if (array_length(translation_keys) == 0)
		{
			show_debug_message("[scr_initialize_sync_translation_bulk] Error: No translation keys to sync.");
			return false;
		}
		
		/* Prepare HTTP headers (same style as before) */
		var header_map = ds_map_create();
		ds_map_add(header_map, "Content-Type", "application/json");
		ds_map_add(header_map, "User-Agent", "gm_translation_logger");
		ds_map_add(header_map, "X-API-Key", global.api_key);
		
		/* Prepare the JSON payload */
		var payload_map = ds_map_create();
		/* Instead of a single key, add the entire array */
		ds_map_add(payload_map, "keys", translation_keys);
		ds_map_add(payload_map, "game_name", global.game_name);
		var post_data = json_encode(payload_map);
		ds_map_destroy(payload_map);
		
		/* Use an endpoint for bulk syncing (update this if your server endpoint differs) */
		var sync_translation_endpoint = "https://" + string(global.base_url) + "/sync_translation_bulk";
		var request_id = http_request(
			sync_translation_endpoint,
			"POST",
			header_map,
			post_data
		);
		ds_map_destroy(header_map);
		
		if (request_id == -1)
		{
			show_debug_message("[scr_initialize_sync_translation_bulk] Error: Failed to send bulk HTTP POST request.");
			return false;
		}
		else
		{
			show_debug_message("[scr_initialize_sync_translation_bulk] Bulk HTTP request sent successfully. Request ID: " + string(request_id));
			return request_id;
		}
	}
}