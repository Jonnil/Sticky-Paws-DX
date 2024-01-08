if layer_sequence_is_finished(seq)
{
	can_click = true;
	alarm_set(0, 60);
	layer_sequence_destroy(seq);
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
	instance_destroy();
}