#region /* Make object change difficulty layer depending on what difficulty layer is selected */
if (instance_exists(obj_leveleditor))
&& (obj_leveleditor.difficulty_layer > 0)
&& (!obj_leveleditor.drag_object)
&& (!obj_leveleditor.pause)
{
	audio_sound_pitch(snd_leveleditor_erase_object, random_range(0.9, 1.1));
	scr_audio_play(snd_leveleditor_erase_object, volume_source.sound);
	image_blend = c_aqua;
	if (obj_leveleditor.difficulty_layer == 1)
	&& (other.easy)
	{
		other.easy = false;
		with(other)
		{
			alarm[2] = 1;
		}
	}
	else
	if (obj_leveleditor.difficulty_layer == 2)
	&& (other.normal)
	{
		other.normal = false;
		with(other)
		{
			alarm[2] = 1;
		}
	}
	else
	if (obj_leveleditor.difficulty_layer == 3)
	&& (other.hard)
	{
		other.hard = false;
		with(other)
		{
			alarm[2] = 1;
		}
	}
}
#endregion /* Make object change difficulty layer depending on what difficulty layer is selected END */

#region /* Delete / Erase Objects */
if (instance_exists(obj_leveleditor))
&& (obj_leveleditor.difficulty_layer == 0)
&& (!obj_leveleditor.drag_object)
&& (obj_leveleditor.erase_mode)
&& (!obj_leveleditor.scroll_view)
&& (!obj_leveleditor.pause)
{
	audio_sound_pitch(snd_leveleditor_erase_object, random_range(0.9, 1.1));
	scr_audio_play(snd_leveleditor_erase_object, volume_source.sound);
	image_blend = c_red;
	with(other)		
	{
		instance_destroy();
	}
}
#endregion /* Delete / Erase Objects END */

#region /* Set to appear on difficulty level */
if (instance_exists(obj_leveleditor))
&& (!obj_leveleditor.drag_object)
&& (!obj_leveleditor.erase_mode)
&& (!obj_leveleditor.pause)

|| (instance_exists(obj_leveleditor))
&& (!obj_leveleditor.key_b_hold)
&& (!obj_leveleditor.drag_object)
&& (!obj_leveleditor.erase_mode)
&& (obj_leveleditor.key_a_hold)
&& (!obj_leveleditor.pause)
{
	image_blend = c_lime;
	with(other)
	{
		if (obj_leveleditor.difficulty_layer == 1)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (!easy)
			{
				easy = true;
				placed_for_the_first_time = true;
				alarm[2] = 1;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer == 2)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (!normal)
			{
				normal = true;
				placed_for_the_first_time = true;
				alarm[2] = 1;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer == 3)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (!hard)
			{
				hard = true;
				placed_for_the_first_time = true;
				alarm[2] = 1;
			}
		}
	}
}
#endregion /* Set to appear on difficulty level END */

#region /* Set to dissapear on difficulty level */
if (!keyboard_check(vk_escape))
{
	if (!mouse_check_button(mb_left))
	&& (instance_exists(obj_leveleditor))
	&& (mouse_check_button(mb_right))
	&& (!obj_leveleditor.pause)
	
	|| (instance_exists(obj_leveleditor))
	&& (!obj_leveleditor.key_a_hold)
	&& (obj_leveleditor.key_b_hold)
	&& (!obj_leveleditor.pause)
	{
		audio_sound_pitch(snd_leveleditor_erase_object, random_range(0.9, 1.1));
		scr_audio_play(snd_leveleditor_erase_object, volume_source.sound);
		image_blend = c_yellow;
		if (obj_leveleditor.difficulty_layer == 0)
		{
			if (other.easy)
			{
				other.easy = false;
				other.alarm[2] = 1;
			}
			if (other.normal)
			{
				other.normal = false;
				other.alarm[2] = 1;
			}
			if (other.hard)
			{
				other.hard = false;
				other.alarm[2] = 1;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer == 1)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (other.easy)
			{
				other.easy = false;
				other.alarm[2] = 1;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer == 2)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (other.normal)
			{
				other.normal = false;
				other.alarm[2] = 1;
			}
		}
		else
		if (obj_leveleditor.difficulty_layer == 3)
		&& (obj_leveleditor.set_difficulty_mode)
		{
			if (other.hard)
			{
				other.hard = false;
				other.alarm[2] = 1;
			}
		}
	}
}
#endregion /* Set to dissapear on difficulty level END */