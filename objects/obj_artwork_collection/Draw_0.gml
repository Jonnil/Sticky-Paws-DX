if (asset_get_type("spr_artwork_collection") == asset_sprite)
{
	draw_sprite_ext(spr_artwork_collection, image_index, x, yy, 1, 1, 0, c_white, image_alpha);
}
if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
and (point_distance(x, y, obj_player.x, obj_player.y) < 64)
and (instance_nearest(x, y, obj_player).vspeed = 0)
and (instance_nearest(x, y, obj_player).can_move = true)
and (instance_nearest(x, y, obj_player).intro_animation = "")
and (can_navigate = false)
{
	
	#region /* Draw Enter Gallery Key */
	if (gamepad_is_connected(0))
	and (global.controls_used_for_menu_navigation == "controller")
	{
		scr_draw_gamepad_buttons(gp_padu, x, y - 64, 0.5, c_white, 1);
	}
	else
	{
		draw_sprite_ext(spr_keyboard_keys, vk_up, x, y - 64, 0.5, 0.5, 0, c_white, 1);
	}
	#endregion /* Draw Enter Gallery Key END */
	
}