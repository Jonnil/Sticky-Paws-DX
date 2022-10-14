draw_set_halign(fa_center);
if (score_up == "1-up")
and (show_remaining_jumps == false)
or (score_up == "2-up")
and (show_remaining_jumps == false)
or (score_up == "3-up")
and (show_remaining_jumps == false)
{
	scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
}
else
if (score_up == "checkpoint")
and (show_remaining_jumps == false)
{
	scr_draw_text_outlined(x, y, string_upper(l10n_text("Checkpoint")), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
}
else
if (score_up == "last checkpoint")
and (show_remaining_jumps == false)
{
	scr_draw_text_outlined(x, y, string_upper(l10n_text("Last Checkpoint")), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
}
else
if (show_remaining_jumps == false)
{
	if (not_score == false)
	{
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
	}
	scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * image_xscale, c_white, c_black, image_alpha);
}

if (show_remaining_jumps == true)
{
	scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * image_xscale, c_gray, c_white, image_alpha);
}