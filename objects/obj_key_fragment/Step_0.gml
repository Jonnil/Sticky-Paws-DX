if (bounce_up)
{

	#region /* Show Key Fragment HUD */
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_key_fragment_timer = global.hud_hide_time * 60;
	}
	#endregion /* Show Key Fragment HUD END */

	if (delay >= delay_time)
	{
		visible = true;
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		if (vspeed > 0 && y > ystart - 32)
		{
			collect_key_fragment = true;
		}
	}
	else
	{
		visible = false;
		y = ystart;
	}
	delay++;
}

if (collect_key_fragment)
{
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	effect_create_depth(depth - 1, ef_ring, x, y, 0, c_white);
	if (instance_exists(obj_camera))
	{

		#region /* Show Key Fragment HUD */
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_key_fragment_timer = global.hud_hide_time * 60;
		}
		#endregion /* Show Key Fragment HUD END */

		#region /* What Key Fragment is this? */
		for(var i = 1; i <= global.max_key_fragment; i ++)
		{
			if (key_fragment == i)
			{
				global.key_fragment[i] = true;

				if (instance_exists(obj_camera))
				{
					obj_camera.hud_show_key_fragment_blink[i] = 120;
					if (!global.key_fragment_already_collected[i])
					{
						global.key_fragment_already_collected[i] = true;
					}
				}
				break;
			}
			else
			{
				if (instance_exists(obj_camera))
				{
					obj_camera.hud_show_key_fragment_blink[i] = 0;
				}
			}
		}
		#endregion /* What Key Fragment is this? END */

		obj_camera.key_fragment_total += 1;
		if (obj_camera.key_fragment_total >= global.max_key_fragment)
		{
			instance_create_depth(x, y, 0, obj_key);
		}
	}
	instance_destroy();
}
