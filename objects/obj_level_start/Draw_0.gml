key_a = (gamepad_button_check(0, gp_face1))
or(keyboard_check(global.player1_key_jump));
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))
or(keyboard_check_pressed(global.player1_key_jump));
key_a_released = (gamepad_button_check_released(0, gp_face1))
or(keyboard_check_released(global.player1_key_jump));
key_b = (gamepad_button_check(0, gp_face2))
or(keyboard_check(global.player1_key_sprint));
draw_self();

#region /*Drag Object*/
if (asset_get_type("obj_leveleditor") == asset_object)
and(instance_exists(obj_leveleditor))
and(obj_leveleditor.pause = false)
{
	if (!keyboard_check(vk_space))
	and(!mouse_check_button(mb_middle))
	and(!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2))
	{
		if (mouse_check_button_pressed(mb_left))
		or(key_a_pressed)
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
	
	#region /*Drag the object*/
	if (drag_object = true)
	{
		x = obj_leveleditor.x;
		y = obj_leveleditor.y;
	}
	#endregion /*Drag the object END*/
	
	#region /*Release the object*/
	if (mouse_check_button_released(mb_left))
	or(key_a_released)
	{
		if (drag_object = true)
		{
			drag_release_timer = 3;
			drag_object = 0.5;
			obj_leveleditor.drag_object = false;
		}
	}
}
#endregion /*Release the object END*/

#endregion /*Drag Object END*/

if (drag_release_timer > 0)
{
	drag_release_timer -= 1;
}
else
{
	if (drag_object = 0.5)
	{
		drag_object = false;
		move_snap(32, 32);
	}
}

#region /*Make sure the level end isn't outside of the level, this code has to be after the drag object code*/
if (asset_get_type("obj_level_end") == asset_object)
and(instance_exists(obj_level_end))
{
	if (x > obj_level_end.x - 32)
	{
		x = obj_level_end.x - 32;
	}
}
if (x < 0 + sprite_width - 32)
{
	x = 0 + sprite_width - 32
}
if (x > room_width)
{
	x = room_width;
}
if (y < 64)
{
	y = 64
}
if (y > room_height)
{
	y = room_height;
}
#endregion /*Make sure the level end isn't outside of the level, this code has to be after the drag object code END*/

if (global.play_edited_level = true)
or(global.actually_play_edited_level = true)
{
	if (asset_get_type("obj_ground") == asset_object)
	{
		instance_create_depth(x, y, 0, obj_ground);
		instance_create_depth(x - 32, y, 0, obj_ground);
		instance_create_depth(x - 64, y, 0, obj_ground);
		instance_create_depth(x - 96, y, 0, obj_ground);
		instance_create_depth(x - 128, y, 0, obj_ground);
		instance_create_depth(x - 160, y, 0, obj_ground);
		instance_create_depth(x - 192, y, 0, obj_ground);
	}
	if (global.actually_play_edited_level = true)
	{
		global.play_edited_level = true;
		background_visible[6] = false;
		view_xview = x - view_wview / 2;
		view_yview = y - view_hview / 2;
		if (asset_get_type("obj_camera") == asset_object)
		and(!instance_exists(obj_camera))
		{
			#region /*Load Checkpoint*/
			if (file_exists(working_directory + "\Custom Levels\custom_level_save.ini"))
			{
				ini_open(working_directory + "\Custom Levels\custom_level_save.ini");

				if (ini_key_exists("Level" + string(global.level_editor_level), "x_checkpoint"))
				{
					global.x_chekpoint = ini_read_real("Level" + string(global.level_editor_level), "x_checkpoint", 0);
				}
				if (ini_key_exists("Level" + string(global.level_editor_level), "y_checkpoint"))
				{
					global.y_checkpoint = ini_read_real("Level" + string(global.level_editor_level), "y_checkpoint", 0);
				}
				if (ini_key_exists("Level" + string(global.level_editor_level), "checkpoint_millisecond"))
				{
					global.checkpoint_millisecond = ini_read_real("Level" + string(global.level_editor_level), "checkpoint_millisecond", 0);
				}
				if (ini_key_exists("Level" + string(global.level_editor_level), "checkpoint_second"))
				{
					global.checkpoint_second = ini_read_real("Level" + string(global.level_editor_level), "checkpoint_second", 0);
				}
				if (ini_key_exists("Level" + string(global.level_editor_level), "checkpoint_minute"))
				{
					global.checkpoint_minute = ini_read_real("Level" + string(global.level_editor_level), "checkpoint_minute", 0);
				}
				if (ini_key_exists("Level" + string(global.level_editor_level), "checkpoint_realmillisecond"))
				{
					global.checkpoint_realmillisecond = ini_read_real("Level" + string(global.level_editor_level), "checkpoint_realmillisecond", 0);
				}

				if (global.x_checkpoint > 0)
				or(global.y_checkpoint > 0)
				{
					view_xview = global.x_checkpoint - view_wview / 2;
					view_yview = global.y_checkpoint - view_hview / 2;
					instance_create_depth(global.x_checkpoint, global.y_checkpoint, 0, obj_camera);
				}
				else
				{
					instance_create_depth(x - 64, y - 64, 0, obj_camera);
				}
			}
			#endregion /*Load Checkpoint END*/
			
			else
			{
				instance_create_depth(x - 64, y - 64, 0, obj_camera);
			}
		}
	}
	instance_destroy();
}