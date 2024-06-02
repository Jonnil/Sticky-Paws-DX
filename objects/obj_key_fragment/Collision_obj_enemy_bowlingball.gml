#region /* Touch Enemy Bowlingball */
if (!collision_line(x, y, other.x, other.y, obj_wall, false, true))
{
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	effect_create_above(ef_ring, x, y, 0, c_white);
	if (instance_exists(obj_camera))
	{
		obj_camera.key_fragment_total += 1;
		if (obj_camera.key_fragment_total >= key_fragment_max_number)
		{
			instance_create_depth(x, y, 0, obj_key);
		}
	}
	instance_destroy();
}
#endregion /* Touch Enemy Bowlingball END */