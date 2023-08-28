#region /* When you go from pause menu to level again, game should destroy players that are not connected anymore */
/* But don't run this code before the pause happens, do it when you return from pause */
/* Otherwise when returning from pause menu, players that are still connected with new controller dissapear prematurely */
/* You only want to run this code in a Room Start Event */
if (player == 1 && controller_connected && !gamepad_is_connected(global.player_slot[1]))
{
	instance_destroy();
}
if (player == 2 && controller_connected && !gamepad_is_connected(global.player_slot[2]))
{
	instance_destroy();
}
if (player == 3 && controller_connected && !gamepad_is_connected(global.player_slot[3]))
{
	instance_destroy();
}
if (player == 4 && controller_connected && !gamepad_is_connected(global.player_slot[4]))
{
	instance_destroy();
}
#endregion /* When you go from pause menu to level again, game should destroy players that are not connected anymore END */