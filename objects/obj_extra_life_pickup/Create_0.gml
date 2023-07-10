dir = +1;

mask_index = spr_wall;

if (instance_exists(obj_camera))
&& (obj_camera.sprite_lives_icon > noone)
{
	sprite_index = obj_camera.sprite_lives_icon;
}
else
{
	sprite_index = spr_1up;
}
allow_move = false;
effect_time = 0;
number_of_extra_lives = 1; /* Different extra lives pickups. 1-up, 2-up or 3-up */
text_alpha = 0;
bounce_up = false;