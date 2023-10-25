function scr_modify_objects_in_level_editor()
{
	
	#region /* Modify Objects */
	if (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	&& (!mouse_check_button(mb_right))
	&& (delay > 1)
	&& (instance_exists(obj_leveleditor))
	&& (!keyboard_check(vk_space))
	&& (!mouse_check_button(mb_middle))
	&& (!mouse_check_button(mb_right))
	&& (instance_exists(obj_leveleditor))
	&& (obj_leveleditor.fill_mode == false)
	&& (obj_leveleditor.erase_mode == false)
	&& (obj_leveleditor.pause == false)
	&& (obj_leveleditor.menu_delay == 0 && menu_joystick_delay == 0)
	&& (!place_meeting(x, y, obj_level_player1_start))
	&& (!place_meeting(x, y, obj_level_player2_start))
	&& (!place_meeting(x, y, obj_level_player3_start))
	&& (!place_meeting(x, y, obj_level_player4_start))
	&& (!position_meeting(x, y, obj_level_height))
	&& (!position_meeting(x, y, obj_level_width))
	&& (!position_meeting(x, y, obj_water_level_height))
	&& (!obj_leveleditor.hovering_over_icons)
	&& (obj_leveleditor.placing_object <= 0)
	{
		if (keyboard_check_pressed(ord("A")))
		&& (!keyboard_check(vk_control))
		|| (mouse_check_button_released(mb_left))
		&& (dragged_from_original_place == false)
		&& (placed_for_the_first_time == false)
		|| (instance_exists(obj_leveleditor))
		&& (obj_leveleditor.key_a_released)
		&& (dragged_from_original_place == false)
		&& (placed_for_the_first_time == false)
		|| (instance_exists(obj_leveleditor))
		&& (gamepad_button_check_released(global.player_slot[1], obj_leveleditor.button_draw))
		&& (dragged_from_original_place == false)
		&& (placed_for_the_first_time == false)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				/* Don't put a move_snap here! We don't want the object to change position when modifying it */
				
				#region /* Object ID's to modify */
				if (global.world_editor == false)
				{
					modify_object_menu = true;
					
					#region /* Change wall into it's different forms */
					if (object == LEVEL_OBJECT_ID.ID_WALL)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_DIRT;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_DIRT)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_GLASS;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_GLASS)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_GRASS;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_GRASS)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_GRAVEL;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_GRAVEL)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_METAL;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_METAL)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_STONE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_STONE)
					{
						object = LEVEL_OBJECT_ID.ID_WALL_WOOD;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WALL_WOOD)
					{
						object = LEVEL_OBJECT_ID.ID_WALL;
					}
					#endregion /* Change wall into it's different forms END */
					
					else
					
					#region /* Change bump in ground to it's different forms */
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND;
					}
					#endregion /* Change bump in ground to it's different forms END */
					
					#region /* Change invisible bump in ground to it's different forms */
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND;
					}
					#endregion /* Change invisible bump in ground to it's different forms END */
					
					else
					
					#region /* Change Basic Collectible Direction */
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_2;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_2)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_3;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_3)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_4;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_4)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_5;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_5)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_6;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_6)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_7;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_7)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_8;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_8)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE;
					}
					#endregion /* Change Basic Collectible Direction */
					
					else
					
					#region /* Falling Block */
					if (object == LEVEL_OBJECT_ID.ID_FALLING_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_FALLING_BLOCK_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_FALLING_BLOCK_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_FALLING_BLOCK;
					}
					#endregion /* Falling Block END */
					
					#region /* Falling Block Long */
					if (object == LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG)
					{
						object = LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG)
					{
						object = LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG)
					{
						object = LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG)
					{
						object = LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG_SOLID;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG_SOLID)
					{
						object = LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG;
					}
					#endregion /* Falling Block Long END */
					
					else
					
					#region /* Brick Block */
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BRICK_BLOCK;
					}
					#endregion /* Brick Block */
					
					else
					
					#region /* Question Block */
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_QUESTION_BLOCK;
					}
					#endregion /* Question Block */
					
					else
					
					#region /* Melon Block */
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_10_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_10_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_MELON_BLOCK;
					}
					#endregion /* Melon Block */
					
					else
					
					#region /* Hard Block */
					if (object == LEVEL_OBJECT_ID.ID_HARD_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_HARD_BLOCK_ALTERNATE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_HARD_BLOCK_ALTERNATE)
					{
						object = LEVEL_OBJECT_ID.ID_HARD_BLOCK_2X2;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_HARD_BLOCK_2X2)
					{
						object = LEVEL_OBJECT_ID.ID_HARD_BLOCK;
					}
					#endregion /* Hard Block END */
					
					else
					
					#region /* Heart Balloon / HP Pickup */
					if (object == LEVEL_OBJECT_ID.ID_HEART)
					{
						object = LEVEL_OBJECT_ID.ID_HP_PICKUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_HP_PICKUP)
					{
						object = LEVEL_OBJECT_ID.ID_HEART;
					}
					#endregion /* Heart Balloon / HP Pickup END */
					
					else
					
					#region /* Invincibility Powerup */
					if (object == LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP;
					}
					#endregion /* Invincibility Powerup END */
					
					else
					
					#region /* Extra Lives Pickup */
					if (object == LEVEL_OBJECT_ID.ID_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_ONE_UP;
					}
					#endregion /* Extra Lives Pickup END */
					
					else
					
					#region /* Basic enemy */
					if (object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BASIC_ENEMY;
					}
					#endregion /* Basic enemy END */
					
					else
					
					#region /* Bowling ball enemy */
					if (object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL)
					{
						object = LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND)
					{
						object = LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL;
					}
					#endregion /* Bowling ball enemy END */
					
					else
					
					#region /* Big Stationary Enemy */
					if (object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY)
					{
						object = LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY;
					}
					#endregion /* Big Stationary Enemy END */
					
					else
					
					#region /* Spikes Emerge Direction */
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME)
					{
						object = LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK;
					}
					#endregion /* Spikes Emerge Direction END */
					
					else
					
					#region /* Change Arrow Sign */
					if (object == LEVEL_OBJECT_ID.ID_ARROW_SIGN)
					{
						object = LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL)
					{
						object = LEVEL_OBJECT_ID.ID_ARROW_SIGN;
					}
					#endregion /* Change Arrow Sign END */
					
					else
					
					#region /* Change Oneway Direction */
					if (object == LEVEL_OBJECT_ID.ID_ONEWAY)
					{
						object = LEVEL_OBJECT_ID.ID_ONEWAY2;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ONEWAY2)
					{
						object = LEVEL_OBJECT_ID.ID_ONEWAY3;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ONEWAY3)
					{
						object = LEVEL_OBJECT_ID.ID_ONEWAY4;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_ONEWAY4)
					{
						object = LEVEL_OBJECT_ID.ID_ONEWAY;
					}
					#endregion /* Change Oneway Direction END */
					
					else
					
					#region /* Change Water */
					if (object == LEVEL_OBJECT_ID.ID_WATER)
					{
						object = LEVEL_OBJECT_ID.ID_BREATHABLE_WATER;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BREATHABLE_WATER)
					{
						object = LEVEL_OBJECT_ID.ID_LAVA;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_LAVA)
					{
						object = LEVEL_OBJECT_ID.ID_WATER;
					}
					#endregion /* Change Water END */
					
					else
					
					#region /* Change Clipped Clothing on Rope */
					if (object == LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT)
					{
						object = LEVEL_OBJECT_ID.ID_CLIPPED_PANTS;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_CLIPPED_PANTS)
					{
						object = LEVEL_OBJECT_ID.ID_CLIPPED_SOCK;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_CLIPPED_SOCK)
					{
						object = LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT;
					}
					#endregion /* Change Clipped Clothing on Rope END */
					
					else
					
					#region /* Change bucket to its different forms */
					if (object == LEVEL_OBJECT_ID.ID_BUCKET)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_8_BASIC_COLLECTIBLES;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_8_BASIC_COLLECTIBLES)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_HEART_BALLOON;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_HEART_BALLOON)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_ONE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_ONE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_TWO_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_TWO_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_THREE_UP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_THREE_UP)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING)
					{
						object = LEVEL_OBJECT_ID.ID_BUCKET;
					}
					#endregion /* Change bucket to its different forms END */
					
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
					
					else
					
					#region /* Change Eye Block */
					if (object == LEVEL_OBJECT_ID.ID_EYE_BLOCK)
					{
						object = LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY)
					{
						object = LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER)
					{
						object = LEVEL_OBJECT_ID.ID_EYE_BLOCK;
					}
					#endregion /* Change Eye Block END */
					
					else
					
					#region /* Change Water Level Change */
					if (object == LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW)
					{
						object = LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST)
					{
						object = LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER)
					{
						object = LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW;
					}
					#endregion /* Change Water Level Change END */
					
					else
					
					#region /* Change Warp Box */
					if (object == LEVEL_OBJECT_ID.ID_WARP_BOX)
					{
						object = LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE)
					{
						object = LEVEL_OBJECT_ID.ID_WARP_BOX;
					}
					#endregion /* Change Warp Box END */
					
					else
					
					#region /* Readable Sign */
					if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
					{
						if (!instance_exists(obj_leveleditor_modify_object_menu))
						{
							instance_create_depth(x, y, 0, obj_leveleditor_modify_object_menu);
						}
					}
					#endregion /* Readable Sign END */
					
					#region /* Update variables */
					if (global.actually_play_edited_level == false)
					{
						for(i = 0; i < ds_grid_height(global.object_grid)-1; i += 1)
						{
							if (object == ds_grid_get(global.object_grid, 0, i))
							{
								sprite_index = ds_grid_get(global.object_grid, 1, i);
								image_index = ds_grid_get(global.object_grid, 2, i);
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
	#endregion /* Modify Objects END */
	
}