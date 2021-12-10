draw_self();

if (place_meeting(x, y, obj_player))
and (instance_nearest(x, y, obj_player).vspeed = 0)
and (can_navigate = false)
{
		
	#region /*Draw Enter Gallery Key*/
	if (gamepad_is_connected(0))
	{
		draw_sprite_ext(spr_xbox_buttons, 5, x, y-64, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_up, x, y-64, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /*Draw Enter Gallery Key END*/
		
}