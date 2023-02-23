#region /* Debug toggles */
var can_spawn_objects = true;
#endregion /* Debug toggles END */

#region /* Initialize Object */
if (global.actually_play_edited_level == false)
{
	if (global.world_editor == false)
	{
		for(i = 0; i < ds_grid_height(global.object_grid)-1; i += 1)
		{
			if (object == ds_grid_get(global.object_grid, 0, i))
			{
				sprite_index = ds_grid_get(global.object_grid, 1, i);
				mask_index = ds_grid_get(global.object_grid, 3, i);
				draw_xscale = ds_grid_get(global.object_grid, 4, i);
				draw_yscale = ds_grid_get(global.object_grid, 4, i);
				draw_angle = ds_grid_get(global.object_grid, 5, i);
				image_blend = ds_grid_get(global.object_grid, 6, i);
				image_alpha = ds_grid_get(global.object_grid, 7, i);
			}
		}
		
		if (object == level_object_id.id_basic_collectible)
		or (object == level_object_id.id_basic_collectible_2)
		or (object == level_object_id.id_basic_collectible_3)
		or (object == level_object_id.id_basic_collectible_4)
		or (object == level_object_id.id_basic_collectible_5)
		or (object == level_object_id.id_basic_collectible_6)
		or (object == level_object_id.id_basic_collectible_7)
		or (object == level_object_id.id_basic_collectible_8)
		or (object == level_object_id.id_oneway)
		or (object == level_object_id.id_oneway2)
		or (object == level_object_id.id_oneway3)
		or (object == level_object_id.id_oneway4)
		{
			draw_rotate_arrow = true;
		}
		
	}
	else
	{
		if (object == 1){if (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;}mask_index = spr_wall;}
		if (object == 2){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 3){if (asset_get_type("spr_map_exit") == asset_sprite){sprite_index = spr_map_exit;}mask_index = spr_wall;}
		if (object == 4){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 5){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 6){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 7){sprite_index = spr_noone; mask_index = spr_wall;}
	}
	scr_make_sprite_transparent_setting_difficulty_levels();
}

if (can_spawn_objects == true)
{
	if (global.actually_play_edited_level == true)
	or (global.play_edited_level == true)
	{
		scr_spawn_objects_when_starting_room();
	}
}
#endregion /* Initialize Object END */