function scr_config_load()
{
	if (file_exists(working_directory + "config.ini")) /* Check if config.ini exists before loading any settings */
	{
		ini_open(working_directory + "config.ini");
		
		variable_instance_exists(self, "inform_about_report_feature")
		{
			if (ini_key_exists("config", "inform_about_report_feature")){inform_about_report_feature = ini_read_real("config", "inform_about_report_feature", true);}
		}
		variable_instance_exists(self, "upload_rules_do_not_show_level")
		{
			if (ini_key_exists("config", "upload_rules_do_not_show_level")){upload_rules_do_not_show_level = ini_read_real("config", "upload_rules_do_not_show_level", false);}
		}
		variable_instance_exists(self, "upload_rules_do_not_show_character")
		{
			if (ini_key_exists("config", "upload_rules_do_not_show_character")){upload_rules_do_not_show_character = ini_read_real("config", "upload_rules_do_not_show_character", false);}
		}
		if (ini_key_exists("config", "caution_online_do_not_show")){global.online_enabled = ini_read_real("config", "caution_online_do_not_show", false);}
		if (ini_key_exists("config", "always_show_level_editor_buttons")){global.always_show_level_editor_buttons = ini_read_real("config", "always_show_level_editor_buttons", true);}
		if (ini_key_exists("config", "current_file")){global.file = ini_read_real("config", "current_file", 0);}
		if (ini_key_exists("config", "difficulty")){global.difficulty = ini_read_real("config", "difficulty", 0);}
		if (ini_key_exists("config", "enable_difficutly_layers_in_level_editor")){global.enable_difficutly_layers_in_level_editor = ini_read_real("config", "enable_difficutly_layers_in_level_editor", 0);}
		if (ini_key_exists("config", "automatically_pause_when_window_is_unfocused")){global.automatically_pause_when_window_is_unfocused = ini_read_real("config", "automatically_pause_when_window_is_unfocused", 0);}
		if (ini_key_exists("config", "enable_links")){global.enable_links = ini_read_real("config", "enable_links", 1);}
		if (ini_key_exists("config", "show_timer")){global.show_timer = ini_read_real("config", "show_timer", 0);}
		if (ini_key_exists("config", "show_defeats_counter")){global.show_defeats_counter = ini_read_real("config", "show_defeats_counter", 0);}
		if (ini_key_exists("config", "show_ranks")){global.show_ranks = ini_read_real("config", "show_ranks", 0);}
		if (ini_key_exists("config", "assist_enable")){global.assist_enable = ini_read_real("config", "assist_enable", 0);}
		if (ini_key_exists("config", "assist_enable_enemies")){global.assist_enable_enemies = ini_read_real("config", "assist_enable_enemies", 0);}
		if (ini_key_exists("config", "assist_enable_spikes")){global.assist_enable_spikes = ini_read_real("config", "assist_enable_spikes", 0);}
		if (ini_key_exists("config", "narrator")){global.narrator = ini_read_real("config", "narrator", 0);}
		if (ini_key_exists("config", "show_tutorial_signs")){global.show_tutorial_signs = ini_read_real("config", "show_tutorial_signs", 0);}
		if (ini_key_exists("config", "show_new_items_notification")){global.show_new_items_notification = ini_read_real("config", "show_new_items_notification", 0);}
		if (ini_key_exists("config", "hud_hide_time")){global.hud_hide_time = ini_read_real("config", "hud_hide_time", 0);}
		if (ini_key_exists("config", "selected_font")){global.selected_font = ini_read_real("config", "selected_font", 0);scr_set_font();}
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
		
		#region /* Account Settings */
		if (ini_key_exists("config", "username")){global.username = ini_read_string("config", "username", "");}
		#endregion /* Account Settings END */
		
		if (ini_key_exists("config", "fullscreen_mode")){window_set_fullscreen(ini_read_real("config", "fullscreen_mode", 0));}
		if (ini_key_exists("config", "interpolate")){global.interpolate = ini_read_real("config", "interpolate", 0);}
		if (ini_key_exists("config", "show_fps")){global.show_fps = ini_read_real("config", "show_fps", 0);}
		if (ini_key_exists("config", "show_fps_real")){global.show_fps_real = ini_read_real("config", "show_fps_real", 0);}
		if (ini_key_exists("config", "show_instance_count")){global.show_instance_count = ini_read_real("config", "show_instance_count", 0);}
		if (ini_key_exists("config", "show_collision_mask")){global.show_collision_mask = ini_read_real("config", "show_collision_mask", 0);}
		if (ini_key_exists("config", "volume_main")){global.volume_main = ini_read_real("config", "volume_main", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_music")){global.volume_music = ini_read_real("config", "volume_music", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_melody")){global.volume_melody = ini_read_real("config", "volume_melody", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_sound")){global.volume_sound = ini_read_real("config", "volume_sound", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_ambient")){global.volume_ambient = ini_read_real("config", "volume_ambient", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_footstep")){global.volume_footstep = ini_read_real("config", "volume_footstep", 7000) * 0.0001;}
		if (ini_key_exists("config", "volume_voices")){global.volume_voice = ini_read_real("config", "volume_voices", 7000) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_gameplay")){global.background_brightness_gameplay = ini_read_real("config", "background_brightness_gameplay", 0) * 0.0001;}
		if (ini_key_exists("config", "background_brightness_menu")){global.background_brightness_menu = ini_read_real("config", "background_brightness_menu", 0) * 0.0001;}
		if (ini_key_exists("config", "enable_background_layer1")){global.enable_background_layer1 = ini_read_real("config", "enable_background_layer1", 0);}
		if (ini_key_exists("config", "enable_background_layer2")){global.enable_background_layer2 = ini_read_real("config", "enable_background_layer2", 0);}
		if (ini_key_exists("config", "enable_background_layer3")){global.enable_background_layer3 = ini_read_real("config", "enable_background_layer3", 0);}
		if (ini_key_exists("config", "enable_background_layer4")){global.enable_background_layer4 = ini_read_real("config", "enable_background_layer4", 0);}
		if (ini_key_exists("config", "enable_foreground_layer1")){global.enable_foreground_layer1 = ini_read_real("config", "enable_foreground_layer1", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_1_5")){global.enable_foreground_layer_1_5 = ini_read_real("config", "enable_foreground_layer_1_5", 0);}
		if (ini_key_exists("config", "enable_foreground_layer2")){global.enable_foreground_layer2 = ini_read_real("config", "enable_foreground_layer2", 0);}
		if (ini_key_exists("config", "enable_foreground_layer_secret")){global.enable_foreground_layer_secret = ini_read_real("config", "enable_foreground_layer_secret", 0);}
		if (ini_key_exists("config", "enable_transitions")){global.enable_transitions = ini_read_real("config", "enable_transitions", 0);}
		if (ini_key_exists("config", "button_design_color")){global.button_design_color = ini_read_real("config", "button_design_color", 2);}
		if (ini_key_exists("config", "button_design_shape")){global.button_design_shape = ini_read_real("config", "button_design_shape", 1);}
		if (ini_key_exists("config", "button_design_transparency")){global.button_design_transparency = ini_read_real("config", "button_design_transparency", 0);}
		if (ini_key_exists("config", "menu_button_subimg")){global.menu_button_subimg = ini_read_real("config", "menu_button_subimg", 16);}
		
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
		if (ini_key_exists("config", "gui_scale_modifier")){global.gui_scale_modifier = ini_read_real("config", "gui_scale_modifier", 3);}
		if (ini_key_exists("config", "language_localization")){global.language_localization = ini_read_real("config", "language_localization", 0);}
		if (ini_key_exists("config", "convention_mode")){global.convention_mode = ini_read_real("config", "convention_mode", 0);}
		if (ini_key_exists("config", "arcade_mode")){global.arcade_mode = ini_read_real("config", "arcade_mode", 0);}
		if (ini_key_exists("config", "chosen_controller_used")){global.chosen_controller_used = ini_read_real("config", "chosen_controller_used", 0);}
		if (ini_key_exists("config", "show_prompt_when_changing_to_gamepad")){global.show_prompt_when_changing_to_gamepad = ini_read_real("config", "show_prompt_when_changing_to_gamepad", 1);}
		if (ini_key_exists("config", "show_prompt_when_changing_to_keyboard_and_mouse")){global.show_prompt_when_changing_to_keyboard_and_mouse = ini_read_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", 1);}
		if (ini_key_exists("config", "always_show_gamepad_buttons")){global.always_show_gamepad_buttons = ini_read_real("config", "always_show_gamepad_buttons", 0);}
		
		#region /* Load Player 1 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player1")){global.character_index[0] = ini_read_real("config", "character_index_player1", 0);}
		if (ini_key_exists("config", "skin_for_player1")){global.actual_skin_for_player[1] = ini_read_real("config", "skin_for_player1", 0);}
		if (ini_key_exists("config", "player1_name")){global.player_name[1] = ini_read_string("config", "player1_name", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_dive")){global.player_[inp.key][1][1][action.dive] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_dive", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_jump")){global.player_[inp.key][1][1][action.jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_double_jump")){global.player_[inp.key][1][1][action.double_jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_double_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_crouch")){global.player_[inp.key][1][1][action.crouch] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_crouch", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_crouch_toggle")){global.player_[inp.key][1][1][action.crouch_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_crouch_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_sprint")){global.player_[inp.key][1][1][action.sprint] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_sprint", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_sprint_toggle")){global.player_[inp.key][1][1][action.sprint_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_sprint_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_left")){global.player_[inp.key][1][1][action.left] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_left", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_right")){global.player_[inp.key][1][1][action.right] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_right", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_down")){global.player_[inp.key][1][1][action.down] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_down", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_up")){global.player_[inp.key][1][1][action.up] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_up", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_tongue")){global.player_[inp.key][1][1][action.tongue] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_tongue", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_zoom_in")){global.player_[inp.key][1][1][action.zoom_in] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_zoom_in", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_zoom_out")){global.player_[inp.key][1][1][action.zoom_out] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_zoom_out", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_accept")){global.player_[inp.key][1][1][action.accept] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_accept", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key_back")){global.player_[inp.key][1][1][action.back] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key_back", 0);}
		
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_dive")){global.player_[inp.key][1][2][action.dive] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_dive", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_jump")){global.player_[inp.key][1][2][action.jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_double_jump")){global.player_[inp.key][1][2][action.double_jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_double_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_crouch")){global.player_[inp.key][1][2][action.crouch] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_crouch", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_crouch_toggle")){global.player_[inp.key][1][2][action.crouch_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_crouch_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_sprint")){global.player_[inp.key][1][2][action.sprint] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_sprint", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_sprint_toggle")){global.player_[inp.key][1][2][action.sprint_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_sprint_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_left")){global.player_[inp.key][1][2][action.left] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_left", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_right")){global.player_[inp.key][1][2][action.right] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_right", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_down")){global.player_[inp.key][1][2][action.down] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_down", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_up")){global.player_[inp.key][1][2][action.up] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_up", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_tongue")){global.player_[inp.key][1][2][action.tongue] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_tongue", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_zoom_in")){global.player_[inp.key][1][2][action.zoom_in] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_zoom_in", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_zoom_out")){global.player_[inp.key][1][2][action.zoom_out] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_zoom_out", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_accept")){global.player_[inp.key][1][2][action.accept] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_accept", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_key2_back")){global.player_[inp.key][1][2][action.back] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_key2_back", 0);}
		
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_up_is_also_jump")){global.player1_up_is_also_jump = ini_read_real("player1_profile" + string(global.player1_profile), "player1_up_is_also_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_double_tap_to_run")){global.player1_double_tap_to_run = ini_read_real("player1_profile" + string(global.player1_profile), "player1_double_tap_to_run", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_sprint_toggle")){global.player1_sprint_toggle = ini_read_real("player1_profile" + string(global.player1_profile), "player1_sprint_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_double_tap_to_dive")){global.player1_double_tap_to_dive = ini_read_real("player1_profile" + string(global.player1_profile), "player1_double_tap_to_dive", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_jump_or_dive_button")){global.player1_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_opposite_direction")){global.player1_cancel_dive_by_pressing_opposite_direction = ini_read_real("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_down_and_jump_to_groundpound")){global.player1_down_and_jump_to_groundpound = ini_read_real("player1_profile" + string(global.player1_profile), "player1_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_wall_jump_setting")){global.player1_wall_jump_setting = ini_read_real("player1_profile" + string(global.player1_profile), "player1_wall_jump_setting", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_drop_from_rope")){global.player1_drop_from_rope = ini_read_real("player1_profile" + string(global.player1_profile), "player1_drop_from_rope", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_show_controls")){global.player_show_controls[1] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_show_controls", 0);}
		#endregion /* Load Player 1 Keyboard Remapping END */
		
		#region /* Load Player 2 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player2")){global.character_index[1] = ini_read_real("config", "character_index_player2", 1);}
		if (ini_key_exists("config", "skin_for_player2")){global.actual_skin_for_player[2] = ini_read_real("config", "skin_for_player2", 1);}
		if (ini_key_exists("config", "player2_name")){global.player_name[2] = ini_read_string("config", "player2_name", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_dive")){global.player_[inp.key][2][1][action.dive] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_dive", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_jump")){global.player_[inp.key][2][1][action.jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_double_jump")){global.player_[inp.key][2][1][action.double_jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_double_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_crouch")){global.player_[inp.key][2][1][action.crouch] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_crouch", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_crouch_toggle")){global.player_[inp.key][2][1][action.crouch_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_crouch_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_sprint")){global.player_[inp.key][2][1][action.sprint] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_sprint", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_sprint_toggle")){global.player_[inp.key][2][1][action.sprint_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_sprint_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_left")){global.player_[inp.key][2][1][action.left] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_left", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_right")){global.player_[inp.key][2][1][action.right] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_right", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_down")){global.player_[inp.key][2][1][action.down] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_down", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_up")){global.player_[inp.key][2][1][action.up] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_up", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_tongue")){global.player_[inp.key][2][1][action.tongue] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_tongue", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_zoom_in")){global.player_[inp.key][2][1][action.zoom_in] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_zoom_in", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_zoom_out")){global.player_[inp.key][2][1][action.zoom_out] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_zoom_out", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_accept")){global.player_[inp.key][2][1][action.accept] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_accept", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key_back")){global.player_[inp.key][2][1][action.back] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key_back", 0);}
		
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_dive")){global.player_[inp.key][2][2][action.dive] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_dive", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_jump")){global.player_[inp.key][2][2][action.jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_double_jump")){global.player_[inp.key][2][2][action.double_jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_double_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_crouch")){global.player_[inp.key][2][2][action.crouch] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_crouch", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_crouch_toggle")){global.player_[inp.key][2][2][action.crouch_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_crouch_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_sprint")){global.player_[inp.key][2][2][action.sprint] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_sprint", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_sprint_toggle")){global.player_[inp.key][2][2][action.sprint_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_sprint_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_left")){global.player_[inp.key][2][2][action.left] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_left", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_right")){global.player_[inp.key][2][2][action.right] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_right", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_down")){global.player_[inp.key][2][2][action.down] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_down", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_up")){global.player_[inp.key][2][2][action.up] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_up", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_tongue")){global.player_[inp.key][2][2][action.tongue] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_tongue", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_zoom_in")){global.player_[inp.key][2][2][action.zoom_in] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_zoom_in", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_zoom_out")){global.player_[inp.key][2][2][action.zoom_out] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_zoom_out", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_accept")){global.player_[inp.key][2][2][action.accept] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_accept", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_key2_back")){global.player_[inp.key][2][2][action.back] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_key2_back", 0);}
		
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_up_is_also_jump")){global.player2_up_is_also_jump = ini_read_real("player2_profile" + string(global.player2_profile), "player2_up_is_also_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_double_tap_to_run")){global.player2_double_tap_to_run = ini_read_real("player2_profile" + string(global.player2_profile), "player2_double_tap_to_run", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_sprint_toggle")){global.player2_sprint_toggle = ini_read_real("player2_profile" + string(global.player2_profile), "player2_sprint_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_double_tap_to_dive")){global.player2_double_tap_to_dive = ini_read_real("player2_profile" + string(global.player2_profile), "player2_double_tap_to_dive", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_jump_or_dive_button")){global.player2_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_opposite_direction")){global.player2_cancel_dive_by_pressing_opposite_direction = ini_read_real("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_down_and_jump_to_groundpound")){global.player2_down_and_jump_to_groundpound = ini_read_real("player2_profile" + string(global.player2_profile), "player2_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_wall_jump_setting")){global.player2_wall_jump_setting = ini_read_real("player2_profile" + string(global.player2_profile), "player2_wall_jump_setting", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_drop_from_rope")){global.player2_drop_from_rope = ini_read_real("player2_profile" + string(global.player2_profile), "player2_drop_from_rope", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_show_controls")){global.player_show_controls[2] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_show_controls", 0);}
		#endregion /* Load Player 2 Keyboard Remapping END */
		
		#region /* Load Player 3 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player3")){global.character_index[2] = ini_read_real("config", "character_index_player3", 2);}
		if (ini_key_exists("config", "skin_for_player3")){global.actual_skin_for_player[3] = ini_read_real("config", "skin_for_player3", 2);}
		if (ini_key_exists("config", "player3_name")){global.player_name[3] = ini_read_string("config", "player3_name", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_dive")){global.player_[inp.key][3][1][action.dive] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_dive", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_jump")){global.player_[inp.key][3][1][action.jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_double_jump")){global.player_[inp.key][3][1][action.double_jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_double_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_crouch")){global.player_[inp.key][3][1][action.crouch] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_crouch", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_crouch_toggle")){global.player_[inp.key][3][1][action.crouch_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_crouch_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_sprint")){global.player_[inp.key][3][1][action.sprint] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_sprint", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_sprint_toggle")){global.player_[inp.key][3][1][action.sprint_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_sprint_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_left")){global.player_[inp.key][3][1][action.left] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_left", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_right")){global.player_[inp.key][3][1][action.right] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_right", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_down")){global.player_[inp.key][3][1][action.down] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_down", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_up")){global.player_[inp.key][3][1][action.up] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_up", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_tongue")){global.player_[inp.key][3][1][action.tongue] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_tongue", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_zoom_in")){global.player_[inp.key][3][1][action.zoom_in] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_zoom_in", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_zoom_out")){global.player_[inp.key][3][1][action.zoom_out] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_zoom_out", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_accept")){global.player_[inp.key][3][1][action.accept] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_accept", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key_back")){global.player_[inp.key][3][1][action.back] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key_back", 0);}
		
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_dive")){global.player_[inp.key][3][2][action.dive] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_dive", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_jump")){global.player_[inp.key][3][2][action.jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_double_jump")){global.player_[inp.key][3][2][action.double_jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_double_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_crouch")){global.player_[inp.key][3][2][action.crouch] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_crouch", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_crouch_toggle")){global.player_[inp.key][3][2][action.crouch_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_crouch_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_sprint")){global.player_[inp.key][3][2][action.sprint] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_sprint", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_sprint_toggle")){global.player_[inp.key][3][2][action.sprint_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_sprint_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_left")){global.player_[inp.key][3][2][action.left] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_left", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_right")){global.player_[inp.key][3][2][action.right] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_right", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_down")){global.player_[inp.key][3][2][action.down] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_down", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_up")){global.player_[inp.key][3][2][action.up] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_up", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_tongue")){global.player_[inp.key][3][2][action.tongue] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_tongue", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_zoom_in")){global.player_[inp.key][3][2][action.zoom_in] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_zoom_in", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_zoom_out")){global.player_[inp.key][3][2][action.zoom_out] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_zoom_out", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_accept")){global.player_[inp.key][3][2][action.accept] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_accept", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_key2_back")){global.player_[inp.key][3][2][action.back] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_key2_back", 0);}
		
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_up_is_also_jump")){global.player3_up_is_also_jump = ini_read_real("player3_profile" + string(global.player3_profile), "player3_up_is_also_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_double_tap_to_run")){global.player3_double_tap_to_run = ini_read_real("player3_profile" + string(global.player3_profile), "player3_double_tap_to_run", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_sprint_toggle")){global.player3_sprint_toggle = ini_read_real("player3_profile" + string(global.player3_profile), "player3_sprint_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_double_tap_to_dive")){global.player3_double_tap_to_dive = ini_read_real("player3_profile" + string(global.player3_profile), "player3_double_tap_to_dive", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_jump_or_dive_button")){global.player3_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_opposite_direction")){global.player3_cancel_dive_by_pressing_opposite_direction = ini_read_real("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_down_and_jump_to_groundpound")){global.player3_down_and_jump_to_groundpound = ini_read_real("player3_profile" + string(global.player3_profile), "player3_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_wall_jump_setting")){global.player3_wall_jump_setting = ini_read_real("player3_profile" + string(global.player3_profile), "player3_wall_jump_setting", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_drop_from_rope")){global.player3_drop_from_rope = ini_read_real("player3_profile" + string(global.player3_profile), "player3_drop_from_rope", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_show_controls")){global.player_show_controls[3] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_show_controls", 0);}
		#endregion /* Load Player 3 Keyboard Remapping END */
		
		#region /* Load Player 4 Keyboard Remapping */
		if (ini_key_exists("config", "character_index_player4")){global.character_index[3] = ini_read_real("config", "character_index_player4", 3);}
		if (ini_key_exists("config", "skin_for_player4")){global.actual_skin_for_player[4] = ini_read_real("config", "skin_for_player4", 3);}
		if (ini_key_exists("config", "player4_name")){global.player_name[4] = ini_read_string("config", "player4_name", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_dive")){global.player_[inp.key][4][1][action.dive] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_dive", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_jump")){global.player_[inp.key][4][1][action.jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_double_jump")){global.player_[inp.key][4][1][action.double_jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_double_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_crouch")){global.player_[inp.key][4][1][action.crouch] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_crouch", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_crouch_toggle")){global.player_[inp.key][4][1][action.crouch_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_crouch_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_sprint")){global.player_[inp.key][4][1][action.sprint] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_sprint", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_sprint_toggle")){global.player_[inp.key][4][1][action.sprint_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_sprint_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_left")){global.player_[inp.key][4][1][action.left] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_left", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_right")){global.player_[inp.key][4][1][action.right] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_right", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_down")){global.player_[inp.key][4][1][action.down] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_down", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_up")){global.player_[inp.key][4][1][action.up] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_up", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_tongue")){global.player_[inp.key][4][1][action.tongue] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_tongue", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_zoom_in")){global.player_[inp.key][4][1][action.zoom_in] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_zoom_in", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_zoom_out")){global.player_[inp.key][4][1][action.zoom_out] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_zoom_out", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_accept")){global.player_[inp.key][4][1][action.accept] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_accept", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key_back")){global.player_[inp.key][4][1][action.back] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key_back", 0);}
		
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_dive")){global.player_[inp.key][4][2][action.dive] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_dive", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_jump")){global.player_[inp.key][4][2][action.jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_double_jump")){global.player_[inp.key][4][2][action.double_jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_double_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_crouch")){global.player_[inp.key][4][2][action.crouch] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_crouch", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_crouch_toggle")){global.player_[inp.key][4][2][action.crouch_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_crouch_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_sprint")){global.player_[inp.key][4][2][action.sprint] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_sprint", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_sprint_toggle")){global.player_[inp.key][4][2][action.sprint_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_sprint_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_left")){global.player_[inp.key][4][2][action.left] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_left", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_right")){global.player_[inp.key][4][2][action.right] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_right", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_down")){global.player_[inp.key][4][2][action.down] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_down", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_up")){global.player_[inp.key][4][2][action.up] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_up", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_tongue")){global.player_[inp.key][4][2][action.tongue] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_tongue", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_zoom_in")){global.player_[inp.key][4][2][action.zoom_in] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_zoom_in", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_zoom_out")){global.player_[inp.key][4][2][action.zoom_out] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_zoom_out", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_accept")){global.player_[inp.key][4][2][action.accept] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_accept", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_key2_back")){global.player_[inp.key][4][2][action.back] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_key2_back", 0);}
		
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_up_is_also_jump")){global.player4_up_is_also_jump = ini_read_real("player4_profile" + string(global.player4_profile), "player4_up_is_also_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_double_tap_to_run")){global.player4_double_tap_to_run = ini_read_real("player4_profile" + string(global.player4_profile), "player4_double_tap_to_run", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_sprint_toggle")){global.player4_sprint_toggle = ini_read_real("player4_profile" + string(global.player4_profile), "player4_sprint_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_double_tap_to_dive")){global.player4_double_tap_to_dive = ini_read_real("player4_profile" + string(global.player4_profile), "player4_double_tap_to_dive", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_jump_or_dive_button")){global.player4_cancel_dive_by_pressing_jump_or_dive_button = ini_read_real("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_jump_or_dive_button", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_opposite_direction")){global.player4_cancel_dive_by_pressing_opposite_direction = ini_read_real("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_opposite_direction", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_down_and_jump_to_groundpound")){global.player4_down_and_jump_to_groundpound = ini_read_real("player4_profile" + string(global.player4_profile), "player4_down_and_jump_to_groundpound", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_wall_jump_setting")){global.player4_wall_jump_setting = ini_read_real("player4_profile" + string(global.player4_profile), "player4_wall_jump_setting", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_drop_from_rope")){global.player4_drop_from_rope = ini_read_real("player4_profile" + string(global.player4_profile), "player4_drop_from_rope", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_show_controls")){global.player4_show_controls = ini_read_real("player4_profile" + string(global.player4_profile), "player4_show_controls", 0);}
		#endregion /* Load Player 4 Keyboard Remapping END */
		
		#region /* Load Player 1 Gamepad Remapping */
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_dive")){global.player_[inp.gp][1][1][action.dive] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_dive", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_jump")){global.player_[inp.gp][1][1][action.jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_double_jump")){global.player_[inp.gp][1][1][action.double_jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_double_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_crouch")){global.player_[inp.gp][1][1][action.crouch] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_crouch", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_crouch_toggle")){global.player_[inp.gp][1][1][action.crouch_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_sprint")){global.player_[inp.gp][1][1][action.sprint] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_sprint", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_sprint_toggle")){global.player_[inp.gp][1][1][action.sprint_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_left")){global.player_[inp.gp][1][1][action.left] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_left", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_right")){global.player_[inp.gp][1][1][action.right] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_right", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_down")){global.player_[inp.gp][1][1][action.down] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_down", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_up")){global.player_[inp.gp][1][1][action.up] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_up", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_tongue")){global.player_[inp.gp][1][1][action.tongue] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_tongue", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_zoom_in")){global.player_[inp.gp][1][1][action.zoom_in] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_zoom_out")){global.player_[inp.gp][1][1][action.zoom_out] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_accept")){global.player_[inp.gp][1][1][action.accept] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_accept", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button_back")){global.player_[inp.gp][1][1][action.back] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button_back", 0);}
		
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_dive")){global.player_[inp.gp][1][2][action.dive] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_dive", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_jump")){global.player_[inp.gp][1][2][action.jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_double_jump")){global.player_[inp.gp][1][2][action.double_jump] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_double_jump", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_crouch")){global.player_[inp.gp][1][2][action.crouch] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_crouch", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_crouch_toggle")){global.player_[inp.gp][1][2][action.crouch_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_sprint")){global.player_[inp.gp][1][2][action.sprint] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_sprint", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_sprint_toggle")){global.player_[inp.gp][1][2][action.sprint_toggle] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_left")){global.player_[inp.gp][1][2][action.left] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_left", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_right")){global.player_[inp.gp][1][2][action.right] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_right", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_down")){global.player_[inp.gp][1][2][action.down] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_down", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_up")){global.player_[inp.gp][1][2][action.up] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_up", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_tongue")){global.player_[inp.gp][1][2][action.tongue] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_tongue", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_zoom_in")){global.player_[inp.gp][1][2][action.zoom_in] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_zoom_out")){global.player_[inp.gp][1][2][action.zoom_out] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_zoom_out", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_accept")){global.player_[inp.gp][1][2][action.accept] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_accept", 0);}
		if (ini_key_exists("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_back")){global.player_[inp.gp][1][2][action.back] = ini_read_real("player1_profile" + string(global.player1_profile), "player1_gamepad_button2_back", 0);}
		#endregion /* Load Player 1 Gamepad Remapping END */
		
		#region /* Load Player 2 Gamepad Remapping */
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_dive")){global.player_[inp.gp][2][1][action.dive] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_dive", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_jump")){global.player_[inp.gp][2][1][action.jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_double_jump")){global.player_[inp.gp][2][1][action.double_jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_double_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_crouch")){global.player_[inp.gp][2][1][action.crouch] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_crouch", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_crouch_toggle")){global.player_[inp.gp][2][1][action.crouch_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_sprint")){global.player_[inp.gp][2][1][action.sprint] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_sprint", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_sprint_toggle")){global.player_[inp.gp][2][1][action.sprint_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_left")){global.player_[inp.gp][2][1][action.left] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_left", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_right")){global.player_[inp.gp][2][1][action.right] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_right", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_down")){global.player_[inp.gp][2][1][action.down] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_down", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_up")){global.player_[inp.gp][2][1][action.up] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_up", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_tongue")){global.player_[inp.gp][2][1][action.tongue] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_tongue", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_zoom_in")){global.player_[inp.gp][2][1][action.zoom_in] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_zoom_out")){global.player_[inp.gp][2][1][action.zoom_out] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_accept")){global.player_[inp.gp][2][1][action.accept] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_accept", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button_back")){global.player_[inp.gp][2][1][action.back] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button_back", 0);}
		
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_dive")){global.player_[inp.gp][2][2][action.dive] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_dive", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_jump")){global.player_[inp.gp][2][2][action.jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_double_jump")){global.player_[inp.gp][2][2][action.double_jump] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_double_jump", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_crouch")){global.player_[inp.gp][2][2][action.crouch] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_crouch", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_crouch_toggle")){global.player_[inp.gp][2][2][action.crouch_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_sprint")){global.player_[inp.gp][2][2][action.sprint] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_sprint", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_sprint_toggle")){global.player_[inp.gp][2][2][action.sprint_toggle] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_left")){global.player_[inp.gp][2][2][action.left] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_left", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_right")){global.player_[inp.gp][2][2][action.right] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_right", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_down")){global.player_[inp.gp][2][2][action.down] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_down", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_up")){global.player_[inp.gp][2][2][action.up] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_up", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_tongue")){global.player_[inp.gp][2][2][action.tongue] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_tongue", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_zoom_in")){global.player_[inp.gp][2][2][action.zoom_in] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_zoom_out")){global.player_[inp.gp][2][2][action.zoom_out] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_zoom_out", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_accept")){global.player_[inp.gp][2][2][action.accept] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_accept", 0);}
		if (ini_key_exists("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_back")){global.player_[inp.gp][2][2][action.back] = ini_read_real("player2_profile" + string(global.player2_profile), "player2_gamepad_button2_back", 0);}
		#endregion /* Load Player 2 Gamepad Remapping END */
		
		#region /* Load Player 3 Gamepad Remapping */
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_dive")){global.player_[inp.gp][3][1][action.dive] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_dive", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_jump")){global.player_[inp.gp][3][1][action.jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_double_jump")){global.player_[inp.gp][3][1][action.double_jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_double_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_crouch")){global.player_[inp.gp][3][1][action.crouch] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_crouch", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_crouch_toggle")){global.player_[inp.gp][3][1][action.crouch_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_sprint")){global.player_[inp.gp][3][1][action.sprint] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_sprint", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_sprint_toggle")){global.player_[inp.gp][3][1][action.sprint_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_left")){global.player_[inp.gp][3][1][action.left] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_left", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_right")){global.player_[inp.gp][3][1][action.right] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_right", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_down")){global.player_[inp.gp][3][1][action.down] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_down", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_up")){global.player_[inp.gp][3][1][action.up] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_up", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_tongue")){global.player_[inp.gp][3][1][action.tongue] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_tongue", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_zoom_in")){global.player_[inp.gp][3][1][action.zoom_in] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_zoom_out")){global.player_[inp.gp][3][1][action.zoom_out] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_accept")){global.player_[inp.gp][3][1][action.accept] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_accept", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button_back")){global.player_[inp.gp][3][1][action.back] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button_back", 0);}
		
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_dive")){global.player_[inp.gp][3][2][action.dive] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_dive", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_jump")){global.player_[inp.gp][3][2][action.jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_double_jump")){global.player_[inp.gp][3][2][action.double_jump] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_double_jump", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_crouch")){global.player_[inp.gp][3][2][action.crouch] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_crouch", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_crouch_toggle")){global.player_[inp.gp][3][2][action.crouch_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_sprint")){global.player_[inp.gp][3][2][action.sprint] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_sprint", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_sprint_toggle")){global.player_[inp.gp][3][2][action.sprint_toggle] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_left")){global.player_[inp.gp][3][2][action.left] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_left", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_right")){global.player_[inp.gp][3][2][action.right] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_right", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_down")){global.player_[inp.gp][3][2][action.down] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_down", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_up")){global.player_[inp.gp][3][2][action.up] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_up", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_tongue")){global.player_[inp.gp][3][2][action.tongue] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_tongue", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_zoom_in")){global.player_[inp.gp][3][2][action.zoom_in] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_zoom_out")){global.player_[inp.gp][3][2][action.zoom_out] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_zoom_out", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_accept")){global.player_[inp.gp][3][2][action.accept] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_accept", 0);}
		if (ini_key_exists("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_back")){global.player_[inp.gp][3][2][action.back] = ini_read_real("player3_profile" + string(global.player3_profile), "player3_gamepad_button2_back", 0);}
		#endregion /* Load Player 3 Gamepad Remapping END */
		
		#region /* Load Player 4 Gamepad Remapping */
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_dive")){global.player_[inp.gp][4][1][action.dive] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_dive", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_jump")){global.player_[inp.gp][4][1][action.jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_double_jump")){global.player_[inp.gp][4][1][action.double_jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_double_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_crouch")){global.player_[inp.gp][4][1][action.crouch] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_crouch", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_crouch_toggle")){global.player_[inp.gp][4][1][action.crouch_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_crouch_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_sprint")){global.player_[inp.gp][4][1][action.sprint] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_sprint", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_sprint_toggle")){global.player_[inp.gp][4][1][action.sprint_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_sprint_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_left")){global.player_[inp.gp][4][1][action.left] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_left", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_right")){global.player_[inp.gp][4][1][action.right] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_right", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_down")){global.player_[inp.gp][4][1][action.down] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_down", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_up")){global.player_[inp.gp][4][1][action.up] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_up", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_tongue")){global.player_[inp.gp][4][1][action.tongue] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_tongue", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_zoom_in")){global.player_[inp.gp][4][1][action.zoom_in] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_zoom_in", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_zoom_out")){global.player_[inp.gp][4][1][action.zoom_out] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_zoom_out", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_accept")){global.player_[inp.gp][4][1][action.accept] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_accept", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button_back")){global.player_[inp.gp][4][1][action.back] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button_back", 0);}
		
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_dive")){global.player_[inp.gp][4][2][action.dive] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_dive", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_jump")){global.player_[inp.gp][4][2][action.jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_double_jump")){global.player_[inp.gp][4][2][action.double_jump] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_double_jump", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_crouch")){global.player_[inp.gp][4][2][action.crouch] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_crouch", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_crouch_toggle")){global.player_[inp.gp][4][2][action.crouch_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_crouch_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_sprint")){global.player_[inp.gp][4][2][action.sprint] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_sprint", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_sprint_toggle")){global.player_[inp.gp][4][2][action.sprint_toggle] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_sprint_toggle", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_left")){global.player_[inp.gp][4][2][action.left] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_left", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_right")){global.player_[inp.gp][4][2][action.right] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_right", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_down")){global.player_[inp.gp][4][2][action.down] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_down", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_up")){global.player_[inp.gp][4][2][action.up] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_up", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_tongue")){global.player_[inp.gp][4][2][action.tongue] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_tongue", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_zoom_in")){global.player_[inp.gp][4][2][action.zoom_in] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_zoom_in", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_zoom_out")){global.player_[inp.gp][4][2][action.zoom_out] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_zoom_out", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_accept")){global.player_[inp.gp][4][2][action.accept] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_accept", 0);}
		if (ini_key_exists("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_back")){global.player_[inp.gp][4][2][action.back] = ini_read_real("player4_profile" + string(global.player4_profile), "player4_gamepad_button2_back", 0);}
		#endregion /* Load Player 4 Gamepad Remapping END */
		
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	}
}