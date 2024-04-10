if (switch_check_profanity(textbox_text))
{
	textbox_text_masked = switch_mask_profanity(textbox_text);
}
else
{
	textbox_text_masked = textbox_text;
}