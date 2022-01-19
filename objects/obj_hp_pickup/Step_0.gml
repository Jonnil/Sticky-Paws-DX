sprite_index = global.resourcepack_sprite_hp_pickup;

#region /*Set the gravity*/
gravity_direction=270;/*Direction of the gravity*/
if (!place_meeting(x,y+1,obj_wall))
{
	gravity = 0.5;/*The gravity*/
}
else
{
	gravity = 0;
}
#endregion /*Set the gravity END*/

#region /*If inside wall, destroy yourself*/
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /*If inside wall, destroy yourself END*/

if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (allow_move=true)
	{
		if (dir=+1)
		{
			if (instance_nearest(x,y,obj_player).x>x)
			and (instance_nearest(x,y,obj_player).hspeed>+2)
			{
				hspeed=instance_nearest(x,y,obj_player).hspeed;
				if (hspeed>+8)
				{
					hspeed=+8;
				}
			}
			else
			{
				hspeed=+2;
			}
		}
		else
		{
			if (instance_nearest(x,y,obj_player).x<x)
			and (instance_nearest(x,y,obj_player).hspeed<-2)
			{
				hspeed=instance_nearest(x,y,obj_player).hspeed;
				if (hspeed<-8)
				{
					hspeed=-8;
				}
			}
			else
			{
				hspeed=-2;
			}
		}
	}
	else
	{
		hspeed=0;
	}
	if (place_meeting(x,y,obj_player))
	and (bounceup=false)
	{
		with(instance_nearest(x,y,obj_player))
		{
			hp+=1;
		}
	effect_create_below(ef_ring,x,y,1,c_white);
	instance_destroy();
	}
}

#region /*When falling, it's not bouncing up anymore*/
if (vspeed>=0)
{
	bounceup=false;
}
#endregion /*When falling, it's not bouncing up anymore END*/

if (asset_get_type("obj_wall") == asset_object)
{
	if (place_meeting(x-1,y,obj_wall))
	{
		dir=+1;
	}
	if (place_meeting(x+1,y,obj_wall))
	{
		dir=-1;
	}
	if (place_meeting(x,y-1,obj_wall))
	{
		vspeed=+4;
	}
}

#region /*Expanding Ring Effect*/
effect_time+=1;
if (effect_time>60)
{
	effect_time=0;
	effect_create_below(ef_ring,x,y,1,c_white);
}
#endregion /*Expanding Ring Effect End*/