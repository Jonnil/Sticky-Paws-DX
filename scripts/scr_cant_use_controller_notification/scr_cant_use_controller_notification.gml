function scr_cant_use_controller_notification()
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		/* Player positions for each character display */
		var normalized_position = (i - 0.5) / (global.max_players); /* Normalized position between 0 and 1 */
		var icon_offset_width = 150;
		player_display_x[i] = normalized_position * icon_offset_width - (icon_offset_width * 0.5); /* Now icon_offset array contains evenly distributed positions based on the screen width */
	}
	
	if (!variable_instance_exists(self, "show_player_controller_cant_use"))
	{
		for(var p = 1; p <= global.max_players; p += 1)
		{
			show_player_controller_cant_use[p] = 0;
			show_player_controller_cant_use_y[p] = display_get_gui_height() * 2;
		}
	}
	
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
					show_player_controller_cant_use[i] = 60;
				}
			}
			#endregion /* Detect when a player is trying to use the controller when they can't END */
			
			#region /* Hide and show controllers that can't be used */
			if (show_player_controller_cant_use[i] > 0)
			{
				show_player_controller_cant_use_y[i] = lerp(show_player_controller_cant_use_y[i], display_get_gui_height() - 32, 0.1);
				show_player_controller_cant_use[i] --;
			}
			else
			{
				show_player_controller_cant_use_y[i] = lerp(show_player_controller_cant_use_y[i], display_get_gui_height() * 2, 0.1);
			}
			#endregion /* Hide and show controllers that can't be used END */
			
			#region /* Draw the controllers that can't be used */
			if (show_player_controller_cant_use_y[i] < display_get_gui_height() + 64)
			{
				draw_set_halign(fa_center);
				scr_draw_text_outlined(
					display_get_gui_width() * 0.5,
					show_player_controller_cant_use_y[i] - 16,
					l10n_text("Player " + string(i) + " can't control menu"),
					global.default_text_size * 0.75,
					c_black,
					global.player_color[i],
					1
				);
				
				draw_sprite_ext(spr_icon_gamepad, 0, display_get_gui_width() * 0.5 + player_display_x[i - 1], show_player_controller_cant_use_y[i], 1, 1, 0, global.player_color[i], 1);
			}
			#endregion /* Draw the controllers that can't be used END */
			
		}
	}
}