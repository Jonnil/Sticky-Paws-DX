scr_zoom_camera_draw_gui(10);

if (global.convention_mode = true)
and (!instance_exists(obj_title))
{
	reset_game_if_no_interactivity += 1;
	reset_game_if_no_interactivity_second_countdown_timer += 1;
	if (reset_game_if_no_interactivity_second_countdown_timer >= 60)
	{
		reset_game_if_no_interactivity_second_countdown_timer = 0;
		reset_game_if_no_interactivity_second_countdown -= 1;
	}
	if (reset_game_if_no_interactivity >= 3600)
	{
		game_restart();
	}
}
var mouse_x_position = window_mouse_get_x(); /* Update x position of fake mouse */
var mouse_y_position = window_mouse_get_y(); /* Update y position of fake mouse */
var mouse_moving = point_distance(mouse_x_position, mouse_y_position, window_mouse_get_x(), window_mouse_get_y()); /* Get distance from fake mouse to real mouse */

if (keyboard_check(vk_anykey))
or (mouse_check_button(mb_any))
or (mouse_wheel_down())
or (mouse_wheel_up())
or (instance_exists(obj_camera))
and (mouse_moving)

or (gamepad_button_check(0, gp_face1))
or (gamepad_button_check(0, gp_face2))
or (gamepad_button_check(0, gp_face3))
or (gamepad_button_check(0, gp_face4))
or (gamepad_button_check(0, gp_padd))
or (gamepad_button_check(0, gp_padl))
or (gamepad_button_check(0, gp_padr))
or (gamepad_button_check(0, gp_padu))
or (gamepad_button_check(0, gp_select))
or (gamepad_button_check(0, gp_shoulderl))
or (gamepad_button_check(0, gp_shoulderlb))
or (gamepad_button_check(0, gp_shoulderr))
or (gamepad_button_check(0, gp_shoulderrb))
or (gamepad_button_check(0, gp_start))
or (gamepad_button_check(0, gp_stickl))
or (gamepad_button_check(0, gp_stickr))
or (gamepad_axis_value(0, gp_axislh) <> 0)
or (gamepad_axis_value(0, gp_axislv) <> 0)
or (gamepad_axis_value(0, gp_axisrh) <> 0)
or (gamepad_axis_value(0, gp_axisrv) <> 0)

or (gamepad_button_check(1, gp_face1))
or (gamepad_button_check(1, gp_face2))
or (gamepad_button_check(1, gp_face3))
or (gamepad_button_check(1, gp_face4))
or (gamepad_button_check(1, gp_padd))
or (gamepad_button_check(1, gp_padl))
or (gamepad_button_check(1, gp_padr))
or (gamepad_button_check(1, gp_padu))
or (gamepad_button_check(1, gp_select))
or (gamepad_button_check(1, gp_shoulderl))
or (gamepad_button_check(1, gp_shoulderlb))
or (gamepad_button_check(1, gp_shoulderr))
or (gamepad_button_check(1, gp_shoulderrb))
or (gamepad_button_check(1, gp_start))
or (gamepad_button_check(1, gp_stickl))
or (gamepad_button_check(1, gp_stickr))
or (gamepad_axis_value(1, gp_axislh) <> 0)
or (gamepad_axis_value(1, gp_axislv) <> 0)
or (gamepad_axis_value(1, gp_axisrh) <> 0)
or (gamepad_axis_value(1, gp_axisrv) <> 0)

or (gamepad_button_check(2, gp_face1))
or (gamepad_button_check(2, gp_face2))
or (gamepad_button_check(2, gp_face3))
or (gamepad_button_check(2, gp_face4))
or (gamepad_button_check(2, gp_padd))
or (gamepad_button_check(2, gp_padl))
or (gamepad_button_check(2, gp_padr))
or (gamepad_button_check(2, gp_padu))
or (gamepad_button_check(2, gp_select))
or (gamepad_button_check(2, gp_shoulderl))
or (gamepad_button_check(2, gp_shoulderlb))
or (gamepad_button_check(2, gp_shoulderr))
or (gamepad_button_check(2, gp_shoulderrb))
or (gamepad_button_check(2, gp_start))
or (gamepad_button_check(2, gp_stickl))
or (gamepad_button_check(2, gp_stickr))
or (gamepad_axis_value(2, gp_axislh) <> 0)
or (gamepad_axis_value(2, gp_axislv) <> 0)
or (gamepad_axis_value(2, gp_axisrh) <> 0)
or (gamepad_axis_value(2, gp_axisrv) <> 0)

or (gamepad_button_check(3, gp_face1))
or (gamepad_button_check(3, gp_face2))
or (gamepad_button_check(3, gp_face3))
or (gamepad_button_check(3, gp_face4))
or (gamepad_button_check(3, gp_padd))
or (gamepad_button_check(3, gp_padl))
or (gamepad_button_check(3, gp_padr))
or (gamepad_button_check(3, gp_padu))
or (gamepad_button_check(3, gp_select))
or (gamepad_button_check(3, gp_shoulderl))
or (gamepad_button_check(3, gp_shoulderlb))
or (gamepad_button_check(3, gp_shoulderr))
or (gamepad_button_check(3, gp_shoulderrb))
or (gamepad_button_check(3, gp_start))
or (gamepad_button_check(3, gp_stickl))
or (gamepad_button_check(3, gp_stickr))
or (gamepad_axis_value(3, gp_axislh) <> 0)
or (gamepad_axis_value(3, gp_axislv) <> 0)
or (gamepad_axis_value(3, gp_axisrh) <> 0)
or (gamepad_axis_value(3, gp_axisrv) <> 0)
{
	reset_game_if_no_interactivity = 0;
	reset_game_if_no_interactivity_second_countdown_timer = 0;
	reset_game_if_no_interactivity_second_countdown = 60;
}
if (global.convention_mode = true)
and (!instance_exists(obj_title))
and (reset_game_if_no_interactivity_second_countdown <= 30)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (reset_game_if_no_interactivity_second_countdown >= 2)
	{
		scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("seconds"), global.default_text_size * 2, c_black, c_red, 1);
	}
	else
	{
		scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2, l10n_text("Game will restart in") + " " + string(reset_game_if_no_interactivity_second_countdown) + " " + l10n_text("second"), global.default_text_size * 2, c_black, c_red, 1);
	}
	scr_draw_text_outlined(display_get_gui_width() / 2, display_get_gui_height() / 2 + 42, l10n_text("Start moving to continue playing"), global.default_text_size, c_black, c_red, 1);
}