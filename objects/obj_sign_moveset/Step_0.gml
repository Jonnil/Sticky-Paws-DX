if (!place_meeting(x, y + 1, obj_wall))
&& (bbox_bottom < camera_get_view_y(view_get_camera(view_current)) + camera_get_view_height(view_get_camera(view_current)))
&& (!stop_gravity)
{
	gravity = 0.5;
}
else
{
	gravity = 0;
	hspeed = 0;
	vspeed = 0;
	speed = 0;
}

if (global.show_tutorial_signs)
&& (!global.full_level_map_screenshot)
{
	visible = true;
}
else
{
	visible = false;
}

if (global.full_level_map_screenshot)
{
	instance_destroy();
}
