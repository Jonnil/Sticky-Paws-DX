if (instance_exists(obj_player))
&& (instance_nearest(x, y, obj_player).intro_animation == "ending_chair")
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

var catlyn_playing = false;

for(var i = 1; i <= global.max_players; i += 1)
{
	if (global.character_for_player[i] == "catlyn" && global.player_can_play[i])
	{
		catlyn_playing = true;
		break; /* Exit the loop once the condition is met for any player */
	}
}

if (catlyn_playing)
{
	image_alpha = 0; /* If anyone is playing as Catlyn, make it invisible */
}
else
{
	image_alpha = 1;
}
