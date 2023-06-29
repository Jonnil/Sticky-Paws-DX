#region /* If a unavailable skin is selected, then go to the last selectable skin for each player */
if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1]) + "/mask.png"))
&& (!file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1]) + "/mask.png"))
&& (global.skin_for_player[1] > 0)
{
	var what_player = 1;
	
	menu_delay = 3;
	global.skin_for_player[1] --;
	
	#region /* Player 1 character select portrait sprite */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1]) + "/mask.png"))
	|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1]) + "/mask.png"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/data/character_config.ini"))
		{
			character_folder[what_player] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		else
		{
			character_folder[what_player] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
	
		if (file_exists(string(character_folder[what_player]) + "/sprites/skin" + string(global.skin_for_player[what_player]) + "/mask.png"))
		{
			skin_folder = "/skin" + string(global.skin_for_player[what_player]) + "/";
		}
		else
		{
			skin_folder = "/";
		}
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[what_player] = spr_noone;
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
		global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 1 character select portrait sprite END */
	
}

if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2]) + "/mask.png"))
&& (!file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2]) + "/mask.png"))
&& (global.skin_for_player[2] > 0)
{
	var what_player = 2;
	
	menu_delay = 3;
	global.skin_for_player[2] --;
	
	#region /* Player 2 character select portrait sprite */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2]) + "/mask.png"))
	|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2]) + "/mask.png"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/data/character_config.ini"))
		{
			character_folder[what_player] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		else
		{
			character_folder[what_player] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		
		if (file_exists(string(character_folder[what_player]) + "/sprites/skin" + string(global.skin_for_player[what_player]) + "/mask.png"))
		{
			skin_folder = "/skin" + string(global.skin_for_player[what_player]) + "/";
		}
		else
		{
			skin_folder = "/";
		}
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[what_player] = spr_noone;
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
		global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 2 character select portrait sprite END */
	
}

if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3]) + "/mask.png"))
&& (!file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3]) + "/mask.png"))
&& (global.skin_for_player[3] > 0)
{
	var what_player = 3;
	
	menu_delay = 3;
	global.skin_for_player[3] --;
	
	#region /* Player 3 character select portrait sprite */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3]) + "/mask.png"))
	|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3]) + "/mask.png"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/data/character_config.ini"))
		{
			character_folder[what_player] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		else
		{
			character_folder[what_player] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		
		if (file_exists(string(character_folder[what_player]) + "/sprites/skin" + string(global.skin_for_player[what_player]) + "/mask.png"))
		{
			skin_folder = "/skin" + string(global.skin_for_player[what_player]) + "/";
		}
		else
		{
			skin_folder = "/";
		}
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[what_player] = spr_noone;
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
		global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 3 character select portrait sprite END */
	
}

if (!file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4]) + "/mask.png"))
&& (!file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4]) + "/mask.png"))
&& (global.skin_for_player[4] > 0)
{
	var what_player = 4;
	
	menu_delay = 3;
	global.skin_for_player[4] --;
	
	#region /* Player 4 character select portrait sprite */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4]) + "/mask.png"))
	|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4]) + "/mask.png"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1])) + "/data/character_config.ini"))
		{
			character_folder[what_player] = "characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		else
		{
			character_folder[what_player] = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[what_player - 1]));
		}
		
		if (file_exists(string(character_folder[what_player]) + "/sprites/skin" + string(global.skin_for_player[what_player]) + "/mask.png"))
		{
			skin_folder = "/skin" + string(global.skin_for_player[what_player]) + "/";
		}
		else
		{
			skin_folder = "/";
		}
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[what_player] = spr_noone;
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("stand", global.sprite_select_player[what_player], character_folder[what_player]);
		global.sprite_player_stand[what_player] = global.sprite_select_player[what_player];
		global.sprite_select_player[what_player] = scr_initialize_custom_character_sprite("character_select_portrait", global.sprite_select_player[what_player], character_folder[what_player]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 4 character select portrait sprite END */
	
}
#endregion /* If a unavailable skin is selected, then go to the last selectable skin for each player END */

#region /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player */
var player_count = 4;
var voicepack_array = [
	global.voicepack_for_player[1],
	global.voicepack_for_player[2],
	global.voicepack_for_player[3],
	global.voicepack_for_player[4]
];
var character_index, voicepack_variable;

for (var i = 0; i < player_count; i++)
{
	character_index = global.character_index[i];
	voicepack_variable = voicepack_array[i];
	
	var file_path = "characters/" + string(ds_list_find_value(global.all_loaded_characters, character_index)) + "/sound/voicepack" + string(voicepack_variable) + "/jump.ogg";
	var custom_file_path = working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, character_index)) + "/sound/voicepack" + string(voicepack_variable) + "/jump.ogg";
	
	if (!file_exists(file_path) && !file_exists(custom_file_path) && voicepack_variable > 0)
	{
		menu_delay = 3;
		voicepack_variable --;
	}
	
	voicepack_array[i] = voicepack_variable;
}

global.voicepack_for_player[1] = voicepack_array[0];
global.voicepack_for_player[2] = voicepack_array[1];
global.voicepack_for_player[3] = voicepack_array[2];
global.voicepack_for_player[4] = voicepack_array[3];
#endregion /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player END */