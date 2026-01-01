if (sprite_index = spr_sign_run)
&& (!run_button_alternative)
{
	#region /* Set correct variables for players */
	var gamepad_player_is_connected = gamepad_is_connected(what_player - 1);

	var gp_button2_run = global.player_[inp.gp][what_player][2][action.run];
	var player_key2_run = global.player_[inp.key][what_player][2][action.run];

	/* If run buttons are not found, find run toggle buttons instead */
	if (gp_button2_run == noone)
	{
		gp_button2_run = global.player_[inp.gp][what_player][2][action.run_toggle];
	}
	
	if (player_key2_run == noone)
	{
		player_key2_run = global.player_[inp.key][what_player][2][action.run_toggle];
	}
	#endregion /* Set correct variables for players END */

	if (gamepad_player_is_connected)
	&& (gp_button2_run != "")
	|| (!gamepad_player_is_connected)
	&& (player_key2_run != "")
	{
		run_button_alternative = true;
		sprite_index = spr_sign_run_alternative;
		image_index = 0;
		image_speed = 0.02;
	}
	else
	{
		run_button_alternative = false;
		sprite_index = spr_sign_double_tap_run;
		image_index = 0;
		image_speed = 0.02;
	}
}
else
if (sprite_index == spr_sign_run || sprite_index == spr_sign_run_alternative)
&& (global.player_double_tap_to_run[what_player])
{
	run_button_alternative = false;
	sprite_index = spr_sign_double_tap_run;
	image_index = 0;
	image_speed = 0.02;
}
else
if (sprite_index == spr_sign_reset)
{
	sprite_index = sprite_sign;
	image_index = 0;
	image_speed = 0.02;
}
else
{
	sprite_index = spr_sign_reset;
	image_index = 0;
	image_speed = 0.5;
}
