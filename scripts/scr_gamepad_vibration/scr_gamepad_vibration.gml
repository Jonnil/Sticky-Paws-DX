function scr_gamepad_vibration(what_player = 1, motor_speed = 0.5, duration = 10)
{
	for (var i = 1; i <= global.max_players; i += 1) {
		if (what_player == i &&
			instance_exists(obj_camera) &&
			instance_exists(obj_player) &&
			global.controls_used_for_navigation == "gamepad") {
			gamepad_set_vibration(i - 1, motor_speed, motor_speed);
			obj_camera.player_motor_speed[i] = motor_speed;
			var time_source = time_source_create(time_source_game, duration, time_source_units_frames, function(){
				player_vibration_active[i] = false;
			}, [], 1);
			time_source_start(time_source);
			break; /* Exit the loop once the correct player is found */
		}
	}
}