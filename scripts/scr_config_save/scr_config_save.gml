///scr_config_save()
function scr_config_save()
{
	if (file_exists("config.ini"))
	{
		file_delete("config.ini");
	}
	ini_open("config.ini");

	ini_write_real("config","difficulty",global.difficulty);
	ini_write_real("config","automatically_pause_when_window_is_unfocused",global.automatically_pause_when_window_is_unfocused);
	ini_write_real("config","show_timer",global.show_timer);
	ini_write_real("config","show_deaths_counter",global.show_deaths_counter);
	ini_write_real("config","custom_level_load_delay",global.custom_level_load_delay);
	ini_write_real("config","activate_cheats",global.activate_cheats);
	ini_write_real("config","enable_enemies",global.enable_enemies);
	ini_write_real("config","enable_spikes",global.enable_spikes);
	ini_write_real("config","narrator",global.narrator);
	ini_write_real("config","show_tutorial_signs",global.show_tutorial_signs);
	ini_write_real("config","hud_hide_time",global.hud_hide_time);
	ini_write_real("config","players_can_collide",global.players_can_collide);
	
	#region /*Assist Settings*/
	ini_write_real("config","assist_enable",global.assist_enable);
	ini_write_real("config","assist_item_appear",global.assist_item_appear);
	ini_write_real("config","assist_extra_hp",global.assist_extra_hp);
	ini_write_real("config","assist_invincible",global.assist_invincible);
	ini_write_real("config","assist_guiding_arrows",global.assist_guiding_arrows);
	ini_write_real("config","assist_normal_arrows",global.assist_normal_arrows);
	#endregion /*Assist Settings END*/
	
	ini_write_real("config","fullscreen_mode",window_get_fullscreen());
	ini_write_real("config","interpolate",global.interpolate);
	ini_write_real("config","show_fps",global.show_fps);
	ini_write_real("config","show_fps_real",global.show_fps_real);
	ini_write_real("config","show_instance_count",global.show_instance_count);
	ini_write_real("config","show_collision_mask",global.show_collision_mask);
	ini_write_real("config","music_volume",global.music_volume);
	ini_write_real("config","sfx_volume",global.sfx_volume);
	ini_write_real("config","ambient_volume",global.ambient_volume);
	ini_write_real("config","voices_volume",global.voices_volume);
	ini_write_real("config","background_brightness_gameplay",global.background_brightness_gameplay);
	ini_write_real("config","background_brightness_menu",global.background_brightness_menu);
	ini_write_real("config","enable_background_layer1",global.enable_background_layer1);
	ini_write_real("config","enable_background_layer2",global.enable_background_layer2);
	ini_write_real("config","enable_background_layer3",global.enable_background_layer3);
	ini_write_real("config","enable_background_layer4",global.enable_background_layer4);
	ini_write_real("config","enable_foreground_layer1",global.enable_foreground_layer1);
	ini_write_real("config","enable_foreground_layer2",global.enable_foreground_layer2);
	ini_write_real("config","enable_transitions",global.enable_transitions);
	ini_write_real("config","selected_resourcepack",global.selected_resourcepack);
	ini_write_real("config","selected_title_background",global.selected_title_background);
	
	#region /*Save Player 1 Keyboard Remapping*/
	ini_write_real("config","character_for_player_1",global.character_for_player_1);
	ini_write_real("config","color_for_player_1",global.color_for_player_1);
	ini_write_string("config","player1_name",global.player1_name);
	ini_write_real("config","player1_key_dive",global.player1_key_dive);
	ini_write_real("config","player1_key_jump",global.player1_key_jump);
	ini_write_real("config","player1_key_crouch",global.player1_key_crouch);
	ini_write_real("config","player1_key_crouch_toggle",global.player1_key_crouch_toggle);
	ini_write_real("config","player1_key_sprint",global.player1_key_sprint);
	ini_write_real("config","player1_key_sprint_toggle",global.player1_key_sprint_toggle);
	ini_write_real("config","player1_key_left",global.player1_key_left);
	ini_write_real("config","player1_key_right",global.player1_key_right);
	ini_write_real("config","player1_key_down",global.player1_key_down);
	ini_write_real("config","player1_key_up",global.player1_key_up);
	ini_write_real("config","player1_key_tongue",global.player1_key_tongue);
	ini_write_real("config","player1_key2_dive",global.player1_key2_dive);
	ini_write_real("config","player1_key2_jump",global.player1_key2_jump);
	ini_write_real("config","player1_key2_crouch",global.player1_key2_crouch);
	ini_write_real("config","player1_key2_crouch_toggle",global.player1_key2_crouch_toggle);
	ini_write_real("config","player1_key2_sprint",global.player1_key2_sprint);
	ini_write_real("config","player1_key2_sprint_toggle",global.player1_key2_sprint_toggle);
	ini_write_real("config","player1_key2_left",global.player1_key2_left);
	ini_write_real("config","player1_key2_right",global.player1_key2_right);
	ini_write_real("config","player1_key2_down",global.player1_key2_down);
	ini_write_real("config","player1_key2_up",global.player1_key2_up);
	ini_write_real("config","player1_key2_tongue",global.player1_key2_tongue);
	ini_write_real("config","player1_up_key_is_jump_key",global.player1_up_key_is_jump_key);
	ini_write_real("config","player1_double_tap_to_run",global.player1_double_tap_to_run);
	ini_write_real("config","player1_sprint_toggle",global.player1_sprint_toggle);
	ini_write_real("config","player1_cancel_dive_by_pressing_jump_or_dive_button",global.player1_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config","player1_cancel_dive_by_pressing_opposite_direction",global.player1_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config","player1_wall_jump_setting",global.player1_wall_jump_setting);
	ini_write_real("config","player1_drop_from_rope",global.player1_drop_from_rope);
	ini_write_real("config","player1_show_controls",global.player1_show_controls);
	#endregion /*Save Player 1 Keyboard Remapping END*/
	
	#region /*Save Player 2 Keyboard Remapping*/
	ini_write_real("config","character_for_player_2",global.character_for_player_2);
	ini_write_real("config","color_for_player_2",global.color_for_player_2);
	ini_write_string("config","player2_name",global.player2_name);
	ini_write_real("config","player2_key_dive",global.player2_key_dive);
	ini_write_real("config","player2_key_jump",global.player2_key_jump);
	ini_write_real("config","player2_key_crouch",global.player2_key_crouch);
	ini_write_real("config","player2_key_crouch_toggle",global.player2_key_crouch_toggle);
	ini_write_real("config","player2_key_sprint",global.player2_key_sprint);
	ini_write_real("config","player2_key_sprint_toggle",global.player2_key_sprint_toggle);
	ini_write_real("config","player2_key_left",global.player2_key_left);
	ini_write_real("config","player2_key_right",global.player2_key_right);
	ini_write_real("config","player2_key_down",global.player2_key_down);
	ini_write_real("config","player2_key_up",global.player2_key_up);
	ini_write_real("config","player2_key_tongue",global.player2_key_tongue);
	ini_write_real("config","player2_key2_dive",global.player2_key2_dive);
	ini_write_real("config","player2_key2_jump",global.player2_key2_jump);
	ini_write_real("config","player2_key2_crouch",global.player2_key2_crouch);
	ini_write_real("config","player2_key2_crouch_toggle",global.player2_key2_crouch_toggle);
	ini_write_real("config","player2_key2_sprint",global.player2_key2_sprint);
	ini_write_real("config","player2_key2_sprint_toggle",global.player2_key2_sprint_toggle);
	ini_write_real("config","player2_key2_left",global.player2_key2_left);
	ini_write_real("config","player2_key2_right",global.player2_key2_right);
	ini_write_real("config","player2_key2_down",global.player2_key2_down);
	ini_write_real("config","player2_key2_up",global.player2_key2_up);
	ini_write_real("config","player2_key2_tongue",global.player2_key2_tongue);
	ini_write_real("config","player2_up_key_is_jump_key",global.player2_up_key_is_jump_key);
	ini_write_real("config","player2_double_tap_to_run",global.player2_double_tap_to_run);
	ini_write_real("config","player2_sprint_toggle",global.player2_sprint_toggle);
	ini_write_real("config","player2_cancel_dive_by_pressing_jump_or_dive_button",global.player2_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config","player2_cancel_dive_by_pressing_opposite_direction",global.player2_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config","player2_wall_jump_setting",global.player2_wall_jump_setting);
	ini_write_real("config","player2_drop_from_rope",global.player2_drop_from_rope);
	ini_write_real("config","player2_show_controls",global.player2_show_controls);
	#endregion /*Save Player 2 Keyboard Remapping END*/
	
	#region /*Save Player 3 Keyboard Remapping*/
	ini_write_real("config","character_for_player_3",global.character_for_player_3);
	ini_write_real("config","color_for_player_3",global.color_for_player_3);
	ini_write_string("config","player3_name",global.player3_name);
	ini_write_real("config","player3_key_dive",global.player3_key_dive);
	ini_write_real("config","player3_key_jump",global.player3_key_jump);
	ini_write_real("config","player3_key_crouch",global.player3_key_crouch);
	ini_write_real("config","player3_key_crouch_toggle",global.player3_key_crouch_toggle);
	ini_write_real("config","player3_key_sprint",global.player3_key_sprint);
	ini_write_real("config","player3_key_sprint_toggle",global.player3_key_sprint_toggle);
	ini_write_real("config","player3_key_left",global.player3_key_left);
	ini_write_real("config","player3_key_right",global.player3_key_right);
	ini_write_real("config","player3_key_down",global.player3_key_down);
	ini_write_real("config","player3_key_up",global.player3_key_up);
	ini_write_real("config","player3_key_tongue",global.player3_key_tongue);
	ini_write_real("config","player3_key2_dive",global.player3_key2_dive);
	ini_write_real("config","player3_key2_jump",global.player3_key2_jump);
	ini_write_real("config","player3_key2_crouch",global.player3_key2_crouch);
	ini_write_real("config","player3_key2_crouch_toggle",global.player3_key2_crouch_toggle);
	ini_write_real("config","player3_key2_sprint",global.player3_key2_sprint);
	ini_write_real("config","player3_key2_sprint_toggle",global.player3_key2_sprint_toggle);
	ini_write_real("config","player3_key2_left",global.player3_key2_left);
	ini_write_real("config","player3_key2_right",global.player3_key2_right);
	ini_write_real("config","player3_key2_down",global.player3_key2_down);
	ini_write_real("config","player3_key2_up",global.player3_key2_up);
	ini_write_real("config","player3_key2_tongue",global.player3_key2_tongue);
	ini_write_real("config","player3_up_key_is_jump_key",global.player3_up_key_is_jump_key);
	ini_write_real("config","player3_double_tap_to_run",global.player3_double_tap_to_run);
	ini_write_real("config","player3_sprint_toggle",global.player3_sprint_toggle);
	ini_write_real("config","player3_cancel_dive_by_pressing_jump_or_dive_button",global.player3_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config","player3_cancel_dive_by_pressing_opposite_direction",global.player3_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config","player3_wall_jump_setting",global.player3_wall_jump_setting);
	ini_write_real("config","player3_drop_from_rope",global.player3_drop_from_rope);
	ini_write_real("config","player3_show_controls",global.player3_show_controls);
	#endregion /*Save Player 3 Keyboard Remapping END*/
	
	#region /*Save Player 4 Keyboard Remapping*/
	ini_write_real("config","character_for_player_4",global.character_for_player_4);
	ini_write_real("config","color_for_player_4",global.color_for_player_4);
	ini_write_string("config","player4_name",global.player4_name);
	ini_write_real("config","player4_key_dive",global.player4_key_dive);
	ini_write_real("config","player4_key_jump",global.player4_key_jump);
	ini_write_real("config","player4_key_crouch",global.player4_key_crouch);
	ini_write_real("config","player4_key_crouch_toggle",global.player4_key_crouch_toggle);
	ini_write_real("config","player4_key_sprint",global.player4_key_sprint);
	ini_write_real("config","player4_key_sprint_toggle",global.player4_key_sprint_toggle);
	ini_write_real("config","player4_key_left",global.player4_key_left);
	ini_write_real("config","player4_key_right",global.player4_key_right);
	ini_write_real("config","player4_key_down",global.player4_key_down);
	ini_write_real("config","player4_key_up",global.player4_key_up);
	ini_write_real("config","player4_key_tongue",global.player4_key_tongue);
	ini_write_real("config","player4_key2_dive",global.player4_key2_dive);
	ini_write_real("config","player4_key2_jump",global.player4_key2_jump);
	ini_write_real("config","player4_key2_crouch",global.player4_key2_crouch);
	ini_write_real("config","player4_key2_crouch_toggle",global.player4_key2_crouch_toggle);
	ini_write_real("config","player4_key2_sprint",global.player4_key2_sprint);
	ini_write_real("config","player4_key2_sprint_toggle",global.player4_key2_sprint_toggle);
	ini_write_real("config","player4_key2_left",global.player4_key2_left);
	ini_write_real("config","player4_key2_right",global.player4_key2_right);
	ini_write_real("config","player4_key2_down",global.player4_key2_down);
	ini_write_real("config","player4_key2_up",global.player4_key2_up);
	ini_write_real("config","player4_key2_tongue",global.player4_key2_tongue);
	ini_write_real("config","player4_up_key_is_jump_key",global.player4_up_key_is_jump_key);
	ini_write_real("config","player4_double_tap_to_run",global.player4_double_tap_to_run);
	ini_write_real("config","player4_sprint_toggle",global.player4_sprint_toggle);
	ini_write_real("config","player4_cancel_dive_by_pressing_jump_or_dive_button",global.player4_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("config","player4_cancel_dive_by_pressing_opposite_direction",global.player4_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("config","player4_wall_jump_setting",global.player4_wall_jump_setting);
	ini_write_real("config","player4_drop_from_rope",global.player4_drop_from_rope);
	ini_write_real("config","player4_show_controls",global.player4_show_controls);
	#endregion /*Save Player 4 Keyboard Remapping END*/
	
	ini_close();
	
}