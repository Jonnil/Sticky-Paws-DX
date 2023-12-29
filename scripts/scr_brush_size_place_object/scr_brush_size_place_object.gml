function scr_size_place_object(xx, yy, place_size_number, can_place_object_angle)
{
	if (obj_leveleditor.place_size >= place_size_number - 1)
	&& (!place_meeting(x + xx, y + yy, obj_leveleditor_placed_object))
	&& (global.part_limit < 4000)
	{
		obj_leveleditor.placing_object = 1;
		obj = instance_create_depth(x + xx, y + yy, 0, obj_leveleditor_placed_object);
		obj.place_object_angle = can_place_object_angle;
		obj.object = obj_leveleditor.place_object;
		obj.placed_for_the_first_time = true;
		
		scr_when_placing_on_difficulty_layer();
		
		audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
		scr_audio_play(snd_leveleditor_place_object, volume_source.sound);
	}
}