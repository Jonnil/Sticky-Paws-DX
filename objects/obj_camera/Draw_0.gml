var fixed_player = 1;

#region /* Draw Iris Transitions */
if (global.enable_transitions)
&& (global.actually_play_edited_level)
{
	if (iris_xscale < 31)
	&& (instance_exists(obj_player))
	{
		draw_set_alpha(1);
		draw_sprite_ext(spr_iris, 0, instance_nearest(room_width, y, obj_player).x, instance_nearest(room_width, y, obj_player).y, iris_xscale, iris_yscale, 0, c_black, 1);
		draw_rectangle_color(0, 0, room_width * 2, instance_nearest(room_width, y, obj_player).y - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, instance_nearest(room_width, y, obj_player).x - iris_xscale * 128, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(instance_nearest(room_width, y, obj_player).x + iris_xscale * 128 - 1, 0, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, instance_nearest(room_width, y, obj_player).y + iris_yscale * 128, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
	}
	else
	if (iris_xscale < 15)
	{
		draw_set_alpha(1);
		draw_sprite_ext(spr_iris, 0, camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) * 0.5, camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)) * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
		draw_rectangle_color(0, 0, room_width * 2, camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)) * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) * 0.5 - iris_xscale * 128, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)) * 0.5 + iris_xscale * 128 - 1, 0, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)) * 0.5 + iris_yscale * 128, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /* Draw Iris Transitions END */

#region /* Draw Run Toggling */
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for(var i = 1; i <= global.max_players; i += 1)
{
	if (show_run_toggle_for_player[i] > 0)
	{
		for(var j = 1; j <= global.max_players; j += 1)
		{
			show_run_toggle_for_player[j] = (i == j) ? show_run_toggle_for_player[j] - 1 : 0;
		}

		var player_text = l10n_text("Player " + string(i) + " always runs");
		if (instance_number(obj_player) == 1)
		{
			player_text = l10n_text("Always run");
		}

		scr_draw_text_outlined(camera_get_view_x(view_get_camera(view_current)) + 200, camera_get_view_y(view_get_camera(view_current)) + 32, player_text, global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, global.player_run_toggle[i], camera_get_view_x(view_get_camera(view_current)) + 180, camera_get_view_y(view_get_camera(view_current)) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /* Run Toggling END */

#region /* Show Drowning For Player */
if (instance_exists(obj_water))
|| (instance_exists(obj_water_level))
{
	for(var i = 1; i <= global.max_players; i += 1)
	{
		if (player[i] > 0)
		&& (instance_exists(player[i]))
		{
			if (player[i].allow_drowning)
			&& (player[i].drawn_frames_until_drowning <= player[i].seconds_until_drowning * 60)
			{
				scr_draw_circular_bar(player[i].x, player[i].bbox_top - 56, player[i].drawn_frames_until_drowning, player[i].seconds_until_drowning * 60, scr_make_color_hsv_transition(player[i].drawn_frames_until_drowning, player[i].seconds_until_drowning * 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
			}
		}
	}
}
#endregion /* Show Drowning For Player END */

scr_draw_cursor_tongue(mouse_x, mouse_y, obj_camera.player[fixed_player]);
