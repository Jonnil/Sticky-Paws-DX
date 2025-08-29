scr_enemy_initialize_variables();

image_speed = 0.3;
image_xscale = -1;

can_turn_around_at_wall = false;
draw_angle = 0;

if (blind) {
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}
}
else
{
	if (global.resource_pack_sprite_enemy_bowlingball_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_walk;}else
	if (global.resource_pack_sprite_enemy_bowlingball_blind_walk > noone){sprite_index = global.resource_pack_sprite_enemy_bowlingball_blind_walk;}
}
