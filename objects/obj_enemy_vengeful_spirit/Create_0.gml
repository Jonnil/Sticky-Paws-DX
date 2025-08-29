scr_enemy_initialize_variables();

sprite_index = global.resource_pack_sprite_enemy_vengeful_spirit;
image_speed = 0.3;
image_xscale = -1;
gravity = 0;
depth = -900;
speed = 0;

xx = x;
yy = y;

can_be_attacked_by_stomp = false;
can_be_attacked_by_dive = false;
can_be_attacked_by_damage_invulnerability = false;
