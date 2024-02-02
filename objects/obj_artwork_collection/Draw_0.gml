draw_sprite_ext(spr_artwork_collection, image_index, x, yy, 1, 1, 0, c_white, image_alpha);
if (instance_exists(obj_player))
&& (point_distance(x, y, obj_player.x, obj_player.y) < 64)
&& (instance_nearest(x, y, obj_player).vspeed == 0)
&& (instance_nearest(x, y, obj_player).can_move)
&& (instance_nearest(x, y, obj_player).intro_animation == "")
&& (!can_navigate)
{
	what_player_navigate = instance_nearest(x, y, obj_player).player;
	
	#region /* Draw Enter Gallery Key */
	if (global.controls_used_for_navigation == "gamepad")
	&& (gamepad_is_connected(global.player_slot[what_player_navigate - 1]))
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(gp_padu, x, y - 64, 0.5, c_white, 1, 1, 1, what_player_navigate);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Draw Enter Gallery Key END */
	
}