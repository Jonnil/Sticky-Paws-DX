function scr_set_show_controls_y(from_y_position = 22, always_show_controls = false)
{

	#region /* Show Multiplayer Controls. Y position of show controls for each player */
	if (os_type != os_ios)
	&& (os_type != os_android) {
		var how_many_players_are_playing = 0;

		for(var i = 1; i <= global.max_players; i += 1) {
			if (player_show_controls_alpha[i] > 0 && (global.player_show_controls[i] > 0 || always_show_controls) && global.player_can_play[i]) {
				how_many_players_are_playing += 1;
			}
		}

		var controls_hud_y = from_y_position + (42 * how_many_players_are_playing); /* Initialize controls_hud_y to the maximum value, based on max amount of players */

		for(var i = 1; i <= global.max_players; i += 1) {

			if (player_show_controls_alpha[i] > 0) { /* If player show controls alpha is more than 0, then change the y position to correct position */
				/* Set the controls_hud_y to be decending, from first player to last player */
				controls_hud_y -= 42; /* If player show controls alpha is more than 0, decrease controls_hud_y by 42 */
				show_player_controls_y[i] = lerp(show_player_controls_y[i], controls_hud_y, 0.1);
			}
			else { /* If player show controls alpha is not more than 0, then hide the hud by setting it to +34 */
				show_player_controls_y[i] = lerp(show_player_controls_y[i], +34, 0.1); /* + 34 = don't show */
			}
		}
	}
	#endregion /* Show Multiplayer Controls. Y position of show controls for each player END */

}
