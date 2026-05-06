if (can_only_input_numbers)
{
	if (numeric_modify_confirmed)
	{
		quit_modify_object_menu = true;
		checkpoint_defeat_requirement = clamp(floor(checkpoint_defeat_requirement), 0, 99);
		modify_object_text = string(checkpoint_defeat_requirement);
		keyboard_string = modify_object_text;

		if (instance_exists(instance_nearest(x, y, obj_leveleditor_placed_object)))
		{
			instance_nearest(x, y, obj_leveleditor_placed_object).second_x = modify_object_text;
		}
	}
	else
	if (numeric_modify_cancelled)
	{
		quit_modify_object_menu = true;
	}
}
else
if (global.clicking_ok_input_screen)
{
	quit_modify_object_menu = true;

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

menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}

if (menu_delay > 0)
{
	menu_delay--;
}

scr_menu_navigation_with_joystick_delay();
