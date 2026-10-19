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
		scr_log("INFO", "HTTP.REDIRECT", "redirect_detected");

		/* Check for common URL issues */
		if (string_pos("*", redirect_url) > 0)
		{
			scr_log("WARN", "HTTP.REDIRECT", "url_contains_wildcard");
			return -1;
		}

		/* Only the configured HTTPS origin may receive the game API header */
		var trusted_prefix = "https://" + string_lower(string(global.base_url)) + "/";
		var redirect_prefix = string_lower(string_copy(redirect_url, 1, string_length(trusted_prefix)));
		var invalid_character = false;
		for (var i = 1; i <= string_length(redirect_url); i++)
		{
			var character_code = ord(string_char_at(redirect_url, i));
			if (character_code <= 32 || character_code == 127
			|| string_char_at(redirect_url, i) == chr(92))
			{
				invalid_character = true;
				break;
			}
		}
		if (redirect_prefix != trusted_prefix || invalid_character)
		{
			scr_log("WARN", "HTTP.REDIRECT", "untrusted_redirect_rejected");
			return -1;
		}

		/* Debug: Check for expected request headers in the original async map */
		if (ds_map_exists(async_map, "headers"))
		{
			var orig_headers = ds_map_find_value(async_map, "headers");

			if (string_pos("User-Agent", string(orig_headers)) == 0)
			{
				scr_log("WARN", "HTTP.REDIRECT", "missing_user_agent_header");
			}
			/* Additional header checks could be added here */
		}
		else
		{
			scr_log("DEBUG", "HTTP.REDIRECT", "no_response_headers");
		}

		/* Create a header map for the new GET request */
		var redirect_header_map = ds_map_create();
		ds_map_add(redirect_header_map, "User-Agent", "gmdownloader");
		ds_map_add(redirect_header_map, "Content-Type", "application/json");
		ds_map_add(redirect_header_map, "X-API-Key", global.api_key);

		scr_log("DEBUG", "HTTP.REDIRECT", "http_request_init", "origin=game_server");

		/* Initiate the new HTTP GET request */
		var new_request_id = http_request(redirect_url, "GET", redirect_header_map, "");
		ds_map_destroy(redirect_header_map);

		if (new_request_id == -1)
		{
			scr_log("ERROR", "HTTP.REDIRECT", "http_request_failed");
			return -1;
		}
		else
		{
			scr_log("INFO", "HTTP.REDIRECT", "http_request_started", "request_id=" + string(new_request_id));
		}
		return new_request_id;
	}
	else
	{
		scr_log("ERROR", "HTTP.REDIRECT", "redirect_url_not_found");
		return -1;
	}
}
