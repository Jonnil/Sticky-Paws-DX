/// @function scr_load_resource_pack_sprite()
/// @description scr_load_resource_pack_sprite()

function scr_load_resource_pack_sprite()
{
	var file_name = 0;
	var xorig_variable = 0;
	var yorig_variable = 0;
	
	#region /*Delete sprites before loading new sprites*/
	if (room != room_splash_screen)
	{
		if (global.resourcepack_sprite_tileset_default > 0){sprite_delete(global.resourcepack_sprite_tileset_default);}
		if (global.resourcepack_sprite_tileset_dirt > 0){sprite_delete(global.resourcepack_sprite_tileset_dirt);}
		if (global.resourcepack_sprite_tileset_glass > 0){sprite_delete(global.resourcepack_sprite_tileset_glass);}
		if (global.resourcepack_sprite_tileset_grass > 0){sprite_delete(global.resourcepack_sprite_tileset_grass);}
		if (global.resourcepack_sprite_tileset_gravel > 0){sprite_delete(global.resourcepack_sprite_tileset_gravel);}
		if (global.resourcepack_sprite_tileset_metal > 0){sprite_delete(global.resourcepack_sprite_tileset_metal);}
		if (global.resourcepack_sprite_tileset_stone > 0){sprite_delete(global.resourcepack_sprite_tileset_stone);}
		if (global.resourcepack_sprite_tileset_wood > 0){sprite_delete(global.resourcepack_sprite_tileset_wood);}
		if (global.resourcepack_sprite_title_logo > 0){sprite_delete(global.resourcepack_sprite_title_logo);}
		if (global.resourcepack_sprite_title_logo_christmas > 0){sprite_delete(global.resourcepack_sprite_title_logo_christmas);}
		if (global.resourcepack_sprite_artwork_collection > 0){sprite_delete(global.resourcepack_sprite_artwork_collection);}
		if (global.resourcepack_sprite_basic_collectible > 0){sprite_delete(global.resourcepack_sprite_basic_collectible);}
		if (global.resourcepack_sprite_basic_enemy > 0){sprite_delete(global.resourcepack_sprite_basic_enemy);}
		if (global.resourcepack_sprite_basic_enemy_blind > 0){sprite_delete(global.resourcepack_sprite_basic_enemy_blind);}
		if (global.resourcepack_sprite_basic_enemy_angry > 0){sprite_delete(global.resourcepack_sprite_basic_enemy_angry);}
		if (global.resourcepack_sprite_basic_enemy_flattened > 0){sprite_delete(global.resourcepack_sprite_basic_enemy_flattened);}
		if (global.resourcepack_sprite_enemy_bowlingball_walk > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_walk);}
		if (global.resourcepack_sprite_enemy_bowlingball_stomped > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_stomped);}
		if (global.resourcepack_sprite_enemy_bowlingball_revive > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_revive);}
		if (global.resourcepack_sprite_enemy_bowlingball_blind_walk > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_blind_walk);}
		if (global.resourcepack_sprite_enemy_bowlingball_blind_stomped > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_blind_stomped);}
		if (global.resourcepack_sprite_enemy_bowlingball_blind_revive > 0){sprite_delete(global.resourcepack_sprite_enemy_bowlingball_blind_revive);}
		if (global.resourcepack_sprite_bowlingball > 0){sprite_delete(global.resourcepack_sprite_bowlingball);}
		if (global.resourcepack_sprite_bowlingball_shine > 0){sprite_delete(global.resourcepack_sprite_bowlingball_shine);}
		if (global.resourcepack_sprite_coil_spring > 0){sprite_delete(global.resourcepack_sprite_coil_spring);}
		if (global.resourcepack_sprite_big_collectible > 0){sprite_delete(global.resourcepack_sprite_big_collectible);}
		if (global.resourcepack_sprite_big_collectible_outline > 0){sprite_delete(global.resourcepack_sprite_big_collectible_outline);}
		if (global.resourcepack_sprite_big_stationary_enemy > 0){sprite_delete(global.resourcepack_sprite_big_stationary_enemy);}
		if (global.resourcepack_sprite_big_stationary_enemy_flattened > 0){sprite_delete(global.resourcepack_sprite_big_stationary_enemy_flattened);}
		if (global.resourcepack_sprite_blaster > 0){sprite_delete(global.resourcepack_sprite_blaster);}
		if (global.resourcepack_sprite_bullet > 0){sprite_delete(global.resourcepack_sprite_bullet);}
		if (global.resourcepack_sprite_bullet_flattened > 0){sprite_delete(global.resourcepack_sprite_bullet_flattened);}
		if (global.resourcepack_sprite_hp_pickup > 0){sprite_delete(global.resourcepack_sprite_hp_pickup);}
		if (global.resourcepack_sprite_invincibility_powerup > 0){sprite_delete(global.resourcepack_sprite_invincibility_powerup);}
	}
	#endregion /*Delete sprites before loading new sprites END*/
	
	if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
	or(file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
	{
		
		if (file_exists("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini"))
		{
			ini_open("resourcepacks/resourcepack" + string(global.selected_resourcepack) + "/data/sprite_origin_point.ini");
		}
		else
		if (file_exists(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini"))
		{
			ini_open(working_directory + "/custom_resourcepacks/resourcepack" + string(global.selected_resourcepack-global.max_number_of_official_resourcepacks) + "/data/sprite_origin_point.ini");
		}
		
		global.resourcepack_sprite_tileset_default = scr_initialize_resource_pack_sprite("tileset_default", global.resourcepack_sprite_tileset_default);
		global.resourcepack_sprite_tileset_dirt = scr_initialize_resource_pack_sprite("tileset_dirt", global.resourcepack_sprite_tileset_dirt);
		global.resourcepack_sprite_tileset_glass = scr_initialize_resource_pack_sprite("tileset_glass", global.resourcepack_sprite_tileset_glass);
		global.resourcepack_sprite_tileset_grass = scr_initialize_resource_pack_sprite("tileset_grass", global.resourcepack_sprite_tileset_grass);
		global.resourcepack_sprite_tileset_gravel = scr_initialize_resource_pack_sprite("tileset_gravel", global.resourcepack_sprite_tileset_gravel);
		global.resourcepack_sprite_tileset_metal = scr_initialize_resource_pack_sprite("tileset_metal", global.resourcepack_sprite_tileset_metal);
		global.resourcepack_sprite_tileset_stone = scr_initialize_resource_pack_sprite("tileset_stone", global.resourcepack_sprite_tileset_stone);
		global.resourcepack_sprite_tileset_wood = scr_initialize_resource_pack_sprite("tileset_wood", global.resourcepack_sprite_tileset_wood);
		global.resourcepack_sprite_title_logo = scr_initialize_resource_pack_sprite("title_logo", global.resourcepack_sprite_title_logo);
		global.resourcepack_sprite_title_logo_christmas = scr_initialize_resource_pack_sprite("title_logo_christmas", global.resourcepack_sprite_title_logo_christmas);
		global.resourcepack_sprite_artwork_collection = scr_initialize_resource_pack_sprite("artwork_collection", global.resourcepack_sprite_artwork_collection);
		global.resourcepack_sprite_basic_collectible = scr_initialize_resource_pack_sprite("basic_collectible", global.resourcepack_sprite_basic_collectible);
		global.resourcepack_sprite_big_collectible = scr_initialize_resource_pack_sprite("big_collectible", global.resourcepack_sprite_big_collectible);
		global.resourcepack_sprite_big_collectible_outline = scr_initialize_resource_pack_sprite("big_collectible_outline", global.resourcepack_sprite_big_collectible_outline);
		global.resourcepack_sprite_bullet = scr_initialize_resource_pack_sprite("bullet", global.resourcepack_sprite_bullet);
		global.resourcepack_sprite_bullet_flattened = scr_initialize_resource_pack_sprite("bullet_flattened", global.resourcepack_sprite_bullet_flattened);
		global.resourcepack_sprite_blaster = scr_initialize_resource_pack_sprite("blaster", global.resourcepack_sprite_blaster);
		global.resourcepack_sprite_basic_enemy = scr_initialize_resource_pack_sprite("basic_enemy", global.resourcepack_sprite_basic_enemy);
		global.resourcepack_sprite_basic_enemy_blind = scr_initialize_resource_pack_sprite("basic_enemy_blind", global.resourcepack_sprite_basic_enemy_blind);
		global.resourcepack_sprite_basic_enemy_angry = scr_initialize_resource_pack_sprite("basic_enemy_angry", global.resourcepack_sprite_basic_enemy_angry);
		global.resourcepack_sprite_basic_enemy_flattened = scr_initialize_resource_pack_sprite("basic_enemy_flattened", global.resourcepack_sprite_basic_enemy_flattened);
		global.resourcepack_sprite_enemy_bowlingball_walk = scr_initialize_resource_pack_sprite("enemy_bowlingball_walk", global.resourcepack_sprite_enemy_bowlingball_walk);
		global.resourcepack_sprite_enemy_bowlingball_stomped = scr_initialize_resource_pack_sprite("enemy_bowlingball_stomped", global.resourcepack_sprite_enemy_bowlingball_stomped);
		global.resourcepack_sprite_enemy_bowlingball_revive = scr_initialize_resource_pack_sprite("enemy_bowlingball_revive", global.resourcepack_sprite_enemy_bowlingball_revive);
		global.resourcepack_sprite_enemy_bowlingball_blind_walk = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_walk", global.resourcepack_sprite_enemy_bowlingball_blind_walk);
		global.resourcepack_sprite_enemy_bowlingball_blind_stomped = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_stomped", global.resourcepack_sprite_enemy_bowlingball_blind_stomped);
		global.resourcepack_sprite_enemy_bowlingball_blind_revive = scr_initialize_resource_pack_sprite("enemy_bowlingball_blind_revive", global.resourcepack_sprite_enemy_bowlingball_blind_revive);
		global.resourcepack_sprite_bowlingball = scr_initialize_resource_pack_sprite("bowlingball", global.resourcepack_sprite_bowlingball);
		global.resourcepack_sprite_bowlingball_shine = scr_initialize_resource_pack_sprite("bowlingball_shine", global.resourcepack_sprite_bowlingball_shine);
		global.resourcepack_sprite_coil_spring = scr_initialize_resource_pack_sprite("coil_spring", global.resourcepack_sprite_coil_spring);
		global.resourcepack_sprite_big_stationary_enemy = scr_initialize_resource_pack_sprite("big_stationary_enemy", global.resourcepack_sprite_big_stationary_enemy);
		global.resourcepack_sprite_big_stationary_enemy_flattened = scr_initialize_resource_pack_sprite("big_stationary_enemy_flattened", global.resourcepack_sprite_big_stationary_enemy_flattened);
		global.resourcepack_sprite_hp_pickup = scr_initialize_resource_pack_sprite("hp_pickup", global.resourcepack_sprite_hp_pickup);
		global.resourcepack_sprite_invincibility_powerup = scr_initialize_resource_pack_sprite("invincibility_powerup", global.resourcepack_sprite_invincibility_powerup);
		
		ini_close();
	}
}