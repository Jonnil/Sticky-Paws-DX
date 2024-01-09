if (distance_to_object(obj_player) < 32)
&& (distance_to_object(obj_textbox) > distance_to_object(obj_player))
{
	textbox_alpha = lerp(textbox_alpha, 1, 0.3);
}
else
{
	textbox_alpha = lerp(textbox_alpha, 0, 0.3);
}