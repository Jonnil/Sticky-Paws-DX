#region /*If enemies are disabled, destroy this object*/
if (global.assist_enable = true)
and (global.assist_enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting = - 1)
or(die_volting = +1)
{
	if (die_volting = - 1)
	{
		image_angle -= 20;
		hspeed = +4;
	}
	else
	{
		image_angle += 20;
		hspeed = -4;
	}
	#region /*Set the gravity*/
	gravity_direction = 270; /*Direction of the gravity*/
	gravity = 0.5; /*The gravity*/
	#endregion /*Set the gravity END*/
	
	sprite_index = global.resource_pack_sprite_bullet;
}
else
{
	if (flat = false)
	{
		/*Set the gravity*/
		gravity_direction = 270; /*Direction of the gravity*/
		gravity = 0; /*The gravity*/
		sprite_index = global.resource_pack_sprite_bullet;
	}
	else
	if (flat = true)
	{
		gravity_direction = 270; /*Direction of the gravity*/
		gravity = 0.5; /*The gravity*/
		image_speed = 0.5;
		sprite_index = global.resource_pack_sprite_bullet_flattened;
		if (image_index > image_number - 1)
		{
			if (instance_exists(obj_foreground_secret))
			and (place_meeting(x, y, obj_foreground_secret))
			and (obj_foreground_secret.image_alpha < 0.5)
			or (instance_exists(obj_foreground_secret))
			and (!place_meeting(x, y, obj_foreground_secret))
			{
				effect_create_above(ef_smoke, x, y, 2, c_white);
			}
			instance_destroy();
		}
	}
}
if (image_xscale < 0)
{
	hspeed = -4;
}
else
{
	hspeed = +4;
}

if (instance_exists(obj_camera))
and (x < obj_camera.view_x_center - 980)
and (image_xscale < 0)
and (draw_xscale >= 0.8)
or (instance_exists(obj_camera))
and (x > obj_camera.view_x_center + 980)
and (image_xscale > 0)
and (draw_xscale >= 0.8)
{
	instance_destroy();
	x = 0;
	y = 0;
}
draw_xscale = lerp(draw_xscale, 1, 0.075);
draw_yscale = lerp(draw_yscale, 1, 0.075);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale *sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);
if (draw_xscale >= 0.8)
and (asset_get_type("obj_wall") == asset_object)
{
	if (place_meeting(x - 1, y, obj_wall))
	or(place_meeting(x + 1, y, obj_wall))
	{
		if (instance_exists(obj_foreground_secret))
		and (place_meeting(x, y, obj_foreground_secret))
		and (obj_foreground_secret.image_alpha < 0.5)
		or (instance_exists(obj_foreground_secret))
		and (!place_meeting(x, y, obj_foreground_secret))
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
		}
		instance_destroy();
	}
}

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	stuck_in_wall_counter += 1;
	if (stuck_in_wall_counter >= 3)
	{
		flat = false;
		die = true;
		die_volting = true;
	}
}
else
{
	if (stuck_in_wall_counter > 0)
	{
		stuck_in_wall_counter -= 1;
	}
}
#endregion /*Kill enemy if it's inside the wall END*/