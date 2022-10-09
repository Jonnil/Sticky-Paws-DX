draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}

#region /* If inside wall, destroy yourself */
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /* If inside wall, destroy yourself END */

#region /* When falling, it's not bouncing up anymore */
if (vspeed >= 0)
{
	bounceup = false;
}
#endregion /* When falling, it's not bouncing up anymore END */

if (instance_exists(obj_camera))
and (obj_camera.sprite_lives_icon > noone)
{
	sprite_index = obj_camera.sprite_lives_icon;
}

text_alpha = lerp(text_alpha, scr_wave(0, 1, 3, 0), 0.1);

#region /* Color the extra live pickup differently if it grants you different amounts of lives */
if (number_of_extra_lives = 3)
{
	if (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_blue, 1);
	}
	//scr_draw_text_outlined(x, y, "3-up", global.default_text_size * 0.75, c_white, c_black, text_alpha);
}
else
if (number_of_extra_lives = 2)
{
	if (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_lime, 1);
	}
	//scr_draw_text_outlined(x, y, "2-up", global.default_text_size * 0.75, c_white, c_black, text_alpha);
}
else
{
	if (sprite_index > 0)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
	}
	//scr_draw_text_outlined(x, y, "1-up", global.default_text_size * 0.75, c_white, c_black, text_alpha);
}
#endregion /* Color the extra live pickup differently if it grants you different amounts of lives END */

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (asset_get_type("obj_wall") == asset_object)
and (!place_meeting(x, y + 1, obj_wall))
and (asset_get_type("obj_semisolid_platform") == asset_object)
and (!position_meeting(x, bbox_bottom + 1, obj_semisolid_platform))
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

if (asset_get_type("obj_player") == asset_object)
and (instance_exists(obj_player))
{
	if (allow_move == true)
	{
		if (dir = +1)
		{
			if (instance_nearest(x, y, obj_player).x > x)
			and (instance_nearest(x, y, obj_player).hspeed > + 2)
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
			and (instance_nearest(x, y, obj_player).hspeed < - 2)
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
	and (bounceup = false)
	{
		
		#region /* Give Life */
		if (number_of_extra_lives = 3)
		{
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				with(instance_create_depth(x, y - 16, 0, obj_scoreup))
				{
					scoreup = "3-up";
				}
			}
		}
		else
		if (number_of_extra_lives = 2)
		{
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				with(instance_create_depth(x, y - 16, 0, obj_scoreup))
				{
					scoreup = "2-up";
				}
			}
		}
		else
		{
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				with(instance_create_depth(x, y - 16, 0, obj_scoreup))
				{
					scoreup = "1-up";
				}
			}
		}
		global.hud_show_lives = true;
		if (asset_get_type("obj_camera") == asset_object)
		and (instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_hide_time * 60;
			}
		}
		#endregion /* Give Life END */
		
		effect_create_below(ef_ring, x, y, 1, c_white);
		instance_destroy();
	}
}
if (asset_get_type("obj_wall") == asset_object)
{
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
}

#region /* Expanding Ring Effect */
if effect_time < 60
{
	effect_time += 1;
}
if effect_time > 60
and (global.pause == false)
{
	effect_time = 0;
	effect_create_below(ef_ring, x, y, 1, c_white);
}
#endregion /* Expanding Ring Effect END */