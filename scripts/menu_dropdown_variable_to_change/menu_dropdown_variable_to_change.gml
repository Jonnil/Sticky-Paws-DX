function menu_dropdown_variable_to_change(variable_to_change, change_to_value)
{
	if (menu == "assist_item_appear")
	&& (variable_to_change == global.assist_item_appear)
	{
		global.assist_item_appear = change_to_value;
	}
	else
	if (menu == "assist_extra_hp")
	&& (variable_to_change == global.assist_extra_hp)
	{
		global.assist_extra_hp = change_to_value;
	}
	else
	if (menu == "remap_select_profile")
	&& (variable_to_change == global.player_profile[remapping_player + 1])
	{
		if (global.settings_sidebar_menu == "controller_settings")
		{
			var key_or_gamepad = 1;
		}
		else
		{
			var key_or_gamepad = 0;
		}
		scr_save_player_control_profile(remapping_player + 1, key_or_gamepad);
		global.player_profile[remapping_player + 1] = change_to_value;
		scr_set_default_remapping_player_gamepad(remapping_player + 1, false);
		scr_set_default_remapping_player_keyboard(remapping_player + 1, false);
		scr_config_load();
	}
	else
	if (menu == "wall_jump_setting")
	&& (variable_to_change == global.player_wall_jump_setting[remapping_player + 1])
	{
		global.player_wall_jump_setting[remapping_player + 1] = change_to_value;
	}
	else
	if (menu == "show_controls")
	&& (variable_to_change == global.player_show_controls[remapping_player + 1])
	{
		global.player_show_controls[remapping_player + 1] = change_to_value;
	}
	else
	if (menu == "chosen_controller_used")
	&& (variable_to_change == global.chosen_controller_used[remapping_player + 1])
	{
		global.chosen_controller_used[remapping_player + 1] = change_to_value;
		set_controller_sprites_to_use();
	}
	else
	if (menu == "difficulty_settings")
	&& (variable_to_change == global.difficulty)
	{
		global.difficulty = change_to_value;
	}
	else
	if (menu == "hud_hide_time")
	&& (variable_to_change == global.hud_hide_time)
	{
		global.hud_hide_time = change_to_value;
	}
	else
	if (menu == "number_of_audio_channels")
	&& (variable_to_change == global.number_of_audio_channels)
	{
		global.number_of_audio_channels = change_to_value;
	}
	else
	if (menu == "select_level_editing_music")
	&& (variable_to_change == global.selected_level_editing_music)
	{
		global.selected_level_editing_music = change_to_value;
	}
	else
	if (menu == "gui_scale_modifier")
	&& (variable_to_change == global.gui_scale_modifier)
	{
		global.gui_scale_modifier = change_to_value;
	}
	else
	if (menu == "intended_level_difficulty")
	&& (variable_instance_exists(self, "intended_level_difficulty"))
	&& (variable_to_change == intended_level_difficulty)
	{
		intended_level_difficulty = change_to_value;
	}
	else
	if (menu == "select_font")
	&& (variable_to_change == global.selected_font)
	{
		global.selected_font = change_to_value;
		scr_set_font();
	}
	else
	if (menu == "customize_button_design_transparency")
	&& (variable_to_change == global.button_design_transparency)
	{
		global.button_design_transparency = change_to_value;
	}
	else
	if (menu == "customize_button_design_shape")
	&& (variable_to_change == global.button_design_shape)
	{
		global.button_design_shape = change_to_value;
	}
	else
	if (menu == "customize_button_design_color")
	&& (variable_to_change == global.button_design_color)
	{
		global.button_design_color = change_to_value;
	}
	else
	if (menu == "resolution_setting")
	&& (variable_to_change == global.resolution_setting)
	{
		global.resolution_setting = change_to_value;

		/* Resolution Current Display Size */
		if (global.resolution_setting == 0){display_set_gui_size(display_get_width(), display_get_height());window_set_size(display_get_width(), display_get_height());}else
		if (global.resolution_setting == 1){display_set_gui_size(1920, 1080);window_set_size(1920, 1080);}else
		if (global.resolution_setting == 2){display_set_gui_size(1600, 900);window_set_size(1600, 900);}else
		if (global.resolution_setting == 3){display_set_gui_size(1280, 720);window_set_size(1280, 720);}else
		if (global.resolution_setting == 4){display_set_gui_size(1024, 576);window_set_size(1024, 576);}else
		if (global.resolution_setting == 5){display_set_gui_size(960, 540);window_set_size(960, 540);}else
		if (global.resolution_setting == 6){display_set_gui_size(480, 270);window_set_size(480, 270);}
	}
	else
	if (menu == "upload_edit_development_stage")
	&& (variable_to_change == development_stage_index)
	{
		development_stage_index = change_to_value;
		ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		ini_write_real("info", "development_stage_index", development_stage_index);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	else
	if (menu == "upload_edit_visibility")
	&& (variable_to_change == visibility_index)
	{
		visibility_index = change_to_value;
		thumbnail_level_unlisted[global.select_level_index] = visibility_index;
		ini_open(game_save_id + "custom_levels/" + string(global.level_name) + "/data/level_information.ini");
		ini_write_real("info", "visibility_index", visibility_index);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	else
	if (menu == "upload_character_edit_visibility")
	&& (variable_to_change == visibility_index)
	{
		visibility_index = change_to_value;
		var fixed_player = 1;
		var character_name = string(ds_list_find_value(global.all_loaded_characters, global.character_index[fixed_player - 1]))
		ini_open(game_save_id + "custom_characters/" + string(character_name) + "/data/character_config.ini");
		ini_write_real("info", "visibility_index", visibility_index);
		ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
	}
	else
	if (menu == "language_auto_update")
	&& (variable_to_change == global.language_auto_update_interval)
	{
		global.language_auto_update_interval = change_to_value;
	}
}
