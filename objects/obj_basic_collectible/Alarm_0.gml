/// @description Collect the basic collectible
effect_create_depth(depth - 1, ef_ring, x, y, 0, c_white);
global.basic_collectibles += bulk_number;
if (instance_exists(obj_player))
{
	instance_nearest(x, y, obj_player).basic_collectibles += bulk_number;
}
obj_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
if (bulk_number == 1)
{
	score += 200;
}

get_1up_when_collect_basic_collectibles();

instance_destroy();
