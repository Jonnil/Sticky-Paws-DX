function scr_spawn_objects_when_starting_room()
{
	
	#region /* Spawn objects when starting room */
	if (global.world_editor == false)
	{
		
		#region /* Only spawn objects according to difficulty settings */
		if (global.difficulty <= 0)
		&& (easy == true)
		|| (global.difficulty == 1)
		&& (normal == true)
		|| (global.difficulty >= 2)
		&& (hard == true)
		{
			switch (object) {
			    case level_object_id.id_wall:
			        instance_create_depth(x, y, 0, obj_ground);
			        break;
			    case level_object_id.id_wall_dirt:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 1;
			        break;
			    case level_object_id.id_wall_glass:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 2;
			        break;
			    case level_object_id.id_wall_grass:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 3;
			        break;
			    case level_object_id.id_wall_gravel:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 4;
			        break;
			    case level_object_id.id_wall_metal:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 5;
			        break;
			    case level_object_id.id_wall_stone:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 6;
			        break;
			    case level_object_id.id_wall_wood:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 7;
			        break;
			    case level_object_id.id_wall_jump_panel:
			        instance_create_depth(x, y, 0, obj_wall_jump_panel);
			        break;
			    case level_object_id.id_wall_climb_panel:
			        instance_create_depth(x, y, 0, obj_wall_climb_panel);
			        break;
			    case level_object_id.id_spikes:
			        instance_create_depth(x, y, 0, obj_spikes);
			        break;
			    case level_object_id.id_semisolid_platform:
			        instance_create_depth(x, y, 0, obj_semisolid_platform);
			        break;
				case level_object_id.id_brick_block:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";}
			        break;
				case level_object_id.id_brick_block_10_basic_collectibles:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "10_basic_collectibles";}
			        break;
			    case level_object_id.id_brick_block_heart_balloon:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "heart_balloon";}
			        break;
			    case level_object_id.id_brick_block_one_up:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "1-up";}
			        break;
			    case level_object_id.id_brick_block_two_up:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "2-up";}
			        break;
			    case level_object_id.id_brick_block_three_up:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "3-up";}
			        break;
			    case level_object_id.id_brick_block_invincibility_powerup:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "invincibility_powerup";}
			        break;
			    case level_object_id.id_brick_block_invincibility_powerup_coil_spring:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "invincibility_powerup_coil_spring";}
			        break;
				case level_object_id.id_question_block:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";}
					break;
				case level_object_id.id_question_block_10_basic_collectibles:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "10_basic_collectibles";}
					break;
				case level_object_id.id_question_block_heart_balloon:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "heart_balloon";}
					break;
				case level_object_id.id_question_block_one_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "1-up";}
					break;
				case level_object_id.id_question_block_two_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "2-up";}
					break;
				case level_object_id.id_question_block_three_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "3-up";}
					break;
				case level_object_id.id_question_block_invincibility_powerup:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "invincibility_powerup";}
					break;
				case level_object_id.id_question_block_invincibility_powerup_coil_spring:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "invincibility_powerup_coil_spring";}
					break;
				case level_object_id.id_melon_block:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";}
					break;
				case level_object_id.id_melon_block_10_basic_collectibles:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "10_basic_collectibles";}
					break;
				case level_object_id.id_melon_block_heart_balloon:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "heart_balloon";}
					break;
				case level_object_id.id_melon_block_one_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "1-up";}
					break;
				case level_object_id.id_melon_block_two_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "2-up";}
					break;
				case level_object_id.id_melon_block_three_up:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "3-up";}
					break;
				case level_object_id.id_melon_block_invincibility_powerup:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "invincibility_powerup";}
					break;
				case level_object_id.id_melon_block_invincibility_powerup_coil_spring:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "invincibility_powerup_coil_spring";}
					break;
				case level_object_id.id_hard_block:
			        instance_create_depth(x, y, 0, obj_hard_block);
			        break;
			    case level_object_id.id_hard_block_alternate:
			        with(instance_create_depth(x, y, 0, obj_hard_block)) {
			            sprite_index = spr_hard_block_alternate;
			        }
			        break;
			    case level_object_id.id_hard_block_2x2:
			        with(instance_create_depth(x, y, 0, obj_hard_block)) {
			            mask_index = spr_hard_block_2x2;
			            sprite_index = spr_hard_block_2x2;
			        }
			        break;
			    case level_object_id.id_falling_block:
			        instance_create_depth(x, y, 0, obj_falling_block);
			        break;
			    case level_object_id.id_falling_block_solid:
			        instance_create_depth(x, y, 0, obj_falling_block_solid);
			        break;
			    case level_object_id.id_falling_block_long:
			        instance_create_depth(x, y, 0, obj_falling_block_long);
			        break;
			    case level_object_id.id_falling_block_long_solid:
			        instance_create_depth(x, y, 0, obj_falling_block_long_solid);
			        break;
			    case level_object_id.id_cloud_block:
			        instance_create_depth(x, y, 0, obj_cloud_block);
			        break;
			    case level_object_id.id_ice_block:
			        instance_create_depth(x, y, 0, obj_ice_block);
			        break;
			    case level_object_id.id_cardboard_block:
					with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 1;}
					break;
			    case level_object_id.id_cardboard:
					with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 2;}
					break;
				case level_object_id.id_cardboard_long:
			        with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 3;}
			        break;
			    case level_object_id.id_bump_in_ground:
					instance_create_depth(x, y, 0, obj_bump_in_ground);
					break;
				case level_object_id.id_bump_in_ground_8_basic_collectibles:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "8_basic_collectibles";}
					break;
			    case level_object_id.id_bump_in_ground_heart_balloon:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "heart_balloon";}
					break;
			    case level_object_id.id_bump_in_ground_one_up:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "1-up";}
					break;
			    case level_object_id.id_bump_in_ground_two_up:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "2-up";}
					break;
			    case level_object_id.id_bump_in_ground_three_up:
			        with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "3-up";}
					break;
			    case level_object_id.id_bump_in_ground_big_collectible:
			        with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {
			            type_of_bump = "big_collectible";
			        }
			        instance_create_depth(x, y, 0, obj_big_collectible_number);
			        if (instance_exists(obj_big_collectible_number)) {
			            with(obj_big_collectible_number) {
			                big_collectible_number_max = instance_number(obj_big_collectible_number);
			            }
			        }
			        break;
				case level_object_id.id_bump_in_ground_invincibility_powerup: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";}break;
				case level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";}break;
				case 281: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){visible = false;}break;
				case 291: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";visible = false;}break;
				case 301: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";visible = false;}break;
				case 311: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";visible = false;}break;
				case 321: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";visible = false;}break;
				case 331: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";visible = false;}break;
				case level_object_id.id_invisible_bump_in_ground_big_collectible:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground))
					{
						type_of_bump = "big_collectible";
						visible = false;
					}
					instance_create_depth(x, y, 0, obj_big_collectible_number);
				
					#region /* Tell the player how many big collectibles exist in the level */
					if (instance_exists(obj_big_collectible_number))
					{
						with(obj_big_collectible_number)
						{
							big_collectible_number_max = instance_number(obj_big_collectible_number);
						}
					}
					#endregion /* Tell the player how many big collectibles exist in the level END */
				
				break;
				case level_object_id.id_invisible_bump_in_ground_invincibility_powerup: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";visible = false;}break;
				case level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";visible = false;}break;
				case 40: instance_create_depth(x, y, 0, obj_basic_collectible);break;
				case 41: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 315;}break;
				case 42: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 270;}break;
				case 43: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 225; image_yscale = -1;}break;
				case 44: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 180; image_yscale = -1;}break;
				case 45: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 135; image_yscale = -1;}break;
				case 46: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 90;}break;
				case 47: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 45;}break;
				case level_object_id.id_big_collectible:
					instance_create_depth(x, y, 0, obj_big_collectible);
					instance_create_depth(x, y, 0, obj_big_collectible_number);
				
					#region /* Tell the player how many big collectibles exist in the level */
					if (instance_exists(obj_big_collectible_number))
					{
						with(obj_big_collectible_number)
						{
							big_collectible_number_max = instance_number(obj_big_collectible_number);
						}
					}
					#endregion /* Tell the player how many big collectibles exist in the level END */
				
				break;
				case 53: instance_create_depth(x, y, 0, obj_heart_balloon);break;
				case 54: instance_create_depth(x, y, 0, obj_hp_pickup);break;
				case 55: with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = false;}break;
				case 55001: with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = true;}break;
				case 56: instance_create_depth(x, y, 0, obj_extra_life_pickup);break;
				case 57: with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 2;}break;
				case 58: with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 3;}break;
			
				case 59: with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;}break;
				case 5901: with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;coil_spring = true;}break;
				case 5902: with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;}break;
				case 5903: with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;coil_spring = true;}break;
			
				case 591: with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;}break;
				case 592: with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;coil_spring = true;}break;
				case 5911: with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;}break;
				case 5912: with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;coil_spring = true;}break;
				case 60: instance_create_depth(x, y, 0, obj_big_stationary_enemy);break;
				case 601: with(instance_create_depth(x, y, 0, obj_big_stationary_enemy)){coil_spring = true;}break;
				case level_object_id.id_blaster: instance_create_depth(x, y, 0, obj_blaster);break;
				case level_object_id.id_spring: with(instance_create_depth(x, y, 0, obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_ladder: instance_create_depth(x, y, 0, obj_vine);break;
				case 64: with(instance_create_depth(x, y, 0, obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case 65: with(instance_create_depth(x, y, 0, obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_checkpoint:
					instance_create_depth(x, y, 0, obj_checkpoint);
				
					#region /* Tell the player how many checkpoints exist in the level */
					if (instance_exists(obj_checkpoint))
					{
						with(obj_checkpoint)
						{
							checkpoint_number_max = instance_number(obj_checkpoint);
						}
					}
					#endregion /* Tell the player how many checkpoints exist in the level END */
				
				break;
				case level_object_id.id_spikes_emerge_block: instance_create_depth(x, y + 16, 0, obj_spikes_emerge);break;
				case level_object_id.id_spikes_emerge_block_left: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15;}break;
				case level_object_id.id_spikes_emerge_block_down: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30;}break;
				case level_object_id.id_spikes_emerge_block_right: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15;}break;
				case level_object_id.id_spikes_emerge_block_offset_time: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 0; timer_offset = true;}break;
				case level_object_id.id_spikes_emerge_block_left_offset_time: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15; timer_offset = true;}break;
				case level_object_id.id_spikes_emerge_block_down_offset_time: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30; timer_offset = true;}break;
				case level_object_id.id_spikes_emerge_block_right_offset_time: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15; timer_offset = true;}break;
				case 68: instance_create_depth(x, y, 0, obj_oneway);break;
				case 69: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 90;}break;
				case 70: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 180;}break;
				case 71: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 270;}break;
				case level_object_id.id_horizontal_rope: instance_create_depth(x, y, 0, obj_horizontal_rope);break;
				case level_object_id.id_water:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						breathable_water = false;
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						if (asset_get_type("spr_water") == asset_sprite)
						{
							sprite_index = spr_water;
						}
					}
					break;
				case level_object_id.id_breathable_water:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						breathable_water = true;
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						if (asset_get_type("spr_water") == asset_sprite)
						{
							sprite_index = spr_water;
						}
					}
					break;
				case level_object_id.id_water_surface:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						if (asset_get_type("spr_water_surface") == asset_sprite)
						{
							sprite_index = spr_water_surface;
						}
						else
						if (asset_get_type("spr_water") == asset_sprite)
						{
							sprite_index = spr_water;
						}
					}
					break;
				case level_object_id.id_air_bubbles_spawner: instance_create_depth(x, y, 0, obj_air_bubbles_spawner);break;
				case level_object_id.id_water_level_change_slow: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 0; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_water_level_change_fast: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 1; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_water_level_change_faster: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 2; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_clipped_shirt: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_shirt;}break;
				case level_object_id.id_clipped_pants: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_pants;}break;
				case level_object_id.id_clipped_sock: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_sock;}break;
				case level_object_id.id_bucket: instance_create_depth(x, y, 0, obj_bucket);break;
				case level_object_id.id_bucket_8_basic_collectibles: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "8_basic_collectibles";}break;
				case level_object_id.id_bucket_heart_balloon: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "heart_balloon";}break;
				case level_object_id.id_bucket_one_up: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "1-up";}break;
				case level_object_id.id_bucket_two_up: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "2-up";}break;
				case level_object_id.id_bucket_three_up: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "3-up";}break;
				case level_object_id.id_bucket_big_collectible:
					with(instance_create_depth(x, y, 0, obj_bucket))
					{
						item_inside = "big_collectible";
					}
					instance_create_depth(x, y, 0, obj_big_collectible_number);
					
					#region /* Tell the player how many big collectibles exist in the level */
					if (instance_exists(obj_big_collectible_number))
					{
						with(obj_big_collectible_number)
						{
							big_collectible_number_max = instance_number(obj_big_collectible_number);
						}
					}
					#endregion /* Tell the player how many big collectibles exist in the level END */
					break;
				case level_object_id.id_bucket_invincibility_powerup: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup";}break;
				case level_object_id.id_bucket_invincibility_powerup_coil_spring: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup_coil_spring";}break;
				case level_object_id.id_bird: instance_create_depth(x, y, 0, obj_bird);break;
				case 90: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}break;
				case 91: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}break;
				case 92: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_ground_pound; sprite_sign = spr_sign_ground_pound;}break;
				case 93: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}break;
				case 94: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_wall_jump; sprite_sign = spr_sign_wall_jump;}break;
				case level_object_id.id_boss: instance_create_depth(x, y, 0, obj_boss);break;
				case level_object_id.id_boss_barrier: instance_create_depth(x, y, 0, obj_boss_barrier);break;
				case level_object_id.id_cake_stealing_enemy:
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
					ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
					if (global.character_select_in_this_menu == "main_game")
					&& (ini_read_string(level_name, "clear_rate", "closed") != "clear")
					|| (global.character_select_in_this_menu == "level_editor")
					{
						with(instance_create_depth(x, y, 0, obj_cake_stealing_enemy))
						{
							cutscene = 1;
							image_xscale = -1;
							visible = true;
						}
					}
					ini_close();
					break;
				case level_object_id.id_artwork_collection: instance_create_depth(x, y, 0, obj_artwork_collection);break;
				case level_object_id.id_block_only_when_player_is_near: instance_create_depth(x, y, 0, obj_block_only_when_player_is_near_spawner);break;
				case level_object_id.id_door: with(instance_create_depth(x, y, 0, obj_door)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case level_object_id.id_npc: instance_create_depth(x, y, 0, obj_npc);break;
				case level_object_id.id_black_wall: instance_create_depth(x, y, 0, obj_black_wall);break;
				case level_object_id.id_ring: instance_create_depth(x, y, 0, obj_ring);
			}
		}
		#endregion /* Only spawn objects according to difficulty settings END */
		
	}
	else
	{
		switch (object)
		{
		    case 1:
		        instance_create_depth(x, y, 0, obj_wall);
		        break;
		    case 2:
		        instance_create_depth(x, y, 0, obj_level);
		        break;
		    case 3:
		        instance_create_depth(x, y, 0, obj_map_exit);
		        break;
		    case 4:
		        with(instance_create_depth(x, y, 0, obj_map_path_turn))
		        {
		            image_angle = 0;
		        }
		        break;
		    case 5:
		        with(instance_create_depth(x, y, 0, obj_map_path_turn))
		        {
		            image_angle = 90;
		        }
		        break;
		    case 6:
		        with(instance_create_depth(x, y, 0, obj_map_path_turn))
		        {
		            image_angle = 180;
		        }
		        break;
		    case 7:
		        with(instance_create_depth(x, y, 0, obj_map_path_turn))
		        {
		            image_angle = 270;
		        }
		        break;
		}
	}
	instance_destroy(); /* Last thing to do is delete itself */
	
	#endregion /* Spawn objects when starting room END */
	
}