scr_audio_play(snd_water_getout, volume_source.sound);

if (position_meeting(x + 32, y, obj_water))
&& (!position_meeting(x - 32, y, obj_water))
&& (!position_meeting(x - 32, y, obj_wall))
{
	image_angle = 90;
}
else
if (position_meeting(x, y - 32, obj_water))
&& (!position_meeting(x, y + 32, obj_water))
&& (!position_meeting(x, y + 32, obj_wall))
{
	image_angle = 180;
}
else
if (position_meeting(x - 32, y, obj_water))
&& (!position_meeting(x + 32, y, obj_water))
&& (!position_meeting(x + 32, y, obj_wall))
{
	image_angle = 270;
}
