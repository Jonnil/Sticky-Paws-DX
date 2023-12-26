#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (global.controls_used_for_navigation == "keyboard")
|| (global.controls_used_for_navigation == "gamepad")
{
	menu = "";
}

var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

if (keyboard_check_pressed(global.player_[inp.key][1][1][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][1][2][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][2][1][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][2][2][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][3][1][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][3][2][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][4][1][action.back]))
|| (keyboard_check_pressed(global.player_[inp.key][4][2][action.back]))
|| (keyboard_check_pressed(vk_escape))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][1][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][1][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[2], global.player_[inp.gp][2][2][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[3], global.player_[inp.gp][3][2][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[4], global.player_[inp.gp][4][2][action.back]))
|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 370, get_window_height - 42, get_window_width, get_window_height))
&& (mouse_check_button_released(mb_left))
{
	if (instance_exists(obj_player))
	{
		obj_player.can_move = true;
	}
	can_navigate = false;
}