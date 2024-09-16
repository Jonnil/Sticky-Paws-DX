if (instance_exists(obj_title))
&& (obj_title.key_up)
|| (instance_exists(obj_pause))
&& (obj_pause.key_up)
|| (instance_exists(obj_leveleditor))
&& (obj_leveleditor.key_up)
{
	key_up = true;
}
else
{
	key_up = false;
}
if (instance_exists(obj_title))
&& (obj_title.key_down)
|| (instance_exists(obj_pause))
&& (obj_pause.key_down)
|| (instance_exists(obj_leveleditor))
&& (obj_leveleditor.key_down)
{
	key_down = true;
}
else
{
	key_down = false;
}

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

#region /* Navigate menu up and down */
if (menu == "copy_to_clipboard")
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	if (key_up)
	|| (key_down)
	{
		menu_delay = 3;
		menu = "back_open_folder_text";
	}
}
else
if (menu == "back_open_folder_text")
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	if (key_up)
	|| (key_down)
	{
		if (show_copy_to_clipboard_button)
		{
			menu_delay = 3;
			menu = "copy_to_clipboard";
		}
	}
}
#endregion /* Navigate menu up and down END */

if (show_copy_to_clipboard_button)
&& (menu_delay == 0 && menu_joystick_delay == 0)
{
	if (instance_exists(obj_title))
	&& (obj_title.key_a_pressed)
	&& (menu == "copy_to_clipboard")
	|| (instance_exists(obj_pause))
	&& (obj_pause.key_a_pressed)
	&& (menu == "copy_to_clipboard")
	|| (instance_exists(obj_leveleditor))
	&& (obj_leveleditor.key_a_pressed)
	&& (menu == "copy_to_clipboard")
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 42 + 39))
	&& (global.controls_used_for_navigation == "mouse")
	&& (mouse_check_button_released(mb_left))
	|| (keyboard_check(vk_control))
	&& (keyboard_check_pressed(ord("C")))
	{
		menu_delay = 3;
		clipboard_set_text(string(open_folder_string));
		if (instance_exists(obj_score_up))
		{
			with(obj_score_up)
			{
				instance_destroy();
			}
		}
		show_copied_text = 60;
	}
}

#region /* Close the open folder text by pressing any close button */
if (keyboard_check_pressed(ord("X")))
|| (keyboard_check_pressed(vk_backspace))
|| (keyboard_check_pressed(vk_escape))
|| (mouse_check_button_released(mb_right))
|| (mouse_check_button_released(mb_side1))
|| (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
|| (gamepad_button_check(global.player_slot[2], global.player_[inp.gp][2][1][action.back]))
|| (gamepad_button_check(global.player_slot[3], global.player_[inp.gp][2][1][action.back]))
|| (gamepad_button_check(global.player_slot[4], global.player_[inp.gp][2][1][action.back]))

|| (menu == "back_open_folder_text")
&& (keyboard_check_pressed(ord("Z")))
|| (menu == "back_open_folder_text")
&& (keyboard_check_pressed(vk_space))
|| (menu == "back_open_folder_text")
&& (keyboard_check_pressed(vk_enter))
|| (menu == "back_open_folder_text")
&& (gamepad_button_check(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
|| (menu == "back_open_folder_text")
&& (gamepad_button_check(global.player_slot[2], global.player_[inp.gp][2][1][action.accept]))
|| (menu == "back_open_folder_text")
&& (gamepad_button_check(global.player_slot[3], global.player_[inp.gp][3][1][action.accept]))
|| (menu == "back_open_folder_text")
&& (gamepad_button_check(global.player_slot[4], global.player_[inp.gp][4][1][action.accept]))

|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 42 + 42, get_window_width * 0.5 - 185 + 370, get_window_height * 0.5 + 42 + 39 + 42))
&& (global.controls_used_for_navigation == "mouse")
&& (mouse_check_button_released(mb_left))
{
	if (menu_delay == 0 && menu_joystick_delay == 0)
	{
		menu_delay = 3;
		close = true;
	}
}
#endregion /* Close the open folder text by pressing any button END */

if (close)
{
	image_alpha = lerp(image_alpha, 0, 0.3);
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
else
{
	image_alpha = lerp(image_alpha, 1, 0.3);
}

#region /* Make it so you can't click on any other button when "open folder text" exists */
if (instance_exists(obj_title))
{
	obj_title.menu_delay = 3;
}
if (instance_exists(obj_pause))
{
	obj_pause.menu_delay = 3;
}
if (instance_exists(obj_leveleditor))
{
	obj_leveleditor.menu_delay = 3;
}
#endregion /* Make it so you can't click on any other button when "open folder text" exists END */

if (menu_delay > 0)
{
	menu_delay --;
}
if (menu_joystick_delay > 0)
{
	menu_joystick_delay --;
}

if (show_copied_text > 0)
{
	copied_text_size = lerp(copied_text_size, 2, 0.2);
	show_copied_text--;
}
else
{
	copied_text_size = lerp(copied_text_size, 0, 0.2);
}

scr_menu_navigation_with_joystick_delay();