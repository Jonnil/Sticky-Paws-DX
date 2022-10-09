function scr_brush_size_place_object(xx, yy, place_brush_size_number, can_place_object_angle)
{
	
	if (!place_meeting(x + xx, y + yy, obj_leveleditor_placed_object))
	and (obj_leveleditor.place_brush_size >= place_brush_size_number - 1)
	and (can_put_objects_above_other_objects = false)
	or (obj_leveleditor.place_brush_size >= place_brush_size_number - 1)
	and (can_put_objects_above_other_objects == true)
	and (mouse_check_button_pressed(mb_left))
	{
		obj_leveleditor.placing_object = 1;
		obj = instance_create_depth(x + xx, y + yy, 0, obj_leveleditor_placed_object);
		obj.place_object_angle = can_place_object_angle;
		obj.object = obj_leveleditor.place_object;
		obj.undo_value = obj_leveleditor.current_undo_value; /* Undo and Redo handeling */
		obj.placed_for_the_first_time = true;
		
		scr_when_placing_on_difficulty_layer();
		
		audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
		scr_audio_play(snd_leveleditor_place_object, volume_source.sound);
	}
	
}