if (layer_sequence_is_finished(seq))
{
	can_click = true;
	alarm_set(0, 60);
	layer_sequence_destroy(seq);
}
for (var i = 1; i <= global.max_players; i += 1)
{
	if (global.character_for_player[i] == "catlyn" && global.player_can_play[i])
	{
		instance_destroy();
		break; /* Exit the loop once the condition is met for any player */
	}
}