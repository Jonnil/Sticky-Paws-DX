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

if (global.character_for_player_1 = 1)
and (global.player1_can_play = true)
or (global.character_for_player_2 = 1)
and (global.player2_can_play = true)
or (global.character_for_player_3 = 1)
and (global.player3_can_play = true)
or (global.character_for_player_4 = 1)
and (global.player4_can_play = true)
{
	instance_destroy(); /*If anyone is playing as Catlyn, destroy this object*/
}