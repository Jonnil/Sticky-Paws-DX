#region /*Translate object names into object ID*/
if (global.world_editor = false)
{
	if (object = "wall"){object = 1;}else
	if (object = "wall_dirt"){object = 1001;}else
	if (object = "wall_glass"){object = 1002;}else
	if (object = "wall_grass"){object = 1003;}else
	if (object = "wall_gravel"){object = 1004;}else
	if (object = "wall_metal"){object = 1005;}else
	if (object = "wall_stone"){object = 1006;}else
	if (object = "wall_wood"){object = 1007;}else
	if (object = "wall_jump_panel"){object = 1008;}else
	if (object = "wall_climb_panel"){object = 1009;}else
	if (object = "spikes"){object = 2;}else
	if (object = "semisolid_platform"){object = 3;}else
	if (object = "brick_block"){object = 4;}else
	if (object = "question_block"){object = 11;}else
	if (object = "hard_block"){object = 18;}else
	if (object = "falling_block"){object = 19;}else
	if (object = "falling_block_solid"){object = 20;}else
	if (object = "falling_block_long"){object = 21;}else
	if (object = "falling_block_long_solid"){object = 22;}else
	if (object = "cloud_block"){object = 23;}else
	if (object = "ice_block"){object = 24;}else
	if (object = "cardboard_block"){object = 25;}else
	if (object = "cardboard"){object = 26;}else
	if (object = "cardboard_long"){object = 27;}else
	if (object = "bump_in_ground"){object = 28;}else
	if (object = "basic_collectible"){object = 40;}else
	if (object = "big_collectible_1"){object = 48;}else
	if (object = "big_collectible_2"){object = 49;}else
	if (object = "big_collectible_3"){object = 50;}else
	if (object = "big_collectible_4"){object = 51;}else
	if (object = "big_collectible_5"){object = 52;}else
	if (object = "heart"){object = 53;}else
	if (object = "hp_pickup"){object = 54;}else
	if (object = "invincibility_powerup"){object = 55;}else
	if (object = "invincibility_powerup_coil_spring"){object = 55001;}else
	if (object = "one-up"){object = 56;}else
	if (object = "two-up"){object = 57;}else
	if (object = "three-up"){object = 58;}else
	if (object = "basic_enemy"){object = 59;}else
	if (object = "basic_enemy_blind"){object = 5902;}else
	if (object = "enemy_bowlingball"){object = 591;}else
	if (object = "enemy_bowlingball_blind"){object = 5911;}else
	if (object = "big_stationary_enemy"){object = 60;}else
	if (object = "blaster"){object = 61;}else
	if (object = "spring"){object = 62;}else
	if (object = "ladder"){object = 63;}else
	if (object = "arrow_sign"){object = 64;}else
	if (object = "arrow_sign_small"){object = 65;}else
	if (object = "checkpoint"){object = 66;}else
	if (object = "spikes_emerge_block"){object = 67;}else
	if (object = "oneway"){object = 68;}else
	if (object = "oneway2"){object = 69;}else
	if (object = "oneway3"){object = 70;}else
	if (object = "oneway4"){object = 71;}else
	if (object = "horizontal_rope"){object = 72;}else
	if (object = "water"){object = 73;}else
	if (object = "water_surface"){object = 731;}else
	if (object = "air_bubbles_spawner"){object = 735;}else
	if (object = "water_level_change_slow"){object = 732;}else
	if (object = "water_level_change_fast"){object = 733;}else
	if (object = "water_level_change_faster"){object = 734;}else
	if (object = "clipped_shirt"){object = 74;}else
	if (object = "clipped_pants"){object = 75;}else
	if (object = "clipped_sock"){object = 76;}else
	if (object = "bucket"){object = 77;}else
	if (object = "bird"){object = 89;}else
	if (object = "sign_crouch"){object = 90;}else
	if (object = "boss"){object = 95;}else
	if (object = "boss_barrier"){object = 96;}else
	if (object = "cake_stealing_enemy"){object = 961;}else
	if (object = "artwork_collection"){object = 97;}else
	if (object = "block_only_when_player_is_near"){object = 98;}
}
else
{
	if (object = "wall"){object = 1;}else
	if (object = "level"){object = 2;}else
	if (object = "exit"){object = 3;}else
	if (object = "right_down"){object = 4;}else
	if (object = "up_right"){object = 5;}else
	if (object = "up_left"){object = 6;}else
	if (object = "left_down"){object = 7;}
}
#endregion /*Translate object names into object ID*/

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
	if (object = 1) and (asset_get_type("spr_wall") == asset_sprite){sprite_index = spr_wall;mask_index = spr_wall;}
	if (object = 1001) and (asset_get_type("spr_wall_dirt") == asset_sprite){sprite_index = spr_wall_dirt;mask_index = spr_wall;}
	if (object = 1002) and (asset_get_type("spr_wall_glass") == asset_sprite){sprite_index = spr_wall_glass;mask_index = spr_wall;}
	if (object = 1003) and (asset_get_type("spr_wall_grass") == asset_sprite){sprite_index = spr_wall_grass;mask_index = spr_wall;}
	if (object = 1004) and (asset_get_type("spr_wall_gravel") == asset_sprite){sprite_index = spr_wall_gravel;mask_index = spr_wall;}
	if (object = 1005) and (asset_get_type("spr_wall_metal") == asset_sprite){sprite_index = spr_wall_metal;mask_index = spr_wall;}
	if (object = 1006) and (asset_get_type("spr_wall_stone") == asset_sprite){sprite_index = spr_wall_stone;mask_index = spr_wall;}
	if (object = 1007) and (asset_get_type("spr_wall_wood") == asset_sprite){sprite_index = spr_wall_wood;mask_index = spr_wall;}

	if (object = 1008) and (asset_get_type("spr_wall_jump_panel") == asset_sprite){sprite_index = spr_wall_jump_panel;mask_index = spr_wall;}
	if (object = 1009) and (asset_get_type("spr_wall_climb_panel") == asset_sprite){sprite_index = spr_wall_climb_panel;mask_index = spr_wall;}
	if (object = 2) and (asset_get_type("spr_spikes") == asset_sprite){sprite_index = spr_spikes;mask_index = spr_wall;}
	if (object = 3) and (asset_get_type("spr_semisolid_platform") == asset_sprite){sprite_index = spr_semisolid_platform;mask_index = spr_wall;}

	#region /*Brick Block*/
	if (object = 4) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	if (object = 5) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	mask_index = spr_wall;}
	if (object = 6) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	if (object = 7) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	mask_index = spr_wall;}
	if (object = 8) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	mask_index = spr_wall;}
	if (object = 9) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;
	mask_index = spr_wall;}
	if (object = 10) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	if (object = 10001) and (asset_get_type("spr_brick_block") == asset_sprite){sprite_index = spr_brick_block;mask_index = spr_wall;}
	#endregion /*Brick Block END*/

	#region /*Question Block*/
	if (object = 11) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	if (object = 12) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	if (object = 13) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	if (object = 14) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	if (object = 15) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	if (object = 16) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;}
	if (object = 17) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	if (object = 17001) and (asset_get_type("spr_question_block") == asset_sprite){sprite_index = spr_question_block;mask_index = spr_wall;}
	#endregion /*Question Block END*/

	if (object = 18) and (asset_get_type("spr_hard_block") == asset_sprite){sprite_index = spr_hard_block;mask_index = spr_wall;}

	#region /*Falling Block*/
	if (object = 19) and (asset_get_type("spr_falling_block") == asset_sprite){sprite_index = spr_falling_block;mask_index = spr_wall;}
	if (object = 20) and (asset_get_type("spr_falling_block_solid") == asset_sprite){sprite_index = spr_falling_block_solid;mask_index = spr_wall;}
	if (object = 21) and (asset_get_type("spr_falling_block_long") == asset_sprite){sprite_index = spr_falling_block_long;mask_index = spr_cardboard;}
	if (object = 22) and (asset_get_type("spr_falling_block_long_solid") == asset_sprite){sprite_index = spr_falling_block_long_solid;mask_index = spr_cardboard;}
	#endregion /*Falling Block END*/

	if (object = 23) and (asset_get_type("spr_cloud_block") == asset_sprite){sprite_index = spr_cloud_block;mask_index = spr_wall;}
	if (object = 24) and (asset_get_type("spr_ice_block") == asset_sprite){sprite_index = spr_ice_block;mask_index = spr_wall;}
	if (object = 25) and (asset_get_type("spr_cardboard_block") == asset_sprite){sprite_index = spr_cardboard_block;mask_index = spr_wall;}
	if (object = 26) and (asset_get_type("spr_cardboard") == asset_sprite){sprite_index = spr_cardboard;mask_index = spr_cardboard;}
	if (object = 27) and (asset_get_type("spr_cardboard_long") == asset_sprite){sprite_index = spr_cardboard_long;mask_index = spr_cardboard_long;}

	#region /*Bump in ground*/
	if (object = 28) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 29) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 30) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 31) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;
	mask_index = spr_wall;}
	if (object = 32) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;
	mask_index = spr_wall;}
	if (object = 33) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;
	mask_index = spr_wall;}
	if (object = 34) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 35) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 36) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 37) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 38) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 39) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	if (object = 39001) and (asset_get_type("spr_bump_in_ground") == asset_sprite){sprite_index = spr_bump_in_ground;mask_index = spr_wall;}
	#endregion /*Bump in ground END*/

	#region /*Basic Collectible*/
	if (object = 40){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 0;draw_yscale = 1;mask_index = spr_wall;}
	if (object = 41){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 315;draw_yscale = 1;mask_index = spr_wall;}
	if (object = 42){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 270;draw_yscale = 1;mask_index = spr_wall;}
	if (object = 43){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 225;draw_yscale = -1;mask_index = spr_wall;}
	if (object = 44){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 180;draw_yscale = -1;mask_index = spr_wall;}
	if (object = 45){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 135;draw_yscale = -1;mask_index = spr_wall;}
	if (object = 46){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 90;draw_yscale = 1;mask_index = spr_wall;}
	if (object = 47){sprite_index = global.resource_pack_sprite_basic_collectible;draw_angle = 45;draw_yscale = 1;mask_index = spr_wall;}
	#endregion /*Basic Collectible END*/

	#region /*Big Collectibles*/
	if (object = 48){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	if (object = 49){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	if (object = 50){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	if (object = 51){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	if (object = 52){sprite_index = global.resource_pack_sprite_big_collectible;mask_index = spr_2x2_block;}
	#endregion /*Big Collectibles END*/

	if (object = 53) and (asset_get_type("spr_heart") == asset_sprite){sprite_index = spr_heart;mask_index = spr_wall;}
	if (object = 54){sprite_index = global.resource_pack_sprite_hp_pickup;mask_index = spr_wall;}
	if (object = 55){sprite_index = noone;mask_index = spr_wall;}
	if (object = 55001){sprite_index = noone;mask_index = spr_wall;}
	if (object = 56) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	mask_index = spr_wall;}
	if (object = 57) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	mask_index = spr_wall;}
	if (object = 58) and (sprite_lives_icon > noone){sprite_index = sprite_lives_icon;
	mask_index = spr_wall;}
	if (object = 59){sprite_index = sprite_basic_enemy;mask_index = spr_wall;}
	if (object = 5901){sprite_index = sprite_basic_enemy; mask_index = spr_wall;}
	if (object = 5902){sprite_index = sprite_basic_enemy_blind;mask_index = spr_wall;}
	if (object = 5903){sprite_index = sprite_basic_enemy_blind; mask_index = spr_wall;}
	if (object = 591){sprite_index = sprite_enemy_bowlingball;mask_index = spr_wall;}
	if (object = 592){sprite_index = sprite_enemy_bowlingball; mask_index = spr_wall;}
	if (object = 5911){sprite_index = sprite_enemy_bowlingball_blind;mask_index = spr_wall;}
	if (object = 5912){sprite_index = sprite_enemy_bowlingball_blind;mask_index = spr_wall;}
	if (object = 60){sprite_index = sprite_big_stationary_enemy;mask_index = spr_wall;}
	if (object = 61){sprite_index = global.resource_pack_sprite_blaster;mask_index = spr_wall;}
	if (object = 62) and (asset_get_type("spr_spring") == asset_sprite){sprite_index = spr_spring;mask_index = spr_wall;}
	if (object = 63) and (asset_get_type("spr_ladder") == asset_sprite){sprite_index = spr_ladder;mask_index = spr_wall;}

	#region /*Arrow Signs*/
	if (object = 64) and (asset_get_type("spr_arrow_sign") == asset_sprite){mask_index = spr_wall;sprite_index = noone;}
	#endregion /*Arrow Signs END*/

	#region /*Arrow Signs Small*/
	if (object = 65) and (asset_get_type("spr_arrow_sign_small") == asset_sprite){mask_index = spr_wall;sprite_index = noone;}
	#endregion /*Arrow Signs Small END*/

	if (object = 66) and (asset_get_type("spr_checkpoint") == asset_sprite){sprite_index = spr_checkpoint;mask_index = spr_2x2_block;}
	if (object = 67) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 0; mask_index = spr_wall;}
	if (object = 671) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 90; mask_index = spr_wall;}
	if (object = 672) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 180; mask_index = spr_wall;}
	if (object = 673) and (asset_get_type("spr_spikes_emerge_block") == asset_sprite){sprite_index = spr_spikes_emerge_block;draw_angle = 270; mask_index = spr_wall;}

	#region /*Oneway*/
	if (object = 68) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 0;mask_index = spr_wall;}
	if (object = 69) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 90;mask_index = spr_wall;}
	if (object = 70) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 180;mask_index = spr_wall;}
	if (object = 71) and (asset_get_type("spr_oneway") == asset_sprite){sprite_index = spr_oneway;draw_angle = 270;mask_index = spr_wall;}
	#endregion /*Oneway END*/

	if (object = 72) and (asset_get_type("spr_horizontal_rope") == asset_sprite){sprite_index = spr_horizontal_rope;mask_index = spr_wall;}
	if (object = 73) and (asset_get_type("spr_water") == asset_sprite){sprite_index = spr_water;mask_index = spr_wall;}
	if (object = 731) and (asset_get_type("spr_water_surface") == asset_sprite){sprite_index = spr_water_surface;mask_index = spr_wall;}
	if (object = 735) and (asset_get_type("spr_air_bubbles_spawner") == asset_sprite){sprite_index = spr_air_bubbles_spawner;mask_index = spr_wall;}
	else
	if (object = 735) and (asset_get_type("spr_bubble") == asset_sprite){sprite_index = spr_bubble;mask_index = spr_wall;}
	if (object = 732) and (asset_get_type("spr_water_level_change_slow") == asset_sprite){sprite_index = spr_water_level_change_slow;mask_index = spr_wall;}
	if (object = 733) and (asset_get_type("spr_water_level_change_fast") == asset_sprite){sprite_index = spr_water_level_change_fast;mask_index = spr_wall;}
	if (object = 734) and (asset_get_type("spr_water_level_change_faster") == asset_sprite){sprite_index = spr_water_level_change_faster;mask_index = spr_wall;}
	if (object = 74) and (asset_get_type("spr_clipped_shirt") == asset_sprite){sprite_index = spr_clipped_shirt;mask_index = spr_wall;}
	if (object = 75) and (asset_get_type("spr_clipped_pants") == asset_sprite){sprite_index = spr_clipped_pants;mask_index = spr_wall;}
	if (object = 76) and (asset_get_type("spr_clipped_sock") == asset_sprite){sprite_index = spr_clipped_sock;mask_index = spr_wall;}

	#region /*Bucket*/
	if (object = 77) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 78) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 79) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 80) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 81) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 82) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 83) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 84) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 85) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 86) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 87) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 88) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	if (object = 88001) and (asset_get_type("spr_bucket") == asset_sprite){sprite_index = spr_bucket;mask_index = spr_wall;}
	#endregion /*Bucket END*/

	if (object = 89) and (asset_get_type("spr_bird") == asset_sprite){sprite_index = spr_bird;mask_index = spr_wall;}
	if (object = 90) and (asset_get_type("spr_sign_crouch") == asset_sprite){sprite_index = spr_sign_crouch;mask_index = spr_wall;}
	if (object = 91) and (asset_get_type("spr_sign_dive") == asset_sprite){sprite_index = spr_sign_dive;mask_index = spr_wall;}
	if (object = 92) and (asset_get_type("spr_sign_ground_pound") == asset_sprite){sprite_index = spr_sign_ground_pound;mask_index = spr_wall;}
	if (object = 93) and (asset_get_type("spr_sign_rope_spin") == asset_sprite){sprite_index = spr_sign_rope_spin;mask_index = spr_wall;}
	if (object = 94) and (asset_get_type("spr_sign_walljump") == asset_sprite){sprite_index = spr_sign_walljump;mask_index = spr_wall;}
	if (object = 95) and (asset_get_type("spr_boss_stand") == asset_sprite){sprite_index = spr_boss_stand;mask_index = spr_wall;}
	if (object = 96) and (asset_get_type("spr_boss_barrier") == asset_sprite){sprite_index = spr_boss_barrier;mask_index = spr_wall;}
	if (object = 961) and (sprite_basic_enemy > 0){sprite_index = sprite_basic_enemy;mask_index = spr_wall;}
	if (object = 97) and (asset_get_type("spr_artwork_collection") == asset_sprite){sprite_index = spr_artwork_collection;mask_index = spr_wall;}
	if (object = 98) and (global.resource_pack_sprite_block_only_when_player_is_near >= 0){sprite_index = global.resource_pack_sprite_block_only_when_player_is_near;mask_index = spr_wall;}
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