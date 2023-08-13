function menu_dropdown_variable_to_change(variable_to_change, change_to_value)
{
	if (menu == "assist_item_appear")
	&& (variable_to_change = global.assist_item_appear)
	{
		global.assist_item_appear = change_to_value;
	}
	else
	if (menu == "assist_extra_hp")
	&& (variable_to_change = global.assist_extra_hp)
	{
		global.assist_extra_hp = change_to_value;
	}
	else
	if (menu == "remap_select_player")
	&& (variable_to_change = remapping_player)
	{
		remapping_player = change_to_value;
		if (global.sprite_select_player[change_to_value + 1] == noone)
		{
			character_portrait_for_player_update_directory[change_to_value + 1] = true
			alarm[0] = true;
		}
	}
	else
	if (menu == "remap_select_profile")
	&& (variable_to_change = global.player1_profile)
	{
		scr_config_save();
		global.player1_profile = change_to_value;
		ini_open(working_directory + "config.ini");
		if (!ini_section_exists("player1_profile" + string(change_to_value)))
		{
			scr_set_default_remapping_player1_gamepad(true);
			scr_set_default_remapping_player1_keyboard(true);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		scr_config_load();
	}
	else
	if (menu == "remap_select_profile")
	&& (variable_to_change = global.player2_profile)
	{
		scr_config_save();
		global.player2_profile = change_to_value;
		ini_open(working_directory + "config.ini");
		if (!ini_section_exists("player2_profile" + string(change_to_value)))
		{
			scr_set_default_remapping_player2_gamepad(true);
			scr_set_default_remapping_player2_keyboard(true);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		scr_config_load();
	}
	else
	if (menu == "remap_select_profile")
	&& (variable_to_change = global.player3_profile)
	{
		scr_config_save();
		global.player3_profile = change_to_value;
		ini_open(working_directory + "config.ini");
		if (!ini_section_exists("player3_profile" + string(change_to_value)))
		{
			scr_set_default_remapping_player3_gamepad(true);
			scr_set_default_remapping_player3_keyboard(true);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		scr_config_load();
	}
	else
	if (menu == "remap_select_profile")
	&& (variable_to_change = global.player4_profile)
	{
		scr_config_save();
		global.player4_profile = change_to_value;
		ini_open(working_directory + "config.ini");
		if (!ini_section_exists("player4_profile" + string(change_to_value)))
		{
			scr_set_default_remapping_player4_gamepad(true);
			scr_set_default_remapping_player4_keyboard(true);
		}
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		scr_config_load();
	}
	else
	if (menu == "wall_jump_setting")
	&& (variable_to_change = global.player1_wall_jump_setting)
	&& (remapping_player == 0)
	{
		global.player1_wall_jump_setting = change_to_value;
	}
	else
	if (menu == "wall_jump_setting")
	&& (variable_to_change = global.player2_wall_jump_setting)
	&& (remapping_player == 1)
	{
		global.player2_wall_jump_setting = change_to_value;
	}
	else
	if (menu == "wall_jump_setting")
	&& (variable_to_change = global.player3_wall_jump_setting)
	&& (remapping_player == 2)
	{
		global.player3_wall_jump_setting = change_to_value;
	}
	else
	if (menu == "wall_jump_setting")
	&& (variable_to_change = global.player4_wall_jump_setting)
	&& (remapping_player == 3)
	{
		global.player4_wall_jump_setting = change_to_value;
	}
	else
	if (menu == "show_controls")
	&& (variable_to_change = global.player1_show_controls)
	&& (remapping_player == 0)
	{
		global.player1_show_controls = change_to_value;
	}
	else
	if (menu == "show_controls")
	&& (variable_to_change = global.player2_show_controls)
	&& (remapping_player == 1)
	{
		global.player2_show_controls = change_to_value;
	}
	else
	if (menu == "show_controls")
	&& (variable_to_change = global.player3_show_controls)
	&& (remapping_player == 2)
	{
		global.player3_show_controls = change_to_value;
	}
	else
	if (menu == "show_controls")
	&& (variable_to_change = global.player4_show_controls)
	&& (remapping_player == 3)
	{
		global.player4_show_controls = change_to_value;
	}
	else
	if (menu == "chosen_controller_used")
	&& (variable_to_change = global.chosen_controller_used)
	{
		global.chosen_controller_used = change_to_value;
	}
	else
	if (menu == "difficulty_settings")
	&& (variable_to_change = global.difficulty)
	{
		global.difficulty = change_to_value;
	}
	else
	if (menu == "hud_hide_time")
	&& (variable_to_change = global.hud_hide_time)
	{
		global.hud_hide_time = change_to_value;
	}
	else
	if (menu == "number_of_audio_channels")
	&& (variable_to_change = global.number_of_audio_channels)
	{
		global.number_of_audio_channels = change_to_value;
	}
	else
	if (menu == "selected_level_editing_music")
	&& (variable_to_change = global.selected_level_editing_music)
	{
		global.selected_level_editing_music = change_to_value;
	}
	else
	if (menu == "gui_scale_modifier")
	&& (variable_to_change = global.gui_scale_modifier)
	{
		global.gui_scale_modifier = change_to_value;
	}
	else
	if (menu == "intended_level_difficulty")
	&& (variable_instance_exists(self, "intended_level_difficulty"))
	&& (variable_to_change = intended_level_difficulty)
	{
		intended_level_difficulty = change_to_value;
	}
	else
	if (menu == "selected_font")
	&& (variable_to_change = global.selected_font)
	{
		global.selected_font = change_to_value;
		scr_set_font();
	}
	else
	if (menu == "customize_button_design_transparency")
	&& (variable_to_change = global.button_design_transparency)
	{
		global.button_design_transparency = change_to_value;
	}
	else
	if (menu == "customize_button_design_shape")
	&& (variable_to_change = global.button_design_shape)
	{
		global.button_design_shape = change_to_value;
	}
	else
	if (menu == "customize_button_design_color")
	&& (variable_to_change = global.button_design_color)
	{
		global.button_design_color = change_to_value;
	}
}