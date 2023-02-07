x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5;

key_a = (gamepad_button_check(0, gp_face1)) or (keyboard_check(global.player1_key_jump));
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))
or (keyboard_check_pressed(global.player1_key_jump));
key_a_released = (gamepad_button_check_released(0, gp_face1))
or (keyboard_check_released(global.player1_key_jump));
key_b = (gamepad_button_check(0, gp_face2))
or (keyboard_check(global.player1_key_sprint));

if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, y - 16, obj_level_width.x - 16, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	if (asset_get_type("spr_level_height") == asset_sprite)
	{
		draw_sprite_ext(spr_level_height, 0, x, y, 1, 1, 0, c_white, 1);
	}
}

#region /* Drag Object */
if (asset_get_type("obj_leveleditor") == asset_object)
and (instance_exists(obj_leveleditor))
and (obj_leveleditor.pause == false)
{
	if (!keyboard_check(vk_space))
	and (!mouse_check_button(mb_middle))
	{
		if (mouse_check_button_pressed(mb_left))
		or (key_a_pressed)
		{
			if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
			{
				if (drag_object < true)
				{
					drag_object = true;
					obj_leveleditor.drag_object = true;
				}
			}
		}
	}
	#region /* Drag the object */
	if (drag_object == true)
	{
		y = obj_leveleditor.y;
	}
	#endregion /* Drag the object END */
	
	#region /* Release the object */
	if (mouse_check_button_released(mb_left))
	or (key_a_released)
	{
		if (drag_object == true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
	#endregion /* Release the object END */
}

#endregion /* Drag Object END */

if drag_release_timer > 0
{
	drag_release_timer -= 1;
}
else
{
	if drag_object = 0.5
	{
		drag_object = false;
		//move_snap(32, 32);
	}
}

#region /* Make sure the level end isn't outside of the level, this code has to be after the drag object code */
if (y < 1080 + 16)
and (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y + 32, l10n_text("Height") + " : " + string(bbox_top), global.default_text_size, c_black, c_red, 1);
	scr_draw_text_outlined(x, y + 64, l10n_text("Warning! Level height shorter than normal"), global.default_text_size * 0.75, c_black, c_red, 1);
}
else
if (global.actually_play_edited_level == false)
and (global.play_edited_level == false)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	scr_draw_text_outlined(x, y + 32, l10n_text("Height") + " : " + string(bbox_top), global.default_text_size, c_black, c_white, 1);
}
#endregion /* Make sure the level end isn't outside of the level, this code has to be after the drag object code END */

if (global.play_edited_level == true)
or (global.actually_play_edited_level == true)
{
	room_height = bbox_top;
	instance_destroy();
}