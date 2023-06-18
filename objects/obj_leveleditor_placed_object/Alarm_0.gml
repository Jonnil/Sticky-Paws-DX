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
				image_angle = draw_angle;
				image_blend = ds_grid_get(global.object_grid, 6, i);
				default_blend = ds_grid_get(global.object_grid, 6, i);
				image_alpha = ds_grid_get(global.object_grid, 7, i);
			}
		}
		
		draw_item_on_top = noone;
		draw_item_with_spring = false;
		
		switch (object)
		{
			case level_object_id.id_basic_collectible:
			case level_object_id.id_basic_collectible_2:
			case level_object_id.id_basic_collectible_3:
			case level_object_id.id_basic_collectible_4:
			case level_object_id.id_basic_collectible_5:
			case level_object_id.id_basic_collectible_6:
			case level_object_id.id_basic_collectible_7:
			case level_object_id.id_basic_collectible_8:
			case level_object_id.id_oneway:
			case level_object_id.id_oneway2:
			case level_object_id.id_oneway3:
			case level_object_id.id_oneway4:
			{
				draw_rotate_arrow = true;
			}
			case level_object_id.id_brick_block_10_basic_collectibles:
			case level_object_id.id_question_block_10_basic_collectibles:
			case level_object_id.id_melon_block_10_basic_collectibles:
			case level_object_id.id_bump_in_ground_8_basic_collectibles:
			case level_object_id.id_invisible_bump_in_ground_8_basic_collectibles:
				draw_item_on_top = global.resource_pack_sprite_basic_collectible;
				break;
				
			case level_object_id.id_brick_block_heart_balloon:
			case level_object_id.id_question_block_heart_balloon:
			case level_object_id.id_bump_in_ground_heart_balloon:
			case level_object_id.id_invisible_bump_in_ground_heart_balloon:
				draw_item_on_top = spr_heart;
				break;
				
			case level_object_id.id_brick_block_one_up:
			case level_object_id.id_question_block_one_up:
			case level_object_id.id_bump_in_ground_one_up:
			case level_object_id.id_invisible_bump_in_ground_one_up:
				draw_item_on_top = spr_1up;
				break;
				
			case level_object_id.id_brick_block_two_up:
			case level_object_id.id_question_block_two_up:
			case level_object_id.id_bump_in_ground_two_up:
			case level_object_id.id_invisible_bump_in_ground_two_up:
				draw_item_on_top = spr_2up;
				break;
				
			case level_object_id.id_brick_block_three_up:
			case level_object_id.id_question_block_three_up:
			case level_object_id.id_bump_in_ground_three_up:
			case level_object_id.id_invisible_bump_in_ground_three_up:
				draw_item_on_top = spr_3up;
				break;
				
			case level_object_id.id_bump_in_ground_big_collectible:
			case level_object_id.id_invisible_bump_in_ground_big_collectible:
				draw_item_on_top = global.resource_pack_sprite_big_collectible;
				break;
				
			case level_object_id.id_brick_block_invincibility_powerup:
			case level_object_id.id_question_block_invincibility_powerup:
			case level_object_id.id_bump_in_ground_invincibility_powerup:
			case level_object_id.id_invisible_bump_in_ground_invincibility_powerup:
				draw_item_on_top = global.resource_pack_sprite_invincibility_powerup;
				break;
				
			case level_object_id.id_brick_block_invincibility_powerup_coil_spring:
			case level_object_id.id_question_block_invincibility_powerup_coil_spring:
			case level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring:
			case level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring:
				draw_item_with_spring = true;
				draw_item_on_top = global.resource_pack_sprite_invincibility_powerup;
				break;
			case level_object_id.id_spring:
				draw_angle = point_direction(x, y, second_x, second_y) - 90;
				break;
			case level_object_id.id_water_level_change_slow:
			case level_object_id.id_water_level_change_fast:
			case level_object_id.id_water_level_change_faster:
				draw_angle = point_direction(x, y, x, second_y) - 90;
				break;
			case level_object_id.id_arrow_sign:
			case level_object_id.id_arrow_sign_small:
				draw_angle = point_direction(x, y, second_x, second_y);
				break;
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