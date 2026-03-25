/* During startup, try one silent token prefetch for the active Switch account so
automatic language updates can begin without opening Nintendo UI. */
if (os_type == os_switch)
&& variable_global_exists("switch_startup_token_prefetch_active")
&& (global.switch_startup_token_prefetch_active)
{
	scr_switch_try_startup_token_prefetch();
}
else
if (global.online_enabled)
{
	scr_switch_update_online_status(false);
}

if ((global.online_enabled)
&& (!global.online_token_validated))
|| (variable_global_exists("switch_startup_token_prefetch_active")
&& global.switch_startup_token_prefetch_active)
{
	alarm[1] = 60;
}
