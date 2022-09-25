scr_audio_play(snd_water_getout, global.sound_volume);

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