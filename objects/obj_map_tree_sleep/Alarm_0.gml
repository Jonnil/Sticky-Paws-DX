if (sprite_index == spr_map_tree_sleep)
&& (floor(random(99)) == 0)
{
	sprite_index = spr_map_tree_yawn;
	image_index = 0;
}
else
{
	alarm_set(0, 60);
}
