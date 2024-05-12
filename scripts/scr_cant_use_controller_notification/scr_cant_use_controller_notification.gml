function scr_cant_use_controller_notification()
{
	var icon_offset = [-48, -16, 16, 48]; /* Offset for each player's icon */
	
	for (var i = 1; i <= global.max_players; i++)
	{
		if (gamepad_is_connected(i - 1))
		{
			
			#region /* Detect when a player is trying to use the controller when they can't */
			if (global.pause_player != i - 1)
			&& (gamepad_is_connected(global.player_slot[i]))
			{
				if (gamepad_button_check(global.player_slot[i], gp_face1))
				|| (gamepad_button_check(global.player_slot[i], gp_face2))
				|| (gamepad_button_check(global.player_slot[i], gp_face3))
				|| (gamepad_button_check(global.player_slot[i], gp_face4))
				{
					show_player_controller_cant_use[i] = 10;
				}
			}
			#endregion /* Detect when a player is trying to use the controller when they can't END */
			
			#region /* Hide and show controllers that can't be used */
			if (show_player_controller_cant_use[i] > 0)
			{
				show_player_controller_cant_use_y[i] = lerp(show_player_controller_cant_use_y[i], display_get_gui_height() - 32, 0.01);
				show_player_controller_cant_use[i] --;
			}
			else
			{
				show_player_controller_cant_use_y[i] = lerp(show_player_controller_cant_use_y[i], display_get_gui_height() + 64, 0.01);
			}
			#endregion /* Hide and show controllers that can't be used END */
			
			#region /* Draw the controllers that can't be used */
			if (show_player_controller_cant_use_y[i] < display_get_gui_height() + 64)
			{
				scr_draw_text_outlined(
					display_get_gui_width() * 0.5,
					show_player_controller_cant_use_y[i] - 16,
					l10n_text("Player " + string(i) + " can't control menu"),
					global.default_text_size * 0.75,
					c_black,
					global.player_color[i],
					1
				);
				
				draw_sprite_ext(spr_icon_gamepad, 0, display_get_gui_width() * 0.5 + icon_offset[i - 1], show_player_controller_cant_use_y[i], 1, 1, 0, global.player_color[i], 1);
			}
			#endregion /* Draw the controllers that can't be used END */
			
		}
	}
}