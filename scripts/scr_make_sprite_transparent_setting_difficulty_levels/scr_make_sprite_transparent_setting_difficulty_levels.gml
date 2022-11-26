function scr_make_sprite_transparent_setting_difficulty_levels()
{
	
	#region /* Make sprite transparent if you're setting difficulty levels */
	if (asset_get_type("obj_leveleditor") == asset_object)
	and (instance_exists(obj_leveleditor))
	and (global.character_select_in_this_menu == "level_editor")
	{
		
		#region /* Show only normal difficulty layer in regular colors when saving a thumbnail */
		if (obj_leveleditor.quit_level_editor >= true)
		and (normal == true)
		{
			image_alpha = 1;
			image_blend = c_white;
		}
		#endregion /* Show only normal difficulty layer in regular colors when saving a thumbnail END */
		
		else
		
		#region /* All layer */
		if (obj_leveleditor.difficulty_layer == 0)
		and (obj_leveleditor.quit_level_editor == false)
		{
			
			#region /* Transparent Object */
			if (easy == true)
			and (normal == false)
			and (hard == false)
			{
				image_alpha = 0.1;
				image_blend = c_lime;
			}
			else
			if (easy == true)
			and (normal == true)
			and (hard == false)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy == false)
			and (normal == true)
			and (hard == false)
			{
				image_alpha = 0.1;
				image_blend = c_yellow;
			}
			else
			if (easy == false)
			and (normal == true)
			and (hard == true)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			else
			if (easy == false)
			and (normal == false)
			and (hard == true)
			{
				image_alpha = 0.1;
				image_blend = c_red;
			}
			else
			if (easy == true)
			and (normal == false)
			and (hard == true)
			{
				image_alpha = 0.1;
				image_blend = c_white;
			}
			#endregion /* Transparent Object END */
			
			else
			if (easy == true)
			and (normal == true)
			and (hard == true)
			{
				image_alpha = 1;
				image_blend = c_white;
			}
		}
		#endregion /* All layer END */
		
		else
		
		#region /* Easy layer */
		if (obj_leveleditor.difficulty_layer == 1)
		and (obj_leveleditor.quit_level_editor == false)
		{
			if (easy == true)
			{
				image_alpha = 1;
				image_blend = c_lime;
			}
			else
			{
				
				#region /* Transparent Object */
				if (easy == true)
				and (normal == false)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_lime;
				}
				else
				if (easy == true)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_yellow;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_red;
				}
				else
				if (easy == true)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				#endregion /* Transparent Object END */
				
			}
		}
		#endregion /* Easy layer END */
		
		#region /* Normal layer */
		if (obj_leveleditor.difficulty_layer == 2)
		and (obj_leveleditor.quit_level_editor == false)
		{
			if (normal == true)
			{
				image_alpha = 1;
				image_blend = c_yellow;
			}
			else
			{
				
				#region /* Transparent Object */
				if (easy == true)
				and (normal == false)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_lime;
				}
				else
				if (easy == true)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_yellow;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_red;
				}
				else
				if (easy == true)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				#endregion /* Transparent Object END */
				
			}
		}
		#endregion /* Normal layer END */
		
		#region /* Hard layer */
		if (obj_leveleditor.difficulty_layer == 3)
		and (obj_leveleditor.quit_level_editor == false)
		{
			if (hard == true)
			{
				image_alpha = 1;
				image_blend = c_red;
			}
			else
			{
				
				#region /* Transparent Object */
				if (easy == true)
				and (normal == false)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_lime;
				}
				else
				if (easy == true)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == false)
				{
					image_alpha = 0.1;
					image_blend = c_yellow;
				}
				else
				if (easy == false)
				and (normal == true)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				else
				if (easy == false)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_red;
				}
				else
				if (easy == true)
				and (normal == false)
				and (hard == true)
				{
					image_alpha = 0.1;
					image_blend = c_white;
				}
				#endregion /* Transparent Object END */
				
			}
		}
		#endregion /* Hard layer END */
		
	}
	else
	if (global.character_select_in_this_menu == "level_editor")
	{
		image_alpha = 1;
		image_blend = c_white;
	}
	#endregion /* Make sprite transparent if you're setting difficulty levels END */
	
}