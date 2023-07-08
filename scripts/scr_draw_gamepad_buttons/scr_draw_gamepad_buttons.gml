function scr_draw_gamepad_buttons(what_button = gp_face1, xx, yy, overall_scale = 1, color = c_white, alpha = 1, xscale = 1, yscale = 1)
{
	if (global.chosen_controller_used == 0)
	&& (global.resource_pack_sprite_buttons_xboxone > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxone;
	}
	else
	if (global.chosen_controller_used == 1)
	&& (global.resource_pack_sprite_buttons_xboxseriesxs > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxseriesxs;
	}
	else
	if (global.chosen_controller_used = 2)
	&& (global.resource_pack_sprite_buttons_nintendoswitch > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_nintendoswitch;
	}
	else
	if (global.chosen_controller_used = 3)
	&& (global.resource_pack_sprite_buttons_playstation4 > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation4;
	}
	else
	if (global.chosen_controller_used = 4)
	&& (global.resource_pack_sprite_buttons_playstation5 > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation5;
	}
	else
	{
		var what_sprites_to_use = spr_noone;
	}
	
	if (what_button == noone)
	{
		draw_sprite_ext(spr_keyboard_keys_none, 0, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_face1)
	{
		draw_sprite_ext(what_sprites_to_use, 0, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_face2)
	{
		draw_sprite_ext(what_sprites_to_use, 1, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_face3)
	{
		draw_sprite_ext(what_sprites_to_use, 2, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_face4)
	{
		draw_sprite_ext(what_sprites_to_use, 3, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderl)
	{
		draw_sprite_ext(what_sprites_to_use, 4, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderlb)
	{
		draw_sprite_ext(what_sprites_to_use, 5, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderr)
	{
		draw_sprite_ext(what_sprites_to_use, 6, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderrb)
	{
		draw_sprite_ext(what_sprites_to_use, 7, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_select)
	{
		draw_sprite_ext(what_sprites_to_use, 8, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_start)
	{
		draw_sprite_ext(what_sprites_to_use, 9, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_stickl)
	{
		draw_sprite_ext(what_sprites_to_use, 10, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_stickr)
	{
		draw_sprite_ext(what_sprites_to_use, 11, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_padu)
	{
		draw_sprite_ext(what_sprites_to_use, 12, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_padd)
	{
		draw_sprite_ext(what_sprites_to_use, 13, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_padl)
	{
		draw_sprite_ext(what_sprites_to_use, 14, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = gp_padr)
	{
		draw_sprite_ext(what_sprites_to_use, 15, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyleft_left)
	{
		draw_sprite_ext(what_sprites_to_use, 16, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyleft_right)
	{
		draw_sprite_ext(what_sprites_to_use, 17, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyleft_down)
	{
		draw_sprite_ext(what_sprites_to_use, 18, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyleft_up)
	{
		draw_sprite_ext(what_sprites_to_use, 19, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyright_left)
	{
		draw_sprite_ext(what_sprites_to_use, 20, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyright_right)
	{
		draw_sprite_ext(what_sprites_to_use, 21, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyright_down)
	{
		draw_sprite_ext(what_sprites_to_use, 22, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
	else
	if (what_button = joystick_value.joyright_up)
	{
		draw_sprite_ext(what_sprites_to_use, 23, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
}