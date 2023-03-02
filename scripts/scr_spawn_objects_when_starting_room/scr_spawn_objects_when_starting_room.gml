function scr_spawn_objects_when_starting_room()
{
	
	#region /* Spawn objects when starting room */
	if (global.world_editor == false)
	{
		
		#region /* Only spawn objects according to difficulty settings */
		if (global.difficulty <= 0)
		and (easy == true)
		or (global.difficulty == 1)
		and (normal == true)
		or (global.difficulty >= 2)
		and (hard == true)
		{
			if (object == level_object_id.id_wall){instance_create_depth(x, y, 0, obj_ground);}else
			if (object == level_object_id.id_wall_dirt){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 1;}}else
			if (object == level_object_id.id_wall_glass){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 2;}}else
			if (object == level_object_id.id_wall_grass){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 3;}}else
			if (object == level_object_id.id_wall_gravel){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 4;}}else
			if (object == level_object_id.id_wall_metal){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 5;}}else
			if (object == level_object_id.id_wall_stone){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 6;}}else
			if (object == level_object_id.id_wall_wood){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 7;}}else
			
			if (object == level_object_id.id_wall_jump_panel){instance_create_depth(x, y, 0, obj_wall_jump_panel);}else
			if (object == level_object_id.id_wall_climb_panel){instance_create_depth(x, y, 0, obj_wall_climb_panel);}else
			if (object == level_object_id.id_spikes){instance_create_depth(x, y, 0, obj_spikes);}else
			if (object == level_object_id.id_semisolid_platform){instance_create_depth(x, y, 0, obj_semisolid_platform);}else
			
			#region /* Brick Block */
			if (object == level_object_id.id_brick_block){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block";}}else
			if (object == level_object_id.id_brick_block_10_basic_collectibles){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "10_basic_collectibles";}}else
			if (object == level_object_id.id_brick_block_heart_balloon){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "heart_balloon";}}else
			if (object == level_object_id.id_brick_block_one_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "1-up";}}else
			if (object == level_object_id.id_brick_block_two_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "2-up";}}else
			if (object == level_object_id.id_brick_block_three_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "3-up";}}else
			if (object == level_object_id.id_brick_block_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "invincibility_powerup";}}else
			if (object == level_object_id.id_brick_block_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "invincibility_powerup_coil_spring";}}else
			#endregion /* Brick Block END */
			
			#region /* Question Block */
			if (object == level_object_id.id_question_block){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";}}else
			if (object == level_object_id.id_question_block_10_basic_collectibles){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "10_basic_collectibles";}}else
			if (object == level_object_id.id_question_block_heart_balloon){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "heart_balloon";}}else
			if (object == level_object_id.id_question_block_one_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "1-up";}}else
			if (object == level_object_id.id_question_block_two_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "2-up";}}else
			if (object == level_object_id.id_question_block_three_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "3-up";}}else
			if (object == level_object_id.id_question_block_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "invincibility_powerup";}}else
			if (object == level_object_id.id_question_block_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "invincibility_powerup_coil_spring";}}else
			#endregion /* Question Block END */
			
			#region /* Melon Block */
			if (object == level_object_id.id_melon_block){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";}}else
			if (object == level_object_id.id_melon_block_10_basic_collectibles){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "10_basic_collectibles";}}else
			if (object == level_object_id.id_melon_block_heart_balloon){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "heart_balloon";}}else
			if (object == level_object_id.id_melon_block_one_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "1-up";}}else
			if (object == level_object_id.id_melon_block_two_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "2-up";}}else
			if (object == level_object_id.id_melon_block_three_up){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "3-up";}}else
			if (object == level_object_id.id_melon_block_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "invincibility_powerup";}}else
			if (object == level_object_id.id_melon_block_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "invincibility_powerup_coil_spring";}}else
			#endregion /* Melon Block END */
			
			if (object == level_object_id.id_hard_block){instance_create_depth(x, y, 0, obj_hard_block);}else
			if (object == level_object_id.id_hard_block_alternate){with(instance_create_depth(x, y, 0, obj_hard_block)){sprite_index = spr_hard_block_alternate;}}else
			if (object == level_object_id.id_hard_block_2x2){with(instance_create_depth(x, y, 0, obj_hard_block)){mask_index = spr_hard_block_2x2; sprite_index = spr_hard_block_2x2;}}else
			
			#region /* Falling Block */
			if (object == level_object_id.id_falling_block){instance_create_depth(x, y, 0, obj_falling_block);}else
			if (object == level_object_id.id_falling_block_solid){instance_create_depth(x, y, 0, obj_falling_block_solid);}else
			if (object == level_object_id.id_falling_block_long){instance_create_depth(x, y, 0, obj_falling_block_long);}else
			if (object == level_object_id.id_falling_block_long_solid){instance_create_depth(x, y, 0, obj_falling_block_long_solid);}else
			#endregion /* Falling Block END */
			
			if (object == level_object_id.id_cloud_block){instance_create_depth(x, y, 0, obj_cloud_block);}else
			if (object == level_object_id.id_ice_block){instance_create_depth(x, y, 0, obj_ice_block);}else
			if (object == level_object_id.id_cardboard_block){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 1;}}else
			if (object == level_object_id.id_cardboard){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 2;}}else
			if (object == level_object_id.id_cardboard_long){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 3;}}else
			
			#region /* Bump in ground */
			if (object == level_object_id.id_bump_in_ground) and (asset_get_type("obj_bump_in_ground") == asset_object){instance_create_depth(x, y, 0, obj_bump_in_ground);}else
			if (object == level_object_id.id_bump_in_ground_8_basic_collectibles) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";}}else
			if (object == level_object_id.id_bump_in_ground_heart_balloon) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";}}else
			if (object == level_object_id.id_bump_in_ground_one_up) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";}}else
			if (object == level_object_id.id_bump_in_ground_two_up) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";}}else
			if (object == level_object_id.id_bump_in_ground_three_up) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";}}else
			if (object == level_object_id.id_bump_in_ground_big_collectible)
			{
				with(instance_create_depth(x, y, 0, obj_bump_in_ground))
				{
					type_of_bump = "big_collectible";
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
				
			}else
			if (object == level_object_id.id_bump_in_ground_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";}}else
			if (object == level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";}}else
			#endregion /* Bump in ground END */
			
			#region /* Invisible Bump in ground */
			if (object == 281) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){visible = false;}}else
			if (object == 291) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";visible = false;}}else
			if (object == 301) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";visible = false;}}else
			if (object == 311) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";visible = false;}}else
			if (object == 321) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";visible = false;}}else
			if (object == 331) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";visible = false;}}else
			if (object == level_object_id.id_invisible_bump_in_ground_big_collectible)
			{
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
				
			}else
			if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";visible = false;}}else
			if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";visible = false;}}else
			#endregion /* Invisible Bump in ground END */
			
			#region /* Basic Collectible */
			if (object == 40) and (asset_get_type("obj_basic_collectible") == asset_object){instance_create_depth(x, y, 0, obj_basic_collectible);}else
			if (object == 41) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 315;}}else
			if (object == 42) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 270;}}else
			if (object == 43) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 225; image_yscale = -1;}}else
			if (object == 44) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 180; image_yscale = -1;}}else
			if (object == 45) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 135; image_yscale = -1;}}else
			if (object == 46) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 90;}}else
			if (object == 47) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 45;}}else
			#endregion /* Basic Collectible END */
			
			#region /* Big Collectibles */
			if (object == level_object_id.id_big_collectible)
			{
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
				
			}else
			#endregion /* Big Collectibles END */
			
			if (object == 53) and (asset_get_type("obj_heart_balloon") == asset_object){instance_create_depth(x, y, 0, obj_heart_balloon);}else
			if (object == 54) and (asset_get_type("obj_hp_pickup") == asset_object){instance_create_depth(x, y, 0, obj_hp_pickup);}else
			if (object == 55) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = false;}}else
			if (object == 55001) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = true;}}else
			if (object == 56) and (asset_get_type("obj_extra_life_pickup") == asset_object){instance_create_depth(x, y, 0, obj_extra_life_pickup);}else
			if (object == 57) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 2;}}else
			if (object == 58) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 3;}}else
			
			if (object == 59){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;}}}else
			if (object == 5901){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;coil_spring = true;}}}else
			if (object == 5902){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;}}}else
			if (object == 5903){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;coil_spring = true;}}}else
			
			if (object == 591){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;}}}else
			if (object == 592){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;coil_spring = true;}}}else
			if (object == 5911){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;}}}else
			if (object == 5912){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;coil_spring = true;}}}else
			if (object == 60){if (asset_get_type("obj_big_stationary_enemy") == asset_object){instance_create_depth(x, y, 0, obj_big_stationary_enemy);}}else
			if (object == 601){if (asset_get_type("obj_big_stationary_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_big_stationary_enemy)){coil_spring = true;}}}else
			if (object == level_object_id.id_blaster){instance_create_depth(x, y, 0, obj_blaster);}else
			if (object == level_object_id.id_spring){with(instance_create_depth(x, y, 0, obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == level_object_id.id_ladder){instance_create_depth(x, y, 0, obj_vine);}else
			if (object == 64) and (asset_get_type("obj_arrow_sign") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == 65) and (asset_get_type("obj_arrow_sign_small") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == level_object_id.id_checkpoint)
			{
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
				
			}else
			if (object == level_object_id.id_spikes_emerge_block){instance_create_depth(x, y + 16, 0, obj_spikes_emerge);}else
			if (object == level_object_id.id_spikes_emerge_block_left){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15;}}else
			if (object == level_object_id.id_spikes_emerge_block_down){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30;}}else
			if (object == level_object_id.id_spikes_emerge_block_right){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15;}}else
			
			if (object == level_object_id.id_spikes_emerge_block_offset_time){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 0; timer_offset = true;}}else
			if (object == level_object_id.id_spikes_emerge_block_left_offset_time){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15; timer_offset = true;}}else
			if (object == level_object_id.id_spikes_emerge_block_down_offset_time){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30; timer_offset = true;}}else
			if (object == level_object_id.id_spikes_emerge_block_right_offset_time){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15; timer_offset = true;}}else
			
			if (object == 68) and (asset_get_type("obj_oneway") == asset_object){instance_create_depth(x, y, 0, obj_oneway);}else
			if (object == 69) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 90;}}else
			if (object == 70) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 180;}}else
			if (object == 71) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 270;}}else
			if (object == level_object_id.id_horizontal_rope){instance_create_depth(x, y, 0, obj_horizontal_rope);}else
			
			#region /* Create Water */
			if (object == level_object_id.id_water)
			{
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
			}else
			#endregion /* Create Water END */
			
			#region /* Create Breathable Water */
			if (object == level_object_id.id_breathable_water)
			{
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
			}else
			#endregion /* Create Breathable Water END */
			
			#region /* Create Water Surface */
			if (object == level_object_id.id_water_surface)
			{
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
			}else
			#endregion /* Create Water Surface END */
			
			if (object == level_object_id.id_air_bubbles_spawner){instance_create_depth(x, y, 0, obj_air_bubbles_spawner);}else
			if (object == level_object_id.id_water_level_change_slow){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 0; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == level_object_id.id_water_level_change_fast){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 1; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == level_object_id.id_water_level_change_faster){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 2; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			
			if (object == level_object_id.id_clipped_shirt){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_shirt;}}else
			if (object == level_object_id.id_clipped_pants){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_pants;}}else
			if (object == level_object_id.id_clipped_sock){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_sock;}}else
			
			#region /* Bucket */
			if (object == level_object_id.id_bucket){instance_create_depth(x, y, 0, obj_bucket);}else
			if (object == level_object_id.id_bucket_8_basic_collectibles){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "8_basic_collectibles";}}else
			if (object == level_object_id.id_bucket_heart_balloon){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "heart_balloon";}}else
			if (object == level_object_id.id_bucket_one_up){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "1-up";}}else
			if (object == level_object_id.id_bucket_two_up){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "2-up";}}else
			if (object == level_object_id.id_bucket_three_up){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "3-up";}}else
			if (object == level_object_id.id_bucket_big_collectible)
			{
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
				
			}else
			if (object == level_object_id.id_bucket_invincibility_powerup){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup";}}else
			if (object == level_object_id.id_bucket_invincibility_powerup_coil_spring){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup_coil_spring";}}else
			#endregion /* Bucket END */
			
			if (object == level_object_id.id_bird){instance_create_depth(x, y, 0, obj_bird);}else
			if (object == 90) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}}else
			if (object == 91) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}}else
			if (object == 92) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_ground_pound; sprite_sign = spr_sign_ground_pound;}}else
			if (object == 93) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}}else
			if (object == 94) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_wall_jump; sprite_sign = spr_sign_wall_jump;}}else
			if (object == level_object_id.id_boss){instance_create_depth(x, y, 0, obj_boss);}else
			if (object == level_object_id.id_boss_barrier){instance_create_depth(x, y, 0, obj_boss_barrier);}else
			if (object == level_object_id.id_cake_stealing_enemy)
			{
				var uppercase_level_name;
				uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
				uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
				var level_name = string(uppercase_level_name);
				
				ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
				if (global.character_select_in_this_menu == "main_game")
				and (ini_read_string(level_name, "clear_rate", "closed") != "clear")
				{
					with(instance_create_depth(x, y, 0, obj_cake_stealing_enemy))
					{
						cutscene = 1;
						image_xscale = -1;
						visible = true;
					}
					with(instance_create_depth(x, y, 0, obj_cake))
					{
						cutscene = 1;
					}
				}
				ini_close();
			}else
			if (object == level_object_id.id_artwork_collection){instance_create_depth(x, y, 0, obj_artwork_collection);}else
			if (object == level_object_id.id_block_only_when_player_is_near){instance_create_depth(x, y, 0, obj_block_only_when_player_is_near_spawner);}else
			if (object == level_object_id.id_door){with(instance_create_depth(x, y, 0, obj_door)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}else
			if (object == level_object_id.id_npc){instance_create_depth(x, y, 0, obj_npc);}else
			if (object == level_object_id.id_black_wall){instance_create_depth(x, y, 0, obj_black_wall);}else
			if (object == level_object_id.id_ring){instance_create_depth(x, y, 0, obj_ring);}
		}
		#endregion /* Only spawn objects according to difficulty settings END */
		
	}
	else
	{
		if (object == 1) and (asset_get_type("obj_wall") == asset_object){instance_create_depth(x, y, 0, obj_wall);}else
		if (object == 2) and (asset_get_type("obj_level") == asset_object){instance_create_depth(x, y, 0, obj_level);}else
		if (object == 3) and (asset_get_type("obj_map_exit") == asset_object){instance_create_depth(x, y, 0, obj_map_exit);}else
		if (object == 4) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 0;}}else
		if (object == 5) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 90;}}else
		if (object == 6) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 180;}}else
		if (object == 7) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 270;}}
	}
	instance_destroy(); /* Last thing to do is delete itself */
	
	#endregion /* Spawn objects when starting room END */
	
}