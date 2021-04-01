draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (asset_get_type("spr_wall") == asset_sprite)
{
	mask_index = spr_wall;
}

#region /*If inside wall, destroy yourself*/
if (position_meeting(x, y, obj_wall))
{
	instance_destroy();
}
#endregion /*If inside wall, destroy yourself END*/

#region /*When falling, it's not bouncing up anymore*/
if (vspeed>=0)
{
	bounceup=false;
}
#endregion /*When falling, it's not bouncing up anymore END*/

#region /*Color the extra live pickup differently if it grants you different amounts of lives*/
if (number_of_extra_lives = 3)
{
	if (asset_get_type("spr_3up") == asset_sprite)
	{
		draw_sprite_ext(spr_3up,image_index,x,y,1,1,0,c_white,1);
	}
	else
	if (sprite_index>noone)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_blue,1);
	}
	draw_text_outlined(x,y,"3-up",global.default_text_size/2,c_white,c_black,1);
}
else
if (number_of_extra_lives = 2)
{
	if (asset_get_type("spr_2up") == asset_sprite)
	{
		draw_sprite_ext(spr_2up,image_index,x,y,1,1,0,c_white,1);
	}
	else
	if (sprite_index>noone)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_lime,1);
	}
	draw_text_outlined(x,y,"2-up",global.default_text_size/2,c_white,c_black,1);
}
else
{
	if (asset_get_type("spr_1up") == asset_sprite)
	{
		draw_sprite_ext(spr_1up,image_index,x,y,1,1,0,c_white,1);
	}
	else
	if (sprite_index>noone)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_red,1);
	}
	draw_text_outlined(x,y,"1-up",global.default_text_size/2,c_white,c_black,1);
}
#endregion /*Color the extra live pickup differently if it grants you different amounts of lives END*/

#region /*Set the gravity*/
gravity_direction = 270; /*Direction of the gravity*/
if (asset_get_type("obj_wall") == asset_object)
and(!place_meeting(x, y + 1, obj_wall))
{
	gravity = 0.5; /*The gravity*/
}
else
{
	gravity = 0;
}
#endregion /*Set the gravity END*/

if (asset_get_type("obj_player") == asset_object)
and(instance_exists(obj_player))
{
	if (allow_move = true)
	{
		if (dir = +1)
		{
			if (instance_nearest(x, y, obj_player).x > x)
			and(instance_nearest(x, y, obj_player).hspeed > +2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed > +8)
				{
					hspeed = +8;
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
			and(instance_nearest(x, y, obj_player).hspeed < -2)
			{
				hspeed = instance_nearest(x, y, obj_player).hspeed;
				if (hspeed < -8)
				{
					hspeed = -8;
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
	and(bounceup = false)
	{
		
		#region /*Give Life*/
		if (number_of_extra_lives = 3)
		{
			lives += 3;
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				obj = instance_create_depth(x, y - 16, 0, obj_scoreup);
				with(obj)
				{
					scoreup = "3-UP";
				}
			}
		}
		else
		if (number_of_extra_lives = 2)
		{
			lives += 2;
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				obj = instance_create_depth(x, y - 16, 0, obj_scoreup);
				with(obj)
				{
					scoreup = "2-UP";
				}
			}
		}
		else
		{
			lives += 1;
			if (asset_get_type("obj_scoreup") == asset_object)
			{
				obj = instance_create_depth(x, y - 16, 0, obj_scoreup);
				with(obj)
				{
					scoreup = "1-UP";
				}
			}
		}
		global.hud_show_lives = true;
		if (asset_get_type("obj_camera") == asset_object)
		and(instance_exists(obj_camera))
		{
			with(obj_camera)
			{
				hud_show_lives_timer = global.hud_show_timer;
			}
		}
		if (asset_get_type("snd_1up") == asset_sound)
		{
			audio_play_sound(snd_1up, 0, 0);
			audio_sound_gain(snd_1up, global.sfx_volume, 0);
		}
		#endregion /*Give Life END*/
		
		effect_create_above(ef_ring, x, y, 1, c_white);
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

#region /*Expanding Ring Effect*/
if effect_time < 60
{
	effect_time += 1;
}
if effect_time > 60
and(global.pause = false)
{
	effect_time = 0;
	effect_create_above(ef_ring, x, y, 1, c_white);
}
#endregion /*Expanding Ring Effect End*/