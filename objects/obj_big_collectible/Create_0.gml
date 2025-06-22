depth = +10;
sprite_index = global.resource_pack_sprite_big_collectible;
image_index = global.collectible_index;
image_speed = 0.25;
bounce_up = false;
delay = 0;
delay_time = 0;
mask_index = sprite_index;
follow_player = false;
effect_time = 0;

big_collectible = 0; /* Tell the player which big collectible they're activating */

collect_big_collectible = false;

alarm[0] = 1;