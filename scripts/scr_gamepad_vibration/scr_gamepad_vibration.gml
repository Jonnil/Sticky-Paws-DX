function scr_gamepad_vibration(what_player = 1, motor_speed = 0.5, duration = 10)
{
	if (instance_exists(obj_camera) &&
		instance_exists(obj_player) &&
		global.controls_used_for_navigation == "gamepad") {
		gamepad_set_vibration(what_player - 1, motor_speed, motor_speed);
		obj_camera.player_motor_speed[what_player] = motor_speed;
		var time_source = time_source_create(time_source_game, duration, time_source_units_frames, function(what_player){
			player_vibration_active[what_player] = false;
		}, [], 1);
		time_source_start(time_source);
	}
}