#region /* Black screen when starting level */
if (save_level_as_png = false)
and (allow_iris == true)
and (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
and (delay <= 1)
and (global.actually_play_edited_level == true)
{
	/* Makes the screen black when starting a level so you don't see the level loading in. Also make sure this black rectangle is bigger than the level, in case the level is smaller than the view size */
	draw_rectangle_color(0, 0, room_width * 3, room_height * 3, c_black, c_black, c_black, c_black, false);
}
#endregion /* Black screen when starting level END */

#region /* Draw Iris Transitions */
if (asset_get_type("obj_player_map") == asset_object)
and (!instance_exists(obj_player_map))
{
	if (global.enable_transitions == true)
	and (global.play_edited_level == false)
	and (global.actually_play_edited_level == false)
	or (global.enable_transitions == true)
	and (global.play_edited_level == true)
	and (global.actually_play_edited_level == true)
	{
		if (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		and (asset_get_type("obj_title") == asset_object)
		and (!instance_exists(obj_title))
		and (iris_xscale < 31)
		{
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, 0, instance_nearest(room_width, y, obj_player).x, instance_nearest(room_width, y, obj_player).y, iris_xscale, iris_yscale, 0, c_black, 1);
			}
			draw_rectangle_color(0, 0, room_width, instance_nearest(room_width, y, obj_player).y - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, instance_nearest(room_width, y, obj_player).x - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(instance_nearest(room_width, y, obj_player).x + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, instance_nearest(room_width, y, obj_player).y + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
		}
		else
		if (iris_xscale < 15)
		{
			if (asset_get_type("spr_iris") == asset_sprite)
			{
				draw_sprite_ext(spr_iris, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2, iris_xscale, iris_yscale, 0, c_black, 1);
			}
			draw_rectangle_color(0, 0, room_width, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 - iris_yscale * 128, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, 0, camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 - iris_xscale * 128, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) / 2 + iris_xscale * 128 - 1, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
			draw_rectangle_color(0, camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) / 2 + iris_yscale * 128, room_width, room_height, c_black, c_black, c_black, c_black, false);
		}
	}
}
#endregion /* Draw Iris Transitions END */

#region /* Sprint Toggling */
key_player1_sprint_toggle_pressed = scr_key_initialize(key_player1_sprint_toggle_pressed, 1, 1, global.player1_key_sprint_toggle, global.player1_key2_sprint_toggle, global.player1_gamepad_button_sprint_toggle, global.player1_gamepad_button2_sprint_toggle);
key_player2_sprint_toggle_pressed = scr_key_initialize(key_player2_sprint_toggle_pressed, 1, 2, global.player2_key_sprint_toggle, global.player2_key2_sprint_toggle, global.player2_gamepad_button_sprint_toggle, global.player2_gamepad_button2_sprint_toggle);
key_player3_sprint_toggle_pressed = scr_key_initialize(key_player3_sprint_toggle_pressed, 1, 3, global.player3_key_sprint_toggle, global.player3_key2_sprint_toggle, global.player3_gamepad_button_sprint_toggle, global.player3_gamepad_button2_sprint_toggle);
key_player4_sprint_toggle_pressed = scr_key_initialize(key_player4_sprint_toggle_pressed, 1, 4, global.player4_key_sprint_toggle, global.player4_key2_sprint_toggle, global.player4_gamepad_button_sprint_toggle, global.player4_gamepad_button2_sprint_toggle);

if (key_player1_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 100;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_sprint_toggle = false)
	{
		global.player1_sprint_toggle = true;
	}
	else
	{
		global.player1_sprint_toggle = false;
	}
}
if (key_player2_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 100;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle = false)
	{
		global.player2_sprint_toggle = true;
	}
	else
	{
		global.player2_sprint_toggle = false;
	}
}
if (key_player3_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 100;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle = false)
	{
		global.player3_sprint_toggle = true;
	}
	else
	{
		global.player3_sprint_toggle = false;
	}
}
if (key_player4_sprint_toggle_pressed)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 100;
	if (global.player4_sprint_toggle = false)
	{
		global.player4_sprint_toggle = true;
	}
	else
	{
		global.player4_sprint_toggle = false;
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (show_sprint_toggle_for_player1 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 -= 1;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player1_can_play == true)
	and (global.player2_can_play = false)
	and (global.player3_can_play = false)
	and (global.player4_can_play = false)
	{
		if (global.player1_sprint_toggle == true)
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
	}
	else
	{
		if (global.player1_sprint_toggle == true)
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 1 always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
		else
		{
			scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 232, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 1 always run"), global.default_text_size, c_white, c_black, 1);
			draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
		}
	}
}
if (show_sprint_toggle_for_player2 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 -= 1;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 = 0;
	if (global.player2_sprint_toggle == true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 2 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 2 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
if (show_sprint_toggle_for_player3 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 -= 1;
	show_sprint_toggle_for_player4 = 0;
	if (global.player3_sprint_toggle == true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 3 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 3 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
if (show_sprint_toggle_for_player4 > 0)
and (asset_get_type("obj_title") == asset_object)
and (!instance_exists(obj_title))
and (asset_get_type("obj_pause") == asset_object)
and (!instance_exists(obj_pause))
{
	show_sprint_toggle_for_player1 = 0;
	show_sprint_toggle_for_player2 = 0;
	show_sprint_toggle_for_player3 = 0;
	show_sprint_toggle_for_player4 -= 1;
	if (global.player4_sprint_toggle == true)
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 4 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, true, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
	else
	{
		scr_draw_text_outlined(camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, l10n_text("Player 4 always run"), global.default_text_size, c_white, c_black, 1);
		draw_sprite_ext(spr_checkbox, false, camera_get_view_x(view_camera[view_current]) + 200, camera_get_view_y(view_camera[view_current]) + 32, 0.5, 0.5, 0, c_white, 1);
	}
}
#endregion /* Sprint Toggling END */

#region /* Show Drowning */

#region /* Show Drowning for Player 1 */
if (player1 > 0)
and (instance_exists(player1))
{
	if (player1.allow_drowning == true)
	&& (player1.drawn_frames_until_drowning <= player1.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player1.x + 2, player1.bbox_top - 54, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player1.x, player1.bbox_top - 56, player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, scr_make_color_hsv_transition(player1.drawn_frames_until_drowning, player1.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 1 END */

#region /* Show Drowning for Player 2 */
if (player2 > 0)
and (instance_exists(player2))
{
	if (player2.allow_drowning == true)
	&& (player2.drawn_frames_until_drowning <= player2.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player2.x + 2, player2.bbox_top - 54, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player2.x, player2.bbox_top - 56, player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, scr_make_color_hsv_transition(player2.drawn_frames_until_drowning, player2.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 2 END */

#region /* Show Drowning for Player 3 */
if (player3 > 0)
and (instance_exists(player3))
{
	if (player3.allow_drowning == true)
	&& (player3.drawn_frames_until_drowning <= player3.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player3.x + 2, player3.bbox_top - 54, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player3.x, player3.bbox_top - 56, player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, scr_make_color_hsv_transition(player3.drawn_frames_until_drowning, player3.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 3 END */

#region /* Show Drowning for Player 4 */
if (player4 > 0)
and (instance_exists(player4))
{
	if (player4.allow_drowning == true)
	&& (player4.drawn_frames_until_drowning <= player4.seconds_until_drowning* 60)
	{
		scr_draw_circular_bar(player4.x + 2, player4.bbox_top - 54, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, c_black, 20, 0.8, 6);
		scr_draw_circular_bar(player4.x, player4.bbox_top - 56, player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, scr_make_color_hsv_transition(player4.drawn_frames_until_drowning, player4.seconds_until_drowning* 60, 0, 100, 255, 255, 255, 255), 20, 1, 6);
	}
}
#endregion /* Show Drowning for Player 4 END */

#endregion /* Show Drowning END */

scr_draw_cursor_tongue(mouse_x, mouse_y, obj_camera.player1);