if (cutscene != 1 && other.intro_animation == "") {
	with (instance_create_depth(x, y, 0, obj_basic_enemy)) {
		image_xscale = -1;
		scr_gamepad_vibration(instance_nearest(x, y, obj_player).player, 0.5, 10);
		scr_audio_play(choose(enemyvoice_defeated1, enemyvoice_defeated2, enemyvoice_defeated3), volume_source.voice);
		audio_sound_pitch(snd_stomp, 1);
		scr_audio_play(snd_stomp, volume_source.sound);
		flat = true;
		die = true;
	}
	if (other.key_jump_hold) {
		with(other) {
			vspeed = -triple_jump_height;
		}
	}
	else {
		other.vspeed = -8;
	}
	instance_destroy();
}