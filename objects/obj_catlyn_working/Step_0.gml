if (instance_exists(obj_player))
and (instance_nearest(x, y, obj_player).intro_animation = "ending_chair")
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
and (distance_to_object(obj_player) < 500)
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
and (image_index <= 3)
{
	image_index = 3;
	image_speed = 0;
}

if (global.character_for_player_1 = "Catlyn")
and (global.player1_can_play = true)
or(global.character_for_player_2 = "Catlyn")
and (global.player2_can_play = true)
or(global.character_for_player_3 = "Catlyn")
and (global.player3_can_play = true)
or(global.character_for_player_4 = "Catlyn")
and (global.player4_can_play = true)
{
	image_alpha = 0; /* if anyone is playing as Catlyn, make it invisible*/
}
else
{
	image_alpha = 1;
}