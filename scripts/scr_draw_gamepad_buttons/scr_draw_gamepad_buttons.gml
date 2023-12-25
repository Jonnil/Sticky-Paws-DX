function scr_draw_gamepad_buttons(what_button = gp_face1, xx, yy, overall_scale = 1, color = c_white, alpha = 1, xscale = 1, yscale = 1, what_player = global.player_slot[1])
{
	if (what_player == global.player_slot[2]) {
		var controller_used_player = 2;
	}
	else
	if (what_player == global.player_slot[3]) {
		var controller_used_player = 3;
	}
	else
	if (what_player == global.player_slot[4]) {
		var controller_used_player = 4;
	}
	else {
		var controller_used_player = 1;
	}
	
	switch (global.chosen_controller_used[controller_used_player]) {
		
		#region /* Autodetect what controller player is using */
		case 0:
		
		if (gamepad_get_description(controller_used_player - 1) == "PS4 Controller")
		{
			var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation4;
		}
		else
		if (gamepad_get_description(controller_used_player - 1) == "PS5 Controller")
		{
			var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation5;
		}
		else
		{
			var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxone;
		}
		
		break;
		#endregion /* Autodetect what controller player is using END */
		
		#region /* Force what controller player wants to use */
		case 1: var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxone; break;
		case 2: var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxseriesxs; break;
		case 3:
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
		case 4: var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation4; break;
		case 5: var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation5; break;
		#endregion /* Force what controller player wants to use END */
		
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
        case JOYSTICK_VALUE.JOYLEFT_LEFT: what_button_to_display = 16; break;
        case JOYSTICK_VALUE.JOYLEFT_RIGHT: what_button_to_display = 17; break;
        case JOYSTICK_VALUE.JOYLEFT_DOWN: what_button_to_display = 18; break;
        case JOYSTICK_VALUE.JOYLEFT_UP: what_button_to_display = 19; break;
        case JOYSTICK_VALUE.JOYRIGHT_LEFT: what_button_to_display = 20; break;
        case JOYSTICK_VALUE.JOYRIGHT_RIGHT: what_button_to_display = 21; break;
        case JOYSTICK_VALUE.JOYRIGHT_DOWN: what_button_to_display = 22; break;
        case JOYSTICK_VALUE.JOYRIGHT_UP: what_button_to_display = 23; break;
    }
	if (sprite_exists(what_sprites_to_use))
	{
		draw_sprite_ext(what_sprites_to_use, what_button_to_display, xx, yy, overall_scale * xscale, overall_scale * yscale, 0, color, alpha);
	}
}