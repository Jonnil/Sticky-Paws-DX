/// @description Collect the basic collectible
effect_create_above(ef_ring, x, y, 0, c_white);
get_1up_when_collect_basic_collectibles();
global.basic_collectibles ++;
if (instance_exists(obj_player))
{
	instance_nearest(x, y, obj_player).basic_collectibles ++;
}
obj_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
score += 200;
instance_destroy();