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
if (global.playergame > 0)
&& (y < room_height)
&& (y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (player == 1)
	{
		if (global.player_name[1] = "")
		{
			scr_draw_text_outlined(x, y - 64, "P1", global.default_text_size, c_black, global.player_color[1], 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player_name[1]), global.default_text_size, c_black, global.player_color[1], 1);
		}
	}
	if (player == 2)
	{
		if (global.player_name[2] = "")
		{
			scr_draw_text_outlined(x, y - 64, "P2", global.default_text_size, c_black, global.player_color[2], 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player_name[2]), global.default_text_size, c_black, global.player_color[2], 1);
		}
	}
	if (player == 3)
	{
		if (global.player_name[3] = "")
		{
			scr_draw_text_outlined(x, y - 64, "P3", global.default_text_size, c_black, global.player_color[3], 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player_name[3]), global.default_text_size, c_black, global.player_color[3], 1);
		}
	}
	if (player == 4)
	{
		if (global.player_name[4] = "")
		{
			scr_draw_text_outlined(x, y - 64, "P4", global.default_text_size, c_black, global.player_color[4], 1);
		}
		else
		{
			scr_draw_text_outlined(x, y - 64, string(global.player_name[4]), global.default_text_size, c_black, global.player_color[4], 1);
		}
	}
}
#endregion /* Display Player Number and Name END */