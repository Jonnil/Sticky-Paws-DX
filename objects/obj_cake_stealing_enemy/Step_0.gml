var view_left = camera_get_view_x(view_camera[view_current]) - 42;
var view_right = (camera_get_view_x(view_camera[view_current])) + (camera_get_view_width(view_camera[view_current])) + 42;
var view_top = camera_get_view_y(view_camera[view_current]) - 42;
var view_bottom = (camera_get_view_y(view_camera[view_current])) + (camera_get_view_height(view_camera[view_current])) + 42;

#region /* Save to variable when on ground */
if (place_meeting(x, y + 1, obj_wall)) /* If there is wall underneath */
|| (collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_semisolid_platform, false, true)) /* If there is semisolid platform underneath */
{
	on_ground = true;
}
else
{
	on_ground = false;
}
#endregion /* Save to variable when on ground */

if (x > view_right && hspeed > 0)
|| (x < view_left && hspeed < 0)
|| (y > view_bottom && vspeed > 0)
|| (y < view_top && vspeed < 0)
{
	hspeed = 0;
	vspeed = 0;
	speed = 0;
	gravity = 0;
	friction = 500;
}
else
{
	friction = 0;
}

#region /* Set the gravity */
gravity_direction = 270; /* Direction of the gravity */
if (!on_ground)
{
	gravity = 0.5; /* The gravity */
}
else
{
	gravity = 0;
}
#endregion /* Set the gravity END */

if (cutscene == 0)
{
	time++;
	if (time >= 60 * 2.3)
	{
		if (place_meeting(x + 1, y, obj_wall))
		{
			sprite_index = global.resource_pack_sprite_basic_enemy;
			hspeed = 0;
			image_xscale = -1;
		}
		else
		{
			sprite_index = global.resource_pack_sprite_basic_enemy_angry;
			hspeed = +7;
			image_xscale = +1;
			visible = true;
		}
	}
}
else
if (cutscene == 1) /* When placed in level, use this cutscene value */
{
	if (instance_exists(obj_player))
	{
		if (distance_to_object(obj_player) < 256) || (instance_nearest(x, y, obj_player).bbox_right >= bbox_left && !collision_line(x, y, instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y, obj_wall, false, true))
		{
			time += 30;
		}
	}
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= 1 && !place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy_angry;
		hspeed = +12;
		image_xscale = +1;
	}
}
else
if (cutscene = 2)
{
	time++;
	if (place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy;
		hspeed = 0;
		image_xscale = -1;
	}
	else
	if (time >= 60 * 2)
	&& (!place_meeting(x + 1, y, obj_wall))
	{
		sprite_index = global.resource_pack_sprite_basic_enemy_angry;
		hspeed = +7;
		image_xscale = +1;
	}
}
