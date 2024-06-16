function scr_date_get_timezone_local_offset()
{
	var _original_timezone = date_get_timezone();
	
	/* Putting date-times in different timezones into structs */
	/* Because date_create_datetime seems to correct the offset depending on the timezone */
	date_set_timezone(timezone_utc);
	var _utc_data =
	{
		year: current_year,
		month: current_month,
		day: current_day,
		hour: current_hour,
		minute: current_minute,
		second: current_second
	};
	date_set_timezone(timezone_local);
	var _local_data =
	{
		year: current_year,
		month: current_month,
		day: current_day,
		hour: current_hour,
		minute: current_minute,
		second: current_second
	};
	
	/* Creating the timestamps and comparing an offset between them */
	date_set_timezone(_original_timezone);
	var _utc_time = date_create_datetime(_utc_data.year, _utc_data.month, _utc_data.day, _utc_data.hour, _utc_data.minute, _utc_data.second);
	var _local_time = date_create_datetime(_local_data.year, _local_data.month, _local_data.day, _local_data.hour, _local_data.minute, _local_data.second);
	var _minutes_diff = date_compare_datetime(_local_time, _utc_time) * round(date_minute_span(_local_time, _utc_time)); /* Minute span is always positive, so it needs to be multiplied by sign comparison */
	
	/* Returning the minutes offset divided by 60 as hours offset */
	/* It takes into account for odd timezones with half offsets */
	return _minutes_diff / 60;
}