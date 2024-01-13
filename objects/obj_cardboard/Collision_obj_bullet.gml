#region /* Collision with bullet */
if (instance_exists(obj_bullet))
&& (distance_to_object(obj_bullet) < 32)
&& (!other.die)
{
	if (place_meeting(x, y, obj_bullet))
	|| (place_meeting(x - 5, y, obj_bullet))
	|| (place_meeting(x + 5, y, obj_bullet))
	{
		alarm[1] = 1; /* Break cardboard */
		break_cardboard_source_x = other.x;
		break_cardboard_source_speed = other.speed;
		
		if (other.x < x)
		{
			with(other)
			{
				die = true;
				vspeed = -8;
				die_volting = - 1;
			}
		}
		else
		{
			with(other)
			{
				die = true;
				vspeed = -8;
				die_volting = +1;
			}
		}
	}
}
#endregion /* Collision with bullet END */