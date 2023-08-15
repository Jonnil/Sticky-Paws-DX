function scr_draw_gamepad_buttons(what_button = gp_face1, xx, yy, overall_scale = 1, color = c_white, alpha = 1, xscale = 1, yscale = 1, what_player)
{
	switch (global.chosen_controller_used) {
		case 0: var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxone; break;
		case 1: var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxseriesxs; break;
		case 2:
		if (os_type == os_switch)
		{
			if (switch_controller_joycon_left_connected(1))
			&& (switch_controller_joycon_right_connected(1))
			{
				var what_sprites_to_use = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
			}
			else
			{
				var what_sprites_to_use = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
			}
		}
		else
		{
			var what_sprites_to_use = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
		}
		break;
		case 3: var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation4; break;
		case 4: var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation5; break;
		default: var what_sprites_to_use = spr_noone; break;
	}
	
	var what_button_to_display = 0;
	
    switch (what_button) {
        case noone: what_sprites_to_use = spr_keyboard_keys_none; what_button_to_display = 0; break;
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
        case joystick_value.joyleft_left: what_button_to_display = 16; break;
        case joystick_value.joyleft_right: what_button_to_display = 17; break;
        case joystick_value.joyleft_down: what_button_to_display = 18; break;
        case joystick_value.joyleft_up: what_button_to_display = 19; break;
        case joystick_value.joyright_left: what_button_to_display = 20; break;
        case joystick_value.joyright_right: what_button_to_display = 21; break;
        case joystick_value.joyright_down: what_button_to_display = 22; break;
        case joystick_value.joyright_up: what_button_to_display = 23; break;
    }
	draw_sprite_ext(what_sprites_to_use, what_button_to_display, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
}