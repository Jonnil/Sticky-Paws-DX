if (global.clicking_ok_input_screen)
{
	quit_modify_object_menu = true;
	
	if (can_only_input_numbers)
	{
		var modify_object_text_numbers = modify_object_text;
		modify_object_text = string_digits(modify_object_text_numbers);
		keyboard_string = string_digits(modify_object_text_numbers);
	}
	
	/* Lastly, set the closest object you're editing to the message you were writing */
	if (instance_exists(instance_nearest(x, y, obj_leveleditor_placed_object)))
	{
		instance_nearest(x, y, obj_leveleditor_placed_object).second_x = string(keyboard_string);
	}
}
else
if (global.clicking_cancel_input_screen)
{
	quit_modify_object_menu = true;
	
	if (can_only_input_numbers)
	{
		var modify_object_text_numbers = modify_object_text;
		modify_object_text = string_digits(modify_object_text_numbers);
		keyboard_string = string_digits(modify_object_text_numbers);
	}
}

if (quit_modify_object_menu)
{
	if (instance_exists(obj_leveleditor))
	{
		obj_leveleditor.menu_delay = 5;
		obj_leveleditor.drag_object = false;
	}
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function()
	{
		if (instance_exists(obj_leveleditor))
		{
			obj_leveleditor.modify_object_menu = false;
			obj_leveleditor.menu_delay = 5;
			obj_leveleditor.drag_object = false;
		}
	}, [], 1);
	time_source_start(time_source);
	instance_destroy();
}

if (menu_delay > 0)
{
	menu_delay --;
}