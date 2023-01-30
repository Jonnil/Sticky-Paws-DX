function scr_spawn_objects_when_starting_room()
{
	
	#region /* Spawn objects when starting room */
	if (global.actually_play_edited_level == true)
	or (global.play_edited_level == true)
	{
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
				if (object == 1) and (asset_get_type("obj_ground") == asset_object){instance_create_depth(x, y, 0, obj_ground);}
				if (object == 1001) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 1;}}
				if (object == 1002) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 2;}}
				if (object == 1003) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 3;}}
				if (object == 1004) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 4;}}
				if (object == 1005) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 5;}}
				if (object == 1006) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 6;}}
				if (object == 1007) and (asset_get_type("obj_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_ground)){ground_surface = 7;}}
				
				if (object == 1008){if (asset_get_type("obj_wall_jump_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_jump_panel);}else{if (asset_get_type("obj_wall_jump_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_jump_panel);}}}
				if (object == 1009){if (asset_get_type("obj_wall_climb_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_climb_panel);}else{if (asset_get_type("obj_wall_climb_panel") == asset_object){instance_create_depth(x, y, 0, obj_wall_climb_panel);}}}
				if (object == 2){if (asset_get_type("obj_spikes") == asset_object){instance_create_depth(x, y, 0, obj_spikes);}else{if (asset_get_type("obj_ground") == asset_object){instance_create_depth(x, y, 0, obj_ground);}}}
				if (object == 3) and (asset_get_type("obj_semisolid_platform") == asset_object){instance_create_depth(x, y, 0, obj_semisolid_platform);}
				
				#region /* Brick Block */
				if (object == level_object_id.id_brick_block) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block";}}
				if (object == level_object_id.id_brick_block_10_basic_collectibles) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "10_basic_collectibles";}}
				if (object == level_object_id.id_brick_block_heart_balloon) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "heart_balloon";}}
				if (object == level_object_id.id_brick_block_one_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "1-up";}}
				if (object == level_object_id.id_brick_block_two_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "2-up";}}
				if (object == level_object_id.id_brick_block_three_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "3-up";}}
				if (object == level_object_id.id_brick_block_invincibility_powerup) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "invincibility_powerup";}}
				if (object == level_object_id.id_brick_block_invincibility_powerup_coil_spring) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "brick_block"; item_inside = "invincibility_powerup_coil_spring";}}
				#endregion /* Brick Block END */
				
				#region /* Question Block */
				if (object == level_object_id.id_question_block) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";}}
				if (object == level_object_id.id_question_block_10_basic_collectibles) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "10_basic_collectibles";}}
				if (object == level_object_id.id_question_block_heart_balloon) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "heart_balloon";}}
				if (object == level_object_id.id_question_block_one_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "1-up";}}
				if (object == level_object_id.id_question_block_two_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "2-up";}}
				if (object == level_object_id.id_question_block_three_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "3-up";}}
				if (object == level_object_id.id_question_block_invincibility_powerup) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "invincibility_powerup";}}
				if (object == level_object_id.id_question_block_invincibility_powerup_coil_spring) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "question_block";item_inside = "invincibility_powerup_coil_spring";}}
				#endregion /* Question Block END */
				
				#region /* Melon Block */
				if (object == level_object_id.id_melon_block) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";}}
				if (object == level_object_id.id_melon_block_10_basic_collectibles) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "10_basic_collectibles";}}
				if (object == level_object_id.id_melon_block_heart_balloon) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "heart_balloon";}}
				if (object == level_object_id.id_melon_block_one_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "1-up";}}
				if (object == level_object_id.id_melon_block_two_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "2-up";}}
				if (object == level_object_id.id_melon_block_three_up) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "3-up";}}
				if (object == level_object_id.id_melon_block_invincibility_powerup) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "invincibility_powerup";}}
				if (object == level_object_id.id_melon_block_invincibility_powerup_coil_spring) and (asset_get_type("obj_question_block") == asset_object){with(instance_create_depth(x, y, 0, obj_question_block)){block_type = "melon_block";item_inside = "invincibility_powerup_coil_spring";}}
				#endregion /* Melon Block END */
				
				if (object == level_object_id.id_hard_block) and (asset_get_type("obj_hard_block") == asset_object){instance_create_depth(x, y, 0, obj_hard_block);}
				if (object == level_object_id.id_hard_block_alternate) and (asset_get_type("obj_hard_block") == asset_object){with(instance_create_depth(x, y, 0, obj_hard_block)){sprite_index = spr_hard_block_alternate;}}
				if (object == level_object_id.id_hard_block_2x2) and (asset_get_type("obj_hard_block") == asset_object){with(instance_create_depth(x, y, 0, obj_hard_block)){mask_index = spr_hard_block_2x2; sprite_index = spr_hard_block_2x2;}}
				
				#region /* Falling Block */
				if (object == 19) and (asset_get_type("obj_falling_block") == asset_object){instance_create_depth(x, y, 0, obj_falling_block);}
				if (object == 20) and (asset_get_type("obj_falling_block_solid") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_solid);}
				if (object == 21) and (asset_get_type("obj_falling_block_long") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_long);}
				if (object == 22) and (asset_get_type("obj_falling_block_long_solid") == asset_object){instance_create_depth(x, y, 0, obj_falling_block_long_solid);}
				#endregion /* Falling Block END */
				
				if (object == level_object_id.id_cloud_block) and (asset_get_type("obj_cloud_block") == asset_object){instance_create_depth(x, y, 0, obj_cloud_block);}
				if (object == level_object_id.id_ice_block) and (asset_get_type("obj_ice_block") == asset_object){instance_create_depth(x, y, 0, obj_ice_block);}
				if (object == level_object_id.id_cardboard_block) and (asset_get_type("obj_cardboard") == asset_object){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 1;}}
				if (object == level_object_id.id_cardboard) and (asset_get_type("obj_cardboard") == asset_object){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 2;}}
				if (object == level_object_id.id_cardboard_long) and (asset_get_type("obj_cardboard") == asset_object){with(instance_create_depth(x, y, 0, obj_cardboard)){length = 3;}}
				
				#region /* Bump in ground */
				if (object == 28) and (asset_get_type("obj_bump_in_ground") == asset_object){instance_create_depth(x, y, 0, obj_bump_in_ground);}
				if (object == 29) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";}}
				if (object == 30) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";}}
				if (object == 31) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";}}
				if (object == 32) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";}}
				if (object == 33) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";}}
				if (object == level_object_id.id_bump_in_ground_big_collectible_1)
				and (asset_get_type("obj_bump_in_ground") == asset_object)
				{
					with(instance_create_depth(x, y, 0, obj_bump_in_ground))
					{
						type_of_bump = "big_collectible_1";
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
					
				}
				if (object == 35) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_2";}}
				if (object == 36) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_3";}}
				if (object == 37) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_4";}}
				if (object == 38) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_5";}}
				if (object == level_object_id.id_bump_in_ground_invincibility_powerup) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";}}
				if (object == level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";}}
				#endregion /* Bump in ground END */
				
				#region /* Invisible Bump in ground */
				if (object == 281) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){visible = false;}}
				if (object == 291) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";visible = false;}}
				if (object == 301) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";visible = false;}}
				if (object == 311) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";visible = false;}}
				if (object == 321) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";visible = false;}}
				if (object == 331) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";visible = false;}}
				if (object == level_object_id.id_invisible_bump_in_ground_big_collectible_1)
				and (asset_get_type("obj_bump_in_ground") == asset_object)
				{
					with(instance_create_depth(x, y, 0, obj_bump_in_ground))
					{
						type_of_bump = "big_collectible_1";
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
					
				}
				if (object == 351) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_2";visible = false;}}
				if (object == 361) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_3";visible = false;}}
				if (object == 371) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_4";visible = false;}}
				if (object == 381) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "big_collectible_5";visible = false;}}
				if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";visible = false;}}
				if (object == level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring) and (asset_get_type("obj_bump_in_ground") == asset_object){with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";visible = false;}}
				#endregion /* Invisible Bump in ground END */
				
				#region /* Basic Collectible */
				if (object == 40) and (asset_get_type("obj_basic_collectible") == asset_object){instance_create_depth(x, y, 0, obj_basic_collectible);}
				if (object == 41) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 315;}}
				if (object == 42) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 270;}}
				if (object == 43) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 225; image_yscale = -1;}}
				if (object == 44) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 180; image_yscale = -1;}}
				if (object == 45) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 135; image_yscale = -1;}}
				if (object == 46) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 90;}}
				if (object == 47) and (asset_get_type("obj_basic_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 45;}}
				#endregion /* Basic Collectible END */
				
				#region /* Big Collectibles */
				if (object == level_object_id.id_big_collectible_1)
				{
					if (asset_get_type("obj_big_collectible") == asset_object)
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
						
					}
				}
				if (object == 49) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 2;}}
				if (object == 50) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 3;}}
				if (object == 51) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 4;}}
				if (object == 52) and (asset_get_type("obj_big_collectible") == asset_object){with(instance_create_depth(x, y, 0, obj_big_collectible)){big_collectible = 5;}}
				#endregion /* Big Collectibles END */
				
				if (object == 53) and (asset_get_type("obj_heart_balloon") == asset_object){instance_create_depth(x, y, 0, obj_heart_balloon);}
				if (object == 54) and (asset_get_type("obj_hp_pickup") == asset_object){instance_create_depth(x, y, 0, obj_hp_pickup);}
				if (object == 55) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = false;}}
				if (object == 55001) and (asset_get_type("obj_invincibility_powerup") == asset_object){with(instance_create_depth(x, y, 0, obj_invincibility_powerup)){coil_spring = true;}}
				if (object == 56) and (asset_get_type("obj_extra_life_pickup") == asset_object){instance_create_depth(x, y, 0, obj_extra_life_pickup);}
				if (object == 57) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 2;}}
				if (object == 58) and (asset_get_type("obj_extra_life_pickup") == asset_object){with(instance_create_depth(x, y, 0, obj_extra_life_pickup)){number_of_extra_lives = 3;}}
				
				if (object == 59){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;}}}
				if (object == 5901){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = false;coil_spring = true;}}}
				if (object == 5902){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;}}}
				if (object == 5903){if (asset_get_type("obj_basic_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_basic_enemy)){blind = true;coil_spring = true;}}}
				
				if (object == 591){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;}}}
				if (object == 592){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = false;coil_spring = true;}}}
				if (object == 5911){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;}}}
				if (object == 5912){if (asset_get_type("obj_enemy_bowlingball") == asset_object){with(instance_create_depth(x, y, 0, obj_enemy_bowlingball)){blind = true;coil_spring = true;}}}
				if (object == 60){if (asset_get_type("obj_big_stationary_enemy") == asset_object){instance_create_depth(x, y, 0, obj_big_stationary_enemy);}}
				if (object == 601){if (asset_get_type("obj_big_stationary_enemy") == asset_object){with(instance_create_depth(x, y, 0, obj_big_stationary_enemy)){coil_spring = true;}}}
				if (object == 61){if (asset_get_type("obj_blaster") == asset_object){instance_create_depth(x, y, 0, obj_blaster);}}
				if (object == level_object_id.id_spring) and (asset_get_type("obj_spring") == asset_object){with(instance_create_depth(x, y, 0, obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == 63) and (asset_get_type("obj_vine") == asset_object){instance_create_depth(x, y, 0, obj_vine);}
				if (object == 64) and (asset_get_type("obj_arrow_sign") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == 65) and (asset_get_type("obj_arrow_sign_small") == asset_object){with(instance_create_depth(x, y, 0, obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == level_object_id.id_checkpoint)
				and (asset_get_type("obj_checkpoint") == asset_object)
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
					
				}
				if (object == level_object_id.id_spikes_emerge_block){if (asset_get_type("obj_spikes_emerge") == asset_object){instance_create_depth(x, y + 16, 0, obj_spikes_emerge);}}
				if (object == level_object_id.id_spikes_emerge_block_left){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15;}}}
				if (object == level_object_id.id_spikes_emerge_block_down){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30;}}}
				if (object == level_object_id.id_spikes_emerge_block_right){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15;}}}
				
				if (object == level_object_id.id_spikes_emerge_block_offset_time){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 0; timer_offset = true;}}}
				if (object == level_object_id.id_spikes_emerge_block_left_offset_time){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15; timer_offset = true;}}}
				if (object == level_object_id.id_spikes_emerge_block_down_offset_time){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30; timer_offset = true;}}}
				if (object == level_object_id.id_spikes_emerge_block_right_offset_time){if (asset_get_type("obj_spikes_emerge") == asset_object){with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15; timer_offset = true;}}}
				
				if (object == 68) and (asset_get_type("obj_oneway") == asset_object){instance_create_depth(x, y, 0, obj_oneway);}
				if (object == 69) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 90;}}
				if (object == 70) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 180;}}
				if (object == 71) and (asset_get_type("obj_oneway") == asset_object){with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 270;}}
				if (object == 72) and (asset_get_type("obj_horizontal_rope") == asset_object){instance_create_depth(x, y, 0, obj_horizontal_rope);}
				
				#region /* Create Water */
				if (object == level_object_id.id_water)
				{
					if (asset_get_type("obj_water") == asset_object)
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
					}
				}
				#endregion /* Create Water END */
				
				#region /* Create Breathable Water */
				if (object == level_object_id.id_breathable_water)
				{
					if (asset_get_type("obj_water") == asset_object)
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
					}
				}
				#endregion /* Create Breathable Water END */
				
				#region /* Create Water Surface */
				if (object == level_object_id.id_water_surface)
				{
					if (asset_get_type("obj_water") == asset_object)
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
					}
				}
				#endregion /* Create Water Surface END */
				
				if (object == level_object_id.id_air_bubbles_spawner) and (asset_get_type("obj_air_bubbles_spawner") == asset_object){instance_create_depth(x, y, 0, obj_air_bubbles_spawner);}
				if (object == level_object_id.id_water_level_change_slow) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 0; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == level_object_id.id_water_level_change_fast) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 1; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == level_object_id.id_water_level_change_faster) and (asset_get_type("obj_water_level_change") == asset_object){with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 2; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				
				if (object == 74) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_shirt;}}
				if (object == 75) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_pants;}}
				if (object == 76) and (asset_get_type("obj_clipped_clothes") == asset_object){with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_sock;}}
				
				#region /* Bucket */
				if (object == level_object_id.id_bucket) and (asset_get_type("obj_bucket") == asset_object){instance_create_depth(x, y, 0, obj_bucket);}
				if (object == level_object_id.id_bucket_8_basic_collectibles) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "8_basic_collectibles";}}
				if (object == level_object_id.id_bucket_heart_balloon) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "heart_balloon";}}
				if (object == level_object_id.id_bucket_one_up) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "1-up";}}
				if (object == level_object_id.id_bucket_two_up) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "2-up";}}
				if (object == level_object_id.id_bucket_three_up) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "3-up";}}
				if (object == level_object_id.id_bucket_big_collectible_1)
				and (asset_get_type("obj_bucket") == asset_object)
				{
					with(instance_create_depth(x, y, 0, obj_bucket))
					{
						item_inside = "big_collectible_1";
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
					
				}
				if (object == level_object_id.id_bucket_big_collectible_2) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_2";}}
				if (object == level_object_id.id_bucket_big_collectible_3) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_3";}}
				if (object == level_object_id.id_bucket_big_collectible_4) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_4";}}
				if (object == level_object_id.id_bucket_big_collectible_5) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "big_collectible_5";}}
				if (object == level_object_id.id_bucket_invincibility_powerup) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup";}}
				if (object == level_object_id.id_bucket_invincibility_powerup_coil_spring) and (asset_get_type("obj_bucket") == asset_object){with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup_coil_spring";}}
				#endregion /* Bucket END */
				
				if (object == 89) and (asset_get_type("obj_bird") == asset_object){instance_create_depth(x, y, 0, obj_bird);}
				if (object == 90) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}}
				if (object == 91) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}}
				if (object == 92) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_ground_pound; sprite_sign = spr_sign_ground_pound;}}
				if (object == 93) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}}
				if (object == 94) and (asset_get_type("obj_sign_moveset") == asset_object){with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_wall_jump; sprite_sign = spr_sign_wall_jump;}}
				if (object == 95) and (asset_get_type("obj_boss") == asset_object){instance_create_depth(x, y, 0, obj_boss);}
				if (object == 96) and (asset_get_type("obj_boss_barrier") == asset_object){instance_create_depth(x, y, 0, obj_boss_barrier);}
				if (object == 961)
				and (asset_get_type("obj_cake_stealing_enemy") == asset_object)
				{
					var uppercase_level_name;
					uppercase_level_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 1));
					uppercase_level_name += string_copy(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index)), 2, string_length(string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index))) - 1);
					var level_name = string(uppercase_level_name);
					
					ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
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
				}
				if (object == level_object_id.id_artwork_collection) and (asset_get_type("obj_artwork_collection") == asset_object){instance_create_depth(x, y, 0, obj_artwork_collection);}
				if (object == level_object_id.id_block_only_when_player_is_near) and (asset_get_type("obj_block_only_when_player_is_near_spawner") == asset_object){instance_create_depth(x, y, 0, obj_block_only_when_player_is_near_spawner);}
				if (object == level_object_id.id_door) and (asset_get_type("obj_door") == asset_object){with(instance_create_depth(x, y, 0, obj_door)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}}
				if (object == level_object_id.id_npc) and (asset_get_type("obj_npc") == asset_object){instance_create_depth(x, y, 0, obj_npc);}
			}
			#endregion /* Only spawn objects according to difficulty settings END */
			
		}
		else
		{
			if (object == 1) and (asset_get_type("obj_wall") == asset_object){instance_create_depth(x, y, 0, obj_wall);}
			if (object == 2) and (asset_get_type("obj_level") == asset_object){instance_create_depth(x, y, 0, obj_level);}
			if (object == 3) and (asset_get_type("obj_map_exit") == asset_object){instance_create_depth(x, y, 0, obj_map_exit);}
			if (object == 4) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 0;}}
			if (object == 5) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 90;}}
			if (object == 6) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 180;}}
			if (object == 7) and (asset_get_type("obj_map_path_turn") == asset_object){with(instance_create_depth(x, y, 0, obj_map_path_turn)){image_angle = 270;}}
		}
		instance_destroy(); /* Last thing to do is delete itself */
	}
	
	#endregion /* Spawn objects when starting room END */
	
}