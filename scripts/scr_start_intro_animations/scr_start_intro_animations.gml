function scr_start_intro_animations() {
	/* Start Intro Animations */
	if (!spawned_from_checkpoint) { /* Ensure not in the middle of a level by touching a checkpoint */
		
	    /* Check intro animations */
	    if ((intro_animation == "cake_stolen" || intro_animation == "ending") && instance_exists(obj_camera)) {
	        if ((!obj_camera.intro_animation_play_only_once || global.current_level_clear_rate == "enter") &&
	            (!obj_camera.intro_animation_play_only_once || global.current_level_clear_rate == "enter")) {
	            can_move = false;
	            crouch = false;
	            cutscene_time++;
				
	            /* Handle different intro animations */
	            switch (intro_animation) {
	                case "cake_stolen":
	                    intro_animation_cake_stolen();
	                    break;
	                case "ending":
	                    intro_animation_ending();
	                    break;
	            }
				if (intro_animation_sprite == noone) {
					intro_animation_sprite = sprite_stand;
				}
	        }
	    } else if (intro_animation == "ending_chair" || intro_animation == "ending_chair_eating") {
	        /* Handle ending chair animations */
	        intro_animation_ending_chair();
	    } else {
	        intro_animation = "";
	    }
	}
}

#region /* Intro Animation Functions */
function intro_animation_cake_stolen() {
    if (cutscene_time == 1) {
        /* Handle cake stolen intro animation */
        intro_animation_sprite = sprite_sitting_eat_closed_mouth;
        /* Create instances if they don't exist */
        instance_create_depth(x + 10, y, 0, obj_chair_and_table);
        instance_create_depth(x + 40, y + 10, 0, obj_cake);
        instance_create_depth(-27.795226, y, 0, obj_cake_stealing_enemy);
    } else if (cutscene_time == 60 * 2) {
        scr_audio_play(voice_open_mouth, volume_source.voice);
        intro_animation_sprite = sprite_sitting_eat_open_mouth;
    } else if (cutscene_time == 60 * 3.5) {
        scr_audio_play(voice_notice, volume_source.voice);
        intro_animation_sprite = sprite_sitting_eat_open_mouth_open_eye;
    } else if (cutscene_time == 60 * 4.2) {
        scr_audio_play(voice_scream, volume_source.voice);
        intro_animation_sprite = sprite_sitting_eat_surprised;
		image_speed = 1;
    } else if (cutscene_time > 60 * 5.2) {
        hspeed = 8;
        vspeed = -8;
        can_move = true;
        intro_animation = "";
    }
}

function intro_animation_ending() {
    if (cutscene_time == 1) {
        /* Handle ending intro animation */
        x = -16 - sprite_width;
        intro_animation_sprite = sprite_run;
        hspeed = 0;
        instance_create_depth(1697, 745, 0, obj_catlyn_working);
        with (instance_create_depth(instance_nearest(x, y, obj_goal).x, instance_nearest(x, y, obj_goal).y, 0, obj_chair_and_table)) {
			ending = true;
		}
		with(obj_goal) {
			instance_destroy();
		}
        instance_create_depth(-16, y, 0, obj_cake);
        with (instance_create_depth(-16, y, 0, obj_cake_stealing_enemy)) {
			time = 60 * 2;
		}
    } else if (cutscene_time >= 60 && cutscene_time < 60 * 2) {
        x += 8;
        intro_animation_sprite = sprite_run;
    } else if (cutscene_time > 60 * 2) {
        cutscene_time = 0;
        hspeed += 8;
        can_move = true;
        intro_animation = "";
    }
}

function intro_animation_ending_chair() {
    if (instance_exists(obj_chair_and_table)) {
        x = instance_nearest(x, y, obj_chair_and_table).x;
    }
    if (!place_meeting(x, y + 1, obj_wall)) {
        y++;
    }
    image_xscale = +1;
    can_move = false;
    crouch = false;
    cutscene_time++;
	image_speed = 0.25;
    if (instance_exists(obj_chair_and_table)) {
        with (instance_nearest(x, y, obj_cake)) {
            attach_player = false;
            if (instance_exists(obj_chair_and_table)) {
                x = instance_nearest(x, y, obj_chair_and_table).x + 23;
            }
        }
    }
	if (cutscene_time == 1) {
		image_index = 0;
		image_speed = 0.25;
	}
    if (cutscene_time <= 240) {
        intro_animation_sprite = sprite_sitting_down_to_eat;
		if (image_index > image_number - 1)
		{
			cutscene_time = 250;
		}
    } else {
        if (!instance_exists(obj_credits)) {
            instance_create_depth(x, y, 0, obj_credits);
        }
        intro_animation_sprite = sprite_sitting_eating;
        intro_animation = "ending_chair_eating";
    }
}
#endregion /* Intro Animation Functions END */