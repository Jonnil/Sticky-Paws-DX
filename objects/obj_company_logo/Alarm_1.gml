/* Update online status first */
if (global.online_enabled)
{
	scr_switch_update_online_status(false);
}

if (!global.online_token_validated)
{
	alarm[1] = 60;
}