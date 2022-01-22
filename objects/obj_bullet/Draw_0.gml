#region /*If enemies are disabled, destroy this object*/
if (global.activate_cheats = true)
and (global.enable_enemies = false)
{
	instance_destroy();
}
#endregion /*If enemies are disabled, destroy this object END*/

if (die_volting=-1)
or (die_volting= + 1)
{
	if (die_volting=-1)
	{
		image_angle-=20;
		hspeed = +4;
	}
	else
	{
		image_angle+=20;
		hspeed =-4;
	}
	#region /*Set the gravity*/
	gravity_direction =270;/*Direction of the gravity*/
	gravity = 0.5;/*The gravity*/
	#endregion /*Set the gravity END*/
	
	sprite_index = global.resourcepack_sprite_bullet;
}
else
{
	if (flat = false)
	{
		/*Set the gravity*/
		gravity_direction =270;/*Direction of the gravity*/
		gravity = 0;/*The gravity*/
		sprite_index = global.resourcepack_sprite_bullet;
	}
	else
	if (flat = true)
	{
		gravity_direction =270;/*Direction of the gravity*/
		gravity = 0.5;/*The gravity*/
		image_speed = 0.5;
		sprite_index = global.resourcepack_sprite_bullet_flattened;
		if (image_index > image_number - 1)
		{
			effect_create_above(ef_smoke, x, y, 2, c_white);
			instance_destroy();
		}
	}
}
if (image_xscale < 0)
{
	hspeed =-4;
}
else
{
	hspeed = +4;
}
if (x<camera_get_view_x(view_camera[view_current])-32)
and (image_xscale < 0)
or (x >camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32)
and (image_xscale > 0)
{
	x= 0;
	y = 0;
	instance_destroy();
}
draw_xscale =lerp(draw_xscale, 1, 0.075);
draw_yscale =lerp(draw_yscale, 1, 0.075);
draw_sprite_ext(sprite_index, image_index,x, y,draw_xscale*sign(image_xscale),draw_yscale, image_angle, image_blend, image_alpha);
if (draw_xscale >= 0.8)
and (asset_get_type("obj_wall") == asset_object)
{
	if (place_meeting(x - 1, y, obj_wall))
	or (place_meeting(x + 1, y, obj_wall))
	{
		effect_create_above(ef_smoke, x, y, 2, c_white);
		instance_destroy();
	}
}
if (image_xscale = -1)
and (x<camera_get_view_x(view_camera[view_current])-32)
or (image_xscale = +1)
and (x >camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + 32)
{
	x= 0;
	y = 0;
	instance_destroy();
}

#region /*Kill enemy if it's inside the wall*/
if (position_meeting(x, y, obj_wall))
and (die = false)
and (draw_xscale >= 0.8)
{
	flat = false;
	die = true;
	die_volting = true;
}
#endregion /*Kill enemy if it's inside the wall END*/