scr_enemy_initialize_variables();

scr_audio_play(snd_arrow, volume_source.sound);
image_speed = 0.3;
mask_index = spr_wall;

blind = true;
can_turn_around_at_wall = false;
draw_xscale = 0;
enemyvoice_defeated1 = noone;
enemyvoice_defeated2 = noone;
enemyvoice_defeated3 = noone;

if (instance_exists(obj_player))
{
	move_towards_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, 8);
	image_angle = point_direction(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y);
}
