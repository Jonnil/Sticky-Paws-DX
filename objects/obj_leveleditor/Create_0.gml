#region /* Essential code that needs to be initialized */

#region /* Set Backgrounds */
layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
#endregion /* Set Backgrounds END */

scr_make_background_visible();

#region /* Essential variables */
prev_display_width = display_get_gui_width();
prev_display_height = display_get_gui_height();
global.time_countdown_bonus = 500;
pause = false;
if (global.player_can_play[1])
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player[1];
}
else
if (global.player_can_play[2])
{
	camera_player = 1;
	camera_selected_skin = global.skin_for_player[2];
}
else
if (global.player_can_play[3])
{
	camera_player = 2;
	camera_selected_skin = global.skin_for_player[3];
}
else
if (global.player_can_play[4])
{
	camera_player = 3;
	camera_selected_skin = global.skin_for_player[4];
}
else
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player[1];
}
#endregion /* Essential variables END */

#region /* Create essential objects so levels can function */

#region /* Create Foreground */
instance_create_depth(0, 0, 0, obj_foreground1);
instance_create_depth(0, 0, 0, obj_foreground1_5);
instance_create_depth(0, 0, 0, obj_foreground2);
instance_create_depth(0, 0, 0, obj_foreground_secret);
instance_create_depth(x, y, 0, obj_background_brightness_gameplay); /* Create Background Brightness in Gameplay */
#endregion /* Create Foreground END */

#region /* Create level height and level width objects */
instance_create_depth(0, 1104, 0, obj_level_height);
instance_create_depth(2720, 0, 0, obj_level_width);
instance_create_depth(0, obj_level_height.y + 32, 0, obj_water_level_height);
#endregion /* Create level height and level width objects END */

#endregion /* Create essential objects so levels can function END */

#region /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" */
if (global.doing_clear_check)
{
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	instance_destroy();
}
#endregion /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" END */

#region /* Load Level */
scr_load_object_placement_json();
#endregion /* Load Level END */

#region /* If actually playing level, set play_edited_level to true and delete itself. Have this code after the "doing clear check = true" */
if (global.actually_play_edited_level)
{
	global.play_edited_level = true;
	with(obj_leveleditor_placed_object)
	{
		alarm[1] = 1;
	}
	instance_destroy();
}
#endregion /* If actually playing level, set play_edited_level to true and delete itself. Have this code after the "doing clear check = true" END */

#endregion /* Essential code that needs to be initialized END */








key_a_pressed = noone;
key_a_released = noone;

#region /* If you're actually playing a level, then you don't need to run a lot of the code only relevant when making a level */
if (global.actually_play_edited_level == false)
{
	autosave_timer = (60 * 3) + 1;
	
	welcome_to_level_editor = false;
	
	key_double_tap_timer = 0;
	key_double_tap_direction = "";
	double_tap_move_camera_faster = false;
	key_up = noone;
	key_left = noone;
	key_right = noone;
	key_down = noone;
	cam_x = camera_get_view_x(view_camera[view_current]);
	cam_y = camera_get_view_y(view_camera[view_current]);
	cam_width = camera_get_view_width(view_camera[view_current]);
	cam_height = camera_get_view_height(view_camera[view_current]);
	get_window_height = display_get_gui_height();
	get_window_width = display_get_gui_width();
	mouse_get_x = device_mouse_x_to_gui(0);
	mouse_get_y = device_mouse_y_to_gui(0);
	view_center_x = cam_x + cam_width * 0.5;
	view_center_y = cam_y + cam_height * 0.5;
	
	current_object_name = "";
	placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
	current_object_category = "terrain"; /* Seperate objects into different categories, to make objects easier to find */
	
	scr_initialize_level_information_ini();
	
	scr_controls_for_level_editor();
	
	tag_art = false;
	tag_boss_battle = false;
	tag_dont_move = false;
	tag_kaizo = false;
	tag_multiplayer = false;
	tag_music = false;
	tag_puzzle_solving = false;
	tag_short_and_sweet = false;
	tag_singleplayer = false;
	tag_speedrun = false;
	tag_standard = false;
	tag_technical = false;
	tag_themed = false;
	tag_glitch_showcase = false;
	intended_level_difficulty = 1; /* Easy = 0. Normal = 1. Hard = 2. Super Hard = 3 */
	
	#region /* Unlock placable objects */
	var debug_unlock_all = false;
	if (debug_unlock_all == false)
	{
		ini_open(working_directory + "save_files/file" + string(global.file) + ".ini");
		
		/* Read all the objects that should be unlocked */
		
		#region /* Terrain Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_DIRT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_DIRT, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GLASS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GLASS, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRASS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GRASS, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRAVEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_GRAVEL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_METAL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_METAL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_STONE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_STONE, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_WOOD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_WOOD, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BLACK_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BLACK_WALL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPIKES, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BRICK_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BRICK_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_QUESTION_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_HARD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HARD_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_FALLING_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CLOUD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ICE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ICE_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL, false);
		#endregion /* Terrain Objects END */
		
		#region /* Item Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_HEART] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HEART, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ONE_UP] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ONE_UP, false);
		#endregion /* Item Objects END */
		
		#region /* Enemy Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BASIC_ENEMY, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BOSS, false);
		#endregion /* Enemy Objects END */
		
		#region /* Gizmo Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BLASTER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BLASTER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_DOOR] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_DOOR, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPRING] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPRING, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_LADDER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_LADDER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ARROW_SIGN] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ARROW_SIGN, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CHECKPOINT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CHECKPOINT, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ONEWAY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ONEWAY, false);
		#endregion /* Gizmo Objects END */
		
		#region /* Special Items */
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_LONG] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_MELON_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_MELON_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BREATHABLE_WATER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BREATHABLE_WATER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BUCKET, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BIRD] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BIRD, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_CROUCH] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_SIGN_CROUCH, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS_BARRIER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_BOSS_BARRIER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_NPC] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_NPC, false);
		unlocked_object[LEVEL_OBJECT_ID.ID_RING] = ini_read_real("Unlock Placable Objects", LEVEL_OBJECT_ID.ID_RING, false);
		#endregion /* Special Items END */
		
		ini_close();
	}
	else
	{
		/* Unlock every object */
		
		#region /* Terrain Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_DIRT] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GLASS] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRASS] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_GRAVEL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_METAL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_STONE] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_WOOD] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BLACK_WALL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BRICK_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_QUESTION_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_HARD_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CLOUD_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ICE_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL] = 2;
		#endregion /* Terrain Objects END */
		
		#region /* Item Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_HEART] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ONE_UP] = 2;
		#endregion /* Item Objects END */
		
		#region /* Enemy Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BASIC_ENEMY] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS] = 2;
		#endregion /* Enemy Objects END */
		
		#region /* Gizmo Objects */
		unlocked_object[LEVEL_OBJECT_ID.ID_BLASTER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_DOOR] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_SPRING] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_LADDER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ARROW_SIGN] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CHECKPOINT] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ONEWAY] = 2;
		#endregion /* Gizmo Objects END */
		
		#region /* Special Items */
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CARDBOARD_LONG] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_MELON_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BREATHABLE_WATER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BUCKET] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BIRD] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_SIGN_CROUCH] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_BOSS_BARRIER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_NPC] = 2;
		unlocked_object[LEVEL_OBJECT_ID.ID_RING] = 2;
		#endregion /* Special Items END */
		
	}
	#endregion /* Unlock placable objects END */
	
	#region /* Load custom sprites */
	sprite_lives_icon = spr_1up;
	sprite_basic_enemy = global.resource_pack_sprite_basic_enemy;
	sprite_basic_enemy_blind = global.resource_pack_sprite_basic_enemy_blind;
	sprite_enemy_bowlingball = global.resource_pack_sprite_enemy_bowlingball_walk;
	sprite_enemy_bowlingball_blind = global.resource_pack_sprite_enemy_bowlingball_blind_walk;
	sprite_big_stationary_enemy = global.resource_pack_sprite_big_stationary_enemy;
	#endregion /* Load custom sprites END */
	
	#region /* Grid Initialization */
	global.object_grid = ds_grid_create(12, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_DIRT, spr_wall_dirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_GLASS, spr_wall_glass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_GRASS, spr_wall_grass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_GRAVEL, spr_wall_gravel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_METAL, spr_wall_metal, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_STONE, spr_wall_stone, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_WOOD, spr_wall_wood, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_JUMP_PANEL, spr_wall_jump_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WALL_CLIMB_PANEL, spr_wall_climb_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES, spr_spikes, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SEMISOLID_PLATFORM, spr_semisolid_platform, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Brick Block */
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_10_BASIC_COLLECTIBLES, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_HEART_BALLOON, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_ONE_UP, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_TWO_UP, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_THREE_UP, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BRICK_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Brick Block END */
	
	#region /* Question Block */
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_10_BASIC_COLLECTIBLES, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_HEART_BALLOON, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_ONE_UP, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_TWO_UP, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_THREE_UP, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_QUESTION_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Question Block END */
	
	#region /* Melon Block */
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_10_BASIC_COLLECTIBLES, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_HEART_BALLOON, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_ONE_UP, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_TWO_UP, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_THREE_UP, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_MELON_BLOCK_INVINCIBILITY_POWERUP_COIL_SPRING, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Melon Block END */
	
	add_object(LEVEL_OBJECT_ID.ID_HARD_BLOCK, spr_hard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_HARD_BLOCK_ALTERNATE, spr_hard_block_alternate, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_HARD_BLOCK_2X2, spr_hard_block_2x2, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Falling Block */
	add_object(LEVEL_OBJECT_ID.ID_FALLING_BLOCK, spr_falling_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_FALLING_BLOCK_SOLID, spr_falling_block_solid, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK, spr_falling_block, 1, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_SOLID, spr_falling_block_solid, 1, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK, spr_falling_block, 2, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_SOLID, spr_falling_block_solid, 2, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK, spr_falling_block, 3, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_SOLID, spr_falling_block_solid, 3, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Falling Block END */
	
	#region /* Falling Block Long */
	add_object(LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG, spr_falling_block_long, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_FALLING_BLOCK_LONG_SOLID, spr_falling_block_long_solid, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG, spr_falling_block_long, 1, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INSTANT_FALLING_BLOCK_LONG_SOLID, spr_falling_block_long_solid, 1, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG, spr_falling_block_long, 2, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WOOD_FALLING_BLOCK_LONG_SOLID, spr_falling_block_long_solid, 2, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG, spr_falling_block_long, 3, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_STONE_FALLING_BLOCK_LONG_SOLID, spr_falling_block_long_solid, 3, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Falling Block Long END */
	
	add_object(LEVEL_OBJECT_ID.ID_CLOUD_BLOCK, spr_cloud_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ICE_BLOCK, spr_ice_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ENEMY_ONLY_WALL, spr_enemy_only_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CARDBOARD_BLOCK, spr_cardboard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CARDBOARD, spr_cardboard, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CARDBOARD_LONG, spr_cardboard_long, 0, spr_cardboard_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Bump in Ground */
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_HEART_BALLOON, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_ONE_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_TWO_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_THREE_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_BIG_COLLECTIBLE, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Bump in Ground END */
	
	#region /* Invisible Bump in Ground */
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_8_BASIC_COLLECTIBLES, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_HEART_BALLOON, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_ONE_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_TWO_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_THREE_UP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_BIG_COLLECTIBLE, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVISIBLE_BUMP_IN_GROUND_INVINCIBILITY_POWERUP_COIL_SPRING, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	#endregion /* Invisible Bump in Ground END */
	
	#region /* Basic Collectible */
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_2, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 315, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_3, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_4, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 225, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_5, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_6, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 135, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_7, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_COLLECTIBLE_8, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 45, c_white, 1, "", noone, true, 0);
	#endregion /* Basic Collectible END */
	
	#region /* Big Collectible */
	add_object(LEVEL_OBJECT_ID.ID_BIG_COLLECTIBLE, global.resource_pack_sprite_big_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Big Collectible END */
	
	add_object(LEVEL_OBJECT_ID.ID_HEART, spr_heart, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_HP_PICKUP, global.resource_pack_sprite_hp_pickup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_INVINCIBILITY_POWERUP_COIL_SPRING, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Extra Lives */
	add_object(LEVEL_OBJECT_ID.ID_ONE_UP, sprite_lives_icon, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_TWO_UP, sprite_lives_icon, 0, spr_wall, 1, 0, c_lime, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_THREE_UP, sprite_lives_icon, 0, spr_wall, 1, 0, c_blue, 1, "", noone, true, 0);
	#endregion /* Extra Lives END */
	
	add_object(LEVEL_OBJECT_ID.ID_BASIC_ENEMY, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BLASTER, spr_blaster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPRING, spr_spring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_LADDER, spr_ladder, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ARROW_SIGN, spr_arrow_sign, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_ARROW_SIGN_SMALL, spr_arrow_sign_small, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_CHECKPOINT, spr_checkpoint, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	
	#region /* Spikes Emerge Block */
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK, spr_spikes_emerge_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT, spr_spikes_emerge_block, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN, spr_spikes_emerge_block, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT, spr_spikes_emerge_block, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_OFFSET_TIME, spr_spikes_emerge_half_out, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_LEFT_OFFSET_TIME, spr_spikes_emerge_half_out, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_DOWN_OFFSET_TIME, spr_spikes_emerge_half_out, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SPIKES_EMERGE_BLOCK_RIGHT_OFFSET_TIME, spr_spikes_emerge_half_out, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* Spikes Emerge Block END */
	
	#region /* One Way */
	add_object(LEVEL_OBJECT_ID.ID_ONEWAY, spr_oneway, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ONEWAY2, spr_oneway, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ONEWAY3, spr_oneway, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ONEWAY4, spr_oneway, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* One Way END */
	
	add_object(LEVEL_OBJECT_ID.ID_HORIZONTAL_ROPE, spr_horizontal_rope, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WATER, spr_water, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_BREATHABLE_WATER, spr_water, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_WATER_SURFACE, spr_water_surface, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_AIR_BUBBLES_SPAWNER, spr_air_bubbles_spawner, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_SLOW, spr_water_level_change_slow, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FAST, spr_water_level_change_fast, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_WATER_LEVEL_CHANGE_FASTER, spr_water_level_change_faster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_CLIPPED_SHIRT, spr_clipped_shirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CLIPPED_PANTS, spr_clipped_pants, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CLIPPED_SOCK, spr_clipped_sock, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_8_BASIC_COLLECTIBLES, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_BIG_COLLECTIBLE, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_HEART_BALLOON, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_INVINCIBILITY_POWERUP_COIL_SPRING, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_ONE_UP, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_TWO_UP, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BUCKET_THREE_UP, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BIRD, spr_bird, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Signs */
	add_object(LEVEL_OBJECT_ID.ID_SIGN_CROUCH, spr_sign_crouch, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SIGN_DIVE, spr_sign_dive, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SIGN_GROUND_POUND, spr_sign_ground_pound, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SIGN_ROPE_SPIN, spr_sign_rope_spin, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_SIGN_WALL_JUMP, spr_sign_wall_jump, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Signs END */
	
	add_object(LEVEL_OBJECT_ID.ID_BOSS, spr_boss_stand, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_BOSS_BARRIER, spr_boss_barrier, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_CAKE_STEALING_ENEMY, global.resource_pack_sprite_cake, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_ARTWORK_COLLECTION, spr_artwork_collection, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_EYE_BLOCK, global.resource_pack_sprite_eye_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY, global.resource_pack_sprite_eye_block_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_EYE_BLOCK_ENEMY_PLAYER, global.resource_pack_sprite_eye_block_enemy_player, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(LEVEL_OBJECT_ID.ID_DOOR, spr_door, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_NPC, spr_npc, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_BLACK_WALL, spr_black_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(LEVEL_OBJECT_ID.ID_RING, spr_ring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	/* This is a dummy object, to make sure every object gets added to the list */ add_object(LEVEL_OBJECT_ID.ID_LAST_OBJECT_DUMMY, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0); /* This dummy object is just here so the last object actually appears */
	#endregion /* Grid Initialization END */
	
	mouse_x_position = device_mouse_x_to_gui(0);
	mouse_y_position = device_mouse_y_to_gui(0);
	
	order_index = 0;
	unlock_index = 0;
	
	#region /* Loading selected level editing music */
	if (file_exists("config.ini"))
	{
		ini_open(working_directory + "config.ini");
		if (ini_key_exists("config", "selected_level_editing_music"))
		{
			global.selected_level_editing_music = ini_read_real("config", "selected_level_editing_music", 1); /* The selected background music when editing in the level editor */
			previous_selected_level_editing_music = ini_read_real("config", "selected_level_editing_music", 1); /* When changing the editing music, you want to compare it to this variable */
		}
		else
		{
			global.selected_level_editing_music = 1;
			previous_selected_level_editing_music = 1;
		}
		ini_close();
	}
	else
	{
		global.selected_level_editing_music = 1;
		previous_selected_level_editing_music = 1;
	}

	if (global.selected_level_editing_music == 0)
	{
		level_editing_music = noone;
		previous_selected_level_editing_music = 0;
	}
	else
	if (global.selected_level_editing_music == 1)
	{
		previous_selected_level_editing_music = -1;
	}
	if (global.selected_level_editing_music == 2)
	&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
		previous_selected_level_editing_music = 2;
	}
	else
	if (global.selected_level_editing_music == 3)
	&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
		previous_selected_level_editing_music = 3;
	}
	else
	if (global.selected_level_editing_music == 4)
	&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
		previous_selected_level_editing_music = 4;
	}
	else
	if (global.selected_level_editing_music == 5)
	&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg"))
	{
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg");
		previous_selected_level_editing_music = 5;
	}
	else
	{
		level_editing_music = noone;
	}
	#endregion /* Loading selected level editing music END */
	
	can_save_to_level_information = false;
	depth = -300;
	
	global.player_has_entered_goal = false;
	
	old_window_get_height = 0;
	old_window_get_width = 0;
	
	mx = mouse_x;
	my = mouse_y;
	
	selected_skin = global.skin_for_player[1];
	
	audio_stop_all();
	upload_rules_do_not_show_level = false;
	upload_rules_do_not_show_character = false;
	level_editor_options_back_to_menu = ""; /* Save what menu you came from, to use later */
	level_editor_options_select_level_index = global.select_level_index;
	level_editor_template_select = false;
	scroll = 0;
	row = 0;
	open_sub_menu = false;
	thumbnail_x_offset = 0; /* Level thumbnail x offset, for when windows size is too small to fit every thumbnail, you need to shift the x position a bit to fit everything */
	show_delete_button = true; /* If delete custom level buttons should show up or not. Sometimes you don't want it to show up when the feature is unavailable */
	navigate_camera_with_arrowkeys = false;
	caution_online_do_not_show = false;
	pressing_play_timer = 0; /* You have to hold down the play button for some time before you play the level from the beginning */
	frames_until_playtest_from_start = 50;
	room_speed = global.max_fps; /* Set correct fps */
	x = mouse_x;
	y = mouse_y;
	place_object_delay_timer = 0; /* Delay for when you can place objects, when using a touch screen to place objects, the cursor doesn't have enough time to update where new position of you touching the screen is, so you accidentally place objects where cursor was last positioned */
	show_level_editor_corner_menu = true;
	view_hview_lerp = 0;
	view_wview_lerp = 0;
	controller_x = mouse_x;
	controller_y = mouse_y;
	controller_view_speed = 8;
	drag_x = mouse_x;
	drag_y = mouse_y;
	cursor_x = x;
	cursor_y = y;
	place_brush_size = 0; /* The size of the brush when placeing objects */
	erase_brush_size = 0; /* The size of the brush when erasing */
	can_make_place_brush_size_bigger = true; /* If you can make the brush size bigger for certain objects */
	mouse_sprite = spr_cursor; /* Sets what cursor sprite to use */
	undo_and_redo_buttons_enabled = false; /* If undo and redo buttons should appear or not */
	tooltip = "";
	show_tooltip = 0;
	show_grid = false; /* Grid should be false when you start level editor */
	hovering_over_icons = false; /* If your mouse cursor is */
	zoom_in = false; /* When this is true, zoom in */
	zoom_reset = false; /* When this is true, reset zoom */
	zoom_out = false; /* When this is true, zoom out */
	difficulty_layer = 0; /* 0 = All, 1 = Easy, 2 = Normal, 3 = Hard */
	level_editor_edit_name = false;
	set_difficulty_mode = false; /* Toggle so you get a pen that can select what object appear in what difficulty */
	place_object = 1;
	placing_object = 0; /* If you are currently placing any object or not. This check is used for when modifying other objects, it shouldn't happen when currently placing any object */
	show_icons_at_bottom = false;
	show_icons_at_top = false;
	icons_at_bottom_y = +100;
	show_undo_redo_icons = false; /* If the undo and redo buttons should show */
	undo_redo_icons_y = +200; /* Undo and redo buttons y postition */
	current_undo_value = 0; /* Every time you place down items, this value increases. When you undo, this value decreases. */
	icons_at_top_y = - 100;
	selected_menu_alpha = 0;
	total_number_of_objects = 9999;
	object_help_description = "";
	drag_object = false;
	erase_mode = false; /* When erasing, this turns true */
	fill_mode = false; /* When filling, this turns true */
	fill_mode_type = "fill"; /* What type of filling you will do. Fill, Horizontal, Vertical */
	can_input_level_name = false;
	quit_level_editor = false;
	menu_joystick_delay = 0;
	menu_cursor_index = 0;
	in_settings = false;
	old_selected_resource_pack = global.selected_resource_pack;
	can_navigate_settings_sidebar = true;
	navigate_slider = false;
	menu = "continue";
	open_dropdown = false;
	name_enter_blink = 0;
	menu_delay = 3;
	startup_loading_timer = 0;
	global.deactivate_timer = 999; /* Don't deactivate all the objects every frame */
	background_brightness_lerp = 0;
	background_brightness_menu_lerp = 0;
	language_index = global.language_localization + 1;
	language_mouse_scroll = 0;
	scroll_view = false; /* If you can scroll the view or not */
	create_level_from_template_save_delay = 0; /* Save the level before starting to edit the template level */
	
	darken_settings_alpha = 0;
	darken_settings_sidebar_alpha = 0;
	accessibility_settings_y = 40;
	game_text_y = 40 * 2;
	game_settings_y = 40 * 3;
	multiplayer_settings_y = 40 * 4;
	controls_text_y = 40 * 5;
	keyboard_and_mouse_settings_y = 40 * 6;
	controller_settings_y = 40 * 7;
	touch_settings_y = 40 * 8;
	general_text_y = 40 * 9;
	account_settings_y = 40 * 10;
	video_settings_y = 40 * 11;
	audio_settings_y = 40 * 12;
	global_resources_settings_y = 40 * 13;
	storage_settings_y = 40 * 14;
	language_settings_y = 40 * 15;
	broadcast_settings_y = 40 * 16;
	how_to_play_y = 40 * 17;
	left_sidebar_x = -400;
	
	play_level_icon_x = 32;
	place_brush_icon_x = 96;
	erase_icon_x = 160;
	fill_icon_x = 224;
	always_show_level_editor_buttons_x = 288;
	grid_button_x = display_get_gui_width() - 288;
	
	#region /* Name displayed masked if includes profanity */
	if (switch_check_profanity(global.level_name))
	{
		level_name_masked = switch_mask_profanity(global.level_name);
	}
	else
	{
		level_name_masked = global.level_name;
	}
	#endregion /* Name displayed masked if includes profanity END */
	
	#region /* Options */
	can_navigate = false;
	menu_y_offset_real = 0;
	menu_cursor_y_position = 0;
	menu_remap_key_number = 0;
	menu_remap_gamepad_button_number = 0;
	
	#region /* Remapping options variables */
	remapping_player = 0; /* remapping_player 0 = player 1. remapping_player 1 = player 2. remapping_player 2 = player 3. remapping_player 3 = player 4 */
	input_key = false;
	can_remap_key = false;
	input_gamepad_button = false;
	can_remap_gamepad_button = false;
	allow_player1_tongue = scr_initialize_custom_character_abilities(0, "allow_tongue", false);
	allow_player2_tongue = scr_initialize_custom_character_abilities(1, "allow_tongue", false);
	allow_player3_tongue = scr_initialize_custom_character_abilities(2, "allow_tongue", false);
	allow_player4_tongue = scr_initialize_custom_character_abilities(3, "allow_tongue", false);
	
	allow_player1_double_jump = scr_initialize_custom_character_abilities(0, "number_of_jumps", 1, "values");
	allow_player2_double_jump = scr_initialize_custom_character_abilities(1, "number_of_jumps", 1, "values");
	allow_player3_double_jump = scr_initialize_custom_character_abilities(2, "number_of_jumps", 1, "values");
	allow_player4_double_jump = scr_initialize_custom_character_abilities(3, "number_of_jumps", 1, "values");
	
	allow_player1_dive = scr_initialize_custom_character_abilities(0, "allow_dive", false);
	allow_player2_dive = scr_initialize_custom_character_abilities(1, "allow_dive", false);
	allow_player3_dive = scr_initialize_custom_character_abilities(2, "allow_dive", false);
	allow_player4_dive = scr_initialize_custom_character_abilities(3, "allow_dive", false);
	#endregion /* Remapping options variables END */
	
	#region /* Character Name */
	if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	|| (file_exists(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
	{
		if (file_exists("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini"))
		{
			ini_open("characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}
		else
		{
			ini_open(working_directory + "custom_characters/" + string(ds_list_find_value(global.all_loaded_characters, global.narrator)) + "/data/character_config.ini");
		}
		
		#region /* Character Name */
		narrator_name = string(ds_list_find_value(global.all_loaded_characters, global.narrator));
		#endregion /* Character Name END */
		
		ini_close();
	}
	else
	{
		narrator_name = string(global.narrator + 1);
	}
	#endregion /* Character Name END */
	
	#region /* Customize look of Options Menu */
	menu_y_offset = -100;
	c_menu_outline = c_black;
	c_menu_fill = c_white;
	#endregion /* Customize look of Options Menu END */
	
	#endregion /* Options END */
	
	image_speed = 0;
	image_index = 0;
	
	#region /* View Size */
	view_wview = 1392;
	view_hview = 736;
	/* Default Views:   set_view_wview = 1024 + 400 - 32   set_view_hview = 768 - 32  */
	#endregion /* View Size END */
	
	#region /* Initialize Background */
	background_x_offset[0] = 0;background_x[0] = 0;background_y_offset[0] = 0;background_y[0] = 0;
	background_x_offset[1] = 0;background_x[1] = 0;background_y_offset[1] = 0;background_y[1] = 0;
	background_x_offset[2] = 0;background_x[2] = 0;background_y_offset[2] = 0;background_y[2] = 0;
	background_x_offset[3] = 0;background_x[3] = 0;background_y_offset[3] = 0;background_y[3] = 0;
	background_x_offset[4] = 0;background_x[4] = 0;background_y_offset[4] = 0;background_y[4] = 0;
	background_x_offset[5] = 0;background_x[5] = 0;background_y_offset[5] = 0;background_y[5] = 0;
	background_x_offset[6] = 0;background_x[6] = 0;background_y_offset[6] = 0;background_y[6] = 0;
	background_x_offset[7] = 0;background_x[7] = 0;background_y_offset[7] = 0;background_y[7] = 0;
	#endregion /* Initialize Background END */
	
	/* HUD Show Controls keys that have been pressed */
	player1_show_controls_timer = 0;
	player_show_controls_alpha[1] = 0;
	
	selected_object = 0;
	selected_object_menu_x = 0;
	selected_object_menu_actual_x = 0;
	sprite_index = spr_wall;
	mask_index = spr_wall;
	alarm[1] = 2;
}
#endregion /* If you're actually playing a level, then you don't need to run a lot of the code only relevant when making a level END */