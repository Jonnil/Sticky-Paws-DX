/* @description Sends a HEAD request to a URL and stores the result globally */
function scr_check_url_exists(_url)
{
	var url_string = is_undefined(_url) ? "" : string(_url);

	if (url_string == ""
	|| (string_pos("http://", url_string) != 1
	&& string_pos("https://", url_string) != 1))
	{
		scr_set_url_check_result(url_string, false, -1, -1, -1, false, false);
		return;
	}

	if (!variable_global_exists("validated_urls"))
	{
		global.validated_urls = ds_map_create();
	}

	if (!variable_global_exists("url_check_requests"))
	{
		global.url_check_requests = ds_map_create();
	}

	if (!variable_global_exists("pending_url_checks"))
	{
		global.pending_url_checks = ds_list_create();
	}

	if (scr_url_checks_disabled_for_platform())
	{
		scr_set_url_check_result(url_string, false, -1, -1, -1, true, true);
		return;
	}

	var should_defer_request = false;

	/* Website validation is not needed during the splash screen, and it should
	wait until passive network is available instead of forcing startup traffic. */
	if (room == rm_splash_screen)
	|| (!scr_get_cached_passive_network_status(false))
	{
		should_defer_request = true;
	}

	if (should_defer_request)
	{
		if (ds_list_find_index(global.pending_url_checks, url_string) == -1)
		{
			ds_list_add(global.pending_url_checks, url_string);
		}

		show_debug_message(
			"[URL CHECK] Deferred: "
			+ url_string
			+ " | room=" + string(room)
			+ " | passive_network=" + string(scr_get_cached_passive_network_status(false))
		);
		return;
	}

	var headers = ds_map_create();
	
	/* HEAD only asks for status, not the full page */
	var request_id = http_request(url_string, "HEAD", headers, "");
	ds_map_destroy(headers);
	
	if (request_id == -1)
	{
		show_debug_message(
			"[URL CHECK] "
			+ url_string
			+ " | Exists: " + string(false)
			+ " | HTTP: " + string(-1)
			+ " | Transfer: " + string(-1)
		);
		
		scr_set_url_check_result(url_string, false, -1, -1, -1, true, false);
		return;
	}
	
	/* Store data so we know what this request was for */
	var data = ds_map_create();
	data[? "url"] = url_string;
	
	global.url_check_requests[? request_id] = data;
}

function scr_process_pending_url_checks(max_requests_per_call = 2)
{
	if (scr_url_checks_disabled_for_platform())
	{
		return;
	}

	if (!variable_global_exists("pending_url_checks"))
	{
		return;
	}

	if (!ds_exists(global.pending_url_checks, ds_type_list))
	{
		return;
	}

	if (ds_list_size(global.pending_url_checks) <= 0)
	{
		return;
	}

	if (room == rm_splash_screen)
	|| (!scr_get_cached_passive_network_status(false))
	{
		return;
	}

	var request_count = min(max_requests_per_call, ds_list_size(global.pending_url_checks));

	repeat (request_count)
	{
		var pending_url = global.pending_url_checks[| 0];
		ds_list_delete(global.pending_url_checks, 0);
		scr_check_url_exists(pending_url);
	}
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
			
			scr_set_url_check_result(url, exists, http_status, http_status, transfer_status, request_failed, false);
			
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
	if (scr_url_checks_disabled_for_platform())
	{
		return false;
	}

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

function scr_url_checks_disabled_for_platform()
{
	return (os_type == os_switch);
}

function scr_set_url_check_result(_url, _exists, _status, _http_status, _transfer_status, _request_failed, _disabled_on_console)
{
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
	entry[? "exists"] = _exists;
	entry[? "status"] = _status;
	entry[? "http_status"] = _http_status;
	entry[? "transfer_status"] = _transfer_status;
	entry[? "request_failed"] = _request_failed;
	entry[? "disabled_on_console"] = _disabled_on_console;

	global.validated_urls[? _url] = entry;
}
