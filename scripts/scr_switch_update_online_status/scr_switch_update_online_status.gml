function scr_switch_update_online_status()
{
	if (os_type == os_switch)
	{
		global.switch_account_network_service_available = false;
		
		var switch_accounts_num = switch_accounts_get_accounts();
		for (var i = 0; i < switch_accounts_num; ++i;)
		{
			global.switch_account_name[i] = switch_accounts_get_nickname(i); /* First get the nickname. With this function you can retrieve the nickname of the user in the given Account ID slot or the User Network Id */
			global.switch_account_open[i] = switch_accounts_is_user_open(i); /* Second get if user is open. With this function you can check an account ID slot to see if the account has been flagged as "open" (active) or not */
			global.switch_account_handle[i] = switch_accounts_get_handle(i); /* Third get the handle. With this function you can retrieve the "handle" (as a pointer) of the user in the given Account ID slot */
			
			/* Other Switch accounts functions to look for */
			global.switch_account_netid[i] = switch_accounts_get_netid(i);
			global.switch_account_online_token[i] = switch_accounts_get_online_token(i);
			global.switch_account_is_user_online[i] = switch_accounts_is_user_online(i);
			
			/* For some reason I can't retrieve infromation from network_service_available as an array without crashing the game with unknown error */
			/* Account needs to be open before you can check network service availability */
			if (global.switch_account_open[i])
			&& (global.switch_account_is_user_online[i])
			{
				global.switch_account_network_service_available = switch_accounts_network_service_available(i);
			}
			
		}
		
		/* If free communication is disabled, and switch_accounts_network_service_available is false, you shouldn't be able to upload or download custom content */
		/* If free communication is disabled, you shouldn't even see the buttons for going online */
		/* But if switch_accounts_network_service_available is false, you should be able to see the buttons for going online, but stop you from going online and instead show a notification telling you to link a Switch Account before proceeding */
		global.free_communication_available = switch_free_communication_available();
	}
	else
	{
		global.switch_account_network_service_available = true;
	}
}