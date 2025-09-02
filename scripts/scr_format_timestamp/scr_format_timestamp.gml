/// @function scr_format_timestamp(date_value, what_timezone)
/// @description Returns a string in the format "YYYY-MM-DD hh:mm:ss".
function scr_format_timestamp(_date_value, what_timezone = timezone_local)
{
	/* Set the timezone explicityl */
	date_set_timezone(what_timezone);

	/* Extract date/time components */
	var yy        = date_get_year(_date_value);
	var mm        = date_get_month(_date_value);
	var dd        = date_get_day(_date_value);
	var hour    = date_get_hour(_date_value);
	var minute    = date_get_minute(_date_value);
	var sec        = date_get_second(_date_value);

	/* Convert them to strings */
	var sYY   = string(yy);
	var sMM   = (mm < 10) ? ("0" + string(mm)) : string(mm);
	var sDD   = (dd < 10) ? ("0" + string(dd)) : string(dd);
	var sHour = (hour < 10) ? ("0" + string(hour)) : string(hour);
	var sMin  = (minute < 10) ? ("0" + string(minute)) : string(minute);
	var sSec  = (sec < 10) ? ("0" + string(sec)) : string(sec);

	/* Build final string: "YYYY-MM-DD hh:mm:ss" */
	return sYY + "-" + sMM + "-" + sDD + "_" + sHour + "." + sMin + "." + sSec;
}
