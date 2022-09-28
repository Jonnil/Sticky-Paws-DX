function scr_draw_gamepad_buttons(what_button, xx, yy, scale, color, alpha)
{
	if (global.chosen_controller_used = 0)
	and (global.resource_pack_sprite_buttons_xboxone > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxone;
	}
	else
	if (global.chosen_controller_used = 1)
	and (global.resource_pack_sprite_buttons_xboxseriesxs > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_xboxseriesxs;
	}
	else
	if (global.chosen_controller_used = 2)
	and (global.resource_pack_sprite_buttons_nintendoswitch > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_nintendoswitch;
	}
	else
	if (global.chosen_controller_used = 3)
	and (global.resource_pack_sprite_buttons_playstation4 > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation4;
	}
	else
	if (global.chosen_controller_used = 4)
	and (global.resource_pack_sprite_buttons_playstation5 > noone)
	{
		var what_sprites_to_use = global.resource_pack_sprite_buttons_playstation5;
	}
	else
	{
		var what_sprites_to_use = spr_noone;
	}
	
	if (what_button == noone)
	and (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_sprite_ext(spr_keyboard_keys_none, 0, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_face1)
	{
		draw_sprite_ext(what_sprites_to_use, 0, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_face2)
	{
		draw_sprite_ext(what_sprites_to_use, 1, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_face3)
	{
		draw_sprite_ext(what_sprites_to_use, 2, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_face4)
	{
		draw_sprite_ext(what_sprites_to_use, 3, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderl)
	{
		draw_sprite_ext(what_sprites_to_use, 4, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderlb)
	{
		draw_sprite_ext(what_sprites_to_use, 5, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderr)
	{
		draw_sprite_ext(what_sprites_to_use, 6, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_shoulderrb)
	{
		draw_sprite_ext(what_sprites_to_use, 7, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_select)
	{
		draw_sprite_ext(what_sprites_to_use, 8, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_start)
	{
		draw_sprite_ext(what_sprites_to_use, 9, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_stickl)
	{
		draw_sprite_ext(what_sprites_to_use, 10, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_stickr)
	{
		draw_sprite_ext(what_sprites_to_use, 11, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_padu)
	{
		draw_sprite_ext(what_sprites_to_use, 12, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_padd)
	{
		draw_sprite_ext(what_sprites_to_use, 13, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_padl)
	{
		draw_sprite_ext(what_sprites_to_use, 14, xx, yy, scale, scale, 0, color, alpha);
	}
	else
	if (what_button = gp_padr)
	{
		draw_sprite_ext(what_sprites_to_use, 15, xx, yy, scale, scale, 0, color, alpha);
	}
}