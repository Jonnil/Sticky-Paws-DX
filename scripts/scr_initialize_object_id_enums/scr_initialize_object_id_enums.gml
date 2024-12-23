function scr_initialize_object_id_enums()
{
	
	#region /* Translate object names into object ID */
	enum LEVEL_OBJECT_ID
	{
		ID_WALL = 1,
		ID_WALL_DIRT = 1001,
		ID_WALL_GLASS = 1002,
		ID_WALL_GRASS = 1003,
		ID_WALL_GRAVEL = 1004,
		ID_WALL_METAL = 1005,
		ID_WALL_STONE = 1006,
		ID_WALL_WOOD = 1007,
		ID_WALL_JUMP_PANEL = 1008,
		ID_WALL_CLIMB_PANEL = 1009,
		ID_SPIKES = 2,
		ID_SEMISOLID_PLATFORM = 3,
		
		#region /* Brick Block */
		ID_BRICK_BLOCK = 4,
		ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES = 5,
		ID_BRICK_BLOCK_HEART_BALLOON = 6,
		ID_BRICK_BLOCK_ONE_UP = 7,
		ID_BRICK_BLOCK_TWO_UP = 8,
		ID_BRICK_BLOCK_THREE_UP = 9,
		ID_BRICK_BLOCK_INVINCIBILITY_POWERUP = 10,
		ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING = 10001,
		#endregion /* Brick Block END */
		
		#region /* Question Block */
		ID_QUESTION_BLOCK = 11,
		ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES = 12,
		ID_QUESTION_BLOCK_HEART_BALLOON = 13,
		ID_QUESTION_BLOCK_ONE_UP = 14,
		ID_QUESTION_BLOCK_TWO_UP = 15,
		ID_QUESTION_BLOCK_THREE_UP = 16,
		ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP = 17,
		ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING = 17001,
		#endregion /* Question Block END */
		
		#region /* Melon Block */
		ID_MELON_BLOCK = 135121,
		ID_MELON_BLOCK_10_BASIC_COLLECTIBLES = 135122,
		ID_MELON_BLOCK_HEART_BALLOON = 135123,
		ID_MELON_BLOCK_ONE_UP = 135124,
		ID_MELON_BLOCK_TWO_UP = 135125,
		ID_MELON_BLOCK_THREE_UP = 135126,
		ID_MELON_BLOCK_INVINCIBILITY_POWERUP = 135127,
		ID_MELON_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING = 135128,
		#endregion /* Melon Block END */
		
		ID_HARD_BLOCK = 18,
		ID_HARD_BLOCK_ALTERNATE = 181,
		ID_HARD_BLOCK_2X2 = 182,
		
		#region /* Falling Blocks */
		/* Normal Falling Blocks */
		ID_FALLING_BLOCK = 19,
		ID_FALLING_BLOCK_SOLID = 20,
		ID_FALLING_BLOCK_LONG = 21,
		ID_FALLING_BLOCK_LONG_SOLID = 22,
		
		/* Instant Falling Blocks */
		ID_INSTANT_FALLING_BLOCK = 191,
		ID_INSTANT_FALLING_BLOCK_SOLID = 201,
		ID_INSTANT_FALLING_BLOCK_LONG = 211,
		ID_INSTANT_FALLING_BLOCK_LONG_SOLID = 221,
		
		/* Wood Falling Blocks */
		ID_WOOD_FALLING_BLOCK = 192,
		ID_WOOD_FALLING_BLOCK_SOLID = 202,
		ID_WOOD_FALLING_BLOCK_LONG = 212,
		ID_WOOD_FALLING_BLOCK_LONG_SOLID = 222,
		
		/* Stone Falling Blocks */
		ID_STONE_FALLING_BLOCK = 193,
		ID_STONE_FALLING_BLOCK_SOLID = 203,
		ID_STONE_FALLING_BLOCK_LONG = 213,
		ID_STONE_FALLING_BLOCK_LONG_SOLID = 223,
		#endregion /* Falling Blocks END */
		
		ID_CLOUD_BLOCK = 23,
		ID_ICE_BLOCK = 24,
		ID_ENEMY_ONLY_WALL = 241,
		ID_CARDBOARD_BLOCK = 25,
		ID_CARDBOARD = 26,
		ID_CARDBOARD_LONG = 27,
		
		#region /* Bump in Ground */
		ID_BUMP_IN_GROUND = 28,
		ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES = 29,
		ID_BUMP_IN_GROUND_HEART_BALLOON = 30,
		ID_BUMP_IN_GROUND_ONE_UP = 31,
		ID_BUMP_IN_GROUND_TWO_UP = 32,
		ID_BUMP_IN_GROUND_THREE_UP = 33,
		ID_BUMP_IN_GROUND_BIG_COLLECTIBLE = 34,
		ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP = 39,
		ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING = 39001,
		#endregion /* Bump in Ground END */
		
		#region /* Invisible Bump in Ground */
		ID_INVISIBLE_BUMP_IN_GROUND = 281,
		ID_INVISIBLE_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES = 291,
		ID_INVISIBLE_BUMP_IN_GROUND_HEART_BALLOON = 301,
		ID_INVISIBLE_BUMP_IN_GROUND_ONE_UP = 311,
		ID_INVISIBLE_BUMP_IN_GROUND_TWO_UP = 321,
		ID_INVISIBLE_BUMP_IN_GROUND_THREE_UP = 331,
		ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE = 341,
		ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP = 391,
		ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING = 390011,
		#endregion /* Invisible Bump in Ground END */
		
		ID_BASIC_COLLECTIBLE = 40,
		ID_BASIC_COLLECTIBLE_2 = 41,
		ID_BASIC_COLLECTIBLE_3 = 42,
		ID_BASIC_COLLECTIBLE_4 = 43,
		ID_BASIC_COLLECTIBLE_5 = 44,
		ID_BASIC_COLLECTIBLE_6 = 45,
		ID_BASIC_COLLECTIBLE_7 = 46,
		ID_BASIC_COLLECTIBLE_8 = 47,
		ID_10_BULK_COLLECTIBLE = 471,
		ID_30_BULK_COLLECTIBLE = 473,
		ID_50_BULK_COLLECTIBLE = 475,
		ID_BIG_COLLECTIBLE = 48,
		ID_KEY_FRAGMENT = 481,
		ID_KEY = 482,
		ID_HEART = 53,
		ID_HP_PICKUP = 54,
		ID_INVINCIBILITY_POWERUP = 55,
		ID_INVINCIBILITY_POWERUP_COIL_SPRING = 55001,
		ID_ONE_UP = 56,
		ID_TWO_UP = 57,
		ID_THREE_UP = 58,
		ID_BASIC_ENEMY = 59,
		ID_BASIC_ENEMY_COIL_SPRING = 5901,
		ID_BASIC_ENEMY_BLIND = 5902,
		ID_BASIC_ENEMY_BLIND_COIL_SPRING = 5903,
		ID_ENEMY_BOWLINGBALL = 591,
		ID_ENEMY_BOWLINGBALL_COIL_SPRING = 592,
		ID_ENEMY_BOWLINGBALL_BLIND = 5911,
		ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING = 5912,
		ID_BIG_STATIONARY_ENEMY = 60,
		ID_BIG_STATIONARY_ENEMY_COIL_SPRING = 601,
		ID_ENEMY_VENGEFUL_SPIRIT = 602,
		ID_BLASTER = 61,
		ID_ENEMY_BULLET_LEFT = 611,
		ID_ENEMY_BULLET_RIGHT = 612,
		ID_SPRING = 62,
		ID_LADDER = 63,
		ID_ARROW_SIGN = 64,
		ID_ARROW_SIGN_SMALL = 65,
		ID_CHECKPOINT = 66,
		
		#region /* Spikes Emerge Block */
		ID_SPIKES_EMERGE_BLOCK = 67,
		ID_SPIKES_EMERGE_BLOCK_LEFT = 671,
		ID_SPIKES_EMERGE_BLOCK_DOWN = 672,
		ID_SPIKES_EMERGE_BLOCK_RIGHT = 673,
		
		ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME = 674,
		ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME = 675,
		ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME = 676,
		ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME = 677,
		#endregion /* Spikes Emerge Block END */
		
		ID_ONEWAY = 68,
		ID_ONEWAY2 = 69,
		ID_ONEWAY3 = 70,
		ID_ONEWAY4 = 71,
		ID_HORIZONTAL_ROPE = 72,
		ID_WATER = 73,
		ID_LAVA = 737,
		ID_BREATHABLE_WATER = 736,
		ID_AIR_BUBBLES_SPAWNER = 735,
		ID_WATER_LEVEL_CHANGE_SLOW = 732,
		ID_WATER_LEVEL_CHANGE_FAST = 733,
		ID_WATER_LEVEL_CHANGE_FASTER = 734,
		ID_CLIPPED_SHIRT = 74,
		ID_CLIPPED_PANTS = 75,
		ID_CLIPPED_SOCK = 76,
		
		#region /* Bucket */
		ID_BUCKET = 77,
		ID_BUCKET_8_BASIC_COLLECTIBLES = 78,
		ID_BUCKET_HEART_BALLOON = 79,
		ID_BUCKET_ONE_UP = 80,
		ID_BUCKET_TWO_UP = 81,
		ID_BUCKET_THREE_UP = 82,
		ID_BUCKET_BIG_COLLECTIBLE = 83,
		ID_BUCKET_INVINCIBILITY_POWERUP = 88,
		ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING = 88001,
		#endregion /* Bucket END */
		
		ID_BIRD = 89,
		ID_BUSH = 891,
		ID_SIGN_CROUCH = 90,
		ID_SIGN_DIVE = 91,
		ID_SIGN_GROUND_POUND = 92,
		ID_SIGN_ROPE_SPIN = 93,
		ID_SIGN_WALL_JUMP = 94,
		ID_SIGN_RUN = 941,
		ID_BOSS = 95,
		ID_BOSS_BARRIER = 96,
		ID_CAKE_STEALING_ENEMY = 961,
		ID_ARTWORK_COLLECTION = 97,
		ID_EYE_BLOCK = 98,
		ID_EYE_BLOCK_ENEMY = 981,
		ID_EYE_BLOCK_ENEMY_PLAYER = 982,
		ID_DOOR = 99,
		ID_DOOR_LOCKED = 993,
		ID_WARP_BOX = 991,
		ID_WARP_BOX_ONE_USE = 992,
		ID_WARP_BOX_LOCKED = 994,
		ID_WARP_BOX_ONE_USE_LOCKED = 995,
		ID_SIGN_READABLE = 100,
		ID_BLACK_WALL = 101,
		ID_RING = 102,
		ID_APPEAR_BLOCK_1 = 103,
		ID_APPEAR_BLOCK_2 = 1031,
		ID_APPEAR_BLOCK_3 = 1032,
		ID_APPEAR_BLOCK_4 = 1033,
		ID_APPEAR_BLOCK_5 = 1034,
		ID_LAST_OBJECT_DUMMY = 999999999
	}
	enum WORLD_OBJECT_ID
	{
		ID_WALL = 1,
		ID_LEVEL = 2,
		ID_EXIT = 3,
		ID_RIGHT_DOWN = 4,
		ID_UP_RIGHT = 5,
		ID_UP_LEFT = 6,
		ID_LEFT_DOWN = 7
	}
	#endregion /* Translate object names into object ID */
	
}