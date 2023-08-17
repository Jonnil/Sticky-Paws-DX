#region /* When you go from pause menu to level again, game should destroy players that are not connected anymore */
/* But don't run this code before the pause happens, do it when you return from pause */
/* Otherwise when returning from pause menu, players that are still connected with new controller dissapear prematurely */
/* You only want to run this code in a Room Start Event */
if (player == 1 && !gamepad_is_connected(global.player1_slot))
{
	instance_destroy();
}
if (player == 2 && !gamepad_is_connected(global.player2_slot))
{
	instance_destroy();
}
if (player == 3 && !gamepad_is_connected(global.player3_slot))
{
	instance_destroy();
}
if (player == 4 && !gamepad_is_connected(global.player4_slot))
{
	instance_destroy();
}
#endregion /* When you go from pause menu to level again, game should destroy players that are not connected anymore END */