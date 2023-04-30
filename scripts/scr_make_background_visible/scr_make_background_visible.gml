function scr_make_background_visible()
{
	
	#region /* Make background visible */
	if (room == room_leveleditor)
	{
		if (global.custom_background1 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
		}
		
		if (global.custom_background2 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
		}
		
		if (global.custom_background3 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
		}
		
		if (global.custom_background4 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
		}
	}
	#endregion /* Make background visible END */
	
}