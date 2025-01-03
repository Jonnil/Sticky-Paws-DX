function scr_config_save()
{
	ini_open(game_save_id + "save_file/config.ini");
	
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
	ini_write_real("config", "narrator_selection", global.narrator_selection);
	ini_write_real("config", "show_tutorial_signs", global.show_tutorial_signs);
	ini_write_real("config", "show_new_items_notification", global.show_new_items_notification);
	ini_write_real("config", "hud_hide_time", global.hud_hide_time);
	ini_write_real("config", "select_font", global.selected_font);
	ini_write_real("config", "players_can_collide", global.players_can_collide);
	
	#region /* Assist Settings */
	ini_write_real("config", "assist_enable", global.assist_enable);
	ini_write_real("config", "assist_item_appear", global.assist_item_appear);
	ini_write_real("config", "assist_extra_hp", global.assist_extra_hp);
	ini_write_real("config", "assist_above_1_hp", global.assist_above_1_hp);
	ini_write_real("config", "assist_invincibility", global.assist_invincibility);
	ini_write_real("config", "assist_moonjump", global.assist_moonjump);
	ini_write_real("config", "assist_hover_when_holding_jump", global.assist_hover_when_holding_jump);
	ini_write_real("config", "assist_floor_over_bottomless_pit", global.assist_floor_over_bottomless_pit);
	ini_write_real("config", "assist_breathe_underwater", global.assist_breathe_underwater);
	ini_write_real("config", "assist_guiding_arrows", global.assist_guiding_arrows);
	ini_write_real("config", "assist_normal_arrows", global.assist_normal_arrows);
	#endregion /* Assist Settings END */
	
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_write_real("config", "interpolate", global.interpolate);
	ini_write_real("config", "show_fps", global.show_fps);
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
	ini_write_real("config", "zoom_level", global.zoom_level);
	ini_write_real("config", "zoom_world_map", global.zoom_world_map);
	ini_write_real("config", "reset_level_zoom_when_going_back_to_map", global.reset_level_zoom_when_going_back_to_map);
	ini_write_real("config", "reset_world_map_zoom_when_going_back_to_map", global.reset_world_map_zoom_when_going_back_to_map);
	ini_write_real("config", "draw_text_outline", global.draw_text_outline);
	ini_write_real("config", "resolution_setting", global.resolution_setting);
	ini_write_real("config", "gui_scale_modifier", global.gui_scale_modifier);
	ini_write_real("config", "show_prompt_when_changing_to_gamepad", global.show_prompt_when_changing_to_gamepad);
	ini_write_real("config", "show_prompt_when_changing_to_keyboard_and_mouse", global.show_prompt_when_changing_to_keyboard_and_mouse);
	ini_write_real("config", "always_show_gamepad_buttons", global.always_show_gamepad_buttons);
	
	for(var i = 1; i <= global.max_players; i += 1)
	{
		
		#region /* Save Player Keyboard Remapping */
		ini_write_real("config", "vibration_strength" + string(i), global.vibration_strength[i]);
		ini_write_real("config", "character_index_player" + string(i), global.character_index[i - 1]);
		ini_write_string("config", "player" + string(i) + "_name", global.player_name[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_up_is_also_jump", global.player_up_is_also_jump[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_jump_uses_jump_key", global.player_double_jump_uses_jump_key[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_is_also_crouch", global.player_down_is_also_crouch[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_run", global.player_double_tap_to_run[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_run_toggle", global.player_run_toggle[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_double_tap_to_dive", global.player_double_tap_to_dive[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_jump_or_dive", global.player_cancel_dive_by_jump_or_dive[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_cancel_dive_by_pressing_opposite_direction", global.player_cancel_dive_by_pressing_opposite_direction[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_down_and_jump_to_groundpound", global.player_down_and_jump_to_groundpound[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_wall_jump_setting", global.player_wall_jump_setting[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_drop_from_rope", global.player_drop_from_rope[i]);
		ini_write_real("player" + string(i) + "_profile" + string(global.player_profile[i] + 1), "player" + string(i) + "_show_controls", global.player_show_controls[i]);
		#endregion /* Save Player Keyboard Remapping END */
		
	}
	
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
	
}