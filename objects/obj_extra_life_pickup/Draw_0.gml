draw_set_halign(fa_center);
draw_set_valign(fa_middle);

#region /* If inside wall, destroy yourself */
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /* If inside wall, destroy yourself END */

#region /* When falling, it's not bouncing up anymore */
if (vspeed >= 0)
{
	bounce_up = false;
}
#endregion /* When falling, it's not bouncing up anymore END */

if (instance_exists(obj_camera))
&& (obj_camera.sprite_lives_icon > noone)
{
	sprite_index = obj_camera.sprite_lives_icon;
}

text_alpha = lerp(text_alpha, scr_wave(0, 1, 3, 0), 0.1);

#region /* Color the extra live pickup differently if it grants you different amounts of lives */
if (number_of_extra_lives = 3)
{
	if (sprite_exists(sprite_index))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_blue, 1);
	}
}
else
if (number_of_extra_lives = 2)
{
	if (sprite_exists(sprite_index))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_lime, 1);
	}
}
else
{
	if (sprite_exists(sprite_index))
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
	}
}
#endregion /* Color the extra live pickup differently if it grants you different amounts of lives END */

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!place_meeting(x, y + 1, obj_wall))
&& (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

if (instance_exists(obj_player))
{
	if (allow_move)
	{
		if (dir = +1)
		{
			if (instance_nearest(x, y, obj_player).x > x)
			&& (instance_nearest(x, y, obj_player).hspeed > + 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed > + 8)
				{
					hspeed = + 8;
				}
			}
			else
			{
				hspeed = +2;
			}
		}
		else
		{
			if (instance_nearest(x, y, obj_player).x < x)
			&& (instance_nearest(x, y, obj_player).hspeed < - 2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed < - 8)
				{
					hspeed = - 8;
				}
			}
			else
			{
				hspeed = -2;
			}
		}
	}
	else
	{
		hspeed = 0;
	}
	if (place_meeting(x, y, obj_player))
	&& (!bounce_up)
	{

		#region /* Give Life */
		if (number_of_extra_lives = 3)
		{
			with(instance_create_depth(x, y - 16, 0, obj_score_up))
			{
				score_up = "3-up";
			}
		}
		else
		if (number_of_extra_lives = 2)
		{
			with(instance_create_depth(x, y - 16, 0, obj_score_up))
			{
				score_up = "2-up";
			}
		}
		else
		{
			with(instance_create_depth(x, y - 16, 0, obj_score_up))
			{
				score_up = "1-up";
			}
		}
		if (instance_exists(obj_camera))
		{
			obj_camera.hud_show_lives_timer = global.hud_hide_time * 60;
		}
		#endregion /* Give Life END */

		effect_create_below(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}

if (place_meeting(x - 1, y, obj_wall))
{
	dir = +1;
}
if (place_meeting(x + 1, y, obj_wall))
{
	dir = -1;
}
if (place_meeting(x, y - 1, obj_wall))
{
	vspeed = +4;
}

#region /* Expanding Ring Effect */
if effect_time < 60
{
	effect_time++;
}
if effect_time > 60
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */
