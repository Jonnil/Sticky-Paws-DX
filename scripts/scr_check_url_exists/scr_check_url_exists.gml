/* @description Sends a HEAD request to a URL and stores the result globally */
function scr_check_url_exists(_url)
{
	var headers = ds_map_create();
	
	/* HEAD only asks for status, not the full page */
	var request_id = http_request(_url, "HEAD", headers, "");
	ds_map_destroy(headers);
	
	if (request_id == -1)
	{
		show_debug_message(
			"[URL CHECK] "
			+ _url
			+ " | Exists: " + string(false)
			+ " | HTTP: " + string(-1)
			+ " | Transfer: " + string(-1)
		);
		
		if (!variable_global_exists("validated_urls"))
		{
			global.validated_urls = ds_map_create();
		}
		
		if (ds_map_exists(global.validated_urls, _url))
		{
			var old_entry = global.validated_urls[? _url];
			
			if (!is_undefined(old_entry))
			{
				ds_map_destroy(old_entry);
			}
		}
		
		var entry = ds_map_create();
		entry[? "exists"] = false;
		entry[? "status"] = -1;
		entry[? "http_status"] = -1;
		entry[? "transfer_status"] = -1;
		
		global.validated_urls[? _url] = entry;
		return;
	}
	
	/* Store data so we know what this request was for */
	if (!variable_global_exists("url_check_requests"))
	{
		global.url_check_requests = ds_map_create();
	}
	
	var data = ds_map_create();
	data[? "url"] = _url;
	
	global.url_check_requests[? request_id] = data;
}

/* @description scr_handle_url_check_http_event(async_load)
Handles all HTTP responses for scr_check_url_exists
Must be called from the Async - HTTP event */
function scr_handle_url_check_http_event(_async_load)
{
	var request_id = ds_map_find_value(_async_load, "id");

	if (variable_global_exists("url_check_requests"))
	{
		if (ds_map_exists(global.url_check_requests, request_id))
		{
			var transfer_status = ds_map_find_value(_async_load, "status");
			
			/* Ignore in-progress updates; wait for completion */
			if (transfer_status == 1)
			{
				return;
			}
			
			var data = global.url_check_requests[? request_id];
			var url = data[? "url"];
			
			var http_status = undefined;
			
			if (ds_map_exists(_async_load, "http_status"))
			{
				http_status = ds_map_find_value(_async_load, "http_status");
			}
			else
			if (transfer_status >= 100)
			{
				http_status = transfer_status;
			}
			
			var request_failed = false;
			var exists = false;
			
			if (!is_undefined(transfer_status)
			&& transfer_status < 0)
			{
				request_failed = true;
			}
			
			if (!request_failed
			&& !is_undefined(http_status))
			{
				if (http_status >= 200 && http_status < 400)
				{
					exists = true;
				}
				else
				if (http_status == 401
				|| http_status == 403
				|| http_status == 405
				|| http_status == 429)
				{
					exists = true;
				}
			}
			
			show_debug_message(
				"[URL CHECK] "
				+ url
				+ " | Exists: " + string(exists)
				+ " | HTTP: " + string(http_status)
				+ " | Transfer: " + string(transfer_status)
				+ " | Failed: " + string(request_failed)
			);
			
			/* Create global result table if missing */
			if (!variable_global_exists("validated_urls"))
			{
				global.validated_urls = ds_map_create();
			}
			
			if (ds_map_exists(global.validated_urls, url))
			{
				var old_entry = global.validated_urls[? url];
				
				if (!is_undefined(old_entry))
				{
					ds_map_destroy(old_entry);
				}
			}
			
			var entry = ds_map_create();
			entry[? "exists"] = exists;
			entry[? "status"] = http_status;
			entry[? "http_status"] = http_status;
			entry[? "transfer_status"] = transfer_status;
			entry[? "request_failed"] = request_failed;
			
			global.validated_urls[? url] = entry;
			
			ds_map_destroy(data);
			ds_map_delete(global.url_check_requests, request_id);
		}
	}
}

/* @description Returns true if the URL was checked and exists
Returns false if it was checked and is missing
Returns undefined if it has not been checked yet */
function scr_url_exists(_url)
{
	if (!variable_global_exists("validated_urls"))
	{
		return undefined;
	}
	
	if (!ds_map_exists(global.validated_urls, _url))
	{
		return undefined;
	}
	
	var data = global.validated_urls[? _url];
	
	return data[? "exists"];
}
