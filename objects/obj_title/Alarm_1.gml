#region /* If a unavailable skin is selected, then go to the last selectable skin for each player */
if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1])))
and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1])))
and (global.skin_for_player[1] > 0)
{
	menu_delay = 3;
	global.skin_for_player[1] -= 1;
	
	#region /* Player 1 character select portrait sprite */
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1])))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[0])) + "/sprites/skin" + string(global.skin_for_player[1])))
	{
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[1] = spr_noone;
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[1], 0, global.skin_for_player[1]);
		global.sprite_select_player[1] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[1], 0, global.skin_for_player[1]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 1 character select portrait sprite END */
	
}

if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2])))
and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2])))
and (global.skin_for_player[2] > 0)
{
	menu_delay = 3;
	global.skin_for_player[2] -= 1;
	
	#region /* Player 2 character select portrait sprite */
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2])))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[1])) + "/sprites/skin" + string(global.skin_for_player[2])))
	{
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[2] = spr_noone;
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[2], 1, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[2], 1, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[2], 1, global.skin_for_player[2]);
		global.sprite_select_player[2] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[2], 1, global.skin_for_player[2]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 2 character select portrait sprite END */
	
}

if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3])))
and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3])))
and (global.skin_for_player[3] > 0)
{
	menu_delay = 3;
	global.skin_for_player[3] -= 1;
	
	#region /* Player 3 character select portrait sprite */
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3])))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[2])) + "/sprites/skin" + string(global.skin_for_player[3])))
	{
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[3] = spr_noone;
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[3], 2, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[3], 2, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[3], 2, global.skin_for_player[3]);
		global.sprite_select_player[3] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[3], 2, global.skin_for_player[3]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 3 character select portrait sprite END */
	
}

if (!directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4])))
and (!directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4])))
and (global.skin_for_player[4] > 0)
{
	menu_delay = 3;
	global.skin_for_player[4] -= 1;
	
	#region /* Player 4 character select portrait sprite */
	if (directory_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4])))
	or (directory_exists(working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.character_index[3])) + "/sprites/skin" + string(global.skin_for_player[4])))
	{
		/* Don't update "actual skin for player" here, because it will save what skin you're supposed to have with other characters, so it doesn't change unintentinally for the player */
		global.sprite_select_player[4] = spr_noone;
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("walk", global.sprite_select_player[4], 3, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("idle", global.sprite_select_player[4], 3, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("stand", global.sprite_select_player[4], 3, global.skin_for_player[4]);
		global.sprite_select_player[4] = scr_initialize_custom_character_select_sprite("character_select_portrait", global.sprite_select_player[4], 3, global.skin_for_player[4]);
	}
	else
	{
		alarm[1] = 1;
	}
	#endregion /* Player 4 character select portrait sprite END */
	
}
#endregion /* If a unavailable skin is selected, then go to the last selectable skin for each player END */

#region /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player */
var playerCount = 4;
var voicepackArray = [
	global.voicepack_for_player[1],
	global.voicepack_for_player[2],
	global.voicepack_for_player[3],
	global.voicepack_for_player[4]
];
var characterIndex, voicepackVariable;

for (var i = 0; i < playerCount; i++)
{
	characterIndex = global.character_index[i];
	voicepackVariable = voicepackArray[i];
	
	var directoryPath = "characters/" + string(ds_list_find_value(global.all_loaded_characters, characterIndex)) + "/sound/voicepack" + string(voicepackVariable);
	var customDirectoryPath = working_directory + "/custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, characterIndex)) + "/sound/voicepack" + string(voicepackVariable);
	
	if (!directory_exists(directoryPath) && !directory_exists(customDirectoryPath) && voicepackVariable > 0)
	{
		menu_delay = 3;
		voicepackVariable -= 1;
	}
	
	voicepackArray[i] = voicepackVariable;
}

global.voicepack_for_player[1] = voicepackArray[0];
global.voicepack_for_player[2] = voicepackArray[1];
global.voicepack_for_player[3] = voicepackArray[2];
global.voicepack_for_player[4] = voicepackArray[3];
#endregion /* If a unavailable voice pack is selected, then go to the last selectable voice pack for each player END */