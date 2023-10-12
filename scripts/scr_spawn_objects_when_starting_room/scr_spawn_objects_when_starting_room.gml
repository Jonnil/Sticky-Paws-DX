function scr_spawn_objects_when_starting_room()
{
	#region /* Spawn objects when starting room */
	if (global.world_editor == false)
	{
		
		#region /* Only spawn objects according to difficulty settings */
		if (global.difficulty <= 0)
		&& (easy)
		|| (global.difficulty == 1)
		&& (normal)
		|| (global.difficulty >= 2)
		&& (hard)
		{
			switch (object)
			{
			    case LEVEL_OBJECT_ID.ID_WALL:
			        instance_create_depth(x, y, 0, obj_ground);
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_DIRT:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 1;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_GLASS:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 2;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_GRASS:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 3;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_GRAVEL:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 4;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_METAL:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 5;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_STONE:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 6;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_WOOD:
			        with(instance_create_depth(x, y, 0, obj_ground)) ground_surface = 7;
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL:
			        instance_create_depth(x, y, 0, obj_wall_jump_panel);
			        break;
			    case LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL:
			        instance_create_depth(x, y, 0, obj_wall_climb_panel);
			        break;
			    case LEVEL_OBJECT_ID.ID_SPIKES:
			        instance_create_depth(x, y, 0, obj_spikes);
			        break;
			    case LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM:
			        instance_create_depth(x, y, 0, obj_semisolid_platform);
			        break;
				case LEVEL_OBJECT_ID.ID_BRICK_BLOCK:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";}
			        break;
				case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "10_basic_collectibles";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_HEART_BALLOON:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "heart_balloon";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_ONE_UP:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "1-up";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_TWO_UP:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "2-up";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_THREE_UP:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "3-up";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "invincibility_powerup";}
			        break;
			    case LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING:
			        with(instance_create_depth(x, y, 0, obj_question_block)) {block_type = "brick_block";item_inside = "invincibility_powerup_coil_spring";}
			        break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "10_basic_collectibles";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_HEART_BALLOON:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "heart_balloon";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_ONE_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "1-up";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_TWO_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "2-up";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_THREE_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "3-up";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "invincibility_powerup";}
					break;
				case LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "question_block";item_inside = "invincibility_powerup_coil_spring";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_10_BASIC_COLLECTIBLES:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "10_basic_collectibles";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_HEART_BALLOON:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "heart_balloon";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_ONE_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "1-up";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_TWO_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "2-up";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_THREE_UP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "3-up";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "invincibility_powerup";}
					break;
				case LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING:
					with (instance_create_depth(x, y, 0, obj_question_block)) {block_type = "melon_block";item_inside = "invincibility_powerup_coil_spring";}
					break;
				case LEVEL_OBJECT_ID.ID_HARD_BLOCK:
			        instance_create_depth(x, y, 0, obj_hard_block);
			        break;
			    case LEVEL_OBJECT_ID.ID_HARD_BLOCK_ALTERNATE:
			        with(instance_create_depth(x, y, 0, obj_hard_block)) {
			            sprite_index = spr_hard_block_alternate;
			        }
			        break;
			    case LEVEL_OBJECT_ID.ID_HARD_BLOCK_2X2:
			        with(instance_create_depth(x, y, 0, obj_hard_block)) {
			            sprite_index = spr_hard_block_2x2;
						mask_index = sprite_index;
			        }
			        break;
					
				#region /* Falling Blocks */
			    case LEVEL_OBJECT_ID.ID_FALLING_BLOCK:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block;
						image_index = 0;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_FALLING_BLOCK_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_solid;
						image_index = 0;
					}
					break;
				
				case LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block;
						image_index = 1;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_solid;
						image_index = 1;
					}
					break;
				
				case LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block;
						image_index = 2;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_solid;
						image_index = 2;
					}
					break;
				
				case LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block;
						image_index = 3;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_solid;
						image_index = 3;
					}
					break;
			    #endregion /* Falling Blocks END */
				
				#region /* Falling Blocks Long */
				case LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block_long;
						image_index = 0;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_long_solid;
						image_index = 0;
					}
			        break;
				
				case LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block_long;
						image_index = 1;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_long_solid;
						image_index = 1;
					}
			        break;
				
				case LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block_long;
						image_index = 2;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_long_solid;
						image_index = 2;
					}
			        break;
				
				case LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG:
			        with(instance_create_depth(x, y, 0, obj_falling_block)) {
						sprite_index = spr_falling_block_long;
						image_index = 3;
					}
			        break;
			    case LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG_SOLID:
			        with(instance_create_depth(x, y, 0, obj_falling_block_solid_spawner)) {
						sprite_index = spr_falling_block_long_solid;
						image_index = 3;
					}
			        break;
			    #endregion /* Falling Blocks Long END*/
				
				case LEVEL_OBJECT_ID.ID_CLOUD_BLOCK:
			        instance_create_depth(x, y, 0, obj_cloud_block);
			        break;
			    case LEVEL_OBJECT_ID.ID_ICE_BLOCK:
			        instance_create_depth(x, y, 0, obj_ice_block);
			        break;
				case LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL:
					instance_create_depth(x, y, 0, obj_enemy_only_wall);
					break;
			    case LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK:
					with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 1;}
					break;
			    case LEVEL_OBJECT_ID.ID_CARDBOARD:
					with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 2;}
					break;
				case LEVEL_OBJECT_ID.ID_CARDBOARD_LONG:
			        with(instance_create_depth(x, y, 0, obj_cardboard)) {length = 3;}
			        break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND:
					instance_create_depth(x, y, 0, obj_bump_in_ground);
					break;
				case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "8_basic_collectibles";}
					break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_HEART_BALLOON:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "heart_balloon";}
					break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_ONE_UP:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "1-up";}
					break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_TWO_UP:
					with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "2-up";}
					break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_THREE_UP:
			        with(instance_create_depth(x, y, 0, obj_bump_in_ground)) {type_of_bump = "3-up";}
					break;
			    case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE:
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
				case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";}break;
				case LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";}break;
				case 281: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){visible = false;}break;
				case 291: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "8_basic_collectibles";visible = false;}break;
				case 301: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "heart_balloon";visible = false;}break;
				case 311: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "1-up";visible = false;}break;
				case 321: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "2-up";visible = false;}break;
				case 331: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "3-up";visible = false;}break;
				case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE:
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
				case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup";visible = false;}break;
				case LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING: with(instance_create_depth(x, y, 0, obj_bump_in_ground)){type_of_bump = "invincibility_powerup_coil_spring";visible = false;}break;
				case 40: instance_create_depth(x, y, 0, obj_basic_collectible);break;
				case 41: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 315;}break;
				case 42: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 270;}break;
				case 43: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 225; image_yscale = -1;}break;
				case 44: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 180; image_yscale = -1;}break;
				case 45: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 135; image_yscale = -1;}break;
				case 46: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 90;}break;
				case 47: with(instance_create_depth(x, y, 0, obj_basic_collectible)){image_angle = 45;}break;
				case LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE:
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
				case LEVEL_OBJECT_ID.ID_BLASTER: instance_create_depth(x, y, 0, obj_blaster);break;
				case LEVEL_OBJECT_ID.ID_SPRING: with(instance_create_depth(x, y, 0, obj_spring)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case LEVEL_OBJECT_ID.ID_LADDER: instance_create_depth(x, y, 0, obj_vine);break;
				case 64: with(instance_create_depth(x, y, 0, obj_arrow_sign)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case 65: with(instance_create_depth(x, y, 0, obj_arrow_sign_small)){if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case LEVEL_OBJECT_ID.ID_CHECKPOINT:
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
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK: instance_create_depth(x, y + 16, 0, obj_spikes_emerge);break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 0; timer_offset = true;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 90; x += 20; y -= 15; timer_offset = true;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 180; y -= 30; timer_offset = true;}break;
				case LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME: with(instance_create_depth(x, y + 16, 0, obj_spikes_emerge)){image_angle = 270; x -= 20; y -= 15; timer_offset = true;}break;
				case 68: instance_create_depth(x, y, 0, obj_oneway);break;
				case 69: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 90;}break;
				case 70: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 180;}break;
				case 71: with(instance_create_depth(x, y, 0, obj_oneway)){image_angle = 270;}break;
				case LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE: instance_create_depth(x, y, 0, obj_horizontal_rope);break;
				case LEVEL_OBJECT_ID.ID_WATER:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						breathable_water = false;
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						sprite_index = spr_water;
					}
					break;
				case LEVEL_OBJECT_ID.ID_BREATHABLE_WATER:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						breathable_water = true;
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						sprite_index = spr_water;
					}
					break;
				case LEVEL_OBJECT_ID.ID_WATER_SURFACE:
					with(instance_create_depth(x, y, 0, obj_water))
					{
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
						sprite_index = spr_water_surface;
					}
					break;
				case LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER: instance_create_depth(x, y, 0, obj_air_bubbles_spawner);break;
				case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 0; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 1; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER: with(instance_create_depth(x, y, 0, obj_water_level_change)){water_level_change_speed = 2; if (instance_exists(obj_leveleditor_placed_object)){second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;}}break;
				case LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_shirt;}break;
				case LEVEL_OBJECT_ID.ID_CLIPPED_PANTS: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_pants;}break;
				case LEVEL_OBJECT_ID.ID_CLIPPED_SOCK: with(instance_create_depth(x, y, 0, obj_clipped_clothes)){sprite_index = spr_clipped_sock;}break;
				case LEVEL_OBJECT_ID.ID_BUCKET: instance_create_depth(x, y, 0, obj_bucket);break;
				case LEVEL_OBJECT_ID.ID_BUCKET_8_BASIC_COLLECTIBLES: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "8_basic_collectibles";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_HEART_BALLOON: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "heart_balloon";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_ONE_UP: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "1-up";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_TWO_UP: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "2-up";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_THREE_UP: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "3-up";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE:
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
				case LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup";}break;
				case LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING: with(instance_create_depth(x, y, 0, obj_bucket)){item_inside = "invincibility_powerup_coil_spring";}break;
				case LEVEL_OBJECT_ID.ID_BIRD: instance_create_depth(x, y, 0, obj_bird);break;
				case 90: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_crouch; sprite_sign = spr_sign_crouch;}break;
				case 91: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_dive; sprite_sign = spr_sign_dive;}break;
				case 92: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_ground_pound; sprite_sign = spr_sign_ground_pound;}break;
				case 93: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_rope_spin; sprite_sign = spr_sign_rope_spin;}break;
				case 94: with(instance_create_depth(x, y, 0, obj_sign_moveset)){sprite_index = spr_sign_wall_jump; sprite_sign = spr_sign_wall_jump;}break;
				case LEVEL_OBJECT_ID.ID_BOSS: instance_create_depth(x, y, 0, obj_boss);break;
				case LEVEL_OBJECT_ID.ID_BOSS_BARRIER: instance_create_depth(x, y, 0, obj_boss_barrier);break;
				case LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY:
					with(instance_create_depth(x, y, 0, obj_cake_stealing_enemy))
					{
						cutscene = 1;
						image_xscale = -1;
						visible = true;
					}
					break;
				case LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION: instance_create_depth(x, y, 0, obj_artwork_collection);break;
				case LEVEL_OBJECT_ID.ID_EYE_BLOCK: instance_create_depth(x, y, 0, obj_eye_block_spawner);break;
				case LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY: with(instance_create_depth(x, y, 0, obj_eye_block_spawner)){sprite_index = global.resource_pack_sprite_eye_block_enemy;}break;
				case LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER: with(instance_create_depth(x, y, 0, obj_eye_block_spawner)){sprite_index = global.resource_pack_sprite_eye_block_enemy_player;}break;
				case LEVEL_OBJECT_ID.ID_DOOR: with(instance_create_depth(x, y, 0, obj_door))
				{
					if (instance_exists(obj_leveleditor_placed_object))
					{
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
					}
				}
				break;
				case LEVEL_OBJECT_ID.ID_WARP_BOX: with(instance_create_depth(x, y, 0, obj_door))
				{
					player_need_to_be_on_ground_to_enter = false;
					door_need_to_be_on_ground_to_enter = false;
					need_to_press_up_to_enter = false;
					destroy_door_after_use = false;
					sprite_index = spr_warp_box;
					if (instance_exists(obj_leveleditor_placed_object))
					{
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
					}
				}
				break;
				case LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE: with(instance_create_depth(x, y, 0, obj_door))
				{
					player_need_to_be_on_ground_to_enter = false;
					door_need_to_be_on_ground_to_enter = false;
					need_to_press_up_to_enter = false;
					destroy_door_after_use = true;
					sprite_index = spr_warp_box_one_use;
					if (instance_exists(obj_leveleditor_placed_object))
					{
						second_x = instance_nearest(x, y, obj_leveleditor_placed_object).second_x;
						second_y = instance_nearest(x, y, obj_leveleditor_placed_object).second_y;
					}
				}
				break;
				case LEVEL_OBJECT_ID.ID_NPC: instance_create_depth(x, y, 0, obj_npc);break;
				case LEVEL_OBJECT_ID.ID_BLACK_WALL: instance_create_depth(x, y, 0, obj_black_wall);break;
				case LEVEL_OBJECT_ID.ID_RING: instance_create_depth(x, y, 0, obj_ring);
				case LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_1: with(instance_create_depth(x, y, 0, obj_appear_block_spawner)){appear_cycle = 1;image_blend = c_yellow;}break;
				case LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_2: with(instance_create_depth(x, y, 0, obj_appear_block_spawner)){appear_cycle = 2;image_blend = c_aqua;}break;
				case LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_3: with(instance_create_depth(x, y, 0, obj_appear_block_spawner)){appear_cycle = 3;image_blend = c_red;}break;
				case LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_4: with(instance_create_depth(x, y, 0, obj_appear_block_spawner)){appear_cycle = 4;image_blend = c_purple;}break;
				case LEVEL_OBJECT_ID.ID_APPEAR_BLOCK_5: with(instance_create_depth(x, y, 0, obj_appear_block_spawner)){appear_cycle = 5;image_blend = c_lime;}break;
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
	#endregion /* Spawn objects when starting room END */
	
	instance_destroy(); /* Last thing to do is delete itself */
}