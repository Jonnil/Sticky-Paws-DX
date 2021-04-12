#region /*Show Enter Level Key*/
if (can_move = true)
and(can_enter_level >= 30)
and(asset_get_type("obj_level") == asset_object)
and(distance_to_object(instance_nearest(x, y, obj_level)) < 4)
and(speed = 0)
and(instance_nearest(x, y, obj_level).clear_rate != "closed")
and(global.pause = false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_outlined(80, window_get_height() - 28, "Enter Level", global.default_text_size, c_black, c_white, 1);
	if (gamepad_is_connected(0))
	and(asset_get_type("spr_xbox_buttons") == asset_sprite)
	{
		draw_sprite_ext(spr_xbox_buttons, 0, 180, window_get_height() - 28, 0.5, 0.5, 0, c_white, 1);
	}
	else
	if (asset_get_type("spr_keyboard_keys") == asset_sprite)
	{
		draw_sprite_ext(spr_keyboard_keys, global.player1_key_jump, 180, window_get_height() - 28, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /*Show Enter Level Key END*/