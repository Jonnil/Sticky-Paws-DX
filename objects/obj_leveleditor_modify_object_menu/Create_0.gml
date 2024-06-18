modify_object_text = "";
modify_object_description = "";
can_only_input_numbers = false;
menu = "ok";
menu_delay = 3;
menu_joystick_delay = 0;
open_dropdown = false;
menu_cursor_index = 0;
quit_modify_object_menu = false;
if (instance_exists(obj_leveleditor_placed_object))
{
	keyboard_string = string(instance_nearest(x, y, obj_leveleditor_placed_object).second_x);
}
if (instance_exists(obj_leveleditor))
{
	obj_leveleditor.modify_object_menu = true;
	obj_leveleditor.welcome_to_level_editor = 0;
}
modify_object_text = keyboard_string;