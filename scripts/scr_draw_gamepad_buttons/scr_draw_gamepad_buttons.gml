function scr_draw_gamepad_buttons(what_button = gp_face1, xx, yy, overall_scale = 1, color = c_white, alpha = 1, xscale = 1, yscale = 1, what_player = 1)
{
	var what_button_to_display = 0;
	var what_sprite_to_use = global.what_controller_sprites_to_use[what_player];

	switch (what_button) {
		case noone: what_sprite_to_use = spr_keyboard_keys_none; what_button_to_display = 0; break;
		case gp_face1: what_button_to_display = 0; break;
		case gp_face2: what_button_to_display = 1; break;
		case gp_face3: what_button_to_display = 2; break;
		case gp_face4: what_button_to_display = 3; break;
		case gp_shoulderl: what_button_to_display = 4; break;
		case gp_shoulderlb: what_button_to_display = 5; break;
		case gp_shoulderr: what_button_to_display = 6; break;
		case gp_shoulderrb: what_button_to_display = 7; break;
		case gp_select: what_button_to_display = 8; break;
		case gp_start: what_button_to_display = 9; break;
		case gp_stickl: what_button_to_display = 10; break;
		case gp_stickr: what_button_to_display = 11; break;
		case gp_padu: what_button_to_display = 12; break;
		case gp_padd: what_button_to_display = 13; break;
		case gp_padl: what_button_to_display = 14; break;
		case gp_padr: what_button_to_display = 15; break;
		case JOYSTICK_VALUE.JOYLEFT_LEFT: what_button_to_display = 16; break;
		case JOYSTICK_VALUE.JOYLEFT_RIGHT: what_button_to_display = 17; break;
		case JOYSTICK_VALUE.JOYLEFT_DOWN: what_button_to_display = 18; break;
		case JOYSTICK_VALUE.JOYLEFT_UP: what_button_to_display = 19; break;
		case JOYSTICK_VALUE.JOYRIGHT_LEFT: what_button_to_display = 20; break;
		case JOYSTICK_VALUE.JOYRIGHT_RIGHT: what_button_to_display = 21; break;
		case JOYSTICK_VALUE.JOYRIGHT_DOWN: what_button_to_display = 22; break;
		case JOYSTICK_VALUE.JOYRIGHT_UP: what_button_to_display = 23; break;
	}
	if (sprite_exists(what_sprite_to_use))
	{
		draw_sprite_ext(what_sprite_to_use, what_button_to_display, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
}
