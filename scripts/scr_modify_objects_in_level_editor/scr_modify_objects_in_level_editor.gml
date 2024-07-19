function scr_modify_objects_in_level_editor()
{
	
	#region /* Modify Objects */
	
	if (mouse_check_button_released(mb_left))
	|| (instance_exists(obj_leveleditor))
	&& (obj_leveleditor.key_a_released)
	|| (instance_exists(obj_leveleditor))
	&& (gamepad_button_check_released(global.player_slot[1], obj_leveleditor.button_draw))
	{
		if (!dragged_from_original_place)
		&& (!placed_for_the_first_time)
		&& (delay > 1)
		&& (!keyboard_check(vk_space))
		&& (!mouse_check_button(mb_middle))
		&& (!mouse_check_button(mb_right))
		&& (instance_exists(obj_leveleditor))
		&& (!keyboard_check(vk_space))
		&& (!mouse_check_button(mb_middle))
		&& (!mouse_check_button(mb_right))
		&& (instance_exists(obj_leveleditor))
		&& (!obj_leveleditor.fill_mode)
		&& (!obj_leveleditor.erase_mode)
		&& (!obj_leveleditor.pause)
		&& (obj_leveleditor.menu_delay == 0 && menu_joystick_delay == 0)
		&& (!place_meeting(x, y, obj_level_player1_start))
		&& (!place_meeting(x, y, obj_level_player2_start))
		&& (!place_meeting(x, y, obj_level_player3_start))
		&& (!place_meeting(x, y, obj_level_player4_start))
		&& (!position_meeting(x, y, obj_level_height))
		&& (!position_meeting(x, y, obj_level_width))
		&& (!position_meeting(x, y, obj_level_end))
		&& (!position_meeting(x, y, obj_water_level_height))
		&& (!obj_leveleditor.hovering_over_icon)
		&& (obj_leveleditor.placing_object <= 0)
		{
			var other_instance = instance_place(x, y, obj_leveleditor_placed_object); /* Check if another obj_leveleditor_placed_object is at the same position (x, y) */
			
			if (other_instance == noone || other_instance == id) /* Ensure that no other instance is found or that the only instance found is the current instance */
			&& (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				/* Don't put a move_snap here! We don't want the object to change position when modifying it */
				
				#region /* Object ID's to modify */
				if (!global.world_editor)
				{
					modify_object_menu = true;
					
					#region /* Change wall into it's different forms */
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
						object = LEVEL_OBJECT_ID.ID_WALL_DIRT;
					}
					#endregion /* Change wall into it's different forms END */
					
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
					
					#region /* Change Bulk Collectible Number */
					if (object == LEVEL_OBJECT_ID.ID_10_BULK_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_30_BULK_COLLECTIBLE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_30_BULK_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_50_BULK_COLLECTIBLE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_50_BULK_COLLECTIBLE)
					{
						object = LEVEL_OBJECT_ID.ID_10_BULK_COLLECTIBLE;
					}
					#endregion /* Change Bulk Collectible Number */
					
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
					
					#region /* Change Moveset Signs */
					if (object == LEVEL_OBJECT_ID.ID_SIGN_CROUCH)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_DIVE;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SIGN_DIVE)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_GROUND_POUND;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SIGN_GROUND_POUND)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_ROPE_SPIN;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SIGN_ROPE_SPIN)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_WALL_JUMP;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SIGN_WALL_JUMP)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_RUN;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_SIGN_RUN)
					{
						object = LEVEL_OBJECT_ID.ID_SIGN_CROUCH;
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
						object = LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WARP_BOX_LOCKED)
					{
						object = LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_WARP_BOX_ONE_USE_LOCKED)
					{
						object = LEVEL_OBJECT_ID.ID_WARP_BOX;
					}
					#endregion /* Change Warp Box END */
					
					else
					
					#region /* Change Bump in Ground */
					if (object == LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND)
					{
						object = LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND;
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND)
					{
						object = LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND;
					}
					#endregion /* Change Bump in Ground END */
					
					else
					
					#region /* Objects that needs modify menu */
					if (object == LEVEL_OBJECT_ID.ID_SIGN_READABLE)
					{
						if (!instance_exists(obj_leveleditor_modify_object_menu))
						{
							with(instance_create_depth(x, y, 0, obj_leveleditor_modify_object_menu))
							{
								modify_object_description = l10n_text("Type what the sign should say");
							}
						}
					}
					else
					if (object == LEVEL_OBJECT_ID.ID_CHECKPOINT)
					{
						if (!instance_exists(obj_leveleditor_modify_object_menu))
						{
							with(instance_create_depth(x, y, 0, obj_leveleditor_modify_object_menu))
							{
								can_only_input_numbers = true;
								modify_object_description = l10n_text("How many times does the player have to get defeated until the checkpoint appears?");
							}
						}
					}
					#endregion /* Objects that needs modify menu END */
					
					#region /* Update variables */
					if (!global.actually_play_edited_level)
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