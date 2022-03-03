depth = +10;
sprite_index = global.resourcepack_sprite_big_collectible;
bounceup = false;
delay = 0;
delay_time = 0;
if (asset_get_type("spr_wall") == asset_object)
{
	mask_index = spr_wall;
}
coinsound = false;
big_collectible = 0;
follow_player = false;
effect_time = 0;