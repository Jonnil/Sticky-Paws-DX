///scr_saveconfig()
function scr_saveconfig() {
	if (file_exists("Config.ini")){file_delete("Config.ini");}
	ini_open("Config.ini");

	ini_write_real("Config","difficulty",global.difficulty);
	ini_write_real("Config","narrator",global.narrator);
	ini_write_real("Config","show_tutorial_signs",global.show_tutorial_signs);
	ini_write_real("Config","hud_show_timer",global.hud_show_timer);
	ini_write_real("Config","players_can_collide",global.players_can_collide);
	/*Assist Settings*/ini_write_real("Config","assist_item_appear",global.assist_item_appear);
	ini_write_real("Config","assist_default_hp",global.assist_default_hp);
	ini_write_real("Config","assist_guiding_arrows",global.assist_guiding_arrows);/*Assist Settings END*/
	ini_write_real("Config","fullscreen_mode",window_get_fullscreen());
	ini_write_real("Config","interpolate",global.interpolate);
	ini_write_real("Config","show_fps",global.show_fps);
	ini_write_real("Config","music_volume",global.music_volume);
	ini_write_real("Config","sfx_volume",global.sfx_volume);
	ini_write_real("Config","voices_volume",global.voices_volume);
	ini_write_real("Config","background_brightness",global.background_brightness);
	ini_write_real("Config","enable_background_layer1",global.enable_background_layer1);
	ini_write_real("Config","enable_background_layer2",global.enable_background_layer2);
	ini_write_real("Config","enable_background_layer3",global.enable_background_layer3);
	ini_write_real("Config","enable_background_layer4",global.enable_background_layer4);
	ini_write_real("Config","enable_foreground_layer1",global.enable_foreground_layer1);
	ini_write_real("Config","enable_foreground_layer2",global.enable_foreground_layer2);
	ini_write_real("Config","enable_transitions",global.enable_transitions);
	//Save Player 1 Keyboard Remapping
	ini_write_real("Config","character_for_player_1",global.character_for_player_1);
	ini_write_real("Config","color_for_player_1",global.color_for_player_1);
	ini_write_string("Config","player1_name",global.player1_name);
	ini_write_real("Config","player1_key_jump",global.player1_key_jump);
	ini_write_real("Config","player1_key_crouch",global.player1_key_crouch);
	ini_write_real("Config","player1_key_crouch_toggle",global.player1_key_crouch_toggle);
	ini_write_real("Config","player1_key_sprint",global.player1_key_sprint);
	ini_write_real("Config","player1_key_sprint_toggle",global.player1_key_sprint_toggle);
	ini_write_real("Config","player1_key_left",global.player1_key_left);
	ini_write_real("Config","player1_key_right",global.player1_key_right);
	ini_write_real("Config","player1_key_down",global.player1_key_down);
	ini_write_real("Config","player1_key_up",global.player1_key_up);
	ini_write_real("Config","player1_key_attack",global.player1_key_attack);
	ini_write_real("Config","player1_key2_jump",global.player1_key2_jump);
	ini_write_real("Config","player1_key2_crouch",global.player1_key2_crouch);
	ini_write_real("Config","player1_key2_crouch_toggle",global.player1_key2_crouch_toggle);
	ini_write_real("Config","player1_key2_sprint",global.player1_key2_sprint);
	ini_write_real("Config","player1_key2_sprint_toggle",global.player1_key2_sprint_toggle);
	ini_write_real("Config","player1_key2_left",global.player1_key2_left);
	ini_write_real("Config","player1_key2_right",global.player1_key2_right);
	ini_write_real("Config","player1_key2_down",global.player1_key2_down);
	ini_write_real("Config","player1_key2_up",global.player1_key2_up);
	ini_write_real("Config","player1_key2_attack",global.player1_key2_attack);
	ini_write_real("Config","player1_up_key_is_jump_key",global.player1_up_key_is_jump_key);
	ini_write_real("Config","player1_double_tap_to_run",global.player1_double_tap_to_run);
	ini_write_real("Config","player1_sprint_toggle",global.player1_sprint_toggle);
	ini_write_real("Config","player1_wall_jump_setting",global.player1_wall_jump_setting);
	ini_write_real("Config","player1_drop_from_rope",global.player1_drop_from_rope);
	ini_write_real("Config","player1_show_controls",global.player1_show_controls);//Save Player 1 Keyboard Remapping End
	//Save Player 2 Keyboard Remapping
	ini_write_real("Config","character_for_player_2",global.character_for_player_2);
	ini_write_real("Config","color_for_player_2",global.color_for_player_2);
	ini_write_string("Config","player2_name",global.player2_name);
	ini_write_real("Config","player2_key_jump",global.player2_key_jump);
	ini_write_real("Config","player2_key_crouch",global.player2_key_crouch);
	ini_write_real("Config","player2_key_crouch_toggle",global.player2_key_crouch_toggle);
	ini_write_real("Config","player2_key_sprint",global.player2_key_sprint);
	ini_write_real("Config","player2_key_sprint_toggle",global.player2_key_sprint_toggle);
	ini_write_real("Config","player2_key_left",global.player2_key_left);
	ini_write_real("Config","player2_key_right",global.player2_key_right);
	ini_write_real("Config","player2_key_down",global.player2_key_down);
	ini_write_real("Config","player2_key_up",global.player2_key_up);
	ini_write_real("Config","player2_key_attack",global.player2_key_attack);
	ini_write_real("Config","player2_key2_jump",global.player2_key2_jump);
	ini_write_real("Config","player2_key2_crouch",global.player2_key2_crouch);
	ini_write_real("Config","player2_key2_crouch_toggle",global.player2_key2_crouch_toggle);
	ini_write_real("Config","player2_key2_sprint",global.player2_key2_sprint);
	ini_write_real("Config","player2_key2_sprint_toggle",global.player2_key2_sprint_toggle);
	ini_write_real("Config","player2_key2_left",global.player2_key2_left);
	ini_write_real("Config","player2_key2_right",global.player2_key2_right);
	ini_write_real("Config","player2_key2_down",global.player2_key2_down);
	ini_write_real("Config","player2_key2_up",global.player2_key2_up);
	ini_write_real("Config","player2_key2_attack",global.player2_key2_attack);
	ini_write_real("Config","player2_up_key_is_jump_key",global.player2_up_key_is_jump_key);
	ini_write_real("Config","player2_double_tap_to_run",global.player2_double_tap_to_run);
	ini_write_real("Config","player2_sprint_toggle",global.player2_sprint_toggle);
	ini_write_real("Config","player2_wall_jump_setting",global.player2_wall_jump_setting);
	ini_write_real("Config","player2_drop_from_rope",global.player2_drop_from_rope);
	ini_write_real("Config","player2_show_controls",global.player2_show_controls);//Save Player 2 Keyboard Remapping End
	//Save Player 3 Keyboard Remapping
	ini_write_real("Config","character_for_player_3",global.character_for_player_3);
	ini_write_real("Config","color_for_player_3",global.color_for_player_3);
	ini_write_string("Config","player3_name",global.player3_name);
	ini_write_real("Config","player3_key_jump",global.player3_key_jump);
	ini_write_real("Config","player3_key_crouch",global.player3_key_crouch);
	ini_write_real("Config","player3_key_crouch_toggle",global.player3_key_crouch_toggle);
	ini_write_real("Config","player3_key_sprint",global.player3_key_sprint);
	ini_write_real("Config","player3_key_sprint_toggle",global.player3_key_sprint_toggle);
	ini_write_real("Config","player3_key_left",global.player3_key_left);
	ini_write_real("Config","player3_key_right",global.player3_key_right);
	ini_write_real("Config","player3_key_down",global.player3_key_down);
	ini_write_real("Config","player3_key_up",global.player3_key_up);
	ini_write_real("Config","player3_key_attack",global.player3_key_attack);
	ini_write_real("Config","player3_key2_jump",global.player3_key2_jump);
	ini_write_real("Config","player3_key2_crouch",global.player3_key2_crouch);
	ini_write_real("Config","player3_key2_crouch_toggle",global.player3_key2_crouch_toggle);
	ini_write_real("Config","player3_key2_sprint",global.player3_key2_sprint);
	ini_write_real("Config","player3_key2_sprint_toggle",global.player3_key2_sprint_toggle);
	ini_write_real("Config","player3_key2_left",global.player3_key2_left);
	ini_write_real("Config","player3_key2_right",global.player3_key2_right);
	ini_write_real("Config","player3_key2_down",global.player3_key2_down);
	ini_write_real("Config","player3_key2_up",global.player3_key2_up);
	ini_write_real("Config","player3_key2_attack",global.player3_key2_attack);
	ini_write_real("Config","player3_up_key_is_jump_key",global.player3_up_key_is_jump_key);
	ini_write_real("Config","player3_double_tap_to_run",global.player3_double_tap_to_run);
	ini_write_real("Config","player3_sprint_toggle",global.player3_sprint_toggle);
	ini_write_real("Config","player3_wall_jump_setting",global.player3_wall_jump_setting);
	ini_write_real("Config","player3_drop_from_rope",global.player3_drop_from_rope);
	ini_write_real("Config","player3_show_controls",global.player3_show_controls);//Save Player 3 Keyboard Remapping End
	//Save Player 4 Keyboard Remapping
	ini_write_real("Config","character_for_player_4",global.character_for_player_4);
	ini_write_real("Config","color_for_player_4",global.color_for_player_4);
	ini_write_string("Config","player4_name",global.player4_name);
	ini_write_real("Config","player4_key_jump",global.player4_key_jump);
	ini_write_real("Config","player4_key_crouch",global.player4_key_crouch);
	ini_write_real("Config","player4_key_crouch_toggle",global.player4_key_crouch_toggle);
	ini_write_real("Config","player4_key_sprint",global.player4_key_sprint);
	ini_write_real("Config","player4_key_sprint_toggle",global.player4_key_sprint_toggle);
	ini_write_real("Config","player4_key_left",global.player4_key_left);
	ini_write_real("Config","player4_key_right",global.player4_key_right);
	ini_write_real("Config","player4_key_down",global.player4_key_down);
	ini_write_real("Config","player4_key_up",global.player4_key_up);
	ini_write_real("Config","player4_key_attack",global.player4_key_attack);
	ini_write_real("Config","player4_key2_jump",global.player4_key2_jump);
	ini_write_real("Config","player4_key2_crouch",global.player4_key2_crouch);
	ini_write_real("Config","player4_key2_crouch_toggle",global.player4_key2_crouch_toggle);
	ini_write_real("Config","player4_key2_sprint",global.player4_key2_sprint);
	ini_write_real("Config","player4_key2_sprint_toggle",global.player4_key2_sprint_toggle);
	ini_write_real("Config","player4_key2_left",global.player4_key2_left);
	ini_write_real("Config","player4_key2_right",global.player4_key2_right);
	ini_write_real("Config","player4_key2_down",global.player4_key2_down);
	ini_write_real("Config","player4_key2_up",global.player4_key2_up);
	ini_write_real("Config","player4_key2_attack",global.player4_key2_attack);
	ini_write_real("Config","player4_up_key_is_jump_key",global.player4_up_key_is_jump_key);
	ini_write_real("Config","player4_double_tap_to_run",global.player4_double_tap_to_run);
	ini_write_real("Config","player4_sprint_toggle",global.player4_sprint_toggle);
	ini_write_real("Config","player4_wall_jump_setting",global.player4_wall_jump_setting);
	ini_write_real("Config","player4_drop_from_rope",global.player4_drop_from_rope);
	ini_write_real("Config","player4_show_controls",global.player4_show_controls);//Save Player 4 Keyboard Remapping End

	ini_close();


}
