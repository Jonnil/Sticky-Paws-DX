function scr_menu_navigation_with_joystick_delay()
{
	var max_navigation_speed = 50;
	
	#region /* Menu navigation with joystick or keyboard (This code must come after all menu navigation code) */
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
	|| (key_up)
	|| (key_down)
	|| (key_left)
	|| (key_right)
	|| (keyboard_check(ord("I")))
	|| (keyboard_check(ord("K")))
	|| (gamepad_axis_value(global.player_slot[1], gp_axisrv) < -0.3)
	|| (gamepad_axis_value(global.player_slot[1], gp_axisrv) > +0.3)
	{
		if (menu_delay >= 1 && menu_joystick_delay == 0)
		{
			menu_joystick_delay = global.menu_navigation_speed; /* Set this variable before speeding up the navigation speed */
			global.menu_navigation_speed -= 10; /* Make the menu navigation go faster the longer you hold down a direction */
		}
	}
	#endregion /* Menu navigation with joystick or keyboard (This code must come after all menu navigation code) END */
	
	if (menu_joystick_delay > 0)
	{
		menu_joystick_delay --;
	}
	global.menu_navigation_speed = clamp(global.menu_navigation_speed, 10, max_navigation_speed);
	
	#region /* Reset back to 0 */
	if (gamepad_axis_value(global.player_slot[1], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[1], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[2], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[2], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[3], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[3], gp_axislh) == 0)
	&& (gamepad_axis_value(global.player_slot[4], gp_axislv) == 0)
	&& (gamepad_axis_value(global.player_slot[4], gp_axislh) == 0)
	&& (!key_up)
	&& (!key_down)
	&& (!key_left)
	&& (!key_right)
	&& (!keyboard_check(ord("I")))
	&& (!keyboard_check(ord("K")))
	&& (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
	&& (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
	{
		global.menu_navigation_speed = max_navigation_speed;
		menu_joystick_delay = 0;
	}
	#endregion /* Reset back to 0 END */
	
}