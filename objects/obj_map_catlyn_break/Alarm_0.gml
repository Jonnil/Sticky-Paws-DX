if (floor(random(99)) == 0)
&& (can_click)
{
	can_click = false;
	seq = layer_sequence_create(layer_create(399), x, y, seq_catlyn_break);
}
else
{
	alarm_set(0, 60);
}
