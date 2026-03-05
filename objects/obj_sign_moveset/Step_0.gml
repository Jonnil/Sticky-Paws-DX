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

var should_show_textbox = visible
&& (string_length(sign_text) > 0);

if (should_show_textbox)
{
	var textbox_y_offset = max(64, sign_textbox_y_offset);
	
	if (!instance_exists(textbox_id))
	{
		textbox_id = instance_create_depth(x, y, 0, obj_textbox);
		textbox_id.textbox_text = sign_text;
		textbox_id.textbox_y_offset = textbox_y_offset;
	}
	else
	{
		textbox_id.x = x;
		textbox_id.y = y;
		textbox_id.textbox_y_offset = textbox_y_offset;
	}
}
else
if (instance_exists(textbox_id))
{
	with (textbox_id)
	{
		instance_destroy();
	}
	textbox_id = noone;
}

if (global.full_level_map_screenshot)
{
	if (instance_exists(textbox_id))
	{
		with (textbox_id)
		{
			instance_destroy();
		}
		textbox_id = noone;
	}
	
	instance_destroy();
}
