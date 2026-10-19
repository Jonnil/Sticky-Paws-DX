function scr_get_build_date(include_hour = false, include_minute = false)
{
	/* Automatic releases stamp GM_version as YYYY.M.DDHH.(MM00+1). */
	/* Decode it to the canonical internal timestamp YYYY.M.DDHHMMSS. */
	/* Ordinary GameMaker builds keep using GM_build_date as YYYY.M.D. */

	var year, month, day, hour, minute, second;
	year = date_get_year(GM_build_date);
	month = date_get_month(GM_build_date);
	day = date_get_day(GM_build_date);
	hour = date_get_hour(GM_build_date);
	minute = date_get_minute(GM_build_date);
	second = date_get_second(GM_build_date);

	var has_release_stamp = false;
	var version_parts = string_split(string(GM_version), ".");
	if (array_length(version_parts) == 4)
	{
		var stamped_year = real(version_parts[0]);
		var stamped_month = real(version_parts[1]);
		var packed_day_hour = real(version_parts[2]);
		var packed_minute_second = real(version_parts[3]) - 1;
		var stamped_day = floor(packed_day_hour / 100);
		var stamped_hour = packed_day_hour mod 100;
		var stamped_minute = floor(packed_minute_second / 100);
		var stamped_second = packed_minute_second mod 100;

		if (stamped_year >= 2000)
		&& (stamped_month >= 1) && (stamped_month <= 12)
		&& (packed_day_hour >= 100)
		&& (stamped_day >= 1) && (stamped_day <= 31)
		&& (stamped_hour >= 0) && (stamped_hour <= 23)
		&& (packed_minute_second >= 0)
		&& (stamped_minute >= 0) && (stamped_minute <= 59)
		&& (stamped_second >= 0) && (stamped_second <= 59)
		{
			year = stamped_year;
			month = stamped_month;
			day = stamped_day;
			hour = stamped_hour;
			minute = stamped_minute;
			second = stamped_second;
			has_release_stamp = true;
		}
	}

	if (include_hour <= false)
	&& (include_minute <= false)
	{
		if (has_release_stamp)
		{
			var release_patch = day * 1000000 + hour * 10000 + minute * 100 + second;
			return (string(year) + "." + string(month) + "." + string(release_patch));
		}
		return (string(year) + "." + string(month) + "." + string(day));
	}

	if (include_hour >= true)
	&& (include_minute >= true)
	{
		/* Public versions use one SemVer-safe fixed-width 1DDHHMM patch everywhere. */
		var public_patch = string_replace_all(string_format(day * 10000 + hour * 100 + minute, 6, 0), " ", "0");
		return (string(year) + "." + string(month) + ".1" + public_patch);
	}
	else
	if (include_hour <= false)
	&& (include_minute >= true)
	{
		return (string(year) + "." + string(month) + "." + string(day) + "." + string(minute));
	}
	else
	if (include_hour >= true)
	&& (include_minute <= false)
	{
		return (string(year) + "." + string(month) + "." + string(day) + "." + string(hour));
	}
}
