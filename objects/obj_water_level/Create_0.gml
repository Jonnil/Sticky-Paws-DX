water_level_change_speed = 0;
water_bob_distance = 1.5;
water_bob_speed = 5;

depth = -50;
image_alpha = 0.5;

if (asset_get_type("obj_level_height") == asset_object)
and (instance_exists(obj_level_height))
{
	water_level_change_new_y = obj_level_height.y + 128;
	water_level_change_new_y_lerp = obj_level_height.y + 128;
	y = obj_level_height.y + 128;
}
else
{
	water_level_change_new_y = room_height + 128;
	water_level_change_new_y_lerp = room_height + 128;
	y = room_height + 128;
}

second_x = x+16;
second_y = y+16;