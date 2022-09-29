if (instance_exists(obj_leveleditor))
and (sprite_lives_icon == noone)
{
	sprite_lives_icon = obj_leveleditor.sprite_lives_icon; /* Just copy lives icon from obj_leveleditor, don't make alarm event for obj_leveleditor_placed_object, it will lag the game */
}

#region /* Initialize object mask */
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
image_speed = 0;
image_index = 0;
#endregion /* Initialize object mask END */

#region /* Initialize Object */
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
}
else
{
	if (object = 1){if (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;}mask_index = spr_wall;}
	if (object = 2){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 3){if (asset_get_type("spr_map_exit") == asset_sprite){sprite_index = spr_map_exit;}mask_index = spr_wall;}
	if (object = 4){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 5){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 6){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 7){sprite_index = spr_noone; mask_index = spr_wall;}
}
#endregion /* Initialize Object END */