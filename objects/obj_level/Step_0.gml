enter_blink += 1;
if (enter_blink > 60)
{
	enter_blink = 0;
}

if (clear_rate = "enter")
{
	image_alpha = 1;
	if (enter_blink > room_speed / 4)
	{
		level_color = c_red;
	}
	else
	{
		level_color = c_white;
	}
}
else
if (clear_rate = "clear")
{
	image_alpha = 1;
	if (big_collectible1 = true)
	and(big_collectible2 = true)
	and(big_collectible3 = true)
	and(big_collectible4 = true)
	and(big_collectible5 = true)
	{
		level_color = c_yellow;
		level_perfect = true;
	}
	else
	{
		level_color = c_blue;
	}
}
else
{
	image_alpha = 0.1;
	level_color = c_black; /*Closed*/
}

#region /*Level Save*/
if (asset_get_type("obj_player_map") == asset_object)
and(instance_exists(obj_player_map))
and(obj_player_map.move_delay = 1)
and(obj_player_map.transfer_data = true)
and(file_exists("file" + string(global.file) + ".ini"))
{
	ini_open("file" + string(global.file) + ".ini");
	ini_write_string(ds_list_find_value(global.all_loaded_main_levels,level), "clear_rate", clear_rate);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "big_collectible1", big_collectible1);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "big_collectible2", big_collectible2);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "big_collectible3", big_collectible3);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "big_collectible4", big_collectible4);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "big_collectible5", big_collectible5);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "lives_until_assist", lives_until_assist);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "x_checkpoint", x_checkpoint);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "y_checkpoint", y_checkpoint);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "checkpoint_millisecond", checkpoint_millisecond);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "checkpoint_second", checkpoint_second);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "checkpoint_minute", checkpoint_minute);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "checkpoint_realmillisecond", checkpoint_realmillisecond);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "timeattack_millisecond", timeattack_millisecond);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "timeattack_second", timeattack_second);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "timeattack_minute", timeattack_minute);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "timeattack_realmillisecond", timeattack_realmillisecond);
	ini_write_real(ds_list_find_value(global.all_loaded_main_levels,level), "level_score", level_score);
	ini_close();
}
#endregion /*Level Save END*/