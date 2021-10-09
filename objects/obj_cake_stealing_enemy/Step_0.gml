gravity = 0.5;
if (cutscene = 0)
{
	time += 1;
	if (time >= room_speed*4)
	{
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		hspeed = +7;
		image_xscale = +1;
	}
}
else
if (cutscene = 1)
{
	if (distance_to_object(obj_player) < 256)
	{
		time += 30;
	}
	if (time >= room_speed*0.25)
	{
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		hspeed = +12;
		image_xscale = +1;
	}
	if (position_meeting(x+32, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
}
else
if (cutscene = 2)
{
	time += 1;
	if (time >= room_speed*2)
	{
		sprite_index = global.resourcepack_sprite_basic_enemy_angry;
		hspeed = +7;
		image_xscale = +1;
	}
	if (position_meeting(x + 32, y, obj_wall))
	{
		sprite_index = global.resourcepack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
}