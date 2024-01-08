if (sprite_index == spr_map_tree_yawn)
&& (image_index > image_number - 1)
{
	sprite_index = spr_map_tree_sleep;
	alarm_set(0, 60);
}