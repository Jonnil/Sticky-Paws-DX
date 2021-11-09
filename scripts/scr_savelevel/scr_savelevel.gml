/*Save Level Information like if you have cleared the level or if you have a checkpoint*/
function scr_savelevel()
{
	if (global.file >= 1)
	and (global.character_select_in_this_menu = "main_game")
	{
		ini_open("file" + string(global.file) + ".ini");
		
		if (global.level_clear_rate = "clear")
		and(ini_read_string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"clear_rate","closed")!="clear")
		{
			ini_write_string(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"clear_rate","clear");
			ini_write_real("Player","number_of_levels_cleared",ini_read_real("Player","number_of_levels_cleared",false)+1);
		}
		if (global.level_clear_rate = "clear")
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"number_of_clears",ini_read_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"number_of_clears",0)+1);
		}
	
		if (global.big_collectible1=true)
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"big_collectible1",true);
		}
		if (global.big_collectible2=true)
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"big_collectible2",true);
		}
		if (global.big_collectible3=true)
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"big_collectible3",true);
		}
		if (global.big_collectible4=true)
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"big_collectible4",true);
		}
		if (global.big_collectible5=true)
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"big_collectible5",true);
		}
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"lives_until_assist",global.lives_until_assist);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"x_checkpoint",global.x_checkpoint);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"y_checkpoint",global.y_checkpoint);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_millisecond",global.checkpoint_millisecond);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_second",global.checkpoint_second);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_minute",global.checkpoint_minute);
		ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"checkpoint_realmillisecond",global.checkpoint_realmillisecond);
		if (global.timeattack_realmillisecond>2)
		
		#region /*Save Fastest Time*/
		if (!ini_key_exists(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_realmillisecond"))
		or(global.timeattack_realmillisecond<ini_read_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_realmillisecond",global.timeattack_realmillisecond))
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_millisecond",global.timeattack_millisecond);
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_second",global.timeattack_second);
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_minute",global.timeattack_minute);
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index),"timeattack_realmillisecond",global.timeattack_realmillisecond);
		}
		#endregion /*Save Fastest Time END*/
		
		if (score > ini_read_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index), "level_score", false))
		{
			ini_write_real(ds_list_find_value(global.all_loaded_main_levels,global.select_level_index), "level_score", score);
		}
		ini_close();
	}
}
