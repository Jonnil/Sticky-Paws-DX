#region /* Initialize Object */
if (global.actually_play_edited_level == false)
{
	if (global.world_editor == false)
	{
		var grid = global.object_grid;
		var grid_height = ds_grid_height(grid) - 1;
		
		var grid_object_index = -1;
		for (var i = 0; i < grid_height; i++)
		{
			if (object == grid[# 0, i])
			{
				grid_object_index = i;
				break;
			}
		}
		
		if (grid_object_index != -1)
		{
			sprite_index = grid[# 1, grid_object_index];
			mask_index = grid[# 3, grid_object_index];
			draw_xscale = grid[# 4, grid_object_index];
			draw_yscale = draw_xscale;
			draw_angle = grid[# 5, grid_object_index];
			image_blend = grid[# 6, grid_object_index];
			default_blend = image_blend;
			image_alpha = grid[# 7, grid_object_index];
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
			case level_object_id.id_spikes_emerge_block:
			case level_object_id.id_spikes_emerge_block_offset_time:
			case level_object_id.id_spikes_emerge_block_down:
			case level_object_id.id_spikes_emerge_block_down_offset_time:
			case level_object_id.id_spikes_emerge_block_left:
			case level_object_id.id_spikes_emerge_block_left_offset_time:
			case level_object_id.id_spikes_emerge_block_right:
			case level_object_id.id_spikes_emerge_block_right_offset_time:
				draw_rotate_arrow = true;
				break;
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