depth = 20;
image_speed = 0;
mask_index = spr_checkpoint;
checkpoint_number = 1; /* Tell the player which checkpoint they're activating */
checkpoint_max_number = 1; /* Tell the player how many checkpoints exist in the level */
item_inside = 0;
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
checkpoint_what_player = 1;
if (room == rm_leveleditor)
&& (global.actually_play_edited_level)
&& (!global.big_collectible_test_override && !global.doing_clear_check_level && !global.doing_clear_check_character)
{
	var level_name = scr_level_progress_section();

	ini_open(scr_level_progress_path());
	checkpoint_what_player = ini_read_real(level_name, "checkpoint_what_player", 1);
	ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
}
#endregion /* Load Level Editor Checkpoint END */

alarm[0] = 2;
