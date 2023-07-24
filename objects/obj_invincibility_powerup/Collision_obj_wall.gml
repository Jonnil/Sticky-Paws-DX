#region /* Push out of the solid object */
while(place_meeting(x, y, other))
{
	x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
	y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
}
#endregion /* Push out of the solid object END */

#region /* Landing on solid object */
if (place_meeting(x, y + 1, other))
&& (vspeed >= 0)
{
	if (instance_exists(obj_camera))
	&& (obj_camera.iris_xscale > 1)
	{
		effect_create_above(ef_smoke, x - 16, bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x, bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x + 16, bbox_bottom, 0, c_white);
		effect_create_above(ef_smoke, x - 16 - 8, bbox_bottom- 8, 0, c_white);
		effect_create_above(ef_smoke, x, bbox_bottom- 8, 0, c_white);
		effect_create_above(ef_smoke, x + 16 + 8, bbox_bottom- 8, 0, c_white);
	}
	scr_audio_play(snd_star_bound, volume_source.sound);
	vspeed = 0;
	gravity = 0;
	draw_xscale = 1.25;
	draw_yscale = 0.75;
}
#endregion /* Landing on solid object END */