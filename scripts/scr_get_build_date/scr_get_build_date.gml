function scr_get_build_date(include_hour = false, include_minute = false)
{
	/* Get GM_build_date in YYYY.MM.DD.HR.MN format */
	/* Version numbers should be in the format MAJOR.MINOR.PATCH by default as that's what's only accepted on most game hosting websites */
	/* But toggles to include hour and minute build date are here if needed for whatever reason */
	
	var year, month, day, hour, minute;
	year = date_get_year(GM_build_date);
	month = date_get_month(GM_build_date);
	if (month < 10)
	{
		month = "0" + string(month);
	}
	day = date_get_day(GM_build_date);
	if (day < 10)
	{
		day = "0" + string(day);
	}
	hour = date_get_hour(GM_build_date);
	if (hour < 10)
	{
		hour = "0" + string(hour);
	}
	minute = date_get_minute(GM_build_date);
	if (minute < 10)
	{
		minute = "0" + string(minute);
	}
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