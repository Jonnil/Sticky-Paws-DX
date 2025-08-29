/// @function scr_extract_redirect_url(html_result)
/// @description Extracts the URL from an HTML redirect response.
/// @param {string} html_result - The HTML response text.
/// @returns {string} - The extracted redirect URL or an empty string if not found.
function scr_extract_redirect_url(html_result)
{
	show_debug_message("[scr_extract_redirect_url] Received HTML response. html_result: " + string(html_result));

	var start_index = string_pos("HREF=\"", html_result);
	show_debug_message("[scr_extract_redirect_url] 'HREF=\"' found at position: " + string(start_index));

	if (start_index == 0)
	{
		show_debug_message("[scr_extract_redirect_url] 'HREF=\"' not found, returning empty string.");
		return "";
	}

	start_index += 6; /* Move past 'HREF="' */
	show_debug_message("[scr_extract_redirect_url] Adjusted start index: " + string(start_index));

	var remaining = string_copy(html_result, start_index, string_length(html_result) - start_index + 1);
	show_debug_message("[scr_extract_redirect_url] Remaining string: " + remaining);

	var end_index = string_pos("\"", remaining);
	show_debug_message("[scr_extract_redirect_url] Ending quote found at position: " + string(end_index));

	if (end_index == 0)
	{
		show_debug_message("[scr_extract_redirect_url] Ending quote not found, returning empty string.");
		return "";
	}

	var url = string_copy(remaining, 1, end_index - 1);
	show_debug_message("[scr_extract_redirect_url] Extracted URL: " + url);

	/* Check for wildcard characters */
	if (string_pos("*", url) > 0)
	{
		show_debug_message("[scr_extract_redirect_url] WARNING: The extracted URL contains a wildcard '*' character. Wildcards are typically not valid in HTTP requests and may indicate a malformed URL.");
	}

	/* Check if the URL starts with a valid scheme */
	if (string_pos("http://", url) != 1
	&& string_pos("https://", url) != 1)
	{
		show_debug_message("[scr_extract_redirect_url] WARNING: The extracted URL does not start with 'http://' or 'https://'. It may be malformed or missing the correct scheme.");
	}

	return url;
}
