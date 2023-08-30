if (instance_exists(obj_player))
&& (instance_nearest(x, y, obj_player).intro_animation = "ending_chair")
{
	image_speed = 0.2;
	if (image_index >= 7)
	{
		image_index = 7;
		image_speed = 0;
	}
}
else
if (instance_exists(obj_player))
&& (distance_to_object(obj_player) < 500)
{
	image_speed = 0.2;
	if (image_index >= 3)
	{
		image_index = 3;
		image_speed = 0;
	}
}
else
if (image_index >= 2)
&& (image_index <= 3)
{
	image_index = 3;
	image_speed = 0;
}

if (global.character_for_player[1] = "catlyn")
&& (global.player_can_play[1])
|| (global.character_for_player[2] = "catlyn")
&& (global.player_can_play[2])
|| (global.character_for_player[3] = "catlyn")
&& (global.player_can_play[3])
|| (global.character_for_player[4] = "catlyn")
&& (global.player_can_play[4])
{
	image_alpha = 0; /* If anyone is playing as Catlyn, make it invisible */
}
else
{
	image_alpha = 1;
}