function scr_gamepad_vibration(which_player, motor_speed, duration)
{
	if (which_player = 1)
	and (instance_exists(obj_camera))
	and (instance_exists(obj_player))
	and (global.controls_used_for_menu_navigation = "controller")
	{
		gamepad_set_vibration(0, motor_speed, motor_speed);
		obj_camera.player1_motor_speed = motor_speed;
		obj_camera.player1_motor_speed = motor_speed;
		obj_camera.alarm[1] = duration;
	}
	else
	if (which_player = 2)
	and (instance_exists(obj_camera))
	and (instance_exists(obj_player))
	and (global.controls_used_for_menu_navigation = "controller")
	{
		gamepad_set_vibration(1, motor_speed, motor_speed);
		obj_camera.player2_motor_speed = motor_speed;
		obj_camera.player2_motor_speed = motor_speed;
		obj_camera.alarm[2] = duration;
	}
	else
	if (which_player = 3)
	and (instance_exists(obj_camera))
	and (instance_exists(obj_player))
	and (global.controls_used_for_menu_navigation = "controller")
	{
		gamepad_set_vibration(2, motor_speed, motor_speed);
		obj_camera.player3_motor_speed = motor_speed;
		obj_camera.player3_motor_speed = motor_speed;
		obj_camera.alarm[3] = duration;
	}
	else
	if (which_player = 4)
	and (instance_exists(obj_camera))
	and (instance_exists(obj_player))
	and (global.controls_used_for_menu_navigation = "controller")
	{
		gamepad_set_vibration(3, motor_speed, motor_speed);
		obj_camera.player4_motor_speed = motor_speed;
		obj_camera.player4_motor_speed = motor_speed;
		obj_camera.alarm[4] = duration;
	}
}