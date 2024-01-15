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
		draw_sprite_ext(spr_iris, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5, iris_xscale, iris_yscale, 0, c_black, 1);
		draw_rectangle_color(0, 0, room_width * 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 - iris_xscale * 128, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5 + iris_xscale * 128 - 1, 0, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
		draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5 + iris_yscale * 128, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
	}
}
#endregion /* Draw Iris Transitions END */

#region /* Draw Run Toggling */
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (show_run_toggle_for_player1 > 0)
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player1 --;
	show_run_toggle_for_player2 = 0;
	show_run_toggle_for_player3 = 0;
	show_run_toggle_for_player4 = 0;
	if (global.player_can_play[1])
	&& (!global.player_can_play[2])
	&& (!global.player_can_play[3])
	&& (!global.player_can_play[4])
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Always run"), global.default_text_size, c_white, c_black, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 1 always runs"), global.default_text_size, c_white, c_black, 1);
	}
	draw_sprite_ext(spr_checkbox, global.player_run_toggle[1], camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
}
if (show_run_toggle_for_player2 > 0)
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player1 = 0;
	show_run_toggle_for_player2 --;
	show_run_toggle_for_player3 = 0;
	show_run_toggle_for_player4 = 0;
	scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 2 always runs"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, global.player_run_toggle[2], camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
}
if (show_run_toggle_for_player3 > 0)
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player1 = 0;
	show_run_toggle_for_player2 = 0;
	show_run_toggle_for_player3 --;
	show_run_toggle_for_player4 = 0;
	scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 3 always runs"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, global.player_run_toggle[3], camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
}
if (show_run_toggle_for_player4 > 0)
&& (!instance_exists(obj_pause))
{
	show_run_toggle_for_player1 = 0;
	show_run_toggle_for_player2 = 0;
	show_run_toggle_for_player3 = 0;
	show_run_toggle_for_player4 --;
	scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 4 always runs"), global.default_text_size, c_white, c_black, 1);
	draw_sprite_ext(spr_checkbox, global.player_run_toggle[4], camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
}
#endregion /* Run Toggling END */

#region /* Show Drowning */

if (instance_exists(obj_water))
|| (instance_exists(obj_water_level))
{
	
	#region /* Show Drowning for Player 1 */
	if (player1 > 0)
	&& (instance_exists(player1))
	{
		if (player1.allow_drowning)
		&& (player1.drawn_frames_until_drowning <= player1.seconds_until_drowning* 60)
		{
			scr_draw_circular_bar(player1.x, player1.bbox_top - 56, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, scr_make_color_hsv_transition(player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
		}
	}
	#endregion /* Show Drowning for Player 1 END */
	
	#region /* Show Drowning for Player 2 */
	if (player2 > 0)
	&& (instance_exists(player2))
	{
		if (player2.allow_drowning)
		&& (player2.drawn_frames_until_drowning <= player2.seconds_until_drowning* 60)
		{
			scr_draw_circular_bar(player2.x, player2.bbox_top - 56, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, scr_make_color_hsv_transition(player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
		}
	}
	#endregion /* Show Drowning for Player 2 END */
	
	#region /* Show Drowning for Player 3 */
	if (player3 > 0)
	&& (instance_exists(player3))
	{
		if (player3.allow_drowning)
		&& (player3.drawn_frames_until_drowning <= player3.seconds_until_drowning* 60)
		{
			scr_draw_circular_bar(player3.x, player3.bbox_top - 56, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, scr_make_color_hsv_transition(player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
		}
	}
	#endregion /* Show Drowning for Player 3 END */
	
	#region /* Show Drowning for Player 4 */
	if (player4 > 0)
	&& (instance_exists(player4))
	{
		if (player4.allow_drowning)
		&& (player4.drawn_frames_until_drowning <= player4.seconds_until_drowning* 60)
		{
			scr_draw_circular_bar(player4.x, player4.bbox_top - 56, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, scr_make_color_hsv_transition(player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
		}
	}
	#endregion /* Show Drowning for Player 4 END */
	
}
#endregion /* Show Drowning END */

scr_draw_cursor_tongue(mouse_x, mouse_y, obj_camera.player1);