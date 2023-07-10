draw_sprite_ext(spr_artwork_collection, image_index, x, yy, 1, 1, 0, c_white, image_alpha);
if (instance_exists(obj_player))
&& (point_distance(x, y, obj_player.x, obj_player.y) < 64)
&& (instance_nearest(x, y, obj_player).vspeed == 0)
&& (instance_nearest(x, y, obj_player).can_move)
&& (instance_nearest(x, y, obj_player).intro_animation = "")
&& (can_navigate == false)
{
	
	#region /* Draw Enter Gallery Key */
	if (gamepad_is_connected(global.player1_slot))
	&& (global.controls_used_for_menu_navigation == "controller")
	|| (global.always_show_gamepad_buttons)
	{
		scr_draw_gamepad_buttons(gp_padu, x, y - 64, 0.5, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Draw Enter Gallery Key END */
	
}