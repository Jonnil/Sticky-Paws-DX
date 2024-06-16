if (sprite_index == spr_sign_run)
&& (global.player_double_tap_to_run[what_player])
{
	sprite_index = spr_sign_double_tap_run;
	image_index = 0;
	image_speed = 0.02;
}
else
if (sprite_index == spr_sign_reset)
{
	sprite_index = sprite_sign;
	image_index = 0;
	image_speed = 0.02;
}
else
{
	sprite_index = spr_sign_reset;
	image_index = 0;
	image_speed = 0.5;
}