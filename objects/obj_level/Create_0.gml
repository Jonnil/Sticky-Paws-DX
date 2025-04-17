alarm[0] = 2;
alarm[1] = 4;
always_open = false; /* If a level should always be open or not */
direction_after_completion = 0; /* What direction the cake stealing enemy should run off */
for(var i = 1; i <= global.max_big_collectible; i += 1)
{
	big_collectible[i] = false;
}
checkpoint_millisecond = 0;
checkpoint_minute = 0;
checkpoint_realmillisecond = 0;
checkpoint_second = 0;
clear_rate = "closed";
cleared_with_debug = false;
enter_blink = 0;
image_speed = 0;
increase_number_of_levels_cleared = true;
level = 0;
level_color = c_black;
level_number = 0;
level_perfect = false;
level_score = 0;
lives_until_assist = 0;
number_of_clears = 0;
number_of_defeats = 0;
ring_color = c_yellow;
scale = 1;
time = 0;
timeattack_millisecond = 0;
timeattack_minute = 0;
timeattack_realmillisecond = 999999999;
timeattack_second = 0;
checkpoint_x = 0;
checkpoint_y = 0;
zero_defeats = 0;
depth = -2;