function scr_config_save()
{
	ini_open(working_directory + "save_file/config.ini");
	
	ini_write_real("config", "current_file", global.file);
	ini_write_real("config", "difficulty", global.difficulty);
	if (global.difficulty != 1)
	{
		global.enable_difficutly_layers_in_level_editor = true;
		ini_write_real("config", "enable_difficutly_layers_in_level_editor", true);
	}
	ini_write_real("config", "automatically_pause_when_window_is_unfocused", global.automatically_pause_when_window_is_unfocused);
	ini_write_real("config", "show_timer", global.show_timer);
	ini_write_real("config", "show_defeats_counter", global.show_defeats_counter);
	ini_write_real("config", "show_ranks", global.show_ranks);
	ini_write_real("config", "assist_enable", global.assist_enable);
	ini_write_real("config", "assist_enable_enemies", global.assist_enable_enemies);
	ini_write_real("config", "assist_enable_spikes", global.assist_enable_spikes);
	ini_write_real("config", "narrator", global.narrator);
	ini_write_real("config", "show_tutorial_signs", global.show_tutorial_signs);
	ini_write_real("config", "show_new_items_notification", global.show_new_items_notification);
	ini_write_real("config", "hud_hide_time", global.hud_hide_time);
	ini_write_real("config", "select_font", global.selected_font);
	ini_write_real("config", "players_can_collide", global.players_can_collide);
	
	#region /* Assist Settings */
	ini_write_real("config", "assist_enable", global.assist_enable);
	ini_write_real("config", "assist_item_appear", global.assist_item_appear);
	ini_write_real("config", "assist_extra_hp", global.assist_extra_hp);
	ini_write_real("config", "assist_invincible", global.assist_invincible);
	ini_write_real("config", "assist_breathe_underwater", global.assist_breathe_underwater);
	ini_write_real("config", "assist_guiding_arrows", global.assist_guiding_arrows);
	ini_write_real("config", "assist_normal_arrows", global.assist_normal_arrows);
	ini_write_real("config", "assist_show_assist_mode_text", global.assist_show_assist_mode_text);
	#endregion /* Assist Settings END */
	
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_write_real("config", "interpolate", global.interpolate);
	ini_write_real("config", "show_fps", global.show_fps);
	ini_write_real("config", "show_fps_real", global.show_fps_real);
	ini_write_real("config", "show_instance_count", global.show_instance_count);
	ini_write_real("config", "show_collision_mask", global.show_collision_mask);
	ini_write_real("config", "volume_main", global.volume_main * 10000);
	ini_write_real("config", "volume_music", global.volume_music * 10000);
	ini_write_real("config", "volume_melody", global.volume_melody * 10000);
	ini_write_real("config", "volume_sound", global.volume_sound * 10000);
	ini_write_real("config", "volume_ambient", global.volume_ambient * 10000);
	ini_write_real("config", "volume_footstep", global.volume_footstep * 10000);
	ini_write_real("config", "volume_voices", global.volume_voice * 10000);
	ini_write_real("config", "background_brightness_gameplay", global.background_brightness_gameplay * 10000);
	ini_write_real("config", "background_brightness_menu", global.background_brightness_menu * 10000);
	ini_write_real("config", "enable_background_layer1", global.enable_background_layer1);
	ini_write_real("config", "enable_background_layer2", global.enable_background_layer2);
	ini_write_real("config", "enable_background_layer3", global.enable_background_layer3);
	ini_write_real("config", "enable_background_layer4", global.enable_background_layer4);
	ini_write_real("config", "enable_foreground_layer1", global.enable_foreground_layer1);
	ini_write_real("config", "enable_foreground_layer_1_5", global.enable_foreground_layer_1_5);
	ini_write_real("config", "enable_foreground_layer2", global.enable_foreground_layer2);
	ini_write_real("config", "enable_foreground_layer_secret", global.enable_foreground_layer_secret);
	ini_write_real("config", "enable_transitions", global.enable_transitions);
	ini_write_real("config", "button_design_color", global.button_design_color);
	ini_write_real("config", "button_design_shape", global.button_design_shape);
	ini_write_real("config", "button_design_transparency", global.button_design_transparency);
	ini_write_real("config", "menu_button_subimg", global.menu_button_subimg);
	if (global.selected_resource_pack <= -1)
	{
		global.selected_resource_pack = 0;
	}
	ini_write_real("config", "select_resource_pack", global.selected_resource_pack);
	
	#region /* Save Custom Title Background */
	if (global.selected_title_background[1] <= -2){global.selected_title_background[1] = -1;}
	if (global.selected_title_background[2] <= -2){global.selected_title_background[2] = -1;}
	if (global.selected_title_background[3] <= -2){global.selected_title_background[3] = -1;}
	ini_write_real("config", "select_title_background1", global.selected_title_background[1]);
	ini_write_real("config", "title_background_scale1", global.title_background_scale[1]);
	ini_write_real("config", "background_layer_x_scroll1", global.background_layer_x_scroll[1]);
	ini_write_real("config", "background_layer_y_scroll1", global.background_layer_y_scroll[1]);
	
	ini_write_real("config", "select_title_background2", global.selected_title_background[2]);
	ini_write_real("config", "title_background_scale2", global.title_background_scale[2]);
	ini_write_real("config", "background_layer_x_scroll2", global.background_layer_x_scroll[2]);
	ini_write_real("config", "background_layer_y_scroll2", global.background_layer_y_scroll[2]);
	
	ini_write_real("config", "select_title_background3", global.selected_title_background[3]);
	ini_write_real("config", "title_background_scale3", global.title_background_scale[3]);
	ini_write_real("config", "background_layer_x_scroll3", global.background_layer_x_scroll[3]);
	ini_write_real("config", "background_layer_y_scroll3", global.background_layer_y_scroll[3]);
	#endregion /* Save Custom Title Background END */
	
	if (global.selected_title_logo <= -1)
	{
		global.selected_title_logo = 0;
	}
	ini_write_real("config", "select_title_logo", global.selected_title_logo);
	ini_write_real("config", "can_load_custom_level_assets", global.can_load_custom_level_assets);
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world_map", global.zoom_world_map);
	ini_write_real("config", "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
	ini_write_real("config", "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
	ini_write_real("config", "resolution_setting", global.resolution_setting);
	ini_write_real("config", "gui_scale_modifier", global.gui_scale_modifier);
	ini_write_real("config", "language_localization", global.language_localization);
	ini_write_real("config", "chosen_controller_used1", global.chosen_controller_used[1]);
	ini_write_real("config", "chosen_controller_used2", global.chosen_controller_used[2]);
	ini_write_real("config", "chosen_controller_used3", global.chosen_controller_used[3]);
	ini_write_real("config", "chosen_controller_used4", global.chosen_controller_used[4]);
	ini_write_real("config", "show_prompt_when_changing_to_gamepad", global.show_prompt_when_changing_to_gamepad);
	ini_write_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", global.show_prompt_when_changing_to_keyboard_and_mouse);
	ini_write_real("config", "always_show_gamepad_buttons", global.always_show_gamepad_buttons);
	
	#region /* Save Player 1 Keyboard Remapping */
	ini_write_real("config", "character_index_player1", global.character_index[0]);
	ini_write_real("config", "skin_for_player1", global.actual_skin_for_player[1]);
	ini_write_string("config", "player1_name", global.player_name[1]);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_up_is_also_jump", global.player1_up_is_also_jump);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_double_tap_to_run", global.player1_double_tap_to_run);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_run_toggle", global.player1_run_toggle);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_double_tap_to_dive", global.player1_double_tap_to_dive);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_jump_or_dive_button", global.player1_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_cancel_dive_by_pressing_opposite_direction", global.player1_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_down_and_jump_to_groundpound", global.player1_down_and_jump_to_groundpound);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_wall_jump_setting", global.player1_wall_jump_setting);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_drop_from_rope", global.player1_drop_from_rope);
	ini_write_real("player1_profile" + string(global.player1_profile), "player1_show_controls", global.player_show_controls[1]);
	#endregion /* Save Player 1 Keyboard Remapping END */
	
	#region /* Save Player 2 Keyboard Remapping */
	ini_write_real("config", "character_index_player2", global.character_index[1]);
	ini_write_real("config", "skin_for_player2", global.actual_skin_for_player[2]);
	ini_write_string("config", "player2_name", global.player_name[2]);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_up_is_also_jump", global.player2_up_is_also_jump);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_double_tap_to_run", global.player2_double_tap_to_run);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_run_toggle", global.player2_run_toggle);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_double_tap_to_dive", global.player2_double_tap_to_dive);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_jump_or_dive_button", global.player2_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_cancel_dive_by_pressing_opposite_direction", global.player2_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_down_and_jump_to_groundpound", global.player2_down_and_jump_to_groundpound);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_wall_jump_setting", global.player2_wall_jump_setting);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_drop_from_rope", global.player2_drop_from_rope);
	ini_write_real("player2_profile" + string(global.player2_profile), "player2_show_controls", global.player_show_controls[2]);
	#endregion /* Save Player 2 Keyboard Remapping END */
	
	#region /* Save Player 3 Keyboard Remapping */
	ini_write_real("config", "character_index_player3", global.character_index[2]);
	ini_write_real("config", "skin_for_player3", global.actual_skin_for_player[3]);
	ini_write_string("config", "player3_name", global.player_name[3]);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_up_is_also_jump", global.player3_up_is_also_jump);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_double_tap_to_run", global.player3_double_tap_to_run);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_run_toggle", global.player3_run_toggle);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_double_tap_to_dive", global.player3_double_tap_to_dive);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_jump_or_dive_button", global.player3_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_cancel_dive_by_pressing_opposite_direction", global.player3_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_down_and_jump_to_groundpound", global.player3_down_and_jump_to_groundpound);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_wall_jump_setting", global.player3_wall_jump_setting);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_drop_from_rope", global.player3_drop_from_rope);
	ini_write_real("player3_profile" + string(global.player3_profile), "player3_show_controls", global.player_show_controls[3]);
	#endregion /* Save Player 3 Keyboard Remapping END */
	
	#region /* Save Player 4 Keyboard Remapping */
	ini_write_real("config", "character_index_player4", global.character_index[3]);
	ini_write_real("config", "skin_for_player4", global.actual_skin_for_player[4]);
	ini_write_string("config", "player4_name", global.player_name[4]);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_up_is_also_jump", global.player4_up_is_also_jump);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_double_tap_to_run", global.player4_double_tap_to_run);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_run_toggle", global.player4_run_toggle);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_double_tap_to_dive", global.player4_double_tap_to_dive);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_jump_or_dive_button", global.player4_cancel_dive_by_pressing_jump_or_dive_button);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_cancel_dive_by_pressing_opposite_direction", global.player4_cancel_dive_by_pressing_opposite_direction);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_down_and_jump_to_groundpound", global.player4_down_and_jump_to_groundpound);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_wall_jump_setting", global.player4_wall_jump_setting);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_drop_from_rope", global.player4_drop_from_rope);
	ini_write_real("player4_profile" + string(global.player4_profile), "player4_show_controls", global.player4_show_controls);
	#endregion /* Save Player 4 Keyboard Remapping END */
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
}