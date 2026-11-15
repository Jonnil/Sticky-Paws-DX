/* The caller closes this read-only save after reading the selected level section. */
function scr_open_level_checkpoint_save()
{
	ini_open(scr_level_progress_path());
}

function scr_load_level_checkpoint()
{
	if (global.actually_play_edited_level && !global.big_collectible_test_override
	&& !global.doing_clear_check_level && !global.doing_clear_check_character) /* Tests never read normal checkpoints. */
	{

		#region /* Load Level Checkpoint */
		if (global.character_select_in_this_menu == "main_game")
		{
			global.level_name = scr_get_active_official_level_id();
		}
		scr_open_level_checkpoint_save();
		var checkpoint_section = scr_level_progress_section();
		/* A newly chosen color starts its own route, rather than another color's checkpoint. */
		if (global.big_collectible_tiers_enabled
		&& ini_read_real(checkpoint_section, "checkpoint_big_collectible_tier", 0) != global.big_collectible_active_tier)
		{
			global.checkpoint_x = 0;
			global.checkpoint_y = 0;
			global.checkpoint_millisecond = 0;
			global.checkpoint_second = 0;
			global.checkpoint_minute = 0;
			global.checkpoint_realmillisecond = 0;
		}
		else /* Missing entries start fresh rather than borrowing the preceding level's checkpoint. */
		{
			global.checkpoint_x = ini_read_real(checkpoint_section, "checkpoint_x", 0);
			global.checkpoint_y = ini_read_real(checkpoint_section, "checkpoint_y", 0);
			global.checkpoint_millisecond = ini_read_real(checkpoint_section, "checkpoint_millisecond", 0);
			global.checkpoint_second = ini_read_real(checkpoint_section, "checkpoint_second", 0);
			global.checkpoint_minute = ini_read_real(checkpoint_section, "checkpoint_minute", 0);
			global.checkpoint_realmillisecond = ini_read_real(checkpoint_section, "checkpoint_realmillisecond", 0);
		}
		ini_close(); /* Only reading save data */

		if (!instance_exists(obj_camera))
		{
			if (!global.doing_clear_check_character && !global.doing_clear_check_level)
			&& (global.checkpoint_x > 0 || global.checkpoint_y > 0)
			{
				camera_set_view_pos(view_get_camera(view_current), global.checkpoint_x, global.checkpoint_y); /* Set camera position to be on the last used checkpoint position */
				instance_create_depth(global.checkpoint_x, global.checkpoint_y, 0, obj_camera);
			}
			else
			{
				camera_set_view_pos(view_get_camera(view_current), x, y); /* Set camera position to be on the x and y position */
				instance_create_depth(x, y, 0, obj_camera);
			}
		}
		#endregion /* Load Level Checkpoint END */

	}
}
