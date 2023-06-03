depth = 10;
image_speed = 0;
mask_index = spr_checkpoint;
get_rewards_cooldown = 10;
checkpoint_number = 1; /* Tell the player which checkpoint they're activating */
checkpoint_number_max = 1; /* Tell the player how many checkpoints exist in the level */
if (global.checkpoint_x == xstart)
&& (global.checkpoint_y == ystart)
{
	checkpoint_activated = true;
}
else
{
	checkpoint_activated = false;
}

#region /* Load Level Editor Checkpoint */
if (asset_get_type("room_leveleditor") == asset_room)
&& (room == room_leveleditor)
&& (global.character_select_in_this_menu == "main_game")
&& (global.actually_play_edited_level)
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
					
	ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
	checkpoint_which_player = ini_read_real(level_name, "checkpoint_which_player", 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
if (asset_get_type("room_leveleditor") == asset_room)
&& (room == room_leveleditor)
&& (global.character_select_in_this_menu == "level_editor")
&& (global.actually_play_edited_level)
{
	var uppercase_level_name;
	uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 1));
	uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index))) - 1);
	var level_name = string(uppercase_level_name);
					
	ini_open(working_directory + "/save_files/custom_level_save.ini");
	checkpoint_which_player = ini_read_real(level_name, "checkpoint_which_player", 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Load Level Editor Checkpoint END */

alarm[0] = 2;