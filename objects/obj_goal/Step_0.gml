if (goal=false)
and (asset_get_type("obj_player")==asset_object)
and (instance_exists(obj_player))
and (place_meeting(x,y,obj_player))
or (goal=false)
and (asset_get_type("obj_player")==asset_object)
and (instance_exists(obj_player))
and (instance_nearest(x,y,obj_player).x>bbox_right)
and (instance_nearest(x,y,obj_player).x<bbox_right+16)
and (instance_nearest(x,y,obj_player).y<bbox_bottom)
and (!collision_line(x,y,instance_nearest(x,y,obj_player).x,instance_nearest(x,y,obj_player).y,obj_wall,false,true))
{
	global.quit_level = false;
	global.quit_to_map = false;
	global.quit_to_title = false;
	global.restart_level = false;
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
	
	global.player_has_entered_goal = true;
	
	#region /*Save Checkpoint*/
	if (asset_get_type("room_leveleditor")==asset_room)
	and (room = room_leveleditor)
	and (global.character_select_in_this_menu = "main_game")
	and (global.file >= 1)
	{
		global.x_checkpoint = 0;
		global.y_checkpoint = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
		
		ini_open(working_directory+"/File" + string(global.file) + ".ini");
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"x_checkpoint",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"y_checkpoint",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"checkpoint_millisecond",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"checkpoint_second",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"checkpoint_minute",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index)),"checkpoint_realmillisecond",0);
		ini_close();
	}
	else
	if (asset_get_type("room_leveleditor")==asset_room)
	and (room = room_leveleditor)
	and (global.character_select_in_this_menu = "level_editor")
	{
		global.x_checkpoint = 0;
		global.y_checkpoint = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
		
		ini_open(working_directory+"/custom_level_save.ini");
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"x_checkpoint",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"y_checkpoint",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_millisecond",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_second",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_minute",0);
		ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels,global.select_level_index)),"checkpoint_realmillisecond",0);
		ini_close();
	}
	#endregion /*Save Checkpoint END*/
	
	goal = true;
}