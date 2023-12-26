function scr_gamepad_vibration(what_player = 1, motor_speed = 0.5, duration = 10)
{
	if (what_player == 1)
	&& (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	&& (global.controls_used_for_navigation == "gamepad")
	{
		gamepad_set_vibration(0, motor_speed, motor_speed);
		obj_camera.player1_motor_speed = motor_speed;
		obj_camera.player1_motor_speed = motor_speed;
		obj_camera.alarm[1] = duration;
	}
	else
	if (what_player = 2)
	&& (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	&& (global.controls_used_for_navigation == "gamepad")
	{
		gamepad_set_vibration(1, motor_speed, motor_speed);
		obj_camera.player2_motor_speed = motor_speed;
		obj_camera.player2_motor_speed = motor_speed;
		obj_camera.alarm[2] = duration;
	}
	else
	if (what_player = 3)
	&& (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	&& (global.controls_used_for_navigation == "gamepad")
	{
		gamepad_set_vibration(2, motor_speed, motor_speed);
		obj_camera.player3_motor_speed = motor_speed;
		obj_camera.player3_motor_speed = motor_speed;
		obj_camera.alarm[3] = duration;
	}
	else
	if (what_player = 4)
	&& (instance_exists(obj_camera))
	&& (instance_exists(obj_player))
	&& (global.controls_used_for_navigation == "gamepad")
	{
		gamepad_set_vibration(3, motor_speed, motor_speed);
		obj_camera.player4_motor_speed = motor_speed;
		obj_camera.player4_motor_speed = motor_speed;
		obj_camera.alarm[4] = duration;
	}
}