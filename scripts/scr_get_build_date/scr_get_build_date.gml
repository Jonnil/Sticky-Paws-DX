function scr_get_build_date(include_hour = false, include_minute = false)
{
	/* Get GM_build_date in YYYY.MM.DD.HR.MN format */
	/* Version numbers should be in the format MAJOR.MINOR.PATCH by default as that's what's only accepted on most game hosting websites */
	/* But toggles to include hour and minute build date are here if needed for whatever reason */
	/* Don't include a 0 before any number, because hosting websites doesn't accept this, like GameJolt */

	var year, month, day, hour, minute;
	year = date_get_year(GM_build_date);
	month = date_get_month(GM_build_date);
	day = date_get_day(GM_build_date);
	hour = date_get_hour(GM_build_date);
	minute = date_get_minute(GM_build_date);
	if (include_hour >= true)
	&& (include_minute >= true)
	{
		return (string(year) + "." + string(month) + "." + string(day) + "." + string(hour) + "." + string(minute));
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
	else
	if (include_hour <= false)
	&& (include_minute <= false)
	{
		return (string(year) + "." + string(month) + "." + string(day));
	}
}
