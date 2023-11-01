function scr_menu_navigation_with_joystick_delay()
{
	
	#region /* Menu navigation with joystick (This code must come after all menu navigation code) */
	if (gamepad_axis_value(global.player_slot[1], gp_axislv) < -0.3)
	|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > +0.3)
	|| (gamepad_axis_value(global.player_slot[1], gp_axislh) < -0.3)
	|| (gamepad_axis_value(global.player_slot[1], gp_axislh) > +0.3)
	|| (gamepad_axis_value(global.player_slot[2], gp_axislv) < -0.3)
	|| (gamepad_axis_value(global.player_slot[2], gp_axislv) > +0.3)
	|| (gamepad_axis_value(global.player_slot[2], gp_axislh) < -0.3)
	|| (gamepad_axis_value(global.player_slot[2], gp_axislh) > +0.3)
	|| (gamepad_axis_value(global.player_slot[3], gp_axislv) < -0.3)
	|| (gamepad_axis_value(global.player_slot[3], gp_axislv) > +0.3)
	|| (gamepad_axis_value(global.player_slot[3], gp_axislh) < -0.3)
	|| (gamepad_axis_value(global.player_slot[3], gp_axislh) > +0.3)
	|| (gamepad_axis_value(global.player_slot[4], gp_axislv) < -0.3)
	|| (gamepad_axis_value(global.player_slot[4], gp_axislv) > +0.3)
	|| (gamepad_axis_value(global.player_slot[4], gp_axislh) < -0.3)
	|| (gamepad_axis_value(global.player_slot[4], gp_axislh) > +0.3)
	{
		if (menu_delay >= 1 && menu_joystick_delay == 0)
		{
			menu_joystick_delay = 15;
		}
	}
	
	if (gamepad_axis_value(global.player_slot[1], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[1], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[2], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[2], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[3], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[3], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[4], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[4], gp_axislh) == 0)
	{
		menu_joystick_delay = 0;
	}
	if (menu_joystick_delay > 0)
	{
		menu_joystick_delay --;
	}
	#endregion /* Menu navigation with joystick (This code must come after all menu navigation code) END */
	
}