if (instance_exists(obj_leveleditor))
and (sprite_lives_icon = noone)
{
	sprite_lives_icon = obj_leveleditor.sprite_lives_icon; /*Just copy lives icon from obj_leveleditor, don't make alarm event for obj_leveleditor_placed_object, it will lag the game*/
}

#region /*Initialize object mask*/
if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}
image_speed = 0;
image_index = 0;
#endregion /*Initialize object mask END*/

#region /*Initialize Object*/
if (global.world_editor = false)
{
	//if object == ds_grid_get(global.object_grid, 0, 0) {sprite_index = ds_grid_get(global.object_grid, 1, 0);mask_index = ds_grid_get(global.object_grid, 3, 0);}
	
	for(i = 0; i < ds_grid_height(global.object_grid)-1; i += 1)
    {
		if (object == ds_grid_get(global.object_grid, 0, i))
		{
			sprite_index = ds_grid_get(global.object_grid, 1, i);
			mask_index = ds_grid_get(global.object_grid, 3, i);
		}
    }
	
	
	
	////if (object = 1) and (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;mask_index = spr_wall;}
	//if (object = 1001) and (asset_get_type("spr_wall_dirt") == asset_sprite){sprite_index = spr_wall_dirt;mask_index = spr_wall;}
	//if (object = 1002) and (asset_get_type("spr_wall_glass") == asset_sprite){sprite_index = spr_wall_glass;mask_index = spr_wall;}
	//if (object = 1003) and (asset_get_type("spr_wall_grass") == asset_sprite){sprite_index = spr_wall_grass;mask_index = spr_wall;}
	//if (object = 1004) and (asset_get_type("spr_wall_gravel") == asset_sprite){sprite_index = spr_wall_gravel;mask_index = spr_wall;}
	//if (object = 1005) and (asset_get_type("spr_wall_metal") == asset_sprite){sprite_index = spr_wall_metal;mask_index = spr_wall;}
	//if (object = 1006) and (asset_get_type("spr_wall_stone") == asset_sprite){sprite_index = spr_wall_stone;mask_index = spr_wall;}
	//if (object = 1007) and (asset_get_type("spr_wall_wood") == asset_sprite){sprite_index = spr_wall_wood;mask_index = spr_wall;}

	//if (object = 1008) and (asset_get_type("spr_wall_jump_panel") == asset_sprite){sprite_index = spr_wall_jump_panel;mask_index = spr_wall;}
	//if (object = 1009) and (asset_get_type("spr_wall_climb_panel") == asset_sprite){sprite_index = spr_wall_climb_panel;mask_index = spr_wall;}
	//if (object = 2) and (asset_get_type("spr_spikes") == asset_sprite){sprite_index = spr_spikes;mask_index = spr_wall;}
	//if (object = 3) and (asset_get_type("spr_semisolid_platform") == asset_sprite){sprite_index = spr_semisolid_platform;mask_index = spr_wall;}

	//#region /*Brick Block*/
	//if (object = 4) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	//if (object = 5) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	//mask_index = spr_wall;}
	//if (object = 6) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	//if (object = 7) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	//mask_index = spr_wall;}
	//if (object = 8) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	//mask_index = spr_wall;}
	//if (object = 9) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	//mask_index = spr_wall;}
	//if (object = 10) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	//if (object = 10001) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	//#endregion /*Brick Block END*/

	//#region /*Question Block*/
	//if (object = 11) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	//if (object = 12) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	//if (object = 13) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	//if (object = 14) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	//if (object = 15) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	//if (object = 16) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	//if (object = 17) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	//if (object = 17001) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	//#endregion /*Question Block END*/

	//if (object = 18) and (asset_get_type("spr_hard_block") == asset_sprite){sprite_index = spr_hard_block;mask_index = spr_wall;}

	//#region /*Falling Block*/
	//if (object = 19) and (asset_get_type("spr_falling_block") == asset_sprite){sprite_index = spr_falling_block;mask_index = spr_wall;}
	//if (object = 20) and (asset_get_type("spr_falling_block_solid") == asset_sprite){sprite_index = spr_falling_block_solid;mask_index = spr_wall;}
	//if (object = 21) and (asset_get_type("spr_falling_block_long") == asset_sprite){sprite_index = spr_falling_block_long;mask_index = spr_cardboard;}
	//if (object = 22) and (asset_get_type("spr_falling_block_long_solid") == asset_sprite){sprite_index = spr_falling_block_long_solid;mask_index = spr_cardboard;}
	//#endregion /*Falling Block END*/

	//if (object = 23) and (asset_get_type("spr_cloud_block") == asset_sprite){sprite_index = spr_cloud_block;mask_index = spr_wall;}
	//if (object = 24) and (asset_get_type("spr_ice_block") == asset_sprite){sprite_index = spr_ice_block;mask_index = spr_wall;}
	//if (object = 25) and (asset_get_type("spr_cardboard_block") == asset_sprite){sprite_index = spr_cardboard_block;mask_index = spr_wall;}
	//if (object = 26) and (asset_get_type("spr_cardboard") == asset_sprite){sprite_index = spr_cardboard;mask_index = spr_cardboard;}
	//if (object = 27) and (asset_get_type("spr_cardboard_long") == asset_sprite){sprite_index = spr_cardboard_long;mask_index = spr_cardboard_long;}

	//#region /*Bump in ground*/
	//if (object = 28) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 29) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 30) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 31) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 32) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 33) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 34) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 35) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 36) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 37) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 38) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 39) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//if (object = 39001) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	//#endregion /*Bump in ground END*/
	
	//#region /*Invisible Bump in ground*/
	//if (object = 281) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 291) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 301) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 311) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 321) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 331) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 341) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 351) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 361) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 371) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 381) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 391) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 390011) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = noone;mask_index = spr_wall;}
	//#endregion /*Invisible Bump in ground END*/
	
	//#region /*Basic Collectible*/
	//if (object = 40){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 0;draw_yscale = 1;mask_index = spr_wall;}
	//if (object = 41){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 315;draw_yscale = 1;mask_index = spr_wall;}
	//if (object = 42){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 270;draw_yscale = 1;mask_index = spr_wall;}
	//if (object = 43){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 225;draw_yscale = -1;mask_index = spr_wall;}
	//if (object = 44){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 180;draw_yscale = -1;mask_index = spr_wall;}
	//if (object = 45){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 135;draw_yscale = -1;mask_index = spr_wall;}
	//if (object = 46){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 90;draw_yscale = 1;mask_index = spr_wall;}
	//if (object = 47){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 45;draw_yscale = 1;mask_index = spr_wall;}
	//#endregion /*Basic Collectible END*/

	//#region /*Big Collectibles*/
	//if (object = 48){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	//if (object = 49){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	//if (object = 50){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	//if (object = 51){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	//if (object = 52){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	//#endregion /*Big Collectibles END*/

	//if (object = 53) and (asset_get_type("spr_heart") == asset_sprite){sprite_index = spr_heart;mask_index = spr_wall;}
	//if (object = 54){sprite_index = global.resource_pack_sprite_hp_pickup;mask_index = spr_wall;}
	//if (object = 55){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 55001){sprite_index = noone;mask_index = spr_wall;}
	//if (object = 56) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	//mask_index = spr_wall;}
	//if (object = 57) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	//mask_index = spr_wall;}
	//if (object = 58) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	//mask_index = spr_wall;}
	//if (object = 59){sprite_index = sprite_basic_enemy;mask_index = spr_wall;}
	//if (object = 5901){sprite_index = sprite_basic_enemy; mask_index = spr_wall;}
	//if (object = 5902){sprite_index = sprite_basic_enemy_blind;mask_index = spr_wall;}
	//if (object = 5903){sprite_index = sprite_basic_enemy_blind; mask_index = spr_wall;}
	//if (object = 591){sprite_index = sprite_enemy_bowlingball;mask_index = spr_wall;}
	//if (object = 592){sprite_index = sprite_enemy_bowlingball; mask_index = spr_wall;}
	//if (object = 5911){sprite_index = sprite_enemy_bowlingball_blind;mask_index = spr_wall;}
	//if (object = 5912){sprite_index = sprite_enemy_bowlingball_blind;mask_index = spr_wall;}
	//if (object = 60){sprite_index = sprite_big_stationary_enemy;mask_index = spr_wall;}
	//if (object = 61){sprite_index = global.resource_pack_sprite_blaster;mask_index = spr_wall;}
	//if (object = 62) and (asset_get_type("spr_spring") == asset_sprite){sprite_index = spr_spring;mask_index = spr_wall;}
	//if (object = 63) and (asset_get_type("spr_ladder") == asset_sprite){sprite_index = spr_ladder;mask_index = spr_wall;}

	//#region /*Arrow Signs*/
	//if (object = 64) and (asset_get_type("spr_arrow_sign") == asset_sprite){mask_index = spr_wall;sprite_index = noone;}
	//#endregion /*Arrow Signs END*/

	//#region /*Arrow Signs Small*/
	//if (object = 65) and (asset_get_type("spr_arrow_sign_small") == asset_sprite){mask_index = spr_wall;sprite_index = noone;}
	//#endregion /*Arrow Signs Small END*/

	//if (object = 66) and (asset_get_type("spr_checkpoint") == asset_sprite){sprite_index = spr_checkpoint;mask_index = spr_2x2_block;}
	//if (object = 67) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 0; mask_index = spr_wall;}
	//if (object = 671) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 90; mask_index = spr_wall;}
	//if (object = 672) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 180; mask_index = spr_wall;}
	//if (object = 673) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 270; mask_index = spr_wall;}

	//#region /*Oneway*/
	//if (object = 68) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 0;mask_index = spr_wall;}
	//if (object = 69) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 90;mask_index = spr_wall;}
	//if (object = 70) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 180;mask_index = spr_wall;}
	//if (object = 71) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 270;mask_index = spr_wall;}
	//#endregion /*Oneway END*/

	//if (object = 72) and (asset_get_type("spr_horizontal_rope") == asset_sprite){sprite_index = spr_horizontal_rope;mask_index = spr_wall;}
	//if (object = 73) and (asset_get_type("spr_water") == asset_sprite){sprite_index = spr_water;mask_index = spr_wall;}
	//if (object = 731) and (asset_get_type("spr_water_surface") == asset_sprite){sprite_index = spr_water_surface;mask_index = spr_wall;}
	//if (object = 735) and (asset_get_type("spr_air_bubbles_spawner") == asset_sprite){sprite_index = spr_air_bubbles_spawner;mask_index = spr_wall;}
	//else
	//if (object = 735) and (asset_get_type("spr_bubble") == asset_sprite){sprite_index = spr_bubble;mask_index = spr_wall;}
	//if (object = 732) and (asset_get_type("spr_water_level_change_slow") == asset_sprite){sprite_index = spr_water_level_change_slow;mask_index = spr_wall;}
	//if (object = 733) and (asset_get_type("spr_water_level_change_fast") == asset_sprite){sprite_index = spr_water_level_change_fast;mask_index = spr_wall;}
	//if (object = 734) and (asset_get_type("spr_water_level_change_faster") == asset_sprite){sprite_index = spr_water_level_change_faster;mask_index = spr_wall;}
	//if (object = 74) and (asset_get_type("spr_clipped_shirt") == asset_sprite){sprite_index = spr_clipped_shirt;mask_index = spr_wall;}
	//if (object = 75) and (asset_get_type("spr_clipped_pants") == asset_sprite){sprite_index = spr_clipped_pants;mask_index = spr_wall;}
	//if (object = 76) and (asset_get_type("spr_clipped_sock") == asset_sprite){sprite_index = spr_clipped_sock;mask_index = spr_wall;}

	//#region /*Bucket*/
	//if (object = 77) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 78) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 79) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 80) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 81) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 82) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 83) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 84) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 85) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 86) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 87) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 88) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//if (object = 88001) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	//#endregion /*Bucket END*/

	//if (object = 89) and (asset_get_type("spr_bird") == asset_sprite){sprite_index = spr_bird;mask_index = spr_wall;}
	//if (object = 90) and (asset_get_type("spr_sign_crouch") == asset_sprite){sprite_index = spr_sign_crouch;mask_index = spr_wall;}
	//if (object = 91) and (asset_get_type("spr_sign_dive") == asset_sprite){sprite_index = spr_sign_dive;mask_index = spr_wall;}
	//if (object = 92) and (asset_get_type("spr_sign_ground_pound") == asset_sprite){sprite_index = spr_sign_ground_pound;mask_index = spr_wall;}
	//if (object = 93) and (asset_get_type("spr_sign_rope_spin") == asset_sprite){sprite_index = spr_sign_rope_spin;mask_index = spr_wall;}
	//if (object = 94) and (asset_get_type("spr_sign_walljump") == asset_sprite){sprite_index = spr_sign_walljump;mask_index = spr_wall;}
	//if (object = 95) and (asset_get_type("spr_boss_stand") == asset_sprite){sprite_index = spr_boss_stand;mask_index = spr_wall;}
	//if (object = 96) and (asset_get_type("spr_boss_barrier") == asset_sprite){sprite_index = spr_boss_barrier;mask_index = spr_wall;}
	//if (object = 961) and (sprite_basic_enemy > 0){sprite_index = sprite_basic_enemy;mask_index = spr_wall;}
	//if (object = 97) and (asset_get_type("spr_artwork_collection") == asset_sprite){sprite_index = spr_artwork_collection;mask_index = spr_wall;}
	//if (object = 98) and (global.resource_pack_sprite_block_only_when_player_is_near >= 0){sprite_index = global.resource_pack_sprite_block_only_when_player_is_near;mask_index = spr_wall;}
}
else
{
	if (object = 1){if (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;}mask_index = spr_wall;}
	if (object = 2){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 3){if (asset_get_type("spr_map_exit") == asset_sprite){sprite_index = spr_map_exit;}mask_index = spr_wall;}
	if (object = 4){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 5){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 6){sprite_index = spr_noone; mask_index = spr_wall;}
	if (object = 7){sprite_index = spr_noone; mask_index = spr_wall;}
}
#endregion /*Initialize Object END*/