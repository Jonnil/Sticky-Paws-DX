if (!instance_exists(obj_player))
&& (count > 49)
&& (last_player)
{
	if (iris_zoom == 0)
	{
		iris_xscale = lerp(iris_xscale, 1, 0.1);
		iris_yscale = lerp(iris_yscale, 1, 0.1);
	}
	else
	{
		iris_xscale = lerp(iris_xscale, 0, 0.1);
		iris_yscale = lerp(iris_yscale, 0, 0.1);
	}
	if (iris_xscale <= 1.1)
	{
		iris_zoom = 1;
	}
	if (instance_exists(obj_player_lose))
	{
		if (iris_xscale < 16)
		&& (global.enable_transitions)
		{
			draw_set_alpha(1);
			draw_sprite_ext(spr_iris_dead, image_index, xx, yy, iris_xscale, iris_yscale, image_angle, image_blend, image_alpha);
			draw_rectangle_color(0, 0, room_width * 3, yy - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, xx - iris_xscale * 128, room_height * 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(xx + iris_xscale * 128, 0, room_width * 3, room_height * 3, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, yy + iris_yscale * 128, room_width * 3, room_height * 3, c_black, c_black, c_black, c_black, false);
		}
	}
}
if (sprite_exists(sprite_index))
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * default_xscale, image_yscale * default_yscale, image_angle, image_blend, image_alpha);
}

#region /* Display Player Number and Name */
if (global.playergame >= 2)
&& (y < room_height)
&& (y < camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.player_name[player] = "")
	{
		var player_name_text = "P" + string(player);
	}
	else
	{
		var player_name_text = string(global.player_name[player]);
	}
	scr_draw_text_outlined(x, y - 64, string(player_name_text), global.default_text_size, c_black, global.player_color[player], 1);
}
#endregion /* Display Player Number and Name END */
