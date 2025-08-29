function scr_get_relevant_docs(error_stacktrace, error_longmessage)
{

	#region /* Define Documentation Base URL */
	/* Determine the appropriate base URL based on GameMaker version */
	var game_maker_version = ""; /* Replace this with a way to detect the version */
	var base_url = "";

	if (game_maker_version == "monthly")
	{
		base_url = "https://manual.gamemaker.io/monthly/en/";
	}
	else
	if (game_maker_version == "beta")
	{
		base_url = "https://manual.gamemaker.io/beta/en/";
	}
	else
	{
		/* Default to LTS if version is unknown */
		base_url = "https://manual.gamemaker.io/lts/en/";
	}
	#endregion /* Define Documentation Base URL END */

	#region /* Define Built-in Functions and Documentation URLs */
	/* Create a map of built-in functions and their corresponding documentation URLs */
	var function_docs = ds_map_create();
	ds_map_add(function_docs, "string_pos", base_url + "GameMaker_Language/GML_Reference/Strings/string_pos.htm");
	ds_map_add(function_docs, "string_copy", base_url + "GameMaker_Language/GML_Reference/Strings/string_copy.htm");
	ds_map_add(function_docs, "instance_create_depth", "");
	ds_map_add(function_docs, "ds_map_add", "");
	ds_map_add(function_docs, "global", base_url + "GameMaker_Language/GML_Overview/Variables/Global_Variables.htm");
	ds_map_add(function_docs, "draw_text", "");
	ds_map_add(function_docs, "read only variable", "");
	ds_map_add(function_docs, "translation_key", ""); /* https://your_project_specific_doc/translation_handling */
	#endregion /* Define Built-in Functions and Documentation URLs END */

	#region /* Define Additional Debugging Advice */
	/* Create a map of additional debugging advice tailored for specific error contexts */
	var advice = ds_map_create();
	ds_map_add(advice, "read only variable", "This error occurs when attempting to modify a read-only variable. Ensure the variable is writable or update your logic.");
	ds_map_add(advice, "translation_key", "Verify the 'translation_key' variable is initialized and writable before assigning it. Check the object definition or initialization script.");
	ds_map_add(advice, "instance_create_depth", "If an object is being created with instance_create_depth, ensure its variables are initialized properly in the Create event.");
	#endregion /* Define Additional Debugging Advice END */

	#region /* Match Error Context with Documentation and Advice */
	/* Initialize strings to store detected documentation links and debugging advice */
	var detected_docs = "";
	var detected_advice = "";
	var urls_to_open = []; /* Array to hold URLs to be opened */

	/* Iterate through function_docs to match with error_stacktrace or error_longmessage */
	var current_key = ds_map_find_first(function_docs);
	while (current_key != undefined)
	{
		if (string_pos(current_key, error_stacktrace) > 0
		|| string_pos(current_key, error_longmessage) > 0)
		{
			/* Retrieve documentation URL */
			var url = function_docs[? current_key];

			/* Check URL validity (if possible in your system) or use a fallback */
			if (url == "")
			{
				/* Generate fallback search URL */
				url = base_url + "index.htm#t=Content.htm&rhsearch=" + current_key + "&ux=search";
			}

			/* Append documentation URL */
			detected_docs += "- " + current_key + ": " + url + "\n";
			array_push(urls_to_open, url); /* Add URL to the list of URLs to open */

			/* Append relevant debugging advice if it exists */
			if (ds_map_exists(advice, current_key))
			{
				detected_advice += "- " + current_key + ": " + advice[? current_key] + "\n";
			}
		}
		current_key = ds_map_find_next(function_docs, current_key);
	}
	#endregion /* Match Error Context with Documentation and Advice END */

	#region /* Cleanup */
	/* Destroy the maps to free memory */
	ds_map_destroy(function_docs);
	ds_map_destroy(advice);
	#endregion /* Cleanup END */

	#region /* Combine Results */
	/* Combine documentation links and debugging advice into a single formatted string */
	var result = "";
	if (detected_docs != "")
	{
		result += "Relevant Documentation Links:\n" + detected_docs + "\n";
	}
	if (detected_advice != "")
	{
		result += "Debugging Advice:\n" + detected_advice;
	}
	#endregion /* Combine Results END */

	/* Return the combined results and the URLs to open as an array */
	return [result, urls_to_open];
}
