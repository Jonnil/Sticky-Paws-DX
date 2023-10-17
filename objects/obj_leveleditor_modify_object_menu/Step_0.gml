if (keyboard_check_pressed(vk_enter))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.accept]))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.accept]))
|| (mouse_check_button_released(mb_left))
{
	if (menu == "ok")
	{
		if (instance_exists(instance_nearest(x, y, obj_leveleditor_placed_object)))
		{
			instance_nearest(x, y, obj_leveleditor_placed_object).second_x = string(keyboard_string);
		}
		quit_modify_object_menu = true;
	}
	else
	if (menu == "cancel")
	{
		quit_modify_object_menu = true;
	}
}
if (keyboard_check_pressed(vk_escape))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][1][action.back]))
|| (gamepad_button_check_pressed(global.player_slot[1], global.player_[inp.gp][1][2][action.back]))
|| (mouse_check_button_released(mb_left))
{
	quit_modify_object_menu = true;
}

if (quit_modify_object_menu == true)
{
	if (instance_exists(obj_leveleditor))
	{
		obj_leveleditor.menu_delay = 10;
		obj_leveleditor.drag_object = false;
	}
	var time_source = time_source_create(time_source_game, 10, time_source_units_frames, function(){
		if (instance_exists(obj_leveleditor))
		{
			obj_leveleditor.modify_object_menu = false;
			obj_leveleditor.menu_delay = 10;
			obj_leveleditor.drag_object = false;
		}
	}, [], 1);
	time_source_start(time_source);
	instance_destroy();
}