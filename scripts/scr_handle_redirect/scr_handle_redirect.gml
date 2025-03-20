/// @function scr_handle_redirect(html_result, async_map)
/// @description Handles redirect responses by extracting the URL and initiating a new HTTP GET request using http_request.
/// @param {string} html_result - The HTTP response text (HTML) that may contain a redirect URL.
/// @param {ds_map} async_map - The async map from the original request, which may include headers.
/// @returns {real} - Returns the new HTTP request ID from http_request if successful, or -1 if no redirect URL is found.
function scr_handle_redirect(html_result, async_map)
{
	/* Extract the redirect URL using our helper function */
	var redirect_url = scr_extract_redirect_url(html_result);
	
	if (redirect_url != "")
	{
		show_debug_message("[scr_handle_redirect] Redirect detected. Following redirect to: " + redirect_url);
		
		/* Check for common URL issues */
		if (string_pos("*", redirect_url) > 0)
		{
			show_debug_message("[scr_handle_redirect] WARNING: Redirect URL contains a wildcard '*' character. This is typically not valid in HTTP requests.");
			return -1;
		}
		
		if (string_pos("http://", redirect_url) != 1
		&& string_pos("https://", redirect_url) != 1)
		{
			show_debug_message("[scr_handle_redirect] WARNING: Redirect URL does not start with 'http://' or 'https://'. It may be missing the correct scheme.");
			return -1;
		}
		
		/* Debug: Check for expected request headers in the original async map */
		if (ds_map_exists(async_map, "headers"))
		{
			var orig_headers = ds_map_find_value(async_map, "headers");
			show_debug_message("[scr_handle_redirect] Original response headers: " + string(orig_headers));
			
			if (string_pos("User-Agent", string(orig_headers)) == 0)
			{
				show_debug_message("[scr_handle_redirect] WARNING: Expected 'User-Agent' header not found in original response headers.");
			}
			/* Additional header checks could be added here */
		}
		else
		{
			show_debug_message("[scr_handle_redirect] No response headers provided in async load. This may indicate missing or incorrect request headers.");
		}
		
		/* Create a header map for the new GET request */
		var redirect_header_map = ds_map_create();
		ds_map_add(redirect_header_map, "User-Agent", "gmdownloader");
		ds_map_add(redirect_header_map, "Content-Type", "application/json");
		ds_map_add(redirect_header_map, "X-API-Key", global.api_key);
		
		/* Build a string to debug the headers */
		var header_str = "";
		var key = ds_map_find_first(redirect_header_map);
		
		while (!is_undefined(key))
		{
			header_str += key + ": " + ds_map_find_value(redirect_header_map, key) + ", ";
			key = ds_map_find_next(redirect_header_map, key);
		}
		show_debug_message("[scr_handle_redirect] Initiating new HTTP GET request using http_request with headers: " + header_str);
		
		/* Initiate the new HTTP GET request */
		var new_request_id = http_request(redirect_url, "GET", redirect_header_map, "");
		ds_map_destroy(redirect_header_map);
		
		if (new_request_id == -1)
		{
			show_debug_message("[scr_handle_redirect] ERROR: http_request() failed for the redirect URL.");
			return -1;
		}
		else
		{
			show_debug_message("[scr_handle_redirect] New HTTP request initiated. Request ID: " + string(new_request_id));
		}
		return new_request_id;
	}
	else
	{
		show_debug_message("[scr_handle_redirect] ERROR: Redirect URL not found in response.");
		return -1;
	}
}