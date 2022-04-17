/// @function scr_load_resource_pack_sprite()
/// @description scr_load_resource_pack_sprite()

function scr_load_resource_pack_sprite()
{
	
	#region /*Delete sprites before loading new sprites*/
	if (room != room_splash_screen)
	{
		if (global.resource_pack_sprite_splash_controller > 0){global.resource_pack_sprite_splash_controller = spr_noone;}
		if (global.resource_pack_sprite_splash_easteregg > 0){global.resource_pack_sprite_splash_easteregg = spr_noone;}
		if (global.resource_pack_sprite_tileset_default > 0){global.resource_pack_sprite_tileset_default = spr_noone;}
		if (global.resource_pack_sprite_tileset_dirt > 0){global.resource_pack_sprite_tileset_dirt = spr_noone;}
		if (global.resource_pack_sprite_tileset_glass > 0){global.resource_pack_sprite_tileset_glass = spr_noone;}
		if (global.resource_pack_sprite_tileset_grass > 0){global.resource_pack_sprite_tileset_grass = spr_noone;}
		if (global.resource_pack_sprite_tileset_gravel > 0){global.resource_pack_sprite_tileset_gravel = spr_noone;}
		if (global.resource_pack_sprite_tileset_metal > 0){global.resource_pack_sprite_tileset_metal = spr_noone;}
		if (global.resource_pack_sprite_tileset_stone > 0){global.resource_pack_sprite_tileset_stone = spr_noone;}
		if (global.resource_pack_sprite_tileset_wood > 0){global.resource_pack_sprite_tileset_wood = spr_noone;}
		if (global.resource_pack_sprite_title_logo_christmas > 0){global.resource_pack_sprite_title_logo_christmas = spr_noone;}
		if (global.resource_pack_sprite_artwork_collection > 0){global.resource_pack_sprite_artwork_collection = spr_noone;}
		if (global.resource_pack_sprite_basic_collectible > 0){global.resource_pack_sprite_basic_collectible = spr_noone;}
		if (global.resource_pack_sprite_basic_enemy > 0){global.resource_pack_sprite_basic_enemy = spr_noone;}
		if (global.resource_pack_sprite_basic_enemy_blind > 0){global.resource_pack_sprite_basic_enemy_blind = spr_noone;}
		if (global.resource_pack_sprite_basic_enemy_angry > 0){global.resource_pack_sprite_basic_enemy_angry = spr_noone;}
		if (global.resource_pack_sprite_basic_enemy_flattened > 0){global.resource_pack_sprite_basic_enemy_flattened = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_walk > 0){global.resource_pack_sprite_enemy_bowlingball_walk = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_stomped > 0){global.resource_pack_sprite_enemy_bowlingball_stomped = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_revive > 0){global.resource_pack_sprite_enemy_bowlingball_revive = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > 0){global.resource_pack_sprite_enemy_bowlingball_blind_walk = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_blind_stomped > 0){global.resource_pack_sprite_enemy_bowlingball_blind_stomped = spr_noone;}
		if (global.resource_pack_sprite_enemy_bowlingball_blind_revive > 0){global.resource_pack_sprite_enemy_bowlingball_blind_revive = spr_noone;}
		if (global.resource_pack_sprite_bowlingball > 0){global.resource_pack_sprite_bowlingball = spr_noone;}
		if (global.resource_pack_sprite_bowlingball_shine > 0){global.resource_pack_sprite_bowlingball_shine = spr_noone;}
		if (global.resource_pack_sprite_coil_spring > 0){global.resource_pack_sprite_coil_spring = spr_noone;}
		if (global.resource_pack_sprite_big_collectible > 0){global.resource_pack_sprite_big_collectible = spr_noone;}
		if (global.resource_pack_sprite_big_collectible_outline > 0){global.resource_pack_sprite_big_collectible_outline = spr_noone;}
		if (global.resource_pack_sprite_big_stationary_enemy > 0){global.resource_pack_sprite_big_stationary_enemy = spr_noone;}
		if (global.resource_pack_sprite_big_stationary_enemy_flattened > 0){global.resource_pack_sprite_big_stationary_enemy_flattened = spr_noone;}
		if (global.resource_pack_sprite_blaster > 0){global.resource_pack_sprite_blaster = spr_noone;}
		if (global.resource_pack_sprite_bullet > 0){global.resource_pack_sprite_bullet = spr_noone;}
		if (global.resource_pack_sprite_bullet_flattened > 0){global.resource_pack_sprite_bullet_flattened = spr_noone;}
		if (global.resource_pack_sprite_hp_pickup > 0){global.resource_pack_sprite_hp_pickup = spr_noone;}
		if (global.resource_pack_sprite_invincibility_powerup > 0){global.resource_pack_sprite_invincibility_powerup = spr_noone;}
		if (global.resource_pack_sprite_block_only_when_player_is_near > 0){global.resource_pack_sprite_block_only_when_player_is_near = spr_noone;}
	}
	#endregion /*Delete sprites before loading new sprites END*/
	
	if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
	or (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
	{
		if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
		{
			ini_open("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini");
		}
		else
		if (file_exists(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini"))
		{
			ini_open(working_directory + "/custom_resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/data/sprite_origin_point.ini");
		}
		global.resource_pack_sprite_splash_controller = scr_initialize_resource_pack_sprite("splash_controller", global.resource_pack_sprite_splash_controller);
		global.resource_pack_sprite_splash_easteregg = scr_initialize_resource_pack_sprite("splash_easteregg", global.resource_pack_sprite_splash_easteregg);
		global.resource_pack_sprite_tileset_default = scr_initialize_resource_pack_sprite("tileset_default", global.resource_pack_sprite_tileset_default);
		global.resource_pack_sprite_tileset_dirt = scr_initialize_resource_pack_sprite("tileset_dirt", global.resource_pack_sprite_tileset_dirt);
		global.resource_pack_sprite_tileset_glass = scr_initialize_resource_pack_sprite("tileset_glass", global.resource_pack_sprite_tileset_glass);
		global.resource_pack_sprite_tileset_grass = scr_initialize_resource_pack_sprite("tileset_grass", global.resource_pack_sprite_tileset_grass);
		global.resource_pack_sprite_tileset_gravel = scr_initialize_resource_pack_sprite("tileset_gravel", global.resource_pack_sprite_tileset_gravel);
		global.resource_pack_sprite_tileset_metal = scr_initialize_resource_pack_sprite("tileset_metal", global.resource_pack_sprite_tileset_metal);
		global.resource_pack_sprite_tileset_stone = scr_initialize_resource_pack_sprite("tileset_stone", global.resource_pack_sprite_tileset_stone);
		global.resource_pack_sprite_tileset_wood = scr_initialize_resource_pack_sprite("tileset_wood", global.resource_pack_sprite_tileset_wood);
		global.resource_pack_sprite_title_logo_christmas = scr_initialize_resource_pack_sprite("title_logo_christmas", global.resource_pack_sprite_title_logo_christmas);
		global.resource_pack_sprite_artwork_collection = scr_initialize_resource_pack_sprite("artwork_collection", global.resource_pack_sprite_artwork_collection);
		global.resource_pack_sprite_basic_collectible = scr_initialize_resource_pack_sprite("basic_collectible", global.resource_pack_sprite_basic_collectible);
		global.resource_pack_sprite_big_collectible = scr_initialize_resource_pack_sprite("big_collectible", global.resource_pack_sprite_big_collectible);
		global.resource_pack_sprite_big_collectible_outline = scr_initialize_resource_pack_sprite("big_collectible_outline", global.resource_pack_sprite_big_collectible_outline);
		global.resource_pack_sprite_bullet = scr_initialize_resource_pack_sprite("bullet", global.resource_pack_sprite_bullet);
		global.resource_pack_sprite_bullet_flattened = scr_initialize_resource_pack_sprite("bullet_flattened", global.resource_pack_sprite_bullet_flattened);
		global.resource_pack_sprite_blaster = scr_initialize_resource_pack_sprite("blaster", global.resource_pack_sprite_blaster);
		global.resource_pack_sprite_basic_enemy = scr_initialize_resource_pack_sprite("basic_enemy", global.resource_pack_sprite_basic_enemy);
		global.resource_pack_sprite_basic_enemy_blind = scr_initialize_resource_pack_sprite("basic_enemy_blind", global.resource_pack_sprite_basic_enemy_blind);
		global.resource_pack_sprite_basic_enemy_angry = scr_initialize_resource_pack_sprite("basic_enemy_angry", global.resource_pack_sprite_basic_enemy_angry);
		global.resource_pack_sprite_basic_enemy_flattened = scr_initialize_resource_pack_sprite("basic_enemy_flattened", global.resource_pack_sprite_basic_enemy_flattened);
		global.resource_pack_sprite_enemy_bowlingball_walk = scr_initialize_resource_pack_sprite("enemy_bowlingball_walk", global.resource_pack_sprite_enemy_bowlingball_walk);
		global.resource_pack_sprite_enemy_bowlingball_stomped = scr_initialize_resource_pack_sprite("enemy_bowlingball_stomped", global.resource_pack_sprite_enemy_bowlingball_stomped);
		global.resource_pack_sprite_enemy_bowlingball_revive = scr_initialize_resource_pack_sprite("enemy_bowlingball_revive", global.resource_pack_sprite_enemy_bowlingball_revive);
		global.resource_pack_sprite_enemy_bowlingball_blind_walk = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_walk", global.resource_pack_sprite_enemy_bowlingball_blind_walk);
		global.resource_pack_sprite_enemy_bowlingball_blind_stomped = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_stomped", global.resource_pack_sprite_enemy_bowlingball_blind_stomped);
		global.resource_pack_sprite_enemy_bowlingball_blind_revive = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_revive", global.resource_pack_sprite_enemy_bowlingball_blind_revive);
		global.resource_pack_sprite_bowlingball = scr_initialize_resource_pack_sprite("bowlingball", global.resource_pack_sprite_bowlingball);
		global.resource_pack_sprite_bowlingball_shine = scr_initialize_resource_pack_sprite("bowlingball_shine", global.resource_pack_sprite_bowlingball_shine);
		global.resource_pack_sprite_coil_spring = scr_initialize_resource_pack_sprite("coil_spring", global.resource_pack_sprite_coil_spring);
		global.resource_pack_sprite_big_stationary_enemy = scr_initialize_resource_pack_sprite("big_stationary_enemy", global.resource_pack_sprite_big_stationary_enemy);
		global.resource_pack_sprite_big_stationary_enemy_flattened = scr_initialize_resource_pack_sprite("big_stationary_enemy_flattened", global.resource_pack_sprite_big_stationary_enemy_flattened);
		global.resource_pack_sprite_hp_pickup = scr_initialize_resource_pack_sprite("hp_pickup", global.resource_pack_sprite_hp_pickup);
		global.resource_pack_sprite_invincibility_powerup = scr_initialize_resource_pack_sprite("invincibility_powerup", global.resource_pack_sprite_invincibility_powerup);
		global.resource_pack_sprite_block_only_when_player_is_near = scr_initialize_resource_pack_sprite("block_only_when_player_is_near", global.resource_pack_sprite_block_only_when_player_is_near);
		ini_close();
	}
}