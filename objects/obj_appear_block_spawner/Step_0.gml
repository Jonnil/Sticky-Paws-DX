if (appear_cycle == 1)
&& (global.appear_block_timer == 0)
|| (appear_cycle == 2)
&& (global.appear_block_timer == 60)
|| (appear_cycle == 3)
&& (global.appear_block_timer == 60 * 2)
|| (appear_cycle == 4)
&& (global.appear_block_timer == 60 * 3)
|| (appear_cycle == 5)
&& (global.appear_block_timer == 60 * 4)
{
	with(instance_create_depth(x, y, 0, obj_appear_block))
	{
		image_blend = instance_nearest(x, y, obj_appear_block_spawner).image_blend;
		image_index = instance_nearest(x, y, obj_appear_block_spawner).image_index;
	}
}
