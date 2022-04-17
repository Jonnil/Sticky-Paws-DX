if (os_type = os_linux)
{
	var show_copy_to_clipboard_button = false;
	if (menu = "copy_to_clipboard")
	{
		menu = "back_open_folder_text";
	}
}
else
{
	var show_copy_to_clipboard_button = true;
}

draw_set_alpha(image_alpha * 0.99);
draw_rectangle_color(0, 0, window_get_width(), window_get_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_outlined(window_get_width() / 2, window_get_height() / 2,
string_replace_all(string(open_folder_string), "\\", "/"),
global.default_text_size, c_black, c_white, image_alpha);

if (close = false)
{
	if (show_copy_to_clipboard_button = true)
	{
		draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42, "Copy to Clipboard", "copy_to_clipboard", "copy_to_clipboard");
	}
	draw_menu_button(window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, "Back", "back_open_folder_text", "back_open_folder_text");
}

#region /*Navigate menu up and down*/
if (menu = "copy_to_clipboard")
{
	if (instance_exists(obj_title))
	and (obj_title.key_up)
	or (instance_exists(obj_pause))
	and (obj_pause.key_up)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_up)
	or (instance_exists(obj_title))
	and (obj_title.key_down)
	or (instance_exists(obj_pause))
	and (obj_pause.key_down)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_down)
	{
		menu = "back_open_folder_text";
	}
}
else
if (menu = "back_open_folder_text")
{
	if (instance_exists(obj_title))
	and (obj_title.key_up)
	or (instance_exists(obj_pause))
	and (obj_pause.key_up)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_up)
	or (instance_exists(obj_title))
	and (obj_title.key_down)
	or (instance_exists(obj_pause))
	and (obj_pause.key_down)
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_down)
	{
		if (show_copy_to_clipboard_button = true)
		{
			menu = "copy_to_clipboard";
		}
	}
}
#endregion /*Navigate menu up and down END*/

if (show_copy_to_clipboard_button = true)
{
	if (instance_exists(obj_title))
	and (obj_title.key_a_pressed)
	and (menu = "copy_to_clipboard")
	or (instance_exists(obj_pause))
	and (obj_pause.key_a_pressed)
	and (menu = "copy_to_clipboard")
	or (instance_exists(obj_leveleditor))
	and (obj_leveleditor.key_a_pressed)
	and (menu = "copy_to_clipboard")
	or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 42, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 42 + 39))
	and (global.controls_used_for_menu_navigation = "mouse")
	and (mouse_check_button_pressed(mb_left))
	or (keyboard_check(vk_control))
	and (keyboard_check_pressed(ord("C")))
	{
		clipboard_set_text(string(open_folder_string));
		if (instance_exists(obj_scoreup))
		{
			with(obj_scoreup)
			{
				instance_destroy();
			}
		}
		with(instance_create_depth(window_get_width() / 2, window_get_height() / 2 + 42, 0, obj_scoreup))
		{
			scoreup = "Copied";
		}
	}
}

#region /*Close the open folder text by pressing any close button*/
if (keyboard_check_pressed(ord("X")))
or (keyboard_check_pressed(vk_backspace))
or (keyboard_check_pressed(vk_escape))
or (mouse_check_button_pressed(mb_right))
or (mouse_check_button_pressed(mb_side1))
or (gamepad_button_check(0, gp_face2))
or (gamepad_button_check(1, gp_face2))
or (gamepad_button_check(2, gp_face2))
or (gamepad_button_check(3, gp_face2))

or (menu = "back_open_folder_text")
and (keyboard_check_pressed(ord("Z")))
or (menu = "back_open_folder_text")
and (keyboard_check_pressed(vk_space))
or (menu = "back_open_folder_text")
and (keyboard_check_pressed(vk_enter))
or (menu = "back_open_folder_text")
and (gamepad_button_check(0, gp_face1))
or (menu = "back_open_folder_text")
and (gamepad_button_check(1, gp_face1))
or (menu = "back_open_folder_text")
and (gamepad_button_check(2, gp_face1))
or (menu = "back_open_folder_text")
and (gamepad_button_check(3, gp_face1))

or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() / 2 - 185, window_get_height() / 2 + 42 + 42, window_get_width() / 2 - 185 + 370, window_get_height() / 2 + 42 + 39 + 42))
and (global.controls_used_for_menu_navigation = "mouse")
and (mouse_check_button_pressed(mb_left))
{
	close = true;
}
#endregion /*Close the open folder text by pressing any button END*/

if (close = true)
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

#region /*Make it so you can't click on any other button while open folder text exists*/
if (instance_exists(obj_title))
{
	obj_title.menu_delay = 10;
}
if (instance_exists(obj_pause))
{
	obj_pause.menu_delay = 10;
}
if (instance_exists(obj_leveleditor))
{
	obj_leveleditor.menu_delay = 10;
}
#endregion /*Make it so you can't click on any other button while open folder text exists END*/

#region /*Draw mouse cursor for menu navigation*/
if (global.controls_used_for_menu_navigation = "mouse")
and (global.full_level_map_screenshot = false)
and (global.pause = false)
and (os_type!= os_android)
and (os_type!= os_ios)
{
	draw_sprite_ext(spr_cursor, 0, window_mouse_get_x(), window_mouse_get_y(), 1, 1, 0, c_white, 1);
}
#endregion /*Draw mouse cursor for menu navigation END*/