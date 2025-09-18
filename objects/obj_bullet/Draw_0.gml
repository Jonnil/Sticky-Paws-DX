if (die_volting == 0)
{
	if (!flat)
	{
		/* Set the gravity */
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0; /* The gravity */
		sprite_index = global.resource_pack_sprite_bullet;
	}
	else
	if (flat)
	{
		gravity_direction = 270; /* Direction of the gravity */
		gravity = 0.5; /* The gravity */
		image_speed = 0.5;
		sprite_index = global.resource_pack_sprite_bullet_flattened;
		if (image_index > image_number - 1)
		{
			if (instance_exists(obj_foreground_secret))
			&& (place_meeting(x, y, obj_foreground_secret))
			&& (obj_foreground_secret.image_alpha < 0.5)
			|| (instance_exists(obj_foreground_secret))
			&& (!place_meeting(x, y, obj_foreground_secret))
			{
				effect_create_depth(depth - 1, ef_smoke, x, y, 2, c_white);
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

var view_left = camera_get_view_x(view_get_camera(view_current)) - 22;
var view_right = (camera_get_view_x(view_get_camera(view_current))) + (camera_get_view_width(view_get_camera(view_current))) + 22;

if (instance_exists(obj_camera))
&& (x < view_left)
&& (image_xscale < 0)
&& (draw_xscale >= 0.8)
|| (instance_exists(obj_camera))
&& (x > view_right)
&& (image_xscale > 0)
&& (draw_xscale >= 0.8)
{
	instance_destroy();
	x = 0;
	y = 0;
}
draw_xscale = lerp(draw_xscale, 1, 0.05);
draw_yscale = lerp(draw_yscale, 1, 0.05);
draw_sprite_ext(sprite_index, image_index, x, y, draw_xscale * sign(image_xscale), draw_yscale, image_angle, image_blend, image_alpha);
