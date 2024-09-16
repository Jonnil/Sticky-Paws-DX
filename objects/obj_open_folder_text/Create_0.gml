depth = -15000;
open_folder_string = "";
image_alpha = 0;
close = false;
menu = "copy_to_clipboard";
menu_cursor_index = 0;
menu_delay = 3;
menu_joystick_delay = 3;
open_dropdown = false;
show_copied_text = false;
copied_text_size = 0;

if (os_type == os_linux)
{
	show_copy_to_clipboard_button = false;
	if (menu == "copy_to_clipboard")
	{
		menu = "back_open_folder_text";
	}
}
else
{
	show_copy_to_clipboard_button = true;
}

key_up = false;
key_down = false;
key_left = false;
key_right = false;