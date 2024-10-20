draw_self();

if (show_button_graphic)
&& (sprite_index == spr_sign_run || sprite_index == spr_sign_run_alternative)
{
	
	#region /* Set correct variables for players */
	var gamepad_player_is_connected = gamepad_is_connected(what_player - 1);
	
	var gp_button_run = global.player_[inp.gp][what_player][1][action.run];
	var gp_button2_run = global.player_[inp.gp][what_player][2][action.run];
	var player_key_run = global.player_[inp.key][what_player][1][action.run];
	var player_key2_run = global.player_[inp.key][what_player][2][action.run];
	
	/* If run buttons are not found, find run toggle buttons instead */
	if (gp_button_run == noone)
	{
		var gp_button_run = global.player_[inp.gp][what_player][1][action.run_toggle];
	}
	if (gp_button2_run == noone)
	{
		var gp_button2_run = global.player_[inp.gp][what_player][2][action.run_toggle];
	}
	if (player_key_run == noone)
	{
		var player_key_run = global.player_[inp.key][what_player][1][action.run_toggle];
	}
	if (player_key2_run == noone)
	{
		var player_key2_run = global.player_[inp.key][what_player][2][action.run_toggle];
	}
	#endregion /* Set correct variables for players END */
	
	#region /* Show Controls for Player */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (!run_button_alternative)
	{
		scr_draw_show_controls_key("", gp_button_run, gp_button2_run, player_key_run, player_key2_run, x + 32, what_player, y - 32, 1, gamepad_player_is_connected, 0);
	}
	else
	{
		scr_draw_show_controls_key("", gp_button2_run, gp_button_run, player_key2_run, player_key_run, x + 32, what_player, y - 32, 1, gamepad_player_is_connected, 0);
	}
	#endregion /* Show Controls for Player END */
	
}