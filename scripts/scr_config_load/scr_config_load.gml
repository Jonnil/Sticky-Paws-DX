function scr_config_load()
{
	if (file_exists(working_directory + "config.ini")) /* Check if config.ini exists before loading any settings */
	{
		ini_open(working_directory + "config.ini");
		if (ini_key_exists("config", "always_show_level_editor_buttons")){global.always_show_level_editor_buttons = ini_read_real("config", "always_show_level_editor_buttons", true);}
		if (ini_key_exists("config", "current_file")){global.file = ini_read_real("config", "current_file", 0);}
		if (ini_key_exists("config", "difficulty")){global.difficulty = ini_read_real("config", "difficulty", 0);}
		if (ini_key_exists("config", "automatically_pause_when_window_is_unfocused")){global.automatically_pause_when_window_is_unfocused = ini_read_real("config", "automatically_pause_when_window_is_unfocused", 0);}
		if (ini_key_exists("config", "enable_attract_demo")){global.enable_attract_demo = ini_read_real("config", "enable_attract_demo", 1);}
		if (ini_key_exists("config", "enable_links")){global.enable_links = ini_read_real("config", "enable_links", 1);}
		if (ini_key_exists("config", "show_timer")){global.show_timer = ini_read_real("config", "show_timer", 0);}
		if (ini_key_exists("config", "show_deaths_counter")){global.show_deaths_counter = ini_read_real("config", "show_deaths_counter", 0);}
		if (ini_key_exists("config", "show_ranks")){global.show_ranks = ini_read_real("config", "show_ranks", 0);}
		if (ini_key_exists("config", "assist_enable")){global.assist_enable = ini_read_real("config", "assist_enable", 0);}
		if (ini_key_exists("config", "assist_enable_enemies")){global.assist_enable_enemies = ini_read_real("config", "assist_enable_enemies", 0);}
		if (ini_key_exists("config", "assist_enable_spikes")){global.assist_enable_spikes = ini_read_real("config", "assist_enable_spikes", 0);}
		if (ini_key_exists("config", "narrator")){global.narrator = ini_read_real("config", "narrator", 0);}
		if (ini_key_exists("config", "show_tutorial_signs")){global.show_tutorial_signs = ini_read_real("config", "show_tutorial_signs", 0);}
		if (ini_key_exists("config", "hud_hide_time")){global.hud_hide_time = ini_read_real("config", "hud_hide_time", 0);}
		if (ini_key_exists("config", "players_can_collide")){global.players_can_collide = ini_read_real("config", "players_can_collide", 0);}
		
		#region /* Assist Settings */
		if (ini_key_exists("config", "assist_enable")){global.assist_enable = ini_read_real("config", "assist_enable", 0);}
		if (ini_key_exists("config", "assist_item_appear")){global.assist_item_appear = ini_read_real("config", "assist_item_appear", 0);}
		if (ini_key_exists("config", "assist_extra_hp")){global.assist_extra_hp = ini_read_real("config", "assist_extra_hp", 0);}
		if (ini_key_exists("config", "assist_invincible")){global.assist_invincible = ini_read_real("config", "assist_invincible", 0);}
		if (ini_key_exists("config", "assist_breathe_underwater")){global.assist_breathe_underwater = ini_read_real("config", "assist_breathe_underwater", 0);}
		if (ini_key_exists("config", "assist_guiding_arrows")){global.assist_guiding_arrows = ini_read_real("config", "assist_guiding_arrows", 0);}
		if (ini_key_exists("config", "assist_normal_arrows")){global.assist_normal_arrows = ini_read_real("config", "assist_normal_arrows", 0);}
		if (ini_key_exists("config", "assist_show_assist_mode_text")){global.assist_show_assist_mode_text = ini_read_real("config", "assist_show_assist_mode_text", 0);}
		#endregion /* Assist Settings END */
		
		if (ini_key_exists("config", "fullscreen_mode")){window_set_fullscreen(ini_read_real("config", "fullscreen_mode", 0));}
		if (ini_key_exists("config", "interpolate")){global.interpolate = ini_read_real("config", "interpolate", 0);}
		if (ini_key_exists("config", "show_fps")){global.show_fps = ini_read_real("config", "show_fps", 0);}
		if (ini_key_exists("config", "show_fps_real")){global.show_fps_real = ini_read_real("config", "show_fps_real", 0);}
		if (ini_key_exists("config", "show_instance_count")){global.show_instance_count = ini_read_real("config", "show_instance_count", 0);}
		if (ini_key_exists("config", "show_collision_mask")){global.show_collision_mask = ini_read_real("config", "show_collision_mask", 0);}
		if (ini_key_exists("config", "volume_main")){global.volume_main = ini_read_real("config", "volume_main", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_music")){global.volume_music = ini_read_real("config", "volume_music", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_sound")){global.volume_sound = ini_read_real("config", "volume_sound", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_ambient")){global.volume_ambient = ini_read_real("config", "volume_ambient", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_footstep")){global.volume_footstep = ini_read_real("config", "volume_footstep", 7000) * 0.0001;}
		if (ini_key_exists("config", "voices_volume")){global.volume_voice = ini_read_real("config", "voices_volume", 7000) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_gameplay")){global.background_brightness_gameplay = ini_read_real("config", "background_brightness_gameplay", 0) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_menu")){global.background_brightness_menu = ini_read_real("config", "background_brightness_menu", 0) * 0.0001;}
		if (ini_key_exists("config", "enable_background_layer1")){global.enable_background_layer1 = ini_read_real("config", "enable_background_layer1", 0);}
		if (ini_key_exists("config", "enable_background_layer2")){global.enable_background_layer2 = ini_read_real("config", "enable_background_layer2", 0);}
		if (ini_key_exists("config", "enable_background_layer3")){global.enable_background_layer3 = ini_read_real("config", "enable_background_layer3", 0);}
		if (ini_key_exists("config", "enable_background_layer4")){global.enable_background_layer4 = ini_read_real("config", "enable_background_layer4", 0);}
		if (ini_key_exists("config", "enable_foreground_layer1")){global.enable_foreground_layer1 = ini_read_real("config", "enable_foreground_layer1", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_above_static_objects")){global.enable_foreground_layer_above_static_objects = ini_read_real("config", "enable_foreground_layer_above_static_objects", 0);}
		if (ini_key_exists("config", "enable_foreground_layer2")){global.enable_foreground_layer2 = ini_read_real("config", "enable_foreground_layer2", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_secret")){global.enable_foreground_layer_secret = ini_read_real("config", "enable_foreground_layer_secret", 0);}
		if (ini_key_exists("config", "enable_transitions")){global.enable_transitions = ini_read_real("config", "enable_transitions", 0);}
		if (ini_key_exists("config", "selected_resource_pack")){global.selected_resource_pack = ini_read_real("config", "selected_resource_pack", 0);}
		if (ini_key_exists("config", "selected_title_background")){global.selected_title_background = ini_read_real("config", "selected_title_background", 0);}
		if (ini_key_exists("config", "title_background_scale")){global.title_background_scale = ini_read_real("config", "title_background_scale", 1);}
		if (ini_key_exists("config", "background_layer_x_scroll")){global.background_layer_x_scroll = ini_read_real("config", "background_layer_x_scroll", 1);}
		if (ini_key_exists("config", "background_layer_y_scroll")){global.background_layer_y_scroll = ini_read_real("config", "background_layer_y_scroll", 1);}
		if (ini_key_exists("config", "selected_title_logo")){global.selected_title_logo = ini_read_real("config", "selected_title_logo", 0);}
		if (ini_key_exists("config", "zoom_level")){global.zoom_level = ini_read_real("config", "zoom_level", 1);}
		if (ini_key_exists("config", "zoom_world_map")){global.zoom_world_map = ini_read_real("config", "zoom_world_map", 1);}
		if (ini_key_exists("config", "reset_level_zoom_when_going_back_to_map")){global.reset_level_zoom_when_going_back_to_map = ini_read_real("config", "reset_level_zoom_when_going_back_to_map", 0);}
		if (ini_key_exists("config", "reset_world_map_zoom_when_going_back_to_map")){global.reset_world_map_zoom_when_going_back_to_map = ini_read_real("config", "reset_world_map_zoom_when_going_back_to_map", 0);}
		if (ini_key_exists("config", "language_localization")){global.language_localization = ini_read_real("config", "language_localization", 0);}
		if (ini_key_exists("config", "convention_mode")){global.convention_mode = ini_read_real("config", "convention_mode", 0);}
		if (ini_key_exists("config", "arcade_mode")){global.arcade_mode = ini_read_real("config", "arcade_mode", 0);}
		if (ini_key_exists("config", "chosen_controller_used")){global.chosen_controller_used = ini_read_real("config", "chosen_controller_used", 0);}
		if (ini_key_exists("config", "show_prompt_when_changing_to_gamepad")){global.show_prompt_when_changing_to_gamepad = ini_read_real("config", "show_prompt_when_changing_to_gamepad", 1);}
		if (ini_key_exists("config", "show_prompt_when_changing_to_keyboard_and_mouse")){global.show_prompt_when_changing_to_keyboard_and_mouse = ini_read_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", 1);}
		
		#region /* Load Player 1 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player_1")){global.character_index[0] = ini_read_real("config", "character_index_player_1", 0);}
		if (ini_key_exists("config", "skin_for_player_1")){global.skin_for_player_1 = ini_read_real("config", "skin_for_player_1", 0);}
		if (ini_key_exists("config", "player1_name")){global.player1_name = ini_read_string("config", "player1_name", 0);}
		if (ini_key_exists("config", "player1_key_dive")){global.player1_key_dive = ini_read_real("config", "player1_key_dive", 0);}
		if (ini_key_exists("config", "player1_key_jump")){global.player1_key_jump = ini_read_real("config", "player1_key_jump", 0);}
		if (ini_key_exists("config", "player1_key_crouch")){global.player1_key_crouch = ini_read_real("config", "player1_key_crouch", 0);}
		if (ini_key_exists("config", "player1_key_crouch_toggle")){global.player1_key_crouch_toggle = ini_read_real("config", "player1_key_crouch_toggle", 0);}
		if (ini_key_exists("config", "player1_key_sprint")){global.player1_key_sprint = ini_read_real("config", "player1_key_sprint", 0);}
		if (ini_key_exists("config", "player1_key_sprint_toggle")){global.player1_key_sprint_toggle = ini_read_real("config", "player1_key_sprint_toggle", 0);}
		if (ini_key_exists("config", "player1_key_left")){global.player1_key_left = ini_read_real("config", "player1_key_left", 0);}
		if (ini_key_exists("config", "player1_key_right")){global.player1_key_right = ini_read_real("config", "player1_key_right", 0);}
		if (ini_key_exists("config", "player1_key_down")){global.player1_key_down = ini_read_real("config", "player1_key_down", 0);}
		if (ini_key_exists("config", "player1_key_up")){global.player1_key_up = ini_read_real("config", "player1_key_up", 0);}
		if (ini_key_exists("config", "player1_key_tongue")){global.player1_key_tongue = ini_read_real("config", "player1_key_tongue", 0);}
		if (ini_key_exists("config", "player1_key_zoom_in")){global.player1_key_zoom_in = ini_read_real("config", "player1_key_zoom_in", 0);}
		if (ini_key_exists("config", "player1_key_zoom_out")){global.player1_key_zoom_out = ini_read_real("config", "player1_key_zoom_out", 0);}
		if (ini_key_exists("config", "player1_key2_dive")){global.player1_key2_dive = ini_read_real("config", "player1_key2_dive", 0);}
		if (ini_key_exists("config", "player1_key2_jump")){global.player1_key2_jump = ini_read_real("config", "player1_key2_jump", 0);}
		if (ini_key_exists("config", "player1_key2_crouch")){global.player1_key2_crouch = ini_read_real("config", "player1_key2_crouch", 0);}
		if (ini_key_exists("config", "player1_key2_crouch_toggle")){global.player1_key2_crouch_toggle = ini_read_real("config", "player1_key2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player1_key2_sprint")){global.player1_key2_sprint = ini_read_real("config", "player1_key2_sprint", 0);}
		if (ini_key_exists("config", "player1_key2_sprint_toggle")){global.player1_key2_sprint_toggle = ini_read_real("config", "player1_key2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player1_key2_left")){global.player1_key2_left = ini_read_real("config", "player1_key2_left", 0);}
		if (ini_key_exists("config", "player1_key2_right")){global.player1_key2_right = ini_read_real("config", "player1_key2_right", 0);}
		if (ini_key_exists("config", "player1_key2_down")){global.player1_key2_down = ini_read_real("config", "player1_key2_down", 0);}
		if (ini_key_exists("config", "player1_key2_up")){global.player1_key2_up = ini_read_real("config", "player1_key2_up", 0);}
		if (ini_key_exists("config", "player1_key2_tongue")){global.player1_key2_tongue = ini_read_real("config", "player1_key2_tongue", 0);}
		if (ini_key_exists("config", "player1_key2_zoom_in")){global.player1_key2_zoom_in = ini_read_real("config", "player1_key2_zoom_in", 0);}
		if (ini_key_exists("config", "player1_key2_zoom_out")){global.player1_key2_zoom_out = ini_read_real("config", "player1_key2_zoom_out", 0);}
		if (ini_key_exists("config", "player1_up_key_is_jump_key")){global.player1_up_key_is_jump_key = ini_read_real("config", "player1_up_key_is_jump_key", 0);}
		if (ini_key_exists("config", "player1_double_tap_to_run")){global.player1_double_tap_to_run = ini_read_real("config", "player1_double_tap_to_run", 0);}
		if (ini_key_exists("config", "player1_sprint_toggle")){global.player1_sprint_toggle = ini_read_real("config", "player1_sprint_toggle", 0);}
		if (ini_key_exists("config", "player1_cancel_dive_by_pressing_jump_or_dive_button")){global.player1_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("config", "player1_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("config", "player1_cancel_dive_by_pressing_opposite_direction")){global.player1_cancel_dive_by_pressing_opposite_direction = ini_read_real("config", "player1_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("config", "player1_down_and_jump_to_groundpound")){global.player1_down_and_jump_to_groundpound = ini_read_real("config", "player1_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("config", "player1_wall_jump_setting")){global.player1_wall_jump_setting = ini_read_real("config", "player1_wall_jump_setting", 0);}
		if (ini_key_exists("config", "player1_drop_from_rope")){global.player1_drop_from_rope = ini_read_real("config", "player1_drop_from_rope", 0);}
		if (ini_key_exists("config", "player1_show_controls")){global.player1_show_controls = ini_read_real("config", "player1_show_controls", 0);}//Load Player 1 Keyboard Remapping End
		#endregion /* Load Player 1 Keyboard Remapping END */
		
		#region /* Load Player 2 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player_2")){global.character_index[1] = ini_read_real("config", "character_index_player_2", 1);}
		if (ini_key_exists("config", "skin_for_player_2")){global.skin_for_player_2 = ini_read_real("config", "skin_for_player_2", 1);}
		if (ini_key_exists("config", "player2_name")){global.player2_name = ini_read_string("config", "player2_name", 0);}
		if (ini_key_exists("config", "player2_key_dive")){global.player2_key_dive = ini_read_real("config", "player2_key_dive", 0);}
		if (ini_key_exists("config", "player2_key_jump")){global.player2_key_jump = ini_read_real("config", "player2_key_jump", 0);}
		if (ini_key_exists("config", "player2_key_crouch")){global.player2_key_crouch = ini_read_real("config", "player2_key_crouch", 0);}
		if (ini_key_exists("config", "player2_key_crouch_toggle")){global.player2_key_crouch_toggle = ini_read_real("config", "player2_key_crouch_toggle", 0);}
		if (ini_key_exists("config", "player2_key_sprint")){global.player2_key_sprint = ini_read_real("config", "player2_key_sprint", 0);}
		if (ini_key_exists("config", "player2_key_sprint_toggle")){global.player2_key_sprint_toggle = ini_read_real("config", "player2_key_sprint_toggle", 0);}
		if (ini_key_exists("config", "player2_key_left")){global.player2_key_left = ini_read_real("config", "player2_key_left", 0);}
		if (ini_key_exists("config", "player2_key_right")){global.player2_key_right = ini_read_real("config", "player2_key_right", 0);}
		if (ini_key_exists("config", "player2_key_down")){global.player2_key_down = ini_read_real("config", "player2_key_down", 0);}
		if (ini_key_exists("config", "player2_key_up")){global.player2_key_up = ini_read_real("config", "player2_key_up", 0);}
		if (ini_key_exists("config", "player2_key_tongue")){global.player2_key_tongue = ini_read_real("config", "player2_key_tongue", 0);}
		if (ini_key_exists("config", "player2_key_zoom_in")){global.player2_key_zoom_in = ini_read_real("config", "player2_key_zoom_in", 0);}
		if (ini_key_exists("config", "player2_key_zoom_out")){global.player2_key_zoom_out = ini_read_real("config", "player2_key_zoom_out", 0);}
		if (ini_key_exists("config", "player2_key2_dive")){global.player2_key2_dive = ini_read_real("config", "player2_key2_dive", 0);}
		if (ini_key_exists("config", "player2_key2_jump")){global.player2_key2_jump = ini_read_real("config", "player2_key2_jump", 0);}
		if (ini_key_exists("config", "player2_key2_crouch")){global.player2_key2_crouch = ini_read_real("config", "player2_key2_crouch", 0);}
		if (ini_key_exists("config", "player2_key2_crouch_toggle")){global.player2_key2_crouch_toggle = ini_read_real("config", "player2_key2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player2_key2_sprint")){global.player2_key2_sprint = ini_read_real("config", "player2_key2_sprint", 0);}
		if (ini_key_exists("config", "player2_key2_sprint_toggle")){global.player2_key2_sprint_toggle = ini_read_real("config", "player2_key2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player2_key2_left")){global.player2_key2_left = ini_read_real("config", "player2_key2_left", 0);}
		if (ini_key_exists("config", "player2_key2_right")){global.player2_key2_right = ini_read_real("config", "player2_key2_right", 0);}
		if (ini_key_exists("config", "player2_key2_down")){global.player2_key2_down = ini_read_real("config", "player2_key2_down", 0);}
		if (ini_key_exists("config", "player2_key2_up")){global.player2_key2_up = ini_read_real("config", "player2_key2_up", 0);}
		if (ini_key_exists("config", "player2_key2_tongue")){global.player2_key2_tongue = ini_read_real("config", "player2_key2_tongue", 0);}
		if (ini_key_exists("config", "player2_key2_zoom_in")){global.player2_key2_zoom_in = ini_read_real("config", "player2_key2_zoom_in", 0);}
		if (ini_key_exists("config", "player2_key2_zoom_out")){global.player2_key2_zoom_out = ini_read_real("config", "player2_key2_zoom_out", 0);}
		if (ini_key_exists("config", "player2_up_key_is_jump_key")){global.player2_up_key_is_jump_key = ini_read_real("config", "player2_up_key_is_jump_key", 0);}
		if (ini_key_exists("config", "player2_double_tap_to_run")){global.player2_double_tap_to_run = ini_read_real("config", "player2_double_tap_to_run", 0);}
		if (ini_key_exists("config", "player2_sprint_toggle")){global.player2_sprint_toggle = ini_read_real("config", "player2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player2_cancel_dive_by_pressing_jump_or_dive_button")){global.player2_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("config", "player2_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("config", "player2_cancel_dive_by_pressing_opposite_direction")){global.player2_cancel_dive_by_pressing_opposite_direction = ini_read_real("config", "player2_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("config", "player2_down_and_jump_to_groundpound")){global.player2_down_and_jump_to_groundpound = ini_read_real("config", "player2_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("config", "player2_wall_jump_setting")){global.player2_wall_jump_setting = ini_read_real("config", "player2_wall_jump_setting", 0);}
		if (ini_key_exists("config", "player2_drop_from_rope")){global.player2_drop_from_rope = ini_read_real("config", "player2_drop_from_rope", 0);}
		if (ini_key_exists("config", "player2_show_controls")){global.player2_show_controls = ini_read_real("config", "player2_show_controls", 0);}//Load Player 2 Keyboard Remapping End
		#endregion /* Load Player 2 Keyboard Remapping END */
		
		#region /* Load Player 3 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player_3")){global.character_index[2] = ini_read_real("config", "character_index_player_3", 2);}
		if (ini_key_exists("config", "skin_for_player_3")){global.skin_for_player_3 = ini_read_real("config", "skin_for_player_3", 2);}
		if (ini_key_exists("config", "player3_name")){global.player3_name = ini_read_string("config", "player3_name", 0);}
		if (ini_key_exists("config", "player3_key_dive")){global.player3_key_dive = ini_read_real("config", "player3_key_dive", 0);}
		if (ini_key_exists("config", "player3_key_jump")){global.player3_key_jump = ini_read_real("config", "player3_key_jump", 0);}
		if (ini_key_exists("config", "player3_key_crouch")){global.player3_key_crouch = ini_read_real("config", "player3_key_crouch", 0);}
		if (ini_key_exists("config", "player3_key_crouch_toggle")){global.player3_key_crouch_toggle = ini_read_real("config", "player3_key_crouch_toggle", 0);}
		if (ini_key_exists("config", "player3_key_sprint")){global.player3_key_sprint = ini_read_real("config", "player3_key_sprint", 0);}
		if (ini_key_exists("config", "player3_key_sprint_toggle")){global.player3_key_sprint_toggle = ini_read_real("config", "player3_key_sprint_toggle", 0);}
		if (ini_key_exists("config", "player3_key_left")){global.player3_key_left = ini_read_real("config", "player3_key_left", 0);}
		if (ini_key_exists("config", "player3_key_right")){global.player3_key_right = ini_read_real("config", "player3_key_right", 0);}
		if (ini_key_exists("config", "player3_key_down")){global.player3_key_down = ini_read_real("config", "player3_key_down", 0);}
		if (ini_key_exists("config", "player3_key_up")){global.player3_key_up = ini_read_real("config", "player3_key_up", 0);}
		if (ini_key_exists("config", "player3_key_tongue")){global.player3_key_tongue = ini_read_real("config", "player3_key_tongue", 0);}
		if (ini_key_exists("config", "player3_key_zoom_in")){global.player3_key_zoom_in = ini_read_real("config", "player3_key_zoom_in", 0);}
		if (ini_key_exists("config", "player3_key_zoom_out")){global.player3_key_zoom_out = ini_read_real("config", "player3_key_zoom_out", 0);}
		if (ini_key_exists("config", "player3_key2_dive")){global.player3_key2_dive = ini_read_real("config", "player3_key2_dive", 0);}
		if (ini_key_exists("config", "player3_key2_jump")){global.player3_key2_jump = ini_read_real("config", "player3_key2_jump", 0);}
		if (ini_key_exists("config", "player3_key2_crouch")){global.player3_key2_crouch = ini_read_real("config", "player3_key2_crouch", 0);}
		if (ini_key_exists("config", "player3_key2_crouch_toggle")){global.player3_key2_crouch_toggle = ini_read_real("config", "player3_key2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player3_key2_sprint")){global.player3_key2_sprint = ini_read_real("config", "player3_key2_sprint", 0);}
		if (ini_key_exists("config", "player3_key2_sprint_toggle")){global.player3_key2_sprint_toggle = ini_read_real("config", "player3_key2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player3_key2_left")){global.player3_key2_left = ini_read_real("config", "player3_key2_left", 0);}
		if (ini_key_exists("config", "player3_key2_right")){global.player3_key2_right = ini_read_real("config", "player3_key2_right", 0);}
		if (ini_key_exists("config", "player3_key2_down")){global.player3_key2_down = ini_read_real("config", "player3_key2_down", 0);}
		if (ini_key_exists("config", "player3_key2_up")){global.player3_key2_up = ini_read_real("config", "player3_key2_up", 0);}
		if (ini_key_exists("config", "player3_key2_tongue")){global.player3_key2_tongue = ini_read_real("config", "player3_key2_tongue", 0);}
		if (ini_key_exists("config", "player3_key2_zoom_in")){global.player3_key2_zoom_in = ini_read_real("config", "player3_key2_zoom_in", 0);}
		if (ini_key_exists("config", "player3_key2_zoom_out")){global.player3_key2_zoom_out = ini_read_real("config", "player3_key2_zoom_out", 0);}
		if (ini_key_exists("config", "player3_up_key_is_jump_key")){global.player3_up_key_is_jump_key = ini_read_real("config", "player3_up_key_is_jump_key", 0);}
		if (ini_key_exists("config", "player3_double_tap_to_run")){global.player3_double_tap_to_run = ini_read_real("config", "player3_double_tap_to_run", 0);}
		if (ini_key_exists("config", "player3_sprint_toggle")){global.player3_sprint_toggle = ini_read_real("config", "player3_sprint_toggle", 0);}
		if (ini_key_exists("config", "player3_cancel_dive_by_pressing_jump_or_dive_button")){global.player3_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("config", "player3_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("config", "player3_cancel_dive_by_pressing_opposite_direction")){global.player3_cancel_dive_by_pressing_opposite_direction = ini_read_real("config", "player3_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("config", "player3_down_and_jump_to_groundpound")){global.player3_down_and_jump_to_groundpound = ini_read_real("config", "player3_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("config", "player3_wall_jump_setting")){global.player3_wall_jump_setting = ini_read_real("config", "player3_wall_jump_setting", 0);}
		if (ini_key_exists("config", "player3_drop_from_rope")){global.player3_drop_from_rope = ini_read_real("config", "player3_drop_from_rope", 0);}
		if (ini_key_exists("config", "player3_show_controls")){global.player3_show_controls = ini_read_real("config", "player3_show_controls", 0);}//Load Player 3 Keyboard Remapping End
		#endregion /* Load Player 3 Keyboard Remapping END */
		
		#region /* Load Player 4 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player_4")){global.character_index[3] = ini_read_real("config", "character_index_player_4", 3);}
		if (ini_key_exists("config", "skin_for_player_4")){global.skin_for_player_4 = ini_read_real("config", "skin_for_player_4", 3);}
		if (ini_key_exists("config", "player4_name")){global.player4_name = ini_read_string("config", "player4_name", 0);}
		if (ini_key_exists("config", "player4_key_dive")){global.player4_key_dive = ini_read_real("config", "player4_key_dive", 0);}
		if (ini_key_exists("config", "player4_key_jump")){global.player4_key_jump = ini_read_real("config", "player4_key_jump", 0);}
		if (ini_key_exists("config", "player4_key_crouch")){global.player4_key_crouch = ini_read_real("config", "player4_key_crouch", 0);}
		if (ini_key_exists("config", "player4_key_crouch_toggle")){global.player4_key_crouch_toggle = ini_read_real("config", "player4_key_crouch_toggle", 0);}
		if (ini_key_exists("config", "player4_key_sprint")){global.player4_key_sprint = ini_read_real("config", "player4_key_sprint", 0);}
		if (ini_key_exists("config", "player4_key_sprint_toggle")){global.player4_key_sprint_toggle = ini_read_real("config", "player4_key_sprint_toggle", 0);}
		if (ini_key_exists("config", "player4_key_left")){global.player4_key_left = ini_read_real("config", "player4_key_left", 0);}
		if (ini_key_exists("config", "player4_key_right")){global.player4_key_right = ini_read_real("config", "player4_key_right", 0);}
		if (ini_key_exists("config", "player4_key_down")){global.player4_key_down = ini_read_real("config", "player4_key_down", 0);}
		if (ini_key_exists("config", "player4_key_up")){global.player4_key_up = ini_read_real("config", "player4_key_up", 0);}
		if (ini_key_exists("config", "player4_key_tongue")){global.player4_key_tongue = ini_read_real("config", "player4_key_tongue", 0);}
		if (ini_key_exists("config", "player4_key_zoom_in")){global.player4_key_zoom_in = ini_read_real("config", "player4_key_zoom_in", 0);}
		if (ini_key_exists("config", "player4_key_zoom_out")){global.player4_key_zoom_out = ini_read_real("config", "player4_key_zoom_out", 0);}
		if (ini_key_exists("config", "player4_key2_dive")){global.player4_key2_dive = ini_read_real("config", "player4_key2_dive", 0);}
		if (ini_key_exists("config", "player4_key2_jump")){global.player4_key2_jump = ini_read_real("config", "player4_key2_jump", 0);}
		if (ini_key_exists("config", "player4_key2_crouch")){global.player4_key2_crouch = ini_read_real("config", "player4_key2_crouch", 0);}
		if (ini_key_exists("config", "player4_key2_crouch_toggle")){global.player4_key2_crouch_toggle = ini_read_real("config", "player4_key2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player4_key2_sprint")){global.player4_key2_sprint = ini_read_real("config", "player4_key2_sprint", 0);}
		if (ini_key_exists("config", "player4_key2_sprint_toggle")){global.player4_key2_sprint_toggle = ini_read_real("config", "player4_key2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player4_key2_left")){global.player4_key2_left = ini_read_real("config", "player4_key2_left", 0);}
		if (ini_key_exists("config", "player4_key2_right")){global.player4_key2_right = ini_read_real("config", "player4_key2_right", 0);}
		if (ini_key_exists("config", "player4_key2_down")){global.player4_key2_down = ini_read_real("config", "player4_key2_down", 0);}
		if (ini_key_exists("config", "player4_key2_up")){global.player4_key2_up = ini_read_real("config", "player4_key2_up", 0);}
		if (ini_key_exists("config", "player4_key2_tongue")){global.player4_key2_tongue = ini_read_real("config", "player4_key2_tongue", 0);}
		if (ini_key_exists("config", "player4_key2_zoom_in")){global.player4_key2_zoom_in = ini_read_real("config", "player4_key2_zoom_in", 0);}
		if (ini_key_exists("config", "player4_key2_zoom_out")){global.player4_key2_zoom_out = ini_read_real("config", "player4_key2_zoom_out", 0);}
		if (ini_key_exists("config", "player4_up_key_is_jump_key")){global.player4_up_key_is_jump_key = ini_read_real("config", "player4_up_key_is_jump_key", 0);}
		if (ini_key_exists("config", "player4_double_tap_to_run")){global.player4_double_tap_to_run = ini_read_real("config", "player4_double_tap_to_run", 0);}
		if (ini_key_exists("config", "player4_sprint_toggle")){global.player4_sprint_toggle = ini_read_real("config", "player4_sprint_toggle", 0);}
		if (ini_key_exists("config", "player4_cancel_dive_by_pressing_jump_or_dive_button")){global.player4_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("config", "player4_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("config", "player4_cancel_dive_by_pressing_opposite_direction")){global.player4_cancel_dive_by_pressing_opposite_direction = ini_read_real("config", "player4_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("config", "player4_down_and_jump_to_groundpound")){global.player4_down_and_jump_to_groundpound = ini_read_real("config", "player4_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("config", "player4_wall_jump_setting")){global.player4_wall_jump_setting = ini_read_real("config", "player4_wall_jump_setting", 0);}
		if (ini_key_exists("config", "player4_drop_from_rope")){global.player4_drop_from_rope = ini_read_real("config", "player4_drop_from_rope", 0);}
		if (ini_key_exists("config", "player4_show_controls")){global.player4_show_controls = ini_read_real("config", "player4_show_controls", 0);}//Load Player 4 Keyboard Remapping End
		#endregion /* Load Player 4 Keyboard Remapping END */
		
		#region /* Load Player 1 Gamepad Remapping */
		if (ini_key_exists("config", "player1_gamepad_button_dive")){global.player1_gamepad_button_dive = ini_read_real("config", "player1_gamepad_button_dive", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_jump")){global.player1_gamepad_button_jump = ini_read_real("config", "player1_gamepad_button_jump", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_crouch")){global.player1_gamepad_button_crouch = ini_read_real("config", "player1_gamepad_button_crouch", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_crouch_toggle")){global.player1_gamepad_button_crouch_toggle = ini_read_real("config", "player1_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_sprint")){global.player1_gamepad_button_sprint = ini_read_real("config", "player1_gamepad_button_sprint", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_sprint_toggle")){global.player1_gamepad_button_sprint_toggle = ini_read_real("config", "player1_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_left")){global.player1_gamepad_button_left = ini_read_real("config", "player1_gamepad_button_left", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_right")){global.player1_gamepad_button_right = ini_read_real("config", "player1_gamepad_button_right", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_down")){global.player1_gamepad_button_down = ini_read_real("config", "player1_gamepad_button_down", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_up")){global.player1_gamepad_button_up = ini_read_real("config", "player1_gamepad_button_up", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_tongue")){global.player1_gamepad_button_tongue = ini_read_real("config", "player1_gamepad_button_tongue", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_zoom_in")){global.player1_gamepad_button_zoom_in = ini_read_real("config", "player1_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("config", "player1_gamepad_button_zoom_out")){global.player1_gamepad_button_zoom_out = ini_read_real("config", "player1_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_dive")){global.player1_gamepad_button2_dive = ini_read_real("config", "player1_gamepad_button2_dive", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_jump")){global.player1_gamepad_button2_jump = ini_read_real("config", "player1_gamepad_button2_jump", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_crouch")){global.player1_gamepad_button2_crouch = ini_read_real("config", "player1_gamepad_button2_crouch", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_crouch_toggle")){global.player1_gamepad_button2_crouch_toggle = ini_read_real("config", "player1_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_sprint")){global.player1_gamepad_button2_sprint = ini_read_real("config", "player1_gamepad_button2_sprint", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_sprint_toggle")){global.player1_gamepad_button2_sprint_toggle = ini_read_real("config", "player1_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_left")){global.player1_gamepad_button2_left = ini_read_real("config", "player1_gamepad_button2_left", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_right")){global.player1_gamepad_button2_right = ini_read_real("config", "player1_gamepad_button2_right", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_down")){global.player1_gamepad_button2_down = ini_read_real("config", "player1_gamepad_button2_down", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_up")){global.player1_gamepad_button2_up = ini_read_real("config", "player1_gamepad_button2_up", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_tongue")){global.player1_gamepad_button2_tongue = ini_read_real("config", "player1_gamepad_button2_tongue", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_zoom_in")){global.player1_gamepad_button2_zoom_in = ini_read_real("config", "player1_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("config", "player1_gamepad_button2_zoom_out")){global.player1_gamepad_button2_zoom_out = ini_read_real("config", "player1_gamepad_button2_zoom_out", 0);}
		#endregion /* Load Player 1 Gamepad Remapping END */
		
		#region /* Load Player 2 Gamepad Remapping */
		if (ini_key_exists("config", "player2_gamepad_button_dive")){global.player2_gamepad_button_dive = ini_read_real("config", "player2_gamepad_button_dive", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_jump")){global.player2_gamepad_button_jump = ini_read_real("config", "player2_gamepad_button_jump", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_crouch")){global.player2_gamepad_button_crouch = ini_read_real("config", "player2_gamepad_button_crouch", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_crouch_toggle")){global.player2_gamepad_button_crouch_toggle = ini_read_real("config", "player2_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_sprint")){global.player2_gamepad_button_sprint = ini_read_real("config", "player2_gamepad_button_sprint", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_sprint_toggle")){global.player2_gamepad_button_sprint_toggle = ini_read_real("config", "player2_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_left")){global.player2_gamepad_button_left = ini_read_real("config", "player2_gamepad_button_left", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_right")){global.player2_gamepad_button_right = ini_read_real("config", "player2_gamepad_button_right", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_down")){global.player2_gamepad_button_down = ini_read_real("config", "player2_gamepad_button_down", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_up")){global.player2_gamepad_button_up = ini_read_real("config", "player2_gamepad_button_up", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_tongue")){global.player2_gamepad_button_tongue = ini_read_real("config", "player2_gamepad_button_tongue", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_zoom_in")){global.player2_gamepad_button_zoom_in = ini_read_real("config", "player2_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("config", "player2_gamepad_button_zoom_out")){global.player2_gamepad_button_zoom_out = ini_read_real("config", "player2_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_dive")){global.player2_gamepad_button2_dive = ini_read_real("config", "player2_gamepad_button2_dive", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_jump")){global.player2_gamepad_button2_jump = ini_read_real("config", "player2_gamepad_button2_jump", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_crouch")){global.player2_gamepad_button2_crouch = ini_read_real("config", "player2_gamepad_button2_crouch", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_crouch_toggle")){global.player2_gamepad_button2_crouch_toggle = ini_read_real("config", "player2_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_sprint")){global.player2_gamepad_button2_sprint = ini_read_real("config", "player2_gamepad_button2_sprint", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_sprint_toggle")){global.player2_gamepad_button2_sprint_toggle = ini_read_real("config", "player2_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_left")){global.player2_gamepad_button2_left = ini_read_real("config", "player2_gamepad_button2_left", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_right")){global.player2_gamepad_button2_right = ini_read_real("config", "player2_gamepad_button2_right", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_down")){global.player2_gamepad_button2_down = ini_read_real("config", "player2_gamepad_button2_down", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_up")){global.player2_gamepad_button2_up = ini_read_real("config", "player2_gamepad_button2_up", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_tongue")){global.player2_gamepad_button2_tongue = ini_read_real("config", "player2_gamepad_button2_tongue", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_zoom_in")){global.player2_gamepad_button2_zoom_in = ini_read_real("config", "player2_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("config", "player2_gamepad_button2_zoom_out")){global.player2_gamepad_button2_zoom_out = ini_read_real("config", "player2_gamepad_button2_zoom_out", 0);}
		#endregion /* Load Player 2 Gamepad Remapping END */
		
		#region /* Load Player 3 Gamepad Remapping */
		if (ini_key_exists("config", "player3_gamepad_button_dive")){global.player3_gamepad_button_dive = ini_read_real("config", "player3_gamepad_button_dive", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_jump")){global.player3_gamepad_button_jump = ini_read_real("config", "player3_gamepad_button_jump", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_crouch")){global.player3_gamepad_button_crouch = ini_read_real("config", "player3_gamepad_button_crouch", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_crouch_toggle")){global.player3_gamepad_button_crouch_toggle = ini_read_real("config", "player3_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_sprint")){global.player3_gamepad_button_sprint = ini_read_real("config", "player3_gamepad_button_sprint", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_sprint_toggle")){global.player3_gamepad_button_sprint_toggle = ini_read_real("config", "player3_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_left")){global.player3_gamepad_button_left = ini_read_real("config", "player3_gamepad_button_left", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_right")){global.player3_gamepad_button_right = ini_read_real("config", "player3_gamepad_button_right", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_down")){global.player3_gamepad_button_down = ini_read_real("config", "player3_gamepad_button_down", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_up")){global.player3_gamepad_button_up = ini_read_real("config", "player3_gamepad_button_up", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_tongue")){global.player3_gamepad_button_tongue = ini_read_real("config", "player3_gamepad_button_tongue", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_zoom_in")){global.player3_gamepad_button_zoom_in = ini_read_real("config", "player3_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("config", "player3_gamepad_button_zoom_out")){global.player3_gamepad_button_zoom_out = ini_read_real("config", "player3_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_dive")){global.player3_gamepad_button2_dive = ini_read_real("config", "player3_gamepad_button2_dive", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_jump")){global.player3_gamepad_button2_jump = ini_read_real("config", "player3_gamepad_button2_jump", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_crouch")){global.player3_gamepad_button2_crouch = ini_read_real("config", "player3_gamepad_button2_crouch", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_crouch_toggle")){global.player3_gamepad_button2_crouch_toggle = ini_read_real("config", "player3_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_sprint")){global.player3_gamepad_button2_sprint = ini_read_real("config", "player3_gamepad_button2_sprint", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_sprint_toggle")){global.player3_gamepad_button2_sprint_toggle = ini_read_real("config", "player3_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_left")){global.player3_gamepad_button2_left = ini_read_real("config", "player3_gamepad_button2_left", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_right")){global.player3_gamepad_button2_right = ini_read_real("config", "player3_gamepad_button2_right", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_down")){global.player3_gamepad_button2_down = ini_read_real("config", "player3_gamepad_button2_down", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_up")){global.player3_gamepad_button2_up = ini_read_real("config", "player3_gamepad_button2_up", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_tongue")){global.player3_gamepad_button2_tongue = ini_read_real("config", "player3_gamepad_button2_tongue", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_zoom_in")){global.player3_gamepad_button2_zoom_in = ini_read_real("config", "player3_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("config", "player3_gamepad_button2_zoom_out")){global.player3_gamepad_button2_zoom_out = ini_read_real("config", "player3_gamepad_button2_zoom_out", 0);}
		#endregion /* Load Player 3 Gamepad Remapping END */
		
		#region /* Load Player 4 Gamepad Remapping */
		if (ini_key_exists("config", "player4_gamepad_button_dive")){global.player4_gamepad_button_dive = ini_read_real("config", "player4_gamepad_button_dive", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_jump")){global.player4_gamepad_button_jump = ini_read_real("config", "player4_gamepad_button_jump", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_crouch")){global.player4_gamepad_button_crouch = ini_read_real("config", "player4_gamepad_button_crouch", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_crouch_toggle")){global.player4_gamepad_button_crouch_toggle = ini_read_real("config", "player4_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_sprint")){global.player4_gamepad_button_sprint = ini_read_real("config", "player4_gamepad_button_sprint", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_sprint_toggle")){global.player4_gamepad_button_sprint_toggle = ini_read_real("config", "player4_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_left")){global.player4_gamepad_button_left = ini_read_real("config", "player4_gamepad_button_left", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_right")){global.player4_gamepad_button_right = ini_read_real("config", "player4_gamepad_button_right", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_down")){global.player4_gamepad_button_down = ini_read_real("config", "player4_gamepad_button_down", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_up")){global.player4_gamepad_button_up = ini_read_real("config", "player4_gamepad_button_up", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_tongue")){global.player4_gamepad_button_tongue = ini_read_real("config", "player4_gamepad_button_tongue", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_zoom_in")){global.player4_gamepad_button_zoom_in = ini_read_real("config", "player4_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("config", "player4_gamepad_button_zoom_out")){global.player4_gamepad_button_zoom_out = ini_read_real("config", "player4_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_dive")){global.player4_gamepad_button2_dive = ini_read_real("config", "player4_gamepad_button2_dive", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_jump")){global.player4_gamepad_button2_jump = ini_read_real("config", "player4_gamepad_button2_jump", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_crouch")){global.player4_gamepad_button2_crouch = ini_read_real("config", "player4_gamepad_button2_crouch", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_crouch_toggle")){global.player4_gamepad_button2_crouch_toggle = ini_read_real("config", "player4_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_sprint")){global.player4_gamepad_button2_sprint = ini_read_real("config", "player4_gamepad_button2_sprint", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_sprint_toggle")){global.player4_gamepad_button2_sprint_toggle = ini_read_real("config", "player4_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_left")){global.player4_gamepad_button2_left = ini_read_real("config", "player4_gamepad_button2_left", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_right")){global.player4_gamepad_button2_right = ini_read_real("config", "player4_gamepad_button2_right", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_down")){global.player4_gamepad_button2_down = ini_read_real("config", "player4_gamepad_button2_down", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_up")){global.player4_gamepad_button2_up = ini_read_real("config", "player4_gamepad_button2_up", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_tongue")){global.player4_gamepad_button2_tongue = ini_read_real("config", "player4_gamepad_button2_tongue", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_zoom_in")){global.player4_gamepad_button2_zoom_in = ini_read_real("config", "player4_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("config", "player4_gamepad_button2_zoom_out")){global.player4_gamepad_button2_zoom_out = ini_read_real("config", "player4_gamepad_button2_zoom_out", 0);}
		#endregion /* Load Player 4 Gamepad Remapping END */
		
		ini_close();
	}
}