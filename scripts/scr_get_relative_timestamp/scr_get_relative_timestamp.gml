/* Calculates the relative time from a UTC ISO-8601 datetime string
@param {string} datetime - The UTC ISO-8601 datetime string
@returns {string} - The relative time string */
function get_relative_timezone(datetime)
{
	date_set_timezone(timezone_utc);
	var dt = string_split(datetime, " ");
	var d = string_split(dt[0], "-");
	var t = string_split(dt[1], ":");
	var diff = date_second_span(date_create_datetime(d[0], d[1], d[2], t[0], t[1], t[2]), date_current_datetime());
	
	if (diff < 60)
	{
		return string(floor(diff)) + " second" + (diff > 1 ? "s" : "") + " ago";
	}
	else if (diff < 3600)
	{
		var minutes = floor(diff / 60);
		return string(minutes) + " minute" + (minutes > 1 ? "s" : "") + " ago";
	}
	else if (diff < 86400)
	{
		var hours = floor(diff / 3600);
		return string(hours) + " hour" + (hours > 1 ? "s" : "") + " ago";
	}
	else if (diff < 604800)
	{
		var days = floor(diff / 86400);
		return string(days) + " day" + (days > 1 ? "s" : "") + " ago";
	}
	else if (diff < 2629746)
	{
		var weeks = floor(diff / 604800); /* One week (7 days) */
		return string(weeks) + " week" + (weeks > 1 ? "s" : "") + " ago";
	}
	else if (diff < 31449600)
	{
		var months = floor(diff / 2629746); /* One month (30.44 days) */
		return string(months) + " month" + (months > 1 ? "s" : "") + " ago";
	}
	else
	{
		var years = floor(diff / 31449600); /* One year (365.24 days) */
		return string(years) + " year" + (years > 1 ? "s" : "") + " ago";
	}
}