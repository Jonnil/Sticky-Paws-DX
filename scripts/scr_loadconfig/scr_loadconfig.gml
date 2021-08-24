///scr_loadconfig()
function scr_loadconfig()
{
	if (file_exists("Config.ini"))
	{
		ini_open("Config.ini");
		
		if (ini_key_exists("Config","difficulty")){global.difficulty=ini_read_real("Config","difficulty",0);}
		if (ini_key_exists("Config","automatically_pause_when_window_is_unfocused")){global.automatically_pause_when_window_is_unfocused=ini_read_real("Config","automatically_pause_when_window_is_unfocused",0);}
		if (ini_key_exists("Config","show_timer")){global.show_timer=ini_read_real("Config","show_timer",0);}
		if (ini_key_exists("Config","activate_cheats")){global.activate_cheats=ini_read_real("Config","activate_cheats",0);}
		if (ini_key_exists("Config","enable_enemies")){global.enable_enemies=ini_read_real("Config","enable_enemies",0);}
		if (ini_key_exists("Config","enable_spikes")){global.enable_spikes=ini_read_real("Config","enable_spikes",0);}
		if (ini_key_exists("Config","narrator")){global.narrator=ini_read_real("Config","narrator",0);}
		if (ini_key_exists("Config","show_tutorial_signs")){global.show_tutorial_signs=ini_read_real("Config","show_tutorial_signs",0);}
		if (ini_key_exists("Config","hud_hide_time")){global.hud_hide_time=ini_read_real("Config","hud_hide_time",0);}
		if (ini_key_exists("Config","players_can_collide")){global.players_can_collide=ini_read_real("Config","players_can_collide",0);}
		
		#region /*Assist Settings*/
		if (ini_key_exists("Config","assist_enable")){global.assist_enable=ini_read_real("Config","assist_enable",0);}
		if (ini_key_exists("Config","assist_item_appear")){global.assist_item_appear=ini_read_real("Config","assist_item_appear",0);}
		if (ini_key_exists("Config","assist_extra_hp")){global.assist_extra_hp=ini_read_real("Config","assist_extra_hp",0);}
		if (ini_key_exists("Config","assist_invincible")){global.assist_invincible=ini_read_real("Config","assist_invincible",0);}
		if (ini_key_exists("Config","assist_guiding_arrows")){global.assist_guiding_arrows=ini_read_real("Config","assist_guiding_arrows",0);}
		if (ini_key_exists("Config","assist_normal_arrows")){global.assist_normal_arrows=ini_read_real("Config","assist_normal_arrows",0);}
		#endregion /*Assist Settings END*/
		
		if (ini_key_exists("Config","fullscreen_mode")){window_set_fullscreen(ini_read_real("Config","fullscreen_mode",0));}
		if (ini_key_exists("Config","interpolate")){global.interpolate=ini_read_real("Config","interpolate",0);}
		if (ini_key_exists("Config","show_fps")){global.show_fps=ini_read_real("Config","show_fps",0);}
		if (ini_key_exists("Config","show_fps_real")){global.show_fps_real=ini_read_real("Config","show_fps_real",0);}
		if (ini_key_exists("Config","show_instance_count")){global.show_instance_count=ini_read_real("Config","show_instance_count",0);}
		if (ini_key_exists("Config","show_collision_mask")){global.show_collision_mask=ini_read_real("Config","show_collision_mask",0);}
		if (ini_key_exists("Config","music_volume")){global.music_volume=ini_read_real("Config","music_volume",0);}
		if (ini_key_exists("Config","sfx_volume")){global.sfx_volume=ini_read_real("Config","sfx_volume",0);}
		if (ini_key_exists("Config","voices_volume")){global.voices_volume=ini_read_real("Config","voices_volume",0);}
		if (ini_key_exists("Config","background_brightness_gameplay")){global.background_brightness_gameplay=ini_read_real("Config","background_brightness_gameplay",0);}
		if (ini_key_exists("Config","background_brightness_menu")){global.background_brightness_menu=ini_read_real("Config","background_brightness_menu",0);}
		if (ini_key_exists("Config","enable_background_layer1")){global.enable_background_layer1=ini_read_real("Config","enable_background_layer1",0);}
		if (ini_key_exists("Config","enable_background_layer2")){global.enable_background_layer2=ini_read_real("Config","enable_background_layer2",0);}
		if (ini_key_exists("Config","enable_background_layer3")){global.enable_background_layer3=ini_read_real("Config","enable_background_layer3",0);}
		if (ini_key_exists("Config","enable_background_layer4")){global.enable_background_layer4=ini_read_real("Config","enable_background_layer4",0);}
		if (ini_key_exists("Config","enable_foreground_layer1")){global.enable_foreground_layer1=ini_read_real("Config","enable_foreground_layer1",0);}
		if (ini_key_exists("Config","enable_foreground_layer2")){global.enable_foreground_layer2=ini_read_real("Config","enable_foreground_layer2",0);}
		if (ini_key_exists("Config","enable_transitions")){global.enable_transitions=ini_read_real("Config","enable_transitions",0);}
		if (ini_key_exists("Config","selected_resourcepack")){global.selected_resourcepack=ini_read_real("Config","selected_resourcepack",0);}
		
		#region /*Load Player 1 Keyboard Remapping*/
		if (ini_key_exists("Config","character_for_player_1")){global.character_for_player_1=ini_read_real("Config","character_for_player_1",0);}
		if (ini_key_exists("Config","color_for_player_1")){global.color_for_player_1=ini_read_real("Config","color_for_player_1",0);}
		if (ini_key_exists("Config","player1_name")){global.player1_name=ini_read_string("Config","player1_name",0);}
		if (ini_key_exists("Config","player1_key_dive")){global.player1_key_dive=ini_read_real("Config","player1_key_dive",0);}
		if (ini_key_exists("Config","player1_key_jump")){global.player1_key_jump=ini_read_real("Config","player1_key_jump",0);}
		if (ini_key_exists("Config","player1_key_crouch")){global.player1_key_crouch=ini_read_real("Config","player1_key_crouch",0);}
		if (ini_key_exists("Config","player1_key_crouch_toggle")){global.player1_key_crouch_toggle=ini_read_real("Config","player1_key_crouch_toggle",0);}
		if (ini_key_exists("Config","player1_key_sprint")){global.player1_key_sprint=ini_read_real("Config","player1_key_sprint",0);}
		if (ini_key_exists("Config","player1_key_sprint_toggle")){global.player1_key_sprint_toggle=ini_read_real("Config","player1_key_sprint_toggle",0);}
		if (ini_key_exists("Config","player1_key_left")){global.player1_key_left=ini_read_real("Config","player1_key_left",0);}
		if (ini_key_exists("Config","player1_key_right")){global.player1_key_right=ini_read_real("Config","player1_key_right",0);}
		if (ini_key_exists("Config","player1_key_down")){global.player1_key_down=ini_read_real("Config","player1_key_down",0);}
		if (ini_key_exists("Config","player1_key_up")){global.player1_key_up=ini_read_real("Config","player1_key_up",0);}
		if (ini_key_exists("Config","player1_key_tongue")){global.player1_key_tongue=ini_read_real("Config","player1_key_tongue",0);}
		if (ini_key_exists("Config","player1_key2_dive")){global.player1_key2_dive=ini_read_real("Config","player1_key2_dive",0);}
		if (ini_key_exists("Config","player1_key2_jump")){global.player1_key2_jump=ini_read_real("Config","player1_key2_jump",0);}
		if (ini_key_exists("Config","player1_key2_crouch")){global.player1_key2_crouch=ini_read_real("Config","player1_key2_crouch",0);}
		if (ini_key_exists("Config","player1_key2_crouch_toggle")){global.player1_key2_crouch_toggle=ini_read_real("Config","player1_key2_crouch_toggle",0);}
		if (ini_key_exists("Config","player1_key2_sprint")){global.player1_key2_sprint=ini_read_real("Config","player1_key2_sprint",0);}
		if (ini_key_exists("Config","player1_key2_sprint_toggle")){global.player1_key2_sprint_toggle=ini_read_real("Config","player1_key2_sprint_toggle",0);}
		if (ini_key_exists("Config","player1_key2_left")){global.player1_key2_left=ini_read_real("Config","player1_key2_left",0);}
		if (ini_key_exists("Config","player1_key2_right")){global.player1_key2_right=ini_read_real("Config","player1_key2_right",0);}
		if (ini_key_exists("Config","player1_key2_down")){global.player1_key2_down=ini_read_real("Config","player1_key2_down",0);}
		if (ini_key_exists("Config","player1_key2_up")){global.player1_key2_up=ini_read_real("Config","player1_key2_up",0);}
		if (ini_key_exists("Config","player1_key2_tongue")){global.player1_key2_tongue=ini_read_real("Config","player1_key2_tongue",0);}
		if (ini_key_exists("Config","player1_up_key_is_jump_key")){global.player1_up_key_is_jump_key=ini_read_real("Config","player1_up_key_is_jump_key",0);}
		if (ini_key_exists("Config","player1_double_tap_to_run")){global.player1_double_tap_to_run=ini_read_real("Config","player1_double_tap_to_run",0);}
		if (ini_key_exists("Config","player1_sprint_toggle")){global.player1_sprint_toggle=ini_read_real("Config","player1_sprint_toggle",0);}
		if (ini_key_exists("Config","player1_cancel_dive_by_pressing_jump_or_dive_button")){global.player1_cancel_dive_by_pressing_jump_or_dive_button=ini_read_real("Config","player1_cancel_dive_by_pressing_jump_or_dive_button",0);}
		if (ini_key_exists("Config","player1_cancel_dive_by_pressing_opposite_direction")){global.player1_cancel_dive_by_pressing_opposite_direction=ini_read_real("Config","player1_cancel_dive_by_pressing_opposite_direction",0);}
		if (ini_key_exists("Config","player1_wall_jump_setting")){global.player1_wall_jump_setting=ini_read_real("Config","player1_wall_jump_setting",0);}
		if (ini_key_exists("Config","player1_drop_from_rope")){global.player1_drop_from_rope=ini_read_real("Config","player1_drop_from_rope",0);}
		if (ini_key_exists("Config","player1_show_controls")){global.player1_show_controls=ini_read_real("Config","player1_show_controls",0);}//Load Player 1 Keyboard Remapping End
		#endregion /*Load Player 1 Keyboard Remapping END*/
		
		#region /*Load Player 2 Keyboard Remapping*/
		if (ini_key_exists("Config","character_for_player_2")){global.character_for_player_2=ini_read_real("Config","character_for_player_2",0);}
		if (ini_key_exists("Config","color_for_player_2")){global.color_for_player_2=ini_read_real("Config","color_for_player_2",0);}
		if (ini_key_exists("Config","player2_name")){global.player2_name=ini_read_string("Config","player2_name",0);}
		if (ini_key_exists("Config","player2_key_dive")){global.player2_key_dive=ini_read_real("Config","player2_key_dive",0);}
		if (ini_key_exists("Config","player2_key_jump")){global.player2_key_jump=ini_read_real("Config","player2_key_jump",0);}
		if (ini_key_exists("Config","player2_key_crouch")){global.player2_key_crouch=ini_read_real("Config","player2_key_crouch",0);}
		if (ini_key_exists("Config","player2_key_crouch_toggle")){global.player2_key_crouch_toggle=ini_read_real("Config","player2_key_crouch_toggle",0);}
		if (ini_key_exists("Config","player2_key_sprint")){global.player2_key_sprint=ini_read_real("Config","player2_key_sprint",0);}
		if (ini_key_exists("Config","player2_key_sprint_toggle")){global.player2_key_sprint_toggle=ini_read_real("Config","player2_key_sprint_toggle",0);}
		if (ini_key_exists("Config","player2_key_left")){global.player2_key_left=ini_read_real("Config","player2_key_left",0);}
		if (ini_key_exists("Config","player2_key_right")){global.player2_key_right=ini_read_real("Config","player2_key_right",0);}
		if (ini_key_exists("Config","player2_key_down")){global.player2_key_down=ini_read_real("Config","player2_key_down",0);}
		if (ini_key_exists("Config","player2_key_up")){global.player2_key_up=ini_read_real("Config","player2_key_up",0);}
		if (ini_key_exists("Config","player2_key_tongue")){global.player2_key_tongue=ini_read_real("Config","player2_key_tongue",0);}
		if (ini_key_exists("Config","player2_key2_dive")){global.player2_key2_dive=ini_read_real("Config","player2_key2_dive",0);}
		if (ini_key_exists("Config","player2_key2_jump")){global.player2_key2_jump=ini_read_real("Config","player2_key2_jump",0);}
		if (ini_key_exists("Config","player2_key2_crouch")){global.player2_key2_crouch=ini_read_real("Config","player2_key2_crouch",0);}
		if (ini_key_exists("Config","player2_key2_crouch_toggle")){global.player2_key2_crouch_toggle=ini_read_real("Config","player2_key2_crouch_toggle",0);}
		if (ini_key_exists("Config","player2_key2_sprint")){global.player2_key2_sprint=ini_read_real("Config","player2_key2_sprint",0);}
		if (ini_key_exists("Config","player2_key2_sprint_toggle")){global.player2_key2_sprint_toggle=ini_read_real("Config","player2_key2_sprint_toggle",0);}
		if (ini_key_exists("Config","player2_key2_left")){global.player2_key2_left=ini_read_real("Config","player2_key2_left",0);}
		if (ini_key_exists("Config","player2_key2_right")){global.player2_key2_right=ini_read_real("Config","player2_key2_right",0);}
		if (ini_key_exists("Config","player2_key2_down")){global.player2_key2_down=ini_read_real("Config","player2_key2_down",0);}
		if (ini_key_exists("Config","player2_key2_up")){global.player2_key2_up=ini_read_real("Config","player2_key2_up",0);}
		if (ini_key_exists("Config","player2_key2_tongue")){global.player2_key2_tongue=ini_read_real("Config","player2_key2_tongue",0);}
		if (ini_key_exists("Config","player2_up_key_is_jump_key")){global.player2_up_key_is_jump_key=ini_read_real("Config","player2_up_key_is_jump_key",0);}
		if (ini_key_exists("Config","player2_double_tap_to_run")){global.player2_double_tap_to_run=ini_read_real("Config","player2_double_tap_to_run",0);}
		if (ini_key_exists("Config","player2_sprint_toggle")){global.player2_sprint_toggle=ini_read_real("Config","player2_sprint_toggle",0);}
		if (ini_key_exists("Config","player2_cancel_dive_by_pressing_jump_or_dive_button")){global.player2_cancel_dive_by_pressing_jump_or_dive_button=ini_read_real("Config","player2_cancel_dive_by_pressing_jump_or_dive_button",0);}
		if (ini_key_exists("Config","player2_cancel_dive_by_pressing_opposite_direction")){global.player2_cancel_dive_by_pressing_opposite_direction=ini_read_real("Config","player2_cancel_dive_by_pressing_opposite_direction",0);}
		if (ini_key_exists("Config","player2_wall_jump_setting")){global.player2_wall_jump_setting=ini_read_real("Config","player2_wall_jump_setting",0);}
		if (ini_key_exists("Config","player2_drop_from_rope")){global.player2_drop_from_rope=ini_read_real("Config","player2_drop_from_rope",0);}
		if (ini_key_exists("Config","player2_show_controls")){global.player2_show_controls=ini_read_real("Config","player2_show_controls",0);}//Load Player 2 Keyboard Remapping End
		#endregion /*Load Player 2 Keyboard Remapping END*/
		
		#region /*Load Player 3 Keyboard Remapping*/
		if (ini_key_exists("Config","character_for_player_3")){global.character_for_player_3=ini_read_real("Config","character_for_player_3",0);}
		if (ini_key_exists("Config","color_for_player_3")){global.color_for_player_3=ini_read_real("Config","color_for_player_3",0);}
		if (ini_key_exists("Config","player3_name")){global.player3_name=ini_read_string("Config","player3_name",0);}
		if (ini_key_exists("Config","player3_key_dive")){global.player3_key_dive=ini_read_real("Config","player3_key_dive",0);}
		if (ini_key_exists("Config","player3_key_jump")){global.player3_key_jump=ini_read_real("Config","player3_key_jump",0);}
		if (ini_key_exists("Config","player3_key_crouch")){global.player3_key_crouch=ini_read_real("Config","player3_key_crouch",0);}
		if (ini_key_exists("Config","player3_key_crouch_toggle")){global.player3_key_crouch_toggle=ini_read_real("Config","player3_key_crouch_toggle",0);}
		if (ini_key_exists("Config","player3_key_sprint")){global.player3_key_sprint=ini_read_real("Config","player3_key_sprint",0);}
		if (ini_key_exists("Config","player3_key_sprint_toggle")){global.player3_key_sprint_toggle=ini_read_real("Config","player3_key_sprint_toggle",0);}
		if (ini_key_exists("Config","player3_key_left")){global.player3_key_left=ini_read_real("Config","player3_key_left",0);}
		if (ini_key_exists("Config","player3_key_right")){global.player3_key_right=ini_read_real("Config","player3_key_right",0);}
		if (ini_key_exists("Config","player3_key_down")){global.player3_key_down=ini_read_real("Config","player3_key_down",0);}
		if (ini_key_exists("Config","player3_key_up")){global.player3_key_up=ini_read_real("Config","player3_key_up",0);}
		if (ini_key_exists("Config","player3_key_tongue")){global.player3_key_tongue=ini_read_real("Config","player3_key_tongue",0);}
		if (ini_key_exists("Config","player3_key2_dive")){global.player3_key2_dive=ini_read_real("Config","player3_key2_dive",0);}
		if (ini_key_exists("Config","player3_key2_jump")){global.player3_key2_jump=ini_read_real("Config","player3_key2_jump",0);}
		if (ini_key_exists("Config","player3_key2_crouch")){global.player3_key2_crouch=ini_read_real("Config","player3_key2_crouch",0);}
		if (ini_key_exists("Config","player3_key2_crouch_toggle")){global.player3_key2_crouch_toggle=ini_read_real("Config","player3_key2_crouch_toggle",0);}
		if (ini_key_exists("Config","player3_key2_sprint")){global.player3_key2_sprint=ini_read_real("Config","player3_key2_sprint",0);}
		if (ini_key_exists("Config","player3_key2_sprint_toggle")){global.player3_key2_sprint_toggle=ini_read_real("Config","player3_key2_sprint_toggle",0);}
		if (ini_key_exists("Config","player3_key2_left")){global.player3_key2_left=ini_read_real("Config","player3_key2_left",0);}
		if (ini_key_exists("Config","player3_key2_right")){global.player3_key2_right=ini_read_real("Config","player3_key2_right",0);}
		if (ini_key_exists("Config","player3_key2_down")){global.player3_key2_down=ini_read_real("Config","player3_key2_down",0);}
		if (ini_key_exists("Config","player3_key2_up")){global.player3_key2_up=ini_read_real("Config","player3_key2_up",0);}
		if (ini_key_exists("Config","player3_key2_tongue")){global.player3_key2_tongue=ini_read_real("Config","player3_key2_tongue",0);}
		if (ini_key_exists("Config","player3_up_key_is_jump_key")){global.player3_up_key_is_jump_key=ini_read_real("Config","player3_up_key_is_jump_key",0);}
		if (ini_key_exists("Config","player3_double_tap_to_run")){global.player3_double_tap_to_run=ini_read_real("Config","player3_double_tap_to_run",0);}
		if (ini_key_exists("Config","player3_sprint_toggle")){global.player3_sprint_toggle=ini_read_real("Config","player3_sprint_toggle",0);}
		if (ini_key_exists("Config","player3_cancel_dive_by_pressing_jump_or_dive_button")){global.player3_cancel_dive_by_pressing_jump_or_dive_button=ini_read_real("Config","player3_cancel_dive_by_pressing_jump_or_dive_button",0);}
		if (ini_key_exists("Config","player3_cancel_dive_by_pressing_opposite_direction")){global.player3_cancel_dive_by_pressing_opposite_direction=ini_read_real("Config","player3_cancel_dive_by_pressing_opposite_direction",0);}
		if (ini_key_exists("Config","player3_wall_jump_setting")){global.player3_wall_jump_setting=ini_read_real("Config","player3_wall_jump_setting",0);}
		if (ini_key_exists("Config","player3_drop_from_rope")){global.player3_drop_from_rope=ini_read_real("Config","player3_drop_from_rope",0);}
		if (ini_key_exists("Config","player3_show_controls")){global.player3_show_controls=ini_read_real("Config","player3_show_controls",0);}//Load Player 3 Keyboard Remapping End
		#endregion /*Load Player 3 Keyboard Remapping END*/
		
		#region /*Load Player 4 Keyboard Remapping*/
		if (ini_key_exists("Config","character_for_player_4")){global.character_for_player_4=ini_read_real("Config","character_for_player_4",0);}
		if (ini_key_exists("Config","color_for_player_4")){global.color_for_player_4=ini_read_real("Config","color_for_player_4",0);}
		if (ini_key_exists("Config","player4_name")){global.player4_name=ini_read_string("Config","player4_name",0);}
		if (ini_key_exists("Config","player4_key_dive")){global.player4_key_dive=ini_read_real("Config","player4_key_dive",0);}
		if (ini_key_exists("Config","player4_key_jump")){global.player4_key_jump=ini_read_real("Config","player4_key_jump",0);}
		if (ini_key_exists("Config","player4_key_crouch")){global.player4_key_crouch=ini_read_real("Config","player4_key_crouch",0);}
		if (ini_key_exists("Config","player4_key_crouch_toggle")){global.player4_key_crouch_toggle=ini_read_real("Config","player4_key_crouch_toggle",0);}
		if (ini_key_exists("Config","player4_key_sprint")){global.player4_key_sprint=ini_read_real("Config","player4_key_sprint",0);}
		if (ini_key_exists("Config","player4_key_sprint_toggle")){global.player4_key_sprint_toggle=ini_read_real("Config","player4_key_sprint_toggle",0);}
		if (ini_key_exists("Config","player4_key_left")){global.player4_key_left=ini_read_real("Config","player4_key_left",0);}
		if (ini_key_exists("Config","player4_key_right")){global.player4_key_right=ini_read_real("Config","player4_key_right",0);}
		if (ini_key_exists("Config","player4_key_down")){global.player4_key_down=ini_read_real("Config","player4_key_down",0);}
		if (ini_key_exists("Config","player4_key_up")){global.player4_key_up=ini_read_real("Config","player4_key_up",0);}
		if (ini_key_exists("Config","player4_key_tongue")){global.player4_key_tongue=ini_read_real("Config","player4_key_tongue",0);}
		if (ini_key_exists("Config","player4_key2_dive")){global.player4_key2_dive=ini_read_real("Config","player4_key2_dive",0);}
		if (ini_key_exists("Config","player4_key2_jump")){global.player4_key2_jump=ini_read_real("Config","player4_key2_jump",0);}
		if (ini_key_exists("Config","player4_key2_crouch")){global.player4_key2_crouch=ini_read_real("Config","player4_key2_crouch",0);}
		if (ini_key_exists("Config","player4_key2_crouch_toggle")){global.player4_key2_crouch_toggle=ini_read_real("Config","player4_key2_crouch_toggle",0);}
		if (ini_key_exists("Config","player4_key2_sprint")){global.player4_key2_sprint=ini_read_real("Config","player4_key2_sprint",0);}
		if (ini_key_exists("Config","player4_key2_sprint_toggle")){global.player4_key2_sprint_toggle=ini_read_real("Config","player4_key2_sprint_toggle",0);}
		if (ini_key_exists("Config","player4_key2_left")){global.player4_key2_left=ini_read_real("Config","player4_key2_left",0);}
		if (ini_key_exists("Config","player4_key2_right")){global.player4_key2_right=ini_read_real("Config","player4_key2_right",0);}
		if (ini_key_exists("Config","player4_key2_down")){global.player4_key2_down=ini_read_real("Config","player4_key2_down",0);}
		if (ini_key_exists("Config","player4_key2_up")){global.player4_key2_up=ini_read_real("Config","player4_key2_up",0);}
		if (ini_key_exists("Config","player4_key2_tongue")){global.player4_key2_tongue=ini_read_real("Config","player4_key2_tongue",0);}
		if (ini_key_exists("Config","player4_up_key_is_jump_key")){global.player4_up_key_is_jump_key=ini_read_real("Config","player4_up_key_is_jump_key",0);}
		if (ini_key_exists("Config","player4_double_tap_to_run")){global.player4_double_tap_to_run=ini_read_real("Config","player4_double_tap_to_run",0);}
		if (ini_key_exists("Config","player4_sprint_toggle")){global.player4_sprint_toggle=ini_read_real("Config","player4_sprint_toggle",0);}
		if (ini_key_exists("Config","player4_cancel_dive_by_pressing_jump_or_dive_button")){global.player4_cancel_dive_by_pressing_jump_or_dive_button=ini_read_real("Config","player4_cancel_dive_by_pressing_jump_or_dive_button",0);}
		if (ini_key_exists("Config","player4_cancel_dive_by_pressing_opposite_direction")){global.player4_cancel_dive_by_pressing_opposite_direction=ini_read_real("Config","player4_cancel_dive_by_pressing_opposite_direction",0);}
		if (ini_key_exists("Config","player4_wall_jump_setting")){global.player4_wall_jump_setting=ini_read_real("Config","player4_wall_jump_setting",0);}
		if (ini_key_exists("Config","player4_drop_from_rope")){global.player4_drop_from_rope=ini_read_real("Config","player4_drop_from_rope",0);}
		if (ini_key_exists("Config","player4_show_controls")){global.player4_show_controls=ini_read_real("Config","player4_show_controls",0);}//Load Player 4 Keyboard Remapping End
		#endregion /*Load Player 4 Keyboard Remapping END*/
		
		ini_close();
	}
	else
	{
		//Do Nothing
	}
}