if (instance_exists(obj_player_map))
&& (obj_player_map.speed > 0)
&& (distance_to_object(obj_player_map) < 300)
&& (move_speed == 4)
{
	sprite_index = global.resource_pack_sprite_basic_enemy_angry;
	move_speed = 8; /* Move faster than player if the player is chasing */
	speed = move_speed;
}
if (hspeed < -1)
{
	image_xscale = -1;
}
else
if (hspeed > +1)
{
	image_xscale = +1;
}
if (enter_level_delay >= 1)
{
	enter_level_delay ++;
}
if (move_speed == 4)
&& (enter_level_delay >= 30)
|| (enter_level_delay >= 2)
{
	gravity_direction = 270;
	gravity = 0.8;
}
if (move_speed == 4)
&& (enter_level_delay == 30)
|| (enter_level_delay == 2)
{
	scr_audio_play(snd_jump);
	vspeed -= 10;
}
if (move_speed == 4)
&& (enter_level_delay > 50)
|| (enter_level_delay > 22)
{
	if (yy > enter_level_y)
	{
		if (instance_exists(obj_level))
		{
			instance_nearest(x, y, obj_level).scale = 1.5;
		}
		scr_audio_play(snd_blockbreak);
		instance_destroy();
	}
}
if (delay > 0)
{
	delay --;
}
xx = lerp(xx, x, 0.2);
yy = lerp(yy, y, 0.2);

if (move_speed == 4) {
	delay_amount = 10;
}
else {
	delay_amount = 5;
}