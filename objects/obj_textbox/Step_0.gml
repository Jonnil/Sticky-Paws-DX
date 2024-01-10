if (distance_to_object(obj_player) < 32)
&& (distance_to_object(obj_textbox) > distance_to_object(obj_player))
{
	textbox_alpha = lerp(textbox_alpha, 1, 0.3);
}
else
{
	textbox_alpha = lerp(textbox_alpha, 0, 0.3);
}

if (string(textbox_text) == "")
&& (!global.actually_play_edited_level)
{
	textbox_text = l10n_text("This is a sign. Click on it in the editor to edit text!");
}