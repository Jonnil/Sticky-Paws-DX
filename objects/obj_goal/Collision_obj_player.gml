if (goal=false)
{
	image_index=1;
	if (trigger_ending=true)
	{
		global.trigger_ending=true;
	}

	#region /*Stop Music*/
	audio_stop_sound(global.music);
	audio_stop_sound(global.music_underwater);
	global.music=noone;
	global.music_underwater=noone;
	#endregion /*Stop Music END*/

	if (global.demo=true)and(asset_get_type("room_level1")==asset_room)and(room=room_level1)and(global.demo_max_levels>=1)
	or(global.demo=true)and(asset_get_type("room_level2")==asset_room)and(room=room_level2)and(global.demo_max_levels>=2)
	or(global.demo=true)and(asset_get_type("room_level3")==asset_room)and(room=room_level3)and(global.demo_max_levels>=3)
	or(global.demo=true)and(asset_get_type("room_level4")==asset_room)and(room=room_level4)and(global.demo_max_levels>=4)
	or(global.demo=true)and(asset_get_type("room_level5")==asset_room)and(room=room_level5)and(global.demo_max_levels>=5)
	or(global.demo=true)and(asset_get_type("room_level6")==asset_room)and(room=room_level6)and(global.demo_max_levels>=6)
	or(global.demo=true)and(asset_get_type("room_level7")==asset_room)and(room=room_level7)and(global.demo_max_levels>=7)
	or(global.demo=true)and(asset_get_type("room_level8")==asset_room)and(room=room_level8)and(global.demo_max_levels>=8)
	or(global.demo=true)and(asset_get_type("room_level9")==asset_room)and(room=room_level9)and(global.demo_max_levels>=9)
	or(global.demo=true)
	and(global.demo_max_levels>=10)
	{
		global.trigger_demo_ending=500;
	}
	global.player_has_entered_goal=true;

	#region /*Steam Achievment, Clear stage 1 (or 2)*/
	if (global.current_level=1)
	or(global.current_level=2)
	{
		if (!steam_get_achievement("CLEAR_FIRST_STAGE"))
		{
			steam_set_achievement("CLEAR_FIRST_STAGE");
		}
	}
	#endregion /*Steam Achievment, Clear stage 1 (or 2) END*/

	#region /*Save Level Editor Checkpoint*/
	if (asset_get_type("room_leveleditor")==asset_room)
	and(room=room_leveleditor)
	and(global.actually_play_edited_level=true)
	{
		#region /*Create directory for saving custom levels*/
		if (!directory_exists(working_directory+"/Custom Levels"))
		{
			directory_create(working_directory+"/Custom Levels");
		}
		#endregion /*Create directory for saving custom levels*/
		
		ini_open(working_directory+"/Custom Levels/custom_level_save.ini");
		ini_write_real("Level"+string(global.level_editor_level),"x_checkpoint",0);
		ini_write_real("Level"+string(global.level_editor_level),"y_checkpoint",0);
		ini_write_real("Level"+string(global.level_editor_level),"checkpoint_millisecond",0);
		ini_write_real("Level"+string(global.level_editor_level),"checkpoint_second",0);
		ini_write_real("Level"+string(global.level_editor_level),"checkpoint_minute",0);
		ini_write_real("Level"+string(global.level_editor_level),"checkpoint_realmillisecond",0);

		ini_close();
	}
	#endregion /*Save Level Editor Checkpoint END*/
	goal=true;
}