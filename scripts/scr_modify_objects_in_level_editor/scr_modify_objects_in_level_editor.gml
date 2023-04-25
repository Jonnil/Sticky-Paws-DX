function scr_modify_objects_in_level_editor()
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	
	#region /* Modify Objects */
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (delay > 1)
	and (instance_exists(obj_leveleditor))
	and (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	and (!mouse_check_button(mb_right))
	and (asset_get_type("obj_leveleditor") == asset_object)
	and (instance_exists(obj_leveleditor))
	and (obj_leveleditor.fill_mode == false)
	and (obj_leveleditor.erase_mode == false)
	and (obj_leveleditor.pause == false)
	and (obj_leveleditor.menu_delay == 0)
	and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_1_start))
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_2_start))
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_3_start))
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	and (!place_meeting(x, y, obj_level_player_4_start))
	and (asset_get_type("obj_level_height") == asset_object)
	and (!position_meeting(x, y, obj_level_height))
	and (asset_get_type("obj_level_width") == asset_object)
	and (!position_meeting(x, y, obj_level_width))
	and (asset_get_type("obj_water_level_height") == asset_object)
	and (!position_meeting(x, y, obj_water_level_height))
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
	and (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32)) /* Can't place objects when clicking the play button */
	and (obj_leveleditor.placing_object <= 0)
	{
		if (obj_leveleditor.show_grid == true)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32 - 32, 80 + obj_leveleditor.icons_at_top_y + 16 - 32 - 32, display_get_gui_width() + 64 + 32, 80 + obj_leveleditor.icons_at_top_y + 16 + 32 + 32)) /* Up and down buttons when grid is on */
		or (obj_leveleditor.show_grid == false)
		{
			if (obj_leveleditor.set_difficulty_mode == true)
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
			or (obj_leveleditor.set_difficulty_mode == false)
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
			{
				if (keyboard_check_pressed(ord("A")))
				and (!keyboard_check(vk_control))
				or (mouse_check_button_released(mb_left))
				and (dragged_from_original_place == false)
				and (placed_for_the_first_time == false)
				or (instance_exists(obj_leveleditor))
				and (obj_leveleditor.key_a_released)
				and (dragged_from_original_place == false)
				and (placed_for_the_first_time == false)
				{
					if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
					{
						/* Don't put a move_snap here! We don't want the object to change position when modifying it */
						
						#region /* Object ID's to modify */
						if (global.world_editor == false)
						{
							modify_object_menu = true;
							
							#region /* Change wall into it's different forms */
							if (object == level_object_id.id_wall)
							{
								object = level_object_id.id_wall_dirt;
							}
							else
							if (object == level_object_id.id_wall_dirt)
							{
								object = level_object_id.id_wall_glass;
							}
							else
							if (object == level_object_id.id_wall_glass)
							{
								object = level_object_id.id_wall_grass;
							}
							else
							if (object == level_object_id.id_wall_grass)
							{
								object = level_object_id.id_wall_gravel;
							}
							else
							if (object == level_object_id.id_wall_gravel)
							{
								object = level_object_id.id_wall_metal;
							}
							else
							if (object == level_object_id.id_wall_metal)
							{
								object = level_object_id.id_wall_stone;
							}
							else
							if (object == level_object_id.id_wall_stone)
							{
								object = level_object_id.id_wall_wood;
							}
							else
							if (object == level_object_id.id_wall_wood)
							{
								object = level_object_id.id_wall;
							}
							#endregion /* Change wall into it's different forms END */
							
							else
							
							#region /* Change bump in ground to it's different forms */
							if (object == level_object_id.id_bump_in_ground)
							{
								object = level_object_id.id_bump_in_ground_8_basic_collectibles;
							}
							else
							if (object == level_object_id.id_bump_in_ground_8_basic_collectibles)
							{
								object = level_object_id.id_bump_in_ground_heart_balloon;
							}
							else
							if (object == level_object_id.id_bump_in_ground_heart_balloon)
							{
								object = level_object_id.id_bump_in_ground_one_up;
							}
							else
							if (object == level_object_id.id_bump_in_ground_one_up)
							{
								object = level_object_id.id_bump_in_ground_two_up;
							}
							else
							if (object == level_object_id.id_bump_in_ground_two_up)
							{
								object = level_object_id.id_bump_in_ground_three_up;
							}
							else
							if (object == level_object_id.id_bump_in_ground_three_up)
							{
								object = level_object_id.id_bump_in_ground_big_collectible;
							}
							else
							if (object == level_object_id.id_bump_in_ground_big_collectible)
							{
								object = level_object_id.id_bump_in_ground_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_bump_in_ground_invincibility_powerup)
							{
								object = level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_invisible_bump_in_ground;
							}
							#endregion /* Change bump in ground to it's different forms END */
								
							#region /* Change invisible bump in ground to it's different forms */
							if (object == level_object_id.id_invisible_bump_in_ground)
							{
								object = level_object_id.id_invisible_bump_in_ground_8_basic_collectibles;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_8_basic_collectibles)
							{
								object = level_object_id.id_invisible_bump_in_ground_heart_balloon;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_heart_balloon)
							{
								object = level_object_id.id_invisible_bump_in_ground_one_up;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_one_up)
							{
								object = level_object_id.id_invisible_bump_in_ground_two_up;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_two_up)
							{
								object = level_object_id.id_invisible_bump_in_ground_three_up;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_three_up)
							{
								object = level_object_id.id_invisible_bump_in_ground_big_collectible;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_big_collectible)
							{
								object = level_object_id.id_invisible_bump_in_ground_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup)
							{
								object = level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_bump_in_ground;
							}
							#endregion /* Change invisible bump in ground to it's different forms END */
								
							else
							
							#region /* Change Basic Collectible Direction */
							if (object == level_object_id.id_basic_collectible)
							{
								object = level_object_id.id_basic_collectible_2;
							}
							else
							if (object == level_object_id.id_basic_collectible_2)
							{
								object = level_object_id.id_basic_collectible_3;
							}
							else
							if (object == level_object_id.id_basic_collectible_3)
							{
								object = level_object_id.id_basic_collectible_4;
							}
							else
							if (object == level_object_id.id_basic_collectible_4)
							{
								object = level_object_id.id_basic_collectible_5;
							}
							else
							if (object == level_object_id.id_basic_collectible_5)
							{
								object = level_object_id.id_basic_collectible_6;
							}
							else
							if (object == level_object_id.id_basic_collectible_6)
							{
								object = level_object_id.id_basic_collectible_7;
							}
							else
							if (object == level_object_id.id_basic_collectible_7)
							{
								object = level_object_id.id_basic_collectible_8;
							}
							else
							if (object == level_object_id.id_basic_collectible_8)
							{
								object = level_object_id.id_basic_collectible;
							}
							#endregion /* Change Basic Collectible Direction */
							
							else
							
							#region /* Falling Block */
							if (object == level_object_id.id_falling_block)
							{
								object = level_object_id.id_falling_block_solid;
							}
							else
							if (object == level_object_id.id_falling_block_solid)
							{
								object = level_object_id.id_falling_block;
							}
							else
							if (object == level_object_id.id_falling_block_long)
							{
								object = level_object_id.id_falling_block_long_solid;
							}
							else
							if (object == level_object_id.id_falling_block_long_solid)
							{
								object = level_object_id.id_falling_block_long;
							}
							#endregion /* Falling Block END */
							
							else
							
							#region /* Brick Block */
							if (object == level_object_id.id_brick_block)
							{
								object = level_object_id.id_brick_block_10_basic_collectibles;
							}
							else
							if (object == level_object_id.id_brick_block_10_basic_collectibles)
							{
								object = level_object_id.id_brick_block_heart_balloon;
							}
							else
							if (object == level_object_id.id_brick_block_heart_balloon)
							{
								object = level_object_id.id_brick_block_one_up;
							}
							else
							if (object == level_object_id.id_brick_block_one_up)
							{
								object = level_object_id.id_brick_block_two_up;
							}
							else
							if (object == level_object_id.id_brick_block_two_up)
							{
								object = level_object_id.id_brick_block_three_up;
							}
							else
							if (object == level_object_id.id_brick_block_three_up)
							{
								object = level_object_id.id_brick_block_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_brick_block_invincibility_powerup)
							{
								object = level_object_id.id_brick_block_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_brick_block_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_brick_block;
							}
							#endregion /* Brick Block */
							
							else
							
							#region /* Question Block */
							if (object == level_object_id.id_question_block)
							{
								object = level_object_id.id_question_block_10_basic_collectibles;
							}
							else
							if (object == level_object_id.id_question_block_10_basic_collectibles)
							{
								object = level_object_id.id_question_block_heart_balloon;
							}
							else
							if (object == level_object_id.id_question_block_heart_balloon)
							{
								object = level_object_id.id_question_block_one_up;
							}
							else
							if (object == level_object_id.id_question_block_one_up)
							{
								object = level_object_id.id_question_block_two_up;
							}
							else
							if (object == level_object_id.id_question_block_two_up)
							{
								object = level_object_id.id_question_block_three_up;
							}
							else
							if (object == level_object_id.id_question_block_three_up)
							{
								object = level_object_id.id_question_block_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_question_block_invincibility_powerup)
							{
								object = level_object_id.id_question_block_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_question_block_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_question_block;
							}
							#endregion /* Question Block */
							
							else
							
							#region /* Melon Block */
							if (object == level_object_id.id_melon_block)
							{
								object = level_object_id.id_melon_block_10_basic_collectibles;
							}
							else
							if (object == level_object_id.id_melon_block_10_basic_collectibles)
							{
								object = level_object_id.id_melon_block_heart_balloon;
							}
							else
							if (object == level_object_id.id_melon_block_heart_balloon)
							{
								object = level_object_id.id_melon_block_one_up;
							}
							else
							if (object == level_object_id.id_melon_block_one_up)
							{
								object = level_object_id.id_melon_block_two_up;
							}
							else
							if (object == level_object_id.id_melon_block_two_up)
							{
								object = level_object_id.id_melon_block_three_up;
							}
							else
							if (object == level_object_id.id_melon_block_three_up)
							{
								object = level_object_id.id_melon_block_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_melon_block_invincibility_powerup)
							{
								object = level_object_id.id_melon_block_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_melon_block_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_melon_block;
							}
							#endregion /* Melon Block */
							
							else
							
							#region /* Hard Block */
							if (object == level_object_id.id_hard_block)
							{
								object = level_object_id.id_hard_block_alternate;
							}
							else
							if (object == level_object_id.id_hard_block_alternate)
							{
								object = level_object_id.id_hard_block_2x2;
							}
							else
							if (object == level_object_id.id_hard_block_2x2)
							{
								object = level_object_id.id_hard_block;
							}
							#endregion /* Hard Block END */
							
							else
							
							#region /* Heart Balloon / HP Pickup */
							if (object == level_object_id.id_heart)
							{
								object = level_object_id.id_hp_pickup;
							}
							else
							if (object == level_object_id.id_hp_pickup)
							{
								object = level_object_id.id_heart;
							}
							#endregion /* Heart Balloon / HP Pickup END */
							
							else
							
							#region /* Invincibility Powerup */
							if (object == level_object_id.id_invincibility_powerup)
							{
								object = level_object_id.id_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_invincibility_powerup;
							}
							#endregion /* Invincibility Powerup END */
							
							else
							
							#region /* Extra Lives Pickup */
							if (object == level_object_id.id_one_up)
							{
								object = level_object_id.id_two_up;
							}
							else
							if (object == level_object_id.id_two_up)
							{
								object = level_object_id.id_three_up;
							}
							else
							if (object == level_object_id.id_three_up)
							{
								object = level_object_id.id_one_up;
							}
							#endregion /* Extra Lives Pickup END */
							
							else
							
							#region /* Basic enemy */
							if (object == level_object_id.id_basic_enemy)
							{
								object = level_object_id.id_basic_enemy_blind;
							}
							else
							if (object == level_object_id.id_basic_enemy_blind)
							{
								object = level_object_id.id_basic_enemy_coil_spring;
							}
							else
							if (object == level_object_id.id_basic_enemy_coil_spring)
							{
								object = level_object_id.id_basic_enemy_blind_coil_spring;
							}
							else
							if (object == level_object_id.id_basic_enemy_blind_coil_spring)
							{
								object = level_object_id.id_basic_enemy;
							}
							#endregion /* Basic enemy END */
							
							else
							
							#region /* Bowling ball enemy */
							if (object == level_object_id.id_enemy_bowlingball)
							{
								object = level_object_id.id_enemy_bowlingball_blind;
							}
							else
							if (object == level_object_id.id_enemy_bowlingball_blind)
							{
								object = level_object_id.id_enemy_bowlingball_coil_spring;
							}
							else
							if (object == level_object_id.id_enemy_bowlingball_coil_spring)
							{
								object = level_object_id.id_enemy_bowlingball_blind_coil_spring;
							}
							else
							if (object == level_object_id.id_enemy_bowlingball_blind_coil_spring)
							{
								object = level_object_id.id_enemy_bowlingball;
							}
							#endregion /* Bowling ball enemy END */
								
							else
								
							#region /* Big Stationary Enemy */
							if (object == level_object_id.id_big_stationary_enemy)
							{
								object = level_object_id.id_big_stationary_enemy_coil_spring;
							}
							else
							if (object == level_object_id.id_big_stationary_enemy_coil_spring)
							{
								object = level_object_id.id_big_stationary_enemy;
							}
							#endregion /* Big Stationary Enemy END */
								
							else
							
							#region /* Spikes Emerge Direction */
							if (object == level_object_id.id_spikes_emerge_block)
							{
								object = level_object_id.id_spikes_emerge_block_left;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_left)
							{
								object = level_object_id.id_spikes_emerge_block_down;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_down)
							{
								object = level_object_id.id_spikes_emerge_block_right;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_right)
							{
								object = level_object_id.id_spikes_emerge_block_offset_time;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_offset_time)
							{
								object = level_object_id.id_spikes_emerge_block_left_offset_time;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_left_offset_time)
							{
								object = level_object_id.id_spikes_emerge_block_down_offset_time;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_down_offset_time)
							{
								object = level_object_id.id_spikes_emerge_block_right_offset_time;
							}
							else
							if (object == level_object_id.id_spikes_emerge_block_right_offset_time)
							{
								object = level_object_id.id_spikes_emerge_block;
							}
							#endregion /* Spikes Emerge Direction END */
							
							else
							
							#region /* Change Arrow Sign */
							if (object == level_object_id.id_arrow_sign)
							{
								object = level_object_id.id_arrow_sign_small;
							}
							else
							if (object == level_object_id.id_arrow_sign_small)
							{
								object = level_object_id.id_arrow_sign;
							}
							#endregion /* Change Arrow Sign END */
							
							else
							
							#region /* Change Oneway Direction */
							if (object == level_object_id.id_oneway)
							{
								object = level_object_id.id_oneway2;
							}
							else
							if (object == level_object_id.id_oneway2)
							{
								object = level_object_id.id_oneway3;
							}
							else
							if (object == level_object_id.id_oneway3)
							{
								object = level_object_id.id_oneway4;
							}
							else
							if (object == level_object_id.id_oneway4)
							{
								object = level_object_id.id_oneway;
							}
							#endregion /* Change Oneway Direction END */
							
							else
							
							#region /* Change Water */
							if (object == level_object_id.id_water)
							{
								object = level_object_id.id_breathable_water;
							}
							else
							if (object == level_object_id.id_breathable_water)
							{
								object = level_object_id.id_water;
							}
							#endregion /* Change Water END */
							
							else
							
							#region /* Change Clipped Clothing on Rope */
							if (object == 74)
							{
								object = 75;
							}
							else
							if (object == 75)
							{
								object = 76;
							}
							else
							if (object == 76)
							{
								object = 74;
							}
							#endregion /* Change Clipped Clothing on Rope END */
							
							else
							
							#region /* Change bucket to it's different forms */
							if (object == level_object_id.id_bucket)
							{
								object = level_object_id.id_bucket_8_basic_collectibles;
							}
							else
							if (object == level_object_id.id_bucket_8_basic_collectibles)
							{
								object = level_object_id.id_bucket_heart_balloon;
							}
							else
							if (object == level_object_id.id_bucket_heart_balloon)
							{
								object = level_object_id.id_bucket_one_up;
							}
							else
							if (object == level_object_id.id_bucket_one_up)
							{
								object = level_object_id.id_bucket_two_up;
							}
							else
							if (object == level_object_id.id_bucket_two_up)
							{
								object = level_object_id.id_bucket_three_up;
							}
							else
							if (object == level_object_id.id_bucket_three_up)
							{
								object = level_object_id.id_bucket_big_collectible;
							}
							else
							if (object == level_object_id.id_bucket_big_collectible)
							{
								object = level_object_id.id_bucket_invincibility_powerup;
							}
							else
							if (object == level_object_id.id_bucket_invincibility_powerup)
							{
								object = level_object_id.id_bucket_invincibility_powerup_coil_spring;
							}
							else
							if (object == level_object_id.id_bucket_invincibility_powerup_coil_spring)
							{
								object = level_object_id.id_bucket;
							}
							#endregion /* Change bucket to it's different forms END */
							
							else
							
							#region /* Change Moveset Signs */
							if (object == 90)
							{
								object = 91;
							}
							else
							if (object == 91)
							{
								object = 92;
							}
							else
							if (object == 92)
							{
								object = 93;
							}
							else
							if (object == 93)
							{
								object = 94;
							}
							else
							if (object == 94)
							{
								object = 90;
							}
							#endregion /* Change Moveset Signs END */
							
							#region /* Update variables */
							if (global.actually_play_edited_level == false)
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
							#endregion /* Update variables END */
							
						}
						#endregion /* Level Object ID's to modify END */
						
						else
						
						#region /* World Object ID's to modify */
						{
							
							#region /* Change Turn */
							if (object == 4)
							{
								object = 5;
							}
							else
							if (object == 5)
							{
								object = 6;
							}
							else
							if (object == 6)
							{
								object = 7;
							}
							else
							if (object == 7)
							{
								object = 4;
							}
							#endregion /* Change Turn END */
							
						}
							
						alarm[0] = 1; /* Update sprite initializing. That code is in alarm event, so it's not running every frame in step event */
							
						#endregion /* World Object ID's to modify END */
							
					}
				}
			}
		}
	}
	#endregion /* Modify Objects END */
	
}