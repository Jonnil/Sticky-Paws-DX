dir = +1;

if (instance_exists(obj_camera))
and (obj_camera.sprite_lives_icon > noone)
{
	sprite_index = obj_camera.sprite_lives_icon;
}
else
if (asset_get_type("spr_1up") == asset_sprite)
{
	sprite_index = spr_1up;
}
else
{
	if (asset_get_type("spr_heart") == asset_sprite)
	{
		sprite_index = spr_heart;
	}
	image_blend = c_lime;
}
allow_move = false;
effect_time = 0;
number_of_extra_lives = 1; /*Different extra lives pickups. 1-up, 2-up or 3-up*/
text_alpha = 0;