/* During startup, try one silent token prefetch for the active Switch account so
automatic language updates can begin without opening Nintendo UI. */
var should_retry_startup_online_check = false;
var passive_network_available = os_is_network_connected(network_connect_passive);

if (os_type == os_switch)
{
	if (variable_global_exists("switch_startup_token_prefetch_active"))
	&& (global.switch_startup_token_prefetch_active)
	{
		if (passive_network_available)
		{
			scr_switch_try_startup_token_prefetch();
		}
		should_retry_startup_online_check = global.switch_startup_token_prefetch_active;
	}
	else
	if (global.online_enabled)
	&& (passive_network_available)
	&& (!global.online_token_validated)
	&& (global.online_token_request == -1)
	{
		/* Keep startup checks silent and one-shot when the console is offline.
		Manual online actions handle interactive recovery later. */
		scr_switch_update_online_status(false);
	}
}
else
if (global.online_enabled)
{
	scr_switch_update_online_status(false);
	should_retry_startup_online_check = !global.online_token_validated;
}

if (should_retry_startup_online_check)
{
	alarm[1] = 60;
}
