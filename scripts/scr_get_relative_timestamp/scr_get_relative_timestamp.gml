/* @function scr_get_relative_timezone(datetime, what_timezone)
@description Calculates the relative time from a UTC ISO-8601 datetime string
@param {string} datetime - The UTC ISO-8601 datetime string
@param {string} what_timezone - What timezone you want to use
@returns {string} - The relative time string */
function scr_get_relative_timezone(datetime, what_timezone = timezone_utc)
{
	/* Handle empty or invalid input early */
	if (datetime == ""
	|| datetime == undefined)
	{
		return "";
	}
	
	/* Keep original for debugging / fallback */
	var original_datetime = datetime;
	
	/* Normalize ISO-8601 formats like "2025-11-19T08:03:36Z" */
	datetime = string_replace_all(datetime, "T", " ");
	
	if (string_length(datetime) > 0)
	{
		/* Get the last character using string_copy */
		if (string_copy(datetime, string_length(datetime), 1) == "Z")
		{
			/* Remove the trailing Z */
			datetime = string_copy(datetime, 1, string_length(datetime) - 1);
		}
	}
	
	/* Split into date and time parts */
	var dt = string_split(datetime, " ");
	
	if (array_length(dt) < 2)
	{
		/* Unexpected format, avoid crash and log once per bad value */
		show_debug_message("scr_get_relative_timezone: unexpected datetime format: \"" + string(original_datetime) + "\"");
		return original_datetime;
	}
	
	var d = string_split(dt[0], "-");
	var t = string_split(dt[1], ":");
	
	/* Validate date and time components */
	if (array_length(d) < 3
	|| array_length(t) < 3)
	{
		show_debug_message("scr_get_relative_timezone: could not split date/time parts from: \"" + string(original_datetime) + "\"");
		return original_datetime;
	}
	
	/* Convert to numbers (defensive in case of weird strings) */
	var year = real(d[0]);
	var month = real(d[1]);
	var day = real(d[2]);
	var hour = real(t[0]);
	var minute = real(t[1]);
	var second = real(t[2]);
	
	date_set_timezone(what_timezone);
	
	var dt_created = date_create_datetime(year, month, day, hour, minute, second);
	var diff = date_second_span(dt_created, date_current_datetime());
	
	if (diff < 60)
	{
		return string(floor(diff)) + " " + l10n_text("second" + (diff > 1 ? "s" : "") + " ago");
	}
	else
	if (diff < 3600)
	{
		var minutes = floor(diff / 60);
		return string(minutes) + " " + l10n_text("minute" + (minutes > 1 ? "s" : "") + " ago");
	}
	else
	if (diff < 86400)
	{
		var hours = floor(diff / 3600);
		return string(hours) + " " + l10n_text("hour" + (hours > 1 ? "s" : "") + " ago");
	}
	else
	if (diff < 604800)
	{
		var days = floor(diff / 86400);
		return string(days) + " " + l10n_text("day" + (days > 1 ? "s" : "") + " ago");
	}
	else
	if (diff < 2629746)
	{
		var weeks = floor(diff / 604800); /* One week (7 days) */
		return string(weeks) + " " + l10n_text("week" + (weeks > 1 ? "s" : "") + " ago");
	}
	else
	if (diff < 31449600)
	{
		var months = floor(diff / 2629746); /* One month (30.44 days) */
		return string(months) + " " + l10n_text("month" + (months > 1 ? "s" : "") + " ago");
	}
	else
	{
		var years = floor(diff / 31449600); /* One year (365.24 days) */
		return string(years) + " " + l10n_text("year" + (years > 1 ? "s" : "") + " ago");
	}
}