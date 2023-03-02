if (bounce_up == false)
and (other.flat == true)
and (other.die == false)
and (other.die_volting = false)
{
	effect_create_above(ef_ring, x, y, 0, c_white);
	
	if (asset_get_type("obj_player") == asset_object)
	and (instance_exists(obj_player))
	{
		with(instance_nearest(x, y, obj_player))
		{
			score += 200;
			basic_collectibles += 1;
			global.basic_collectibles += 1;
		}
	}
	
	#region /* Get 1-up if you get 100 basic collectibles */
	if (global.basic_collectibles > 99) /* After the code where you collect the basic collectible, then check if you have collected 100 basic collectibles */
	{
		global.basic_collectibles = 0;
		if (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		if (asset_get_type("obj_score_up") == asset_object)
		and (asset_get_type("obj_player") == asset_object)
		and (instance_exists(obj_player))
		{
			with(instance_create_depth(other.x, other.y - 16, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
		else
		if (asset_get_type("obj_score_up") == asset_object)
		{
			with(instance_create_depth(x, y - 16, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
	}
	#endregion /* Get 1-up if you get 100 basic collectibles END */
	
	if (asset_get_type("obj_camera") == asset_object)
	and (instance_exists(obj_camera))
	{
		with(obj_camera)
		{
			hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
			hud_show_score_timer = global.hud_hide_time * 60;
		}
	}
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	instance_destroy();
}