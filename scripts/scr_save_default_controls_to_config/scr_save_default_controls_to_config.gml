function scr_save_default_controls_to_config()
{
	
	#region /*Save default controls to config*/
	ini_open(working_directory + "config.ini");
	
	#region /*Save Player 1 defaults to config*/
	
	#region /*Save Player 1 Key 1 defaults to config*/
	ini_write_real("config", "player1_key_dive", global.player1_key_dive);
	ini_write_real("config", "player1_key_jump", global.player1_key_jump);
	ini_write_real("config", "player1_key_crouch", global.player1_key_crouch);
	ini_write_real("config", "player1_key_crouch_toggle", global.player1_key_crouch_toggle);
	ini_write_real("config", "player1_key_sprint", global.player1_key_sprint);
	ini_write_real("config", "player1_key_sprint_toggle", global.player1_key_sprint_toggle);
	ini_write_real("config", "player1_key_left", global.player1_key_left);
	ini_write_real("config", "player1_key_right", global.player1_key_right);
	ini_write_real("config", "player1_key_down", global.player1_key_down);
	ini_write_real("config", "player1_key_up", global.player1_key_up);
	ini_write_real("config", "player1_key_tongue", global.player1_key_tongue);
	ini_write_real("config", "player1_key_zoom_in", global.player1_key_zoom_in);
	ini_write_real("config", "player1_key_zoom_out", global.player1_key_zoom_out);
	#endregion /*Save Player 1 Key 1 defaults to config END*/
	
	#region /*Save Player 1 Key 2 defaults to config*/
	ini_write_real("config", "player1_key2_dive", global.player1_key2_dive);
	ini_write_real("config", "player1_key2_jump", global.player1_key2_jump);
	ini_write_real("config", "player1_key2_crouch", global.player1_key2_crouch);
	ini_write_real("config", "player1_key2_crouch_toggle", global.player1_key2_crouch_toggle);
	ini_write_real("config", "player1_key2_sprint", global.player1_key2_sprint);
	ini_write_real("config", "player1_key2_sprint_toggle", global.player1_key2_sprint_toggle);
	ini_write_real("config", "player1_key2_left", global.player1_key2_left);
	ini_write_real("config", "player1_key2_right", global.player1_key2_right);
	ini_write_real("config", "player1_key2_down", global.player1_key2_down);
	ini_write_real("config", "player1_key2_up", global.player1_key2_up);
	ini_write_real("config", "player1_key2_tongue", global.player1_key2_tongue);
	ini_write_real("config", "player1_key2_zoom_in", global.player1_key2_zoom_in);
	ini_write_real("config", "player1_key2_zoom_out", global.player1_key2_zoom_out);
	#endregion /*Save Player 1 Key 2 defaults to config END*/
	
	#endregion /*Save Player 1 defaults to config END*/
	
	#region /*Save Player 2 defaults to config*/
	
	#region /*Save Player 2 Key 1 defaults to config*/
	ini_write_real("config", "player2_key_dive", global.player2_key_dive);
	ini_write_real("config", "player2_key_jump", global.player2_key_jump);
	ini_write_real("config", "player2_key_crouch", global.player2_key_crouch);
	ini_write_real("config", "player2_key_crouch_toggle", global.player2_key_crouch_toggle);
	ini_write_real("config", "player2_key_sprint", global.player2_key_sprint);
	ini_write_real("config", "player2_key_sprint_toggle", global.player2_key_sprint_toggle);
	ini_write_real("config", "player2_key_left", global.player2_key_left);
	ini_write_real("config", "player2_key_right", global.player2_key_right);
	ini_write_real("config", "player2_key_down", global.player2_key_down);
	ini_write_real("config", "player2_key_up", global.player2_key_up);
	ini_write_real("config", "player2_key_tongue", global.player2_key_tongue);
	ini_write_real("config", "player2_key_zoom_in", global.player2_key_zoom_in);
	ini_write_real("config", "player2_key_zoom_out", global.player2_key_zoom_out);
	#endregion /*Save Player 2 Key 1 defaults to config END*/
	
	#region /*Save Player 2 Key 2 defaults to config*/
	ini_write_real("config", "player2_key2_dive", global.player2_key2_dive);
	ini_write_real("config", "player2_key2_jump", global.player2_key2_jump);
	ini_write_real("config", "player2_key2_crouch", global.player2_key2_crouch);
	ini_write_real("config", "player2_key2_crouch_toggle", global.player2_key2_crouch_toggle);
	ini_write_real("config", "player2_key2_sprint", global.player2_key2_sprint);
	ini_write_real("config", "player2_key2_sprint_toggle", global.player2_key2_sprint_toggle);
	ini_write_real("config", "player2_key2_left", global.player2_key2_left);
	ini_write_real("config", "player2_key2_right", global.player2_key2_right);
	ini_write_real("config", "player2_key2_down", global.player2_key2_down);
	ini_write_real("config", "player2_key2_up", global.player2_key2_up);
	ini_write_real("config", "player2_key2_tongue", global.player2_key2_tongue);
	ini_write_real("config", "player2_key2_zoom_in", global.player2_key2_zoom_in);
	ini_write_real("config", "player2_key2_zoom_out", global.player2_key2_zoom_out);
	#endregion /*Save Player 2 Key 2 defaults to config END*/
	
	#endregion /*Save Player 2 defaults to config END*/
	
	#region /*Save Player 3 defaults to config*/
	
	#region /*Save Player 3 Key 1 defaults to config*/
	ini_write_real("config", "player3_key_dive", global.player3_key_dive);
	ini_write_real("config", "player3_key_jump", global.player3_key_jump);
	ini_write_real("config", "player3_key_crouch", global.player3_key_crouch);
	ini_write_real("config", "player3_key_crouch_toggle", global.player3_key_crouch_toggle);
	ini_write_real("config", "player3_key_sprint", global.player3_key_sprint);
	ini_write_real("config", "player3_key_sprint_toggle", global.player3_key_sprint_toggle);
	ini_write_real("config", "player3_key_left", global.player3_key_left);
	ini_write_real("config", "player3_key_right", global.player3_key_right);
	ini_write_real("config", "player3_key_down", global.player3_key_down);
	ini_write_real("config", "player3_key_up", global.player3_key_up);
	ini_write_real("config", "player3_key_tongue", global.player3_key_tongue);
	ini_write_real("config", "player3_key_zoom_in", global.player3_key_zoom_in);
	ini_write_real("config", "player3_key_zoom_out", global.player3_key_zoom_out);
	#endregion /*Save Player 3 Key 1 defaults to config END*/
	
	#region /*Save Player 3 Key 2 defaults to config*/
	ini_write_real("config", "player3_key2_dive", global.player3_key2_dive);
	ini_write_real("config", "player3_key2_jump", global.player3_key2_jump);
	ini_write_real("config", "player3_key2_crouch", global.player3_key2_crouch);
	ini_write_real("config", "player3_key2_crouch_toggle", global.player3_key2_crouch_toggle);
	ini_write_real("config", "player3_key2_sprint", global.player3_key2_sprint);
	ini_write_real("config", "player3_key2_sprint_toggle", global.player3_key2_sprint_toggle);
	ini_write_real("config", "player3_key2_left", global.player3_key2_left);
	ini_write_real("config", "player3_key2_right", global.player3_key2_right);
	ini_write_real("config", "player3_key2_down", global.player3_key2_down);
	ini_write_real("config", "player3_key2_up", global.player3_key2_up);
	ini_write_real("config", "player3_key2_tongue", global.player3_key2_tongue);
	ini_write_real("config", "player3_key2_zoom_in", global.player3_key2_zoom_in);
	ini_write_real("config", "player3_key2_zoom_out", global.player3_key2_zoom_out);
	#endregion /*Save Player 3 Key 2 defaults to config END*/
	
	#endregion /*Save Player 3 defaults to config END*/
	
	#region /*Save Player 4 defaults to config*/
	
	#region /*Save Player 4 Key 1 defaults to config*/
	ini_write_real("config", "player4_key_dive", global.player4_key_dive);
	ini_write_real("config", "player4_key_jump", global.player4_key_jump);
	ini_write_real("config", "player4_key_crouch", global.player4_key_crouch);
	ini_write_real("config", "player4_key_crouch_toggle", global.player4_key_crouch_toggle);
	ini_write_real("config", "player4_key_sprint", global.player4_key_sprint);
	ini_write_real("config", "player4_key_sprint_toggle", global.player4_key_sprint_toggle);
	ini_write_real("config", "player4_key_left", global.player4_key_left);
	ini_write_real("config", "player4_key_right", global.player4_key_right);
	ini_write_real("config", "player4_key_down", global.player4_key_down);
	ini_write_real("config", "player4_key_up", global.player4_key_up);
	ini_write_real("config", "player4_key_tongue", global.player4_key_tongue);
	ini_write_real("config", "player4_key_zoom_in", global.player4_key_zoom_in);
	ini_write_real("config", "player4_key_zoom_out", global.player4_key_zoom_out);
	#endregion /*Save Player 4 Key 1 defaults to config END*/
	
	#region /*Save Player 4 Key 2 defaults to config*/
	ini_write_real("config", "player4_key2_dive", global.player4_key2_dive);
	ini_write_real("config", "player4_key2_jump", global.player4_key2_jump);
	ini_write_real("config", "player4_key2_crouch", global.player4_key2_crouch);
	ini_write_real("config", "player4_key2_crouch_toggle", global.player4_key2_crouch_toggle);
	ini_write_real("config", "player4_key2_sprint", global.player4_key2_sprint);
	ini_write_real("config", "player4_key2_sprint_toggle", global.player4_key2_sprint_toggle);
	ini_write_real("config", "player4_key2_left", global.player4_key2_left);
	ini_write_real("config", "player4_key2_right", global.player4_key2_right);
	ini_write_real("config", "player4_key2_down", global.player4_key2_down);
	ini_write_real("config", "player4_key2_up", global.player4_key2_up);
	ini_write_real("config", "player4_key2_tongue", global.player4_key2_tongue);
	ini_write_real("config", "player4_key2_zoom_in", global.player4_key2_zoom_in);
	ini_write_real("config", "player4_key2_zoom_out", global.player4_key2_zoom_out);
	#endregion /*Save Player 4 Key 2 defaults to config END*/
	
	#endregion /*Save Player 4 defaults to config END*/
	
	ini_close();
	#endregion /*Save default controls to config END*/
	
}