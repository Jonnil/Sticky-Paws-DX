depth = -bbox_bottom* 0.1;

if (die_volting == 0)
{
	/* Sets the gravity */
	gravity = 0; /* The gravity */
	if (flat)
	{
		/* Image_yscale = lerp(image_yscale, 0.1, 0.2); */
		image_speed = 0.5;
		if image_xscale = -1
		{
			die_volting = -1;
		}
		else
		{
			die_volting = +1;
		}
	}
}

draw_xscale = lerp(draw_xscale, 1, 0.1);
draw_yscale = lerp(draw_yscale, 1, 0.1);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);

if (draw_xscale >= 0.8)
{
	if (place_meeting(x - 1, y, obj_wall))
	|| (place_meeting(x + 1, y, obj_wall))
	|| (place_meeting(x, y - 1, obj_wall))
	|| (place_meeting(x, y + 1, obj_wall))
	{
		if (hspeed < 0)
		{
			die_volting = +1;
			instance_create_depth(bbox_left, y, 0, obj_block_break);
		}
		else
		{
			die_volting = -1;
			instance_create_depth(bbox_right, y, 0, obj_block_break);
		}
	}
}

if (x < camera_get_view_x(view_get_camera(view_current)))
|| (x > camera_get_view_x(view_get_camera(view_current)) + camera_get_view_width(view_get_camera(view_current)))
|| (y < camera_get_view_y(view_get_camera(view_current)))
|| (y > camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
{
	instance_destroy();
}
