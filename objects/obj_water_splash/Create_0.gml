if (asset_get_type("snd_water_getout") == asset_sound)
{
	audio_play_sound(snd_water_getout, 0, 0);
	audio_sound_gain(snd_water_getout, global.sound_volume * global.main_volume, 0);
}

if (position_meeting(x + 32, y, obj_water))
and (!position_meeting(x - 32, y, obj_water))
and (!position_meeting(x - 32, y, obj_wall))
{
	image_angle = 90;
}
else
if (position_meeting(x, y - 32, obj_water))
and (!position_meeting(x, y + 32, obj_water))
and (!position_meeting(x, y + 32, obj_wall))
{
	image_angle = 180;
}
else
if (position_meeting(x - 32, y, obj_water))
and (!position_meeting(x + 32, y, obj_water))
and (!position_meeting(x + 32, y, obj_wall))
{
	image_angle = 270;
}