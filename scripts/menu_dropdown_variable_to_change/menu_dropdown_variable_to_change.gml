function menu_dropdown_variable_to_change()
{
	var variable_to_change = argument0;
	var change_to_value = argument1;
	
	if (variable_to_change = global.assist_item_appear)
	and (menu = "assist_item_appear")
	{
		global.assist_item_appear = change_to_value;
	}
	else
	if (variable_to_change = global.assist_extra_hp)
	and (menu = "assist_extra_hp")
	{
		global.assist_extra_hp = change_to_value;
	}
	else
	if (variable_to_change = remapping_player)
	and (menu = "remap_select_player")
	{
		remapping_player = change_to_value;
	}
	else
	if (variable_to_change = global.player1_wall_jump_setting)
	and (menu = "wall_jump_setting")
	{
		global.player1_wall_jump_setting = change_to_value;
	}
	else
	if (variable_to_change = global.player2_wall_jump_setting)
	and (menu = "wall_jump_setting")
	{
		global.player2_wall_jump_setting = change_to_value;
	}
	else
	if (variable_to_change = global.player3_wall_jump_setting)
	and (menu = "wall_jump_setting")
	{
		global.player3_wall_jump_setting = change_to_value;
	}
	else
	if (variable_to_change = global.player4_wall_jump_setting)
	and (menu = "wall_jump_setting")
	{
		global.player4_wall_jump_setting = change_to_value;
	}
	else
	if (variable_to_change = global.difficulty)
	and (menu = "difficulty_settings")
	{
		global.difficulty = change_to_value;
	}
	else
	if (variable_to_change = global.hud_hide_time)
	and (menu = "hud_hide_time")
	{
		global.hud_hide_time = change_to_value;
	}
	else
	if (variable_to_change = global.custom_level_load_delay)
	and (menu = "custom_level_load_delay_settings")
	{
		global.custom_level_load_delay = change_to_value;
	}
	else
	if (variable_to_change = global.number_of_audio_channels)
	and (menu = "number_of_audio_channels")
	{
		global.number_of_audio_channels = change_to_value;
	}
}