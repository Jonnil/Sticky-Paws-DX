if (!bounce_up)
{
	if (!other.have_heart_balloon)
	{
		with(other)
		{
			xx_heart = x;
			yy_heart = y;
			have_heart_balloon = true; /* Set this variable after setting heart x and heart y positions */
			hp = max_hp; /* Refill HP to max */

			#region /* Save heart balloon to be true */
			ini_open(game_save_id + "save_file/file" + string(global.file) + ".ini");
			ini_write_real("Player", "player" + string(player) + "_have_heart_balloon", true);
			ini_close(); /* Don't commit the save data on Switch, this is only temporary! */
			#endregion /* Save heart balloon to be true END */

		}
	}
	else
	{

		#region /* 10 Basic Collectibles */
		var num_collectibles = 10; /* Define the number of collectibles to create */
		for (var i = 0; i < num_collectibles; i++) /* Loop to create collectibles with varying delay times */
		{
			var collectible = instance_create_depth(x, bbox_top, 0, obj_basic_collectible);
			with(collectible)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounce_up = true;
				delay_time = 10 * (i + 1); /* Set delay time based on the iteration */
			}
		}
		scr_audio_play(snd_basic_collectible, volume_source.sound); /* Play the collectible sound */
		#endregion /* 10 Basic Collectibles END */

	}

	#region /* 1000 Score */
	global.level_score += 1000;
	with(instance_create_depth(x, y, 0, obj_score_up))
	{
		score_up = 1000;
	}
	#endregion /* 1000 Score END */

	effect_create_depth(depth + 1, ef_ring, x, y, 1, c_white);
	instance_destroy();
}
