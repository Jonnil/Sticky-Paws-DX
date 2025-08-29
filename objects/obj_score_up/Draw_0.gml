if (!above_gui)
{
	draw_set_halign(fa_center);
	if (!show_remaining_jumps)
	&& (score_up == "1-up"
	|| score_up == "2-up"
	|| score_up == "3-up")
	{
		scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
	}
	else
	if (score_up == "checkpoint")
	&& (!show_remaining_jumps)
	{
		if (checkpoint_number >= checkpoint_max_number)
		&& (checkpoint_max_number >= 2)
		{
			scr_draw_text_outlined(x, y - 62, string(checkpoint_number) + "/" + string(checkpoint_max_number) + " " + string_upper(l10n_text("Final")), global.default_text_size * image_xscale, c_black, c_lime, image_alpha);
		}
		else
		if (checkpoint_max_number >= 2)
		{
			scr_draw_text_outlined(x, y - 62, string(checkpoint_number) + "/" + string(checkpoint_max_number), global.default_text_size * image_xscale, c_black, c_lime, image_alpha);
		}
		scr_draw_text_outlined(x, y - 20, string_upper(l10n_text("Checkpoint")), global.default_text_size * 2 * image_xscale, c_black, c_lime, image_alpha);
	}
	else
	if (!show_remaining_jumps)
	&& (score_up != "Copied")
	{
		if (!not_score)
		{
			if (instance_exists(obj_camera))
			{
				obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
			}
		}
		scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * image_xscale, c_white, c_black, image_alpha);
	}
	if (show_remaining_jumps)
	{
		scr_draw_text_outlined(x, y, string_upper(score_up), global.default_text_size * image_xscale, c_gray, c_white, image_alpha);
	}
}
