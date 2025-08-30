/// @description Breaking cardboard
var view_camera_current = view_get_camera(view_current);
var view_left = camera_get_view_x(view_camera_current);
var view_right = view_left + camera_get_view_width(view_camera_current);
var view_top = camera_get_view_y(view_camera_current);
var view_bottom = view_top + camera_get_view_height(view_camera_current);

instance_create_depth(x, y - 32, 0, obj_block_break);
score += 50;
var break_cardboard_direction = random_range(103, 167);
if (break_cardboard_source_x < x)
{
	break_cardboard_direction = random_range(13, 77);
}
var new_instance = instance_create_depth(x, y, 0, obj_cardboard_particle);
new_instance.sprite_index = sprite_index;
new_instance.direction = break_cardboard_direction;
new_instance.speed = random_range(5, 10) + instance_nearest(x, y, obj_cardboard).break_cardboard_source_speed * 0.5;
if (x < view_right && x > view_left && y < view_bottom && y > view_top)
{
	effect_create_above(ef_smoke, x, y, 1, c_dkgray);
	scr_audio_play(snd_blockbreak, volume_source.sound);
}
with (obj_camera)
{
	hud_show_score_timer = global.hud_hide_time * 60;
}
if (instance_exists(obj_player))
{
	scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.4, 10);
}
instance_destroy();
