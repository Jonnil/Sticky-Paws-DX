function scr_size_place_object(xx, yy, place_size_number, can_place_object_angle)
{
	// Check place size conditions
	if (
		 (can_make_place_size_bigger && obj_leveleditor.place_size >= place_size_number - 1)
		 || (!can_make_place_size_bigger && place_size_number == 1)
	   )
	{
		if (!place_meeting(x + xx, y + yy, obj_leveleditor_placed_object) && (global.part_limit < 4000))
		{
			// Check if the object to be placed is one that should count toward the entity limit
			if (
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_VENGEFUL_SPIRIT) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BOSS) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_BLIND_COIL_SPRING) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_ENEMY_BOWLINGBALL_COIL_SPRING) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_BLIND_COIL_SPRING) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BASIC_ENEMY_COIL_SPRING) ||
				(obj_leveleditor.place_object == LEVEL_OBJECT_ID.ID_BIG_STATIONARY_ENEMY_COIL_SPRING)
			   )
			{
				if (global.part_limit_entity >= 100)
				{
					return; // Do not place the object if entity limit is reached
				}
				else
				{
					global.part_limit_entity++;
					global.part_limit_entity_text_alpha = 3;
				}
			}

			// Place the object
			obj_leveleditor.placing_object = 1;
			var inst = instance_create_depth(x + xx, y + yy, 0, obj_leveleditor_placed_object);
			inst.place_object_angle = can_place_object_angle;
			inst.object = obj_leveleditor.place_object;
			inst.placed_for_the_first_time = true;

			scr_when_placing_on_difficulty_layer(inst);

			audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
			scr_audio_play(snd_leveleditor_place_object, volume_source.sound);
		}
	}
}
