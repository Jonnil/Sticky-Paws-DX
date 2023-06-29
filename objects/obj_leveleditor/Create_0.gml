#region /* Essential code that needs to be initialized */

#region /* Essential variables */
global.time_countdown_bonus = 500;
pause = false;
if (global.player1_can_play)
{
	camera_player = 0;
	camera_selected_skin = global.skin_for_player[1];
}
else
if (global.player2_can_play)
{
	camera_player = 1;
	camera_selected_skin = global.skin_for_player[2];
}
else
if (global.player3_can_play)
{
	camera_player = 2;
	camera_selected_skin = global.skin_for_player[3];
}
else
if (global.player4_can_play)
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
instance_create_depth(0, 0, 0, obj_foreground_above_static_objects);
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

#region /* Backgrounds */
layer_background_sprite(layer_background_get_id(layer_get_id("Background")), global.custom_background1);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_2")), global.custom_background2);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_3")), global.custom_background3);
layer_background_sprite(layer_background_get_id(layer_get_id("Background_4")), global.custom_background4);
#endregion /* Backgrounds END */

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
	
	current_object_description = "";
	placed_objects_list = ds_list_create(); /* Only create a DS list if the file exists */
	
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
	ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
	
	/* Read all the objects that should be unlocked */
	
	#region /* Terrain Objects */
	unlocked_object[level_object_id.id_wall] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall, false);
	unlocked_object[level_object_id.id_wall_dirt] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_dirt, false);
	unlocked_object[level_object_id.id_wall_glass] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_glass, false);
	unlocked_object[level_object_id.id_wall_grass] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_grass, false);
	unlocked_object[level_object_id.id_wall_gravel] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_gravel, false);
	unlocked_object[level_object_id.id_wall_metal] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_metal, false);
	unlocked_object[level_object_id.id_wall_stone] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_stone, false);
	unlocked_object[level_object_id.id_wall_wood] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_wood, false);
	unlocked_object[level_object_id.id_black_wall] = ini_read_real("Unlock Placable Objects", level_object_id.id_black_wall, false);
	unlocked_object[level_object_id.id_spikes] = ini_read_real("Unlock Placable Objects", level_object_id.id_spikes, false);
	unlocked_object[level_object_id.id_semisolid_platform] = ini_read_real("Unlock Placable Objects", level_object_id.id_semisolid_platform, false);
	unlocked_object[level_object_id.id_brick_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_brick_block, false);
	unlocked_object[level_object_id.id_question_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_question_block, false);
	unlocked_object[level_object_id.id_hard_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_hard_block, false);
	unlocked_object[level_object_id.id_falling_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_falling_block, false);
	unlocked_object[level_object_id.id_falling_block_long] = ini_read_real("Unlock Placable Objects", level_object_id.id_falling_block_long, false);
	unlocked_object[level_object_id.id_cloud_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_cloud_block, false);
	unlocked_object[level_object_id.id_ice_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_ice_block, false);
	#endregion /* Terrain Objects END */
	
	#region /* Item Objects */
	unlocked_object[level_object_id.id_basic_collectible] = ini_read_real("Unlock Placable Objects", level_object_id.id_basic_collectible, false);
	unlocked_object[level_object_id.id_big_collectible] = ini_read_real("Unlock Placable Objects", level_object_id.id_big_collectible, false);
	unlocked_object[level_object_id.id_heart] = ini_read_real("Unlock Placable Objects", level_object_id.id_heart, false);
	unlocked_object[level_object_id.id_invincibility_powerup] = ini_read_real("Unlock Placable Objects", level_object_id.id_invincibility_powerup, false);
	unlocked_object[level_object_id.id_one_up] = ini_read_real("Unlock Placable Objects", level_object_id.id_one_up, false);
	#endregion /* Item Objects END */
	
	#region /* Enemy Objects */
	unlocked_object[level_object_id.id_basic_enemy] = ini_read_real("Unlock Placable Objects", level_object_id.id_basic_enemy, false);
	unlocked_object[level_object_id.id_enemy_bowlingball] = ini_read_real("Unlock Placable Objects", level_object_id.id_enemy_bowlingball, false);
	unlocked_object[level_object_id.id_big_stationary_enemy] = ini_read_real("Unlock Placable Objects", level_object_id.id_big_stationary_enemy, false);
	unlocked_object[level_object_id.id_boss] = ini_read_real("Unlock Placable Objects", level_object_id.id_boss, false);
	#endregion /* Enemy Objects END */
	
	#region /* Gizmo Objects */
	unlocked_object[level_object_id.id_blaster] = ini_read_real("Unlock Placable Objects", level_object_id.id_blaster, false);
	unlocked_object[level_object_id.id_door] = ini_read_real("Unlock Placable Objects", level_object_id.id_door, false);
	unlocked_object[level_object_id.id_spring] = ini_read_real("Unlock Placable Objects", level_object_id.id_spring, false);
	unlocked_object[level_object_id.id_ladder] = ini_read_real("Unlock Placable Objects", level_object_id.id_ladder, false);
	unlocked_object[level_object_id.id_arrow_sign] = ini_read_real("Unlock Placable Objects", level_object_id.id_arrow_sign, false);
	unlocked_object[level_object_id.id_checkpoint] = ini_read_real("Unlock Placable Objects", level_object_id.id_checkpoint, false);
	unlocked_object[level_object_id.id_spikes_emerge_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_spikes_emerge_block, false);
	unlocked_object[level_object_id.id_oneway] = ini_read_real("Unlock Placable Objects", level_object_id.id_oneway, false);
	#endregion /* Gizmo Objects END */
	
	#region /* Special Items */
	unlocked_object[level_object_id.id_cardboard_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_cardboard_block, false);
	unlocked_object[level_object_id.id_cardboard] = ini_read_real("Unlock Placable Objects", level_object_id.id_cardboard, false);
	unlocked_object[level_object_id.id_cardboard_long] = ini_read_real("Unlock Placable Objects", level_object_id.id_cardboard_long, false);
	unlocked_object[level_object_id.id_bump_in_ground] = ini_read_real("Unlock Placable Objects", level_object_id.id_bump_in_ground, false);
	unlocked_object[level_object_id.id_wall_jump_panel] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_jump_panel, false);
	unlocked_object[level_object_id.id_wall_climb_panel] = ini_read_real("Unlock Placable Objects", level_object_id.id_wall_climb_panel, false);
	unlocked_object[level_object_id.id_melon_block] = ini_read_real("Unlock Placable Objects", level_object_id.id_melon_block, false);
	unlocked_object[level_object_id.id_horizontal_rope] = ini_read_real("Unlock Placable Objects", level_object_id.id_horizontal_rope, false);
	unlocked_object[level_object_id.id_water] = ini_read_real("Unlock Placable Objects", level_object_id.id_water, false);
	unlocked_object[level_object_id.id_breathable_water] = ini_read_real("Unlock Placable Objects", level_object_id.id_breathable_water, false);
	unlocked_object[level_object_id.id_air_bubbles_spawner] = ini_read_real("Unlock Placable Objects", level_object_id.id_air_bubbles_spawner, false);
	unlocked_object[level_object_id.id_water_level_change_slow] = ini_read_real("Unlock Placable Objects", level_object_id.id_water_level_change_slow, false);
	unlocked_object[level_object_id.id_water_level_change_fast] = ini_read_real("Unlock Placable Objects", level_object_id.id_water_level_change_fast, false);
	unlocked_object[level_object_id.id_water_level_change_faster] = ini_read_real("Unlock Placable Objects", level_object_id.id_water_level_change_faster, false);
	unlocked_object[level_object_id.id_clipped_shirt] = ini_read_real("Unlock Placable Objects", level_object_id.id_clipped_shirt, false);
	unlocked_object[level_object_id.id_bucket] = ini_read_real("Unlock Placable Objects", level_object_id.id_bucket, false);
	unlocked_object[level_object_id.id_bird] = ini_read_real("Unlock Placable Objects", level_object_id.id_bird, false);
	unlocked_object[level_object_id.id_sign_crouch] = ini_read_real("Unlock Placable Objects", level_object_id.id_sign_crouch, false);
	unlocked_object[level_object_id.id_boss_barrier] = ini_read_real("Unlock Placable Objects", level_object_id.id_boss_barrier, false);
	unlocked_object[level_object_id.id_cake_stealing_enemy] = ini_read_real("Unlock Placable Objects", level_object_id.id_cake_stealing_enemy, false);
	unlocked_object[level_object_id.id_artwork_collection] = ini_read_real("Unlock Placable Objects", level_object_id.id_artwork_collection, false);
	unlocked_object[level_object_id.id_block_only_when_player_is_near] = ini_read_real("Unlock Placable Objects", level_object_id.id_block_only_when_player_is_near, false);
	unlocked_object[level_object_id.id_npc] = ini_read_real("Unlock Placable Objects", level_object_id.id_npc, false);
	unlocked_object[level_object_id.id_ring] = ini_read_real("Unlock Placable Objects", level_object_id.id_ring, false);
	#endregion /* Special Items END */
	
	ini_close();
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
	add_object(level_object_id.id_wall, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_dirt, spr_wall_dirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_glass, spr_wall_glass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_grass, spr_wall_grass, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_gravel, spr_wall_gravel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_metal, spr_wall_metal, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_stone, spr_wall_stone, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_wood, spr_wall_wood, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_jump_panel, spr_wall_jump_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_wall_climb_panel, spr_wall_climb_panel, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes, spr_spikes, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_semisolid_platform, spr_semisolid_platform, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Brick Block */
	add_object(level_object_id.id_brick_block, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_10_basic_collectibles, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_heart_balloon, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_one_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_two_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_three_up, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_invincibility_powerup, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_brick_block_invincibility_powerup_coil_spring, spr_brick_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Brick Block END */
	
	#region /* Question Block */
	add_object(level_object_id.id_question_block, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_10_basic_collectibles, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_heart_balloon, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_one_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_two_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_three_up, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_invincibility_powerup, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_question_block_invincibility_powerup_coil_spring, spr_question_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Question Block END */
	
	#region /* Melon Block */
	add_object(level_object_id.id_melon_block, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_10_basic_collectibles, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_heart_balloon, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_one_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_two_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_three_up, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_invincibility_powerup, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_melon_block_invincibility_powerup_coil_spring, spr_melon_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Melon Block END */
	
	add_object(level_object_id.id_hard_block, spr_hard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hard_block_alternate, spr_hard_block_alternate, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hard_block_2x2, spr_hard_block_2x2, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Falling Block */
	add_object(level_object_id.id_falling_block, spr_falling_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_solid, spr_falling_block_solid, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_long, spr_falling_block_long, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_falling_block_long_solid, spr_falling_block_long_solid, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Falling Block END */
	
	add_object(level_object_id.id_cloud_block, spr_cloud_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_ice_block, spr_ice_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard_block, spr_cardboard_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard, spr_cardboard, 0, spr_mask_block_long, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cardboard_long, spr_cardboard_long, 0, spr_cardboard_long, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Bump in Ground */
	add_object(level_object_id.id_bump_in_ground, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_8_basic_collectibles, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_heart_balloon, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_one_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_two_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_three_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_big_collectible, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_invincibility_powerup, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bump_in_ground_invincibility_powerup_coil_spring, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Bump in Ground END */
	
	#region /* Invisible Bump in Ground */
	add_object(level_object_id.id_invisible_bump_in_ground, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_8_basic_collectibles, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_heart_balloon, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_one_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_two_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_three_up, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_big_collectible, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_invincibility_powerup, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	add_object(level_object_id.id_invisible_bump_in_ground_invincibility_powerup_coil_spring, spr_bump_in_ground, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, true, 0);
	#endregion /* Invisible Bump in Ground END */
	
	#region /* Basic Collectible */
	add_object(level_object_id.id_basic_collectible, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_2, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 315, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_3, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_4, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 225, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_5, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_6, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 135, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_7, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_collectible_8, global.resource_pack_sprite_basic_collectible, 0, spr_wall, 1, 45, c_white, 1, "", noone, true, 0);
	#endregion /* Basic Collectible END */
	
	#region /* Big Collectible */
	add_object(level_object_id.id_big_collectible, global.resource_pack_sprite_big_collectible, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Big Collectible END */
	
	add_object(level_object_id.id_heart, spr_heart, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_hp_pickup, global.resource_pack_sprite_hp_pickup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_invincibility_powerup, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_invincibility_powerup_coil_spring, global.resource_pack_sprite_invincibility_powerup, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Extra Lives */
	add_object(level_object_id.id_one_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_two_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_lime, 1, "", noone, true, 0);
	add_object(level_object_id.id_three_up, sprite_lives_icon, 0, spr_wall, 1, 0, c_blue, 1, "", noone, true, 0);
	#endregion /* Extra Lives END */
	
	add_object(level_object_id.id_basic_enemy, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_blind, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_coil_spring, global.resource_pack_sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_basic_enemy_blind_coil_spring, global.resource_pack_sprite_basic_enemy_blind, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_blind, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_coil_spring, global.resource_pack_sprite_enemy_bowlingball_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_enemy_bowlingball_blind_coil_spring, global.resource_pack_sprite_enemy_bowlingball_blind_walk, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_big_stationary_enemy, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_big_stationary_enemy_coil_spring, global.resource_pack_sprite_big_stationary_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_blaster, spr_blaster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_spring, spr_spring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_ladder, spr_ladder, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_arrow_sign, spr_arrow_sign, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_arrow_sign_small, spr_arrow_sign_small, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_checkpoint, spr_checkpoint, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	
	#region /* Spikes Emerge Block */
	add_object(level_object_id.id_spikes_emerge_block, spr_spikes_emerge_block, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_left, spr_spikes_emerge_block, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_down, spr_spikes_emerge_block, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_right, spr_spikes_emerge_block, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	
	add_object(level_object_id.id_spikes_emerge_block_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_left_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_down_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_spikes_emerge_block_right_offset_time, spr_spikes_emerge_half_out, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* Spikes Emerge Block END */
	
	#region /* One Way */
	add_object(level_object_id.id_oneway, spr_oneway, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway2, spr_oneway, 0, spr_wall, 1, 90, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway3, spr_oneway, 0, spr_wall, 1, 180, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_oneway4, spr_oneway, 0, spr_wall, 1, 270, c_white, 1, "", noone, true, 0);
	#endregion /* One Way END */
	
	add_object(level_object_id.id_horizontal_rope, spr_horizontal_rope, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_water, spr_water, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_breathable_water, spr_water, 0, spr_wall, 1, 0, c_white, 0.5, "", noone, false, 0);
	add_object(level_object_id.id_water_surface, spr_water_surface, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_air_bubbles_spawner, spr_air_bubbles_spawner, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_water_level_change_slow, spr_water_level_change_slow, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_water_level_change_fast, spr_water_level_change_fast, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_water_level_change_faster, spr_water_level_change_faster, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_clipped_shirt, spr_clipped_shirt, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_clipped_pants, spr_clipped_pants, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_clipped_sock, spr_clipped_sock, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bucket, spr_bucket, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_bird, spr_bird, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	
	#region /* Signs */
	add_object(level_object_id.id_sign_crouch, spr_sign_crouch, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_dive, spr_sign_dive, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_ground_pound, spr_sign_ground_pound, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_rope_spin, spr_sign_rope_spin, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_sign_wall_jump, spr_sign_wall_jump, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	#endregion /* Signs END */
	
	add_object(level_object_id.id_boss, spr_boss_stand, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_boss_barrier, spr_boss_barrier, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_cake_stealing_enemy, sprite_basic_enemy, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_artwork_collection, spr_artwork_collection, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_block_only_when_player_is_near, global.resource_pack_sprite_block_only_when_player_is_near, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0);
	add_object(level_object_id.id_door, spr_door, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_npc, spr_npc, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_black_wall, spr_black_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	add_object(level_object_id.id_ring, spr_ring, 0, spr_wall, 1, 0, c_white, 1, "", noone, false, 0);
	/* This is a dummy object, to make sure every object gets added to the list */ add_object(level_object_id.id_last_object_dummy, spr_wall, 0, spr_wall, 1, 0, c_white, 1, "", noone, true, 0); /* This dummy object is just here so the last object actually appears */
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
	grid_alpha = 0;
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
	total_number_of_objects = 0;
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
	menu_delay = 10;
	startup_loading_timer = 0;
	deactivate_timer = 0; /* Don't deactivate all the objects every frame */
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
	grid_button_x = display_get_gui_width() - 224;
	
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
		var uppercase_narrator_name;
		uppercase_narrator_name = string_upper(string_char_at(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 1));
		uppercase_narrator_name += string_copy(string(ds_list_find_value(global.all_loaded_characters, global.narrator)), 2, string_length(string(ds_list_find_value(global.all_loaded_characters, global.narrator))) - 1);
		narrator_name = string(uppercase_narrator_name);
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
	sprite_index = spr_wall;
	mask_index = spr_wall;
}
#endregion /* If you're actually playing a level, then you don't need to run a lot of the code only relevant when making a level END */