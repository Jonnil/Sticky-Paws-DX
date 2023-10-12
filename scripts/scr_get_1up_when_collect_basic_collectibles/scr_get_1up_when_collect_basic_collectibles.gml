function create_score_up_1up(xx, yy)
{
	with(instance_create_depth(xx, yy - 16, 0, obj_score_up))
	{
		score_up = "1-up";
	}
}

function get_1up_when_collect_basic_collectibles()
{
	
	#region /* Get 1-up if you get 100 basic collectibles */
	var basic_collectible_threshold = 99;
	if (global.basic_collectibles >= basic_collectible_threshold)
	{
		global.basic_collectibles = 0;
		obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		var nearest_instance = instance_nearest(x, y, obj_player);
		if (nearest_instance != noone)
		{
			create_score_up_1up(nearest_instance.x, nearest_instance.y);
		}
		else
		{
			create_score_up_1up(x, y);
		}
	}
	#endregion /* Get 1-up if you get 100 basic collectibles END */
	
}