function scr_gamepad_vibration(what_player = 1, motor_speed = 0.5, duration = 10)
{
	if (instance_exists(obj_camera) && instance_exists(obj_player) && global.controls_used_for_navigation == "gamepad") {
		gamepad_set_vibration(what_player - 1, motor_speed, motor_speed);
		obj_camera.player_motor_speed[what_player] = motor_speed;
		obj_camera.player_vibration_active[what_player] = duration;
	}
}