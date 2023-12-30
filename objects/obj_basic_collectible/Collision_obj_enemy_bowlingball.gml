if (bounce_up == false)
&& (other.flat)
&& (other.die == false)
&& (other.die_volting == false)
{
	effect_create_above(ef_ring, x, y, 0, c_white);
	
	if (instance_exists(obj_player))
	{
		with(instance_nearest(x, y, obj_player))
		{
			score += 200;
			basic_collectibles ++;
			global.basic_collectibles ++;
		}
	}
	
	scr_get_1up_when_collect_basic_collectibles();
	
	if (instance_exists(obj_camera))
	{
		obj_camera.hud_show_basic_collectibles_timer = global.hud_hide_time * 60;
		obj_camera.hud_show_score_timer = global.hud_hide_time * 60;
	}
	scr_audio_play(snd_basic_collectible, volume_source.sound);
	instance_destroy();
}