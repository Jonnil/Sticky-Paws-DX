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
				default_blend = ds_grid_get(global.object_grid, 6, i);
				image_alpha = ds_grid_get(global.object_grid, 7, i);
			}
		}
		
		if (object == level_object_id.id_basic_collectible)
		|| (object == level_object_id.id_basic_collectible_2)
		|| (object == level_object_id.id_basic_collectible_3)
		|| (object == level_object_id.id_basic_collectible_4)
		|| (object == level_object_id.id_basic_collectible_5)
		|| (object == level_object_id.id_basic_collectible_6)
		|| (object == level_object_id.id_basic_collectible_7)
		|| (object == level_object_id.id_basic_collectible_8)
		|| (object == level_object_id.id_oneway)
		|| (object == level_object_id.id_oneway2)
		|| (object == level_object_id.id_oneway3)
		|| (object == level_object_id.id_oneway4)
		{
			draw_rotate_arrow = true;
		}
		
	}
	else
	{
		if (object == 1){sprite_index = spr_wall;mask_index = spr_wall;}
		if (object == 2){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 3){sprite_index = spr_map_exit;mask_index = spr_wall;}
		if (object == 4){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 5){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 6){sprite_index = spr_noone; mask_index = spr_wall;}
		if (object == 7){sprite_index = spr_noone; mask_index = spr_wall;}
	}
	//scr_make_sprite_transparent_setting_difficulty_levels();
}
#endregion /* Initialize Object END */

#region /* Big collectible uses old ID's, need to update them so old levels are compatible */
//if (object == 35)
//|| (object == 36)
//|| (object == 37)
//|| (object == 38)
//{
//	object = 34;
//}
//else
//if (object == 351)
//|| (object == 361)
//|| (object == 371)
//|| (object == 381)
//{
//	object = 341;
//}
//else
//if (object == 49)
//|| (object == 50)
//|| (object == 51)
//|| (object == 52)
//{
//	object = 48;
//}
//else
//if (object == 84)
//|| (object == 85)
//|| (object == 86)
//|| (object == 87)
//{
//	object = 83;
//}
#endregion /* Big collectible uses old ID's, need to update them so old levels are compatible END */

if (!other.easy && !other.normal && !other.hard)
{
	instance_destroy();
}