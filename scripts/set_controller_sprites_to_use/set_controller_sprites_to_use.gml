function set_controller_sprites_to_use() {
	/* This function should only play once in Create Event to prevent lag */
	
	#region /* Set what controllers players are using */
	for(var i = 1; i <= global.max_players; i += 1) {
		switch (global.chosen_controller_used[i]) {
			
			#region /* Autodetect what controller player is using */
			case 0:
			
			if (gamepad_get_description(i - 1) == "PS4 Controller")
			{
				global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_playstation4;
			}
			else
			if (gamepad_get_description(i - 1) == "PS5 Controller")
			{
				global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_playstation5;
			}
			else
			if (os_type == os_switch)
			{
				if (switch_controller_joycon_left_connected(i))
				&& (switch_controller_joycon_right_connected(i))
				{
					global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
				}
				else
				{
					global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_nintendoswitch_horizontal;
				}
			}
			else
			{
				global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_xboxone;
			}
			
			break;
			#endregion /* Autodetect what controller player is using END */
			
			#region /* Force what controller player wants to use */
			case 1: global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_xboxone; break;
			case 2: global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_xboxseriesxs; break;
			case 3:
			if (os_type == os_switch)
			{
				if (switch_controller_joycon_left_connected(i))
				&& (switch_controller_joycon_right_connected(i))
				{
					global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
				}
				else
				{
					global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_nintendoswitch_horizontal;
				}
			}
			else
			{
				global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_nintendoswitch_vertical;
			}
			break;
			case 4: global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_playstation4; break;
			case 5: global.what_controller_sprites_to_use[i] = global.resource_pack_sprite_buttons_playstation5; break;
			#endregion /* Force what controller player wants to use END */
			
			default: global.what_controller_sprites_to_use[i] = spr_noone; break;
		}
	}
	#endregion /* Set what controllers players are using END */
	
}