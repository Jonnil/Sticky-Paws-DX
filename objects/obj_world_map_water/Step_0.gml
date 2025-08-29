timer++;
if (timer == 10)
{
	sprite_index = spr_world_map_water_1;
}
if (timer == 20)
{
	sprite_index = spr_world_map_water_2;
}
if (timer == 30)
{
	sprite_index = spr_world_map_water_3;
}
if (timer == 40)
{
	sprite_index = spr_world_map_water_2;
	timer = 0;
}
