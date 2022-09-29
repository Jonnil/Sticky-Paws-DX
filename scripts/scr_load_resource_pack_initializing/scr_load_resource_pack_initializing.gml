function scr_load_resource_pack_initializing()
{
	ds_list_clear(global.all_loaded_resource_pack);
	ds_list_add(global.all_loaded_resource_pack, "resource_pack0");
	
	first_resource_pack = string(file_find_first(working_directory + "custom_resource_pack/* ", fa_directory))
	if (file_exists(working_directory + "custom_resource_pack/" + first_resource_pack + "/data/sprite_origin_point.ini"))
	{
		ds_list_add(global.all_loaded_resource_pack, first_resource_pack);
	}
}