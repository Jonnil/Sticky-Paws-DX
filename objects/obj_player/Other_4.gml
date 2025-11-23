#region /* When you go from pause menu to level again, game should destroy players that are not connected anymore */
/* But don't run this code before the pause happens, do it when you return from pause */
/* Otherwise when returning from pause menu, players that are still connected with new controller dissapear prematurely */
/* You only want to run this code in a Room Start Event */
for(var i = 1; i <= global.max_players; i += 1)
{
	if (player == i && controller_connected && !gamepad_is_connected(global.player_slot[i]))
	|| (player == i && !global.player_can_play[i])
	{
		instance_destroy();
	}
}
#endregion /* When you go from pause menu to level again, game should destroy players that are not connected anymore END */

#region /* Reload character if it doesn't match the saved character variables */
if (global.character_for_player[player] != custom_character)
|| (global.voicepack_for_player[player] != selected_voicepack)
|| (global.skin_for_player[player] != selected_skin)
{
	custom_character = global.character_for_player[player];
	selected_voicepack = global.voicepack_for_player[player];
	selected_skin = global.skin_for_player[player];
	scr_player_initialize_custom_character(); /* Reset all player variables before reloading character */
	alarm[0] = 1;
}
#endregion /* Reload character if it doesn't match the saved character variables END */