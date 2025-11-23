draw_self();

if (show_button_graphic)
{
	var gp_button = noone;
	var gp_button2 = noone;
	var player_key = noone;
	var player_key2 = noone;
	var xx = x + 32;
	var yy = y - 32;
	
	#region /* Set correct variables for players */
	var gamepad_player_is_connected = gamepad_is_connected(what_player - 1);
	
	if (sprite_index == spr_sign_run
	|| sprite_index == spr_sign_run_alternative)
	{
		gp_button = global.player_[inp.gp][what_player][1][action.run];
		gp_button2 = global.player_[inp.gp][what_player][2][action.run];
		player_key = global.player_[inp.key][what_player][1][action.run];
		player_key2 = global.player_[inp.key][what_player][2][action.run];
		
		/* If run buttons are not found, find run toggle buttons instead */
		if (gp_button == noone)
		{
			gp_button = global.player_[inp.gp][what_player][1][action.run_toggle];
		}
		
		if (gp_button2 == noone)
		{
			gp_button2 = global.player_[inp.gp][what_player][2][action.run_toggle];
		}
		
		if (player_key == noone)
		{
			player_key = global.player_[inp.key][what_player][1][action.run_toggle];
		}
		
		if (player_key2 == noone)
		{
			player_key2 = global.player_[inp.key][what_player][2][action.run_toggle];
		}
	}
	else
	if (sprite_index == spr_sign_dive)
	{
		gp_button = global.player_[inp.gp][what_player][1][action.dive];
		gp_button2 = global.player_[inp.gp][what_player][2][action.dive];
		player_key = global.player_[inp.key][what_player][1][action.dive];
		player_key2 = global.player_[inp.key][what_player][2][action.dive];
		var xx = x + 48;
		var yy = y - 48;
	}
	#endregion /* Set correct variables for players END */
	
	#region /* Show Controls for Player */
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	if (!run_button_alternative)
	{
		scr_draw_show_controls_key("", gp_button, gp_button2, player_key, player_key2, xx, what_player, yy, 1, gamepad_player_is_connected, 0);
	}
	else
	{
		scr_draw_show_controls_key("", gp_button2, gp_button, player_key2, player_key, xx, what_player, yy, 1, gamepad_player_is_connected, 0);
	}
	#endregion /* Show Controls for Player END */
	
}