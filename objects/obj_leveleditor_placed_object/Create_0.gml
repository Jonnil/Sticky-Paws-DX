drag_object = false;
dragged_from_original_place = false;
placed_for_the_first_time = false;
drag_xstart = x;
drag_ystart = y;
drag_release_timer = 0;
object = 0;
easy = 1;
normal = 1;
hard = 1;
delay = 0;
undo_value = 0;
sprite_basic_enemy = global.resource_pack_sprite_basic_enemy;
sprite_basic_enemy_blind = global.resource_pack_sprite_basic_enemy_blind;
sprite_enemy_bowlingball = global.resource_pack_sprite_enemy_bowlingball_walk;
sprite_enemy_bowlingball_blind = global.resource_pack_sprite_enemy_bowlingball_blind_walk;
sprite_big_stationary_enemy = global.resource_pack_sprite_big_stationary_enemy;
sprite_lives_icon = noone;
i = 0;

place_object_angle = false;

second_x = x;
second_y = y;

draw_yscale = 1;
draw_angle = 0;

depth = -110;
mask_index = spr_wall;

alarm[0] = 1;