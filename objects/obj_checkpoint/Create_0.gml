depth = 20;
image_speed = 0;
mask_index = spr_checkpoint;
checkpoint_number = 1; /* Tell the player which checkpoint they're activating */
checkpoint_max_number = 1; /* Tell the player how many checkpoints exist in the level */
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
if (room == rm_leveleditor)
&& (global.character_select_in_this_menu == "main_game")
&& (global.actually_play_edited_level)
{
	var level_name = global.level_name;
					
	ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
	checkpoint_what_player = ini_read_real(level_name, "checkpoint_what_player", 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
else
if (room == rm_leveleditor)
&& (global.actually_play_edited_level)
{
	var level_name = global.level_name;
					
	ini_open(game_save_id + "save_file/custom_level_save.ini");
	checkpoint_what_player = ini_read_real(level_name, "checkpoint_what_player", 1);
	ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
}
#endregion /* Load Level Editor Checkpoint END */

alarm[0] = 2;