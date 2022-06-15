function scr_menu_navigation_with_joystick_delay()
{
	
	#region /*Menu navigation with joystick (This code must come after all menu navigation code)*/
	if (gamepad_axis_value(0, gp_axislv) < 0)
	or(gamepad_axis_value(0, gp_axislv) > 0)
	or(gamepad_axis_value(0, gp_axislh) < 0)
	or(gamepad_axis_value(0, gp_axislh) > 0)
	or(gamepad_axis_value(1, gp_axislv) < 0)
	or(gamepad_axis_value(1, gp_axislv) > 0)
	or(gamepad_axis_value(1, gp_axislh) < 0)
	or(gamepad_axis_value(1, gp_axislh) > 0)
	or(gamepad_axis_value(2, gp_axislv) < 0)
	or(gamepad_axis_value(2, gp_axislv) > 0)
	or(gamepad_axis_value(2, gp_axislh) < 0)
	or(gamepad_axis_value(2, gp_axislh) > 0)
	or(gamepad_axis_value(3, gp_axislv) < 0)
	or(gamepad_axis_value(3, gp_axislv) > 0)
	or(gamepad_axis_value(3, gp_axislh) < 0)
	or(gamepad_axis_value(3, gp_axislh) > 0)
	{
		if (menu_joystick_delay = 0)
		{
			menu_joystick_delay = 15;
		}
	}
	
	if (gamepad_axis_value(0, gp_axislv) = 0)
	and (gamepad_axis_value(0, gp_axislh) = 0)
	and (gamepad_axis_value(1, gp_axislv) = 0)
	and (gamepad_axis_value(1, gp_axislh) = 0)
	and (gamepad_axis_value(2, gp_axislv) = 0)
	and (gamepad_axis_value(2, gp_axislh) = 0)
	and (gamepad_axis_value(3, gp_axislv) = 0)
	and (gamepad_axis_value(3, gp_axislh) = 0)
	{
		menu_joystick_delay = 0;
	}
	if (menu_joystick_delay > 0)
	{
		menu_joystick_delay -= 1;
	}
	#endregion /*Menu navigation with joystick (This code must come after all menu navigation code) END*/
	
}