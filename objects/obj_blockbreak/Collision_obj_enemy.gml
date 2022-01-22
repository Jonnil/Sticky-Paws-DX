with(other)
{
	if (die = false)
	{
		if (die_volting = false)
		{
			die = true;
			if (other.x < x)
			{
				die_volting=-1;
				vspeed =-8;
			}
			else
			{
				die_volting= + 1;
				vspeed =-8;
			}
		}
		#region /*1 Coin*/
		if (asset_get_type("obj_basic_collectible") == asset_object)
		{
			var obj;
			obj = instance_create_depth(x, bbox_top, 0,obj_basic_collectible);
			with(obj)
			{
				image_speed = 1;
				motion_set(90, 10);
				bounceup = true;
			}
		}
		#endregion /*1 Coin END*/
		
		#region /*200 Score*/
		score+=200;
		if (asset_get_type("obj_scoreup") == asset_object)
		{
			obj = instance_create_depth(x, y, 0, obj_scoreup);
			with(obj)
			{
				scoreup =200;
			}
		}
		#endregion /*200 Score END*/
	}
}