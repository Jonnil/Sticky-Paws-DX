if (!die)
{
	while (place_meeting(x, y, other))
	{
		x += lengthdir_x(0.5, point_direction(other.x, other.y, x, y));
		y += lengthdir_y(0.5, point_direction(other.x, other.y, x, y));
	}
	if (place_meeting(x, bbox_bottom + 1, other))
	{
		vspeed = 0;
		gravity = 0;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
	if (place_meeting(x, y - 1, other))
	{
		vspeed += 4;
		draw_xscale = 1.25;
		draw_yscale = 0.75;
	}
	if (position_meeting(bbox_left - 1, bbox_bottom - 8, other))
	|| (position_meeting(bbox_left - 1, bbox_top + 8, other))
	{
		hspeed = 0;
		draw_xscale = 0.75;
		draw_yscale = 1.25;
	}
	if (position_meeting(bbox_right + 1, bbox_bottom - 8, other))
	|| (position_meeting(bbox_right + 1, bbox_top + 8, other))
	{
		hspeed = 0;
		draw_xscale = 0.75;
		draw_yscale = 1.25;
	}
}

if (sprite_index == spr_boss_fall)
{
	sprite_index = spr_boss_stand;
}

if (place_meeting(x, y + 1, obj_wall))
&& (vspeed >= 0)
&& (flying_back == 1)
{
	hspeed = 0;
	vspeed = 0;
	mask_index = spr_boss_vulnerable;
	sprite_index = spr_boss_vulnerable;
	time = -100;
	image_speed = 0.5;
	flying_back = false;
}