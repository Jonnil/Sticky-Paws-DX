function scr_initialize_object_id_enums()
{
	
	#region /* Translate object names into object ID */
	enum level_object_id
	{
		id_wall = 1,
		id_wall_dirt = 1001,
		id_wall_glass = 1002,
		id_wall_grass = 1003,
		id_wall_gravel = 1004,
		id_wall_metal = 1005,
		id_wall_stone = 1006,
		id_wall_wood = 1007,
		id_wall_jump_panel = 1008,
		id_wall_climb_panel = 1009,
		id_spikes = 2,
		id_semisolid_platform = 3,
		
		#region /* Brick Block */
		id_brick_block = 4,
		id_brick_block_10_basic_collectibles = 5,
		id_brick_block_heart_balloon = 6,
		id_brick_block_one_up = 7,
		id_brick_block_two_up = 8,
		id_brick_block_three_up = 9,
		id_brick_block_invincibility_powerup = 10,
		id_brick_block_invincibility_powerup_coil_spring = 10001,
		#endregion /* Brick Block END */
		
		#region /* Question Block */
		id_question_block = 11,
		id_question_block_10_basic_collectibles = 12,
		id_question_block_heart_balloon = 13,
		id_question_block_one_up = 14,
		id_question_block_two_up = 15,
		id_question_block_three_up = 16,
		id_question_block_invincibility_powerup = 17,
		id_question_block_invincibility_powerup_coil_spring = 17001,
		#endregion /* Question Block END */
		
		#region /* Melon Block */
		id_melon_block = 135121,
		id_melon_block_10_basic_collectibles = 135122,
		id_melon_block_heart_balloon = 135123,
		id_melon_block_one_up = 135124,
		id_melon_block_two_up = 135125,
		id_melon_block_three_up = 135126,
		id_melon_block_invincibility_powerup = 135127,
		id_melon_block_invincibility_powerup_coil_spring = 135128,
		#endregion /* Melon Block END */
		
		id_hard_block = 18,
		id_hard_block_alternate = 181,
		id_hard_block_2x2 = 182,
		id_falling_block = 19,
		id_falling_block_solid = 20,
		id_falling_block_long = 21,
		id_falling_block_long_solid = 22,
		id_cloud_block = 23,
		id_ice_block = 24,
		id_cardboard_block = 25,
		id_cardboard = 26,
		id_cardboard_long = 27,
		
		#region /* Bump in Ground */
		id_bump_in_ground = 28,
		id_bump_in_ground_8_basic_collectibles = 29,
		id_bump_in_ground_heart_balloon = 30,
		id_bump_in_ground_one_up = 31,
		id_bump_in_ground_two_up = 32,
		id_bump_in_ground_three_up = 33,
		id_bump_in_ground_big_collectible = 34,
		id_bump_in_ground_invincibility_powerup = 39,
		id_bump_in_ground_invincibility_powerup_coil_spring = 39001,
		#endregion /* Bump in Ground END */
		
		#region /* Invisible Bump in Ground */
		id_invisible_bump_in_ground = 281,
		id_invisible_bump_in_ground_8_basic_collectibles = 291,
		id_invisible_bump_in_ground_heart_balloon = 301,
		id_invisible_bump_in_ground_one_up = 311,
		id_invisible_bump_in_ground_two_up = 321,
		id_invisible_bump_in_ground_three_up = 331,
		id_invisible_bump_in_ground_big_collectible = 341,
		id_invisible_bump_in_ground_invincibility_powerup = 391,
		id_invisible_bump_in_ground_invincibility_powerup_coil_spring = 390011,
		#endregion /* Invisible Bump in Ground END */
		
		id_basic_collectible = 40,
		id_basic_collectible_2 = 41,
		id_basic_collectible_3 = 42,
		id_basic_collectible_4 = 43,
		id_basic_collectible_5 = 44,
		id_basic_collectible_6 = 45,
		id_basic_collectible_7 = 46,
		id_basic_collectible_8 = 47,
		id_big_collectible = 48,
		id_heart = 53,
		id_hp_pickup = 54,
		id_invincibility_powerup = 55,
		id_invincibility_powerup_coil_spring = 55001,
		id_one_up = 56,
		id_two_up = 57,
		id_three_up = 58,
		id_basic_enemy = 59,
		id_basic_enemy_coil_spring = 5901,
		id_basic_enemy_blind = 5902,
		id_basic_enemy_blind_coil_spring = 5903,
		id_enemy_bowlingball = 591,
		id_enemy_bowlingball_coil_spring = 592,
		id_enemy_bowlingball_blind = 5911,
		id_enemy_bowlingball_blind_coil_spring = 5912,
		id_big_stationary_enemy = 60,
		id_big_stationary_enemy_coil_spring = 601,
		id_blaster = 61,
		id_spring = 62,
		id_ladder = 63,
		id_arrow_sign = 64,
		id_arrow_sign_small = 65,
		id_checkpoint = 66,
		
		#region /* Spikes Emerge Block */
		id_spikes_emerge_block = 67,
		id_spikes_emerge_block_left = 671,
		id_spikes_emerge_block_down = 672,
		id_spikes_emerge_block_right = 673,
		
		id_spikes_emerge_block_offset_time = 674,
		id_spikes_emerge_block_left_offset_time = 675,
		id_spikes_emerge_block_down_offset_time = 676,
		id_spikes_emerge_block_right_offset_time = 677,
		#endregion /* Spikes Emerge Block END */
		
		id_oneway = 68,
		id_oneway2 = 69,
		id_oneway3 = 70,
		id_oneway4 = 71,
		id_horizontal_rope = 72,
		id_water = 73,
		id_breathable_water = 736,
		id_water_surface = 731,
		id_air_bubbles_spawner = 735,
		id_water_level_change_slow = 732,
		id_water_level_change_fast = 733,
		id_water_level_change_faster = 734,
		id_clipped_shirt = 74,
		id_clipped_pants = 75,
		id_clipped_sock = 76,
		
		#region /* Bucket */
		id_bucket = 77,
		id_bucket_8_basic_collectibles = 78,
		id_bucket_heart_balloon = 79,
		id_bucket_one_up = 80,
		id_bucket_two_up = 81,
		id_bucket_three_up = 82,
		id_bucket_big_collectible = 83,
		id_bucket_invincibility_powerup = 88,
		id_bucket_invincibility_powerup_coil_spring = 88001,
		#endregion /* Bucket END */
		
		id_bird = 89,
		id_sign_crouch = 90,
		id_sign_dive = 91,
		id_sign_ground_pound = 92,
		id_sign_rope_spin = 93,
		id_sign_wall_jump = 94,
		id_boss = 95,
		id_boss_barrier = 96,
		id_cake_stealing_enemy = 961,
		id_artwork_collection = 97,
		id_eye_block = 98,
		id_door = 99,
		id_npc = 100,
		id_black_wall = 101,
		id_ring = 102,
		id_last_object_dummy = 999999999
	}
	enum world_object_id
	{
		id_wall = 1,
		id_level = 2,
		id_exit = 3,
		id_right_down = 4,
		id_up_right = 5,
		id_up_left = 6,
		id_left_down = 7
	}
	#endregion /* Translate object names into object ID */
	
}