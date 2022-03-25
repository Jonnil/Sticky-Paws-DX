#region /*Fullscreen Toggle if camera doesn't exist. Default: F11*/
if (keyboard_check_pressed(global.fullscreen_key))
{
	if (window_get_fullscreen())
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
	ini_open("config.ini");
	ini_write_real("config", "fullscreen_mode", window_get_fullscreen());
	ini_close();
}
#endregion /*Fullscreen Toggle if camera doesn't exist. Default: F11 END*/

scr_parallax_scrolling_background();

#region /*Deactivate instances outside view*/
if (startup_loading_timer <= 3)
{
	startup_loading_timer += 1;
}

if (quit_level_editor = 0)
and (global.play_edited_level = false)
and (startup_loading_timer >= 3)
{
	instance_activate_all();
	if (global.deactivate_objects_outsiede_view= true)
	{
		instance_deactivate_region(
		camera_get_view_x(view_camera[0]) - 32,
		camera_get_view_y(view_camera[0]) - 32,
		camera_get_view_width(view_camera[0]) + 32 /*Camera Width*/,
		camera_get_view_height(view_camera[0]) + 32 /*Camera Height*/,
		false, true);
	}
}
else
{
	instance_activate_all();
}

#region /*Activate objects that always should be active*/
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_die") == asset_object)
{
	instance_activate_object(obj_player_die);
}
if (asset_get_type("obj_foreground1") == asset_object)
{
	instance_activate_object(obj_foreground1);
}
if (asset_get_type("obj_foreground_above_static_objects") == asset_object)
{
	instance_activate_object(obj_foreground_above_static_objects);
}
if (asset_get_type("obj_foreground2") == asset_object)
{
	instance_activate_object(obj_foreground2);
}
if (asset_get_type("obj_foreground_secret") == asset_object)
{
	instance_activate_object(obj_foreground_secret);
}
if (asset_get_type("obj_level_player_1_start") == asset_object)
{
	instance_activate_object(obj_level_player_1_start);
}
if (asset_get_type("obj_level_player_2_start") == asset_object)
{
	instance_activate_object(obj_level_player_2_start);
}
if (asset_get_type("obj_level_player_3_start") == asset_object)
{
	instance_activate_object(obj_level_player_3_start);
}
if (asset_get_type("obj_level_player_4_start") == asset_object)
{
	instance_activate_object(obj_level_player_4_start);
}
if (asset_get_type("obj_level_end") == asset_object)
{
	instance_activate_object(obj_level_end);
}
if (asset_get_type("obj_level_height") == asset_object)
{
	instance_activate_object(obj_level_height);
}
if (asset_get_type("obj_level_width") == asset_object)
{
	instance_activate_object(obj_level_width);
}
if (asset_get_type("obj_background_brightness_gameplay") == asset_object)
{
	instance_activate_object(obj_background_brightness_gameplay);
}
#endregion /*Activate objects that always should be active END*/

#endregion /*Deactivate instances outside view END*/

#region /*Always keep the brush size within these values*/
if (place_brush_size < 0)
{
	place_brush_size = 0;
}
if (place_brush_size >5)
{
	place_brush_size = 5;
}
if (erase_brush_size < 0)
{
	erase_brush_size = 0;
}
if (erase_brush_size >5)
{
	erase_brush_size = 5;
}
#endregion /*Always keep the brush size within these values END*/

if (window_get_height() != old_window_get_height)
or(window_get_width() != old_window_get_width)
{
	scr_set_screen_size();
	old_window_get_height = window_get_height();
	old_window_get_width = window_get_width();
}

#region /*Play Level when pressing Enter Key*/
if (keyboard_check_pressed(vk_enter))
or(gamepad_button_check_pressed(0, gp_select))
or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x -32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
and (mouse_check_button_pressed(mb_left))
or (global.full_level_map_screenshot = true)
{
	if (pause = false)
	and (menu_delay = 0)
	and (global.character_select_in_this_menu = "level_editor")
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	{
		instance_activate_all(); /*Activate all instances before saving the custom level*/
		
		if (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
		and (!place_meeting(x, y, obj_leveleditor_placed_object))
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height()/ 2 - 32, window_get_width(), window_get_height()/ 2 + 32))
		and (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		{
			
			#region /*Limit so cursor and view can't go outside room*/
			if (camera_get_view_width(view_camera[view_current]) < 1920)
			or(camera_get_view_height(view_camera[view_current]) < 1080)
			{
				camera_set_view_size(view_camera[view_current], 1920, 1080);
			}
			scr_set_screen_size();
			#region /*Limit controller x and controller y inside room*/
			if (controller_x < camera_get_view_x(view_camera[view_current]))
			{
				controller_x = camera_get_view_x(view_camera[view_current]);
			}
			if (controller_x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			{
				controller_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
			}
			if (controller_y < camera_get_view_y(view_camera[view_current]))
			{
				controller_y = camera_get_view_y(view_camera[view_current]);
			}
			if (controller_y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			{
				controller_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
			}
			#endregion /*Limit controller x and controller y inside room END*/
			#region /*Limit x and y inside room*/
			if (x < camera_get_view_x(view_camera[view_current]))
			{
				x = camera_get_view_x(view_camera[view_current]);
			}
			if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			{
				x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
			}
			if (y < camera_get_view_y(view_camera[view_current]))
			{
				y = camera_get_view_y(view_camera[view_current]);
			}
			if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			{
				y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
			}
			#endregion /*Limit x and y inside room END*/
			#region /*Limit view inside room*/
			camera_set_view_pos(view_camera[view_current],
			max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
			max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
			#endregion /*Limit view inside room END*/
			#endregion /*Limit so view and cursor can't go outside room END*/
			
			global.x_checkpoint = 0;
			global.y_checkpoint = 0;
			global.checkpoint_millisecond = 0;
			global.checkpoint_second = 0;
			global.checkpoint_minute = 0;
			global.checkpoint_realmillisecond = 0;
			
			ini_open(working_directory + "/save_files/custom_level_save.ini");
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", 0);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", 0);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
			ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
			ini_close();
			
			#region /*Save Thumbnail*/
			var thumbnail_sprite;
			
			/*thumbnail_sprite = sprite_create_from_surface(application_surface,
			camera_get_view_x(view_camera[view_current]),
			camera_get_view_y(view_camera[view_current]),
			camera_get_view_width(view_camera[view_current]),
			camera_get_view_height(view_camera[view_current]), false, true, 0, 0);*/
			
			thumbnail_sprite = sprite_create_from_surface(application_surface,
			0,
			0,
			camera_get_view_width(view_camera[view_current]),
			camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
			
			if (global.select_level_index >= 1)
			and (global.create_level_from_template = false)
			{
				sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
			}
			else
			if (global.level_name != "")
			{
				sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
			}
			sprite_delete(thumbnail_sprite);
			#endregion /*Save Thumbnail END*/
			
			menu_delay = 999; /*Disable all menu control*/
			scr_save_custom_level();
			lives = 5;
			global.lives_until_assist = 0;
			global.actually_play_edited_level = false;
			global.play_edited_level = true;
			global.character_select_in_this_menu = "level_editor";
			if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x -32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
			or (global.full_level_map_screenshot = true)
			{
				instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_camera);
			}
			else
			{
				instance_create_depth(x, y, 0, obj_camera);
			}
			instance_destroy();
		}
	}
}
#endregion /*Play Level when pressing Enter Key END*/

#region /*Scroll View*/
if (mouse_check_button_pressed(mb_left))
and (keyboard_check(vk_space))
and (quit_level_editor <= 0)
or(mouse_check_button_pressed(mb_middle))
and (quit_level_editor <= 0)
{
	if (pause = false)
	and (!instance_exists(obj_leveleditor_fill))
	{
		drag_x = mouse_x;
		drag_y = mouse_y;
		scroll_view = true;
	}
}
if (scroll_view = true)
and (quit_level_editor <= 0)
and (pause = false)
and (!instance_exists(obj_leveleditor_fill))
{
	camera_set_view_pos(view_camera[view_current], drag_x -(mouse_x -camera_get_view_x(view_camera[view_current])), drag_y-(mouse_y-camera_get_view_y(view_camera[view_current])));
}
if (!mouse_check_button(mb_left))
and (!mouse_check_button(mb_middle))
and (scroll_view = true)
{
	scroll_view = false;
}
#endregion /*Scroll View END*/

if (global.create_level_from_template = true)
and (create_level_from_template_save_delay < 10)
{
	create_level_from_template_save_delay += 1;
}
else
if (global.create_level_from_template = true)
and (create_level_from_template_save_delay = 10)
{
	
	#region /*Limit so cursor and view can't go outside room*/
	if (camera_get_view_width(view_camera[view_current]) < 1920)
	or(camera_get_view_height(view_camera[view_current]) < 1080)
	{
		camera_set_view_size(view_camera[view_current], 1920, 1080);
	}
	scr_set_screen_size();
	
	#region /*Limit controller x and controller y inside room*/
	if (controller_x < camera_get_view_x(view_camera[view_current]))
	{
		controller_x = camera_get_view_x(view_camera[view_current]);
	}
	if (controller_x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	{
		controller_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
	}
	if (controller_y < camera_get_view_y(view_camera[view_current]))
	{
		controller_y = camera_get_view_y(view_camera[view_current]);
	}
	if (controller_y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	{
		controller_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
	}
	#endregion /*Limit controller x and controller y inside room END*/
	
	#region /*Limit x and y inside room*/
	if (x < camera_get_view_x(view_camera[view_current]))
	{
		x = camera_get_view_x(view_camera[view_current]);
	}
	if (x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
	{
		x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
	}
	if (y < camera_get_view_y(view_camera[view_current]))
	{
		y = camera_get_view_y(view_camera[view_current]);
	}
	if (y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
	{
		y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
	}
	#endregion /*Limit x and y inside room END*/
	
	#region /*Limit view inside room*/
	camera_set_view_pos(view_camera[view_current],
	max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
	max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
	#endregion /*Limit view inside room END*/
	
	#endregion /*Limit so view and cursor can't go outside room END*/
	
	global.x_checkpoint = 0;
	global.y_checkpoint = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	
	ini_open(working_directory + "/save_files/custom_level_save.ini");
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
	ini_close();
	
	#region /*Save Thumbnail*/
	var thumbnail_sprite;
	thumbnail_sprite = sprite_create_from_surface(application_surface,
	camera_get_view_x(view_camera[view_current]),
	camera_get_view_y(view_camera[view_current]),
	camera_get_view_width(view_camera[view_current]),
	camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
	if (global.select_level_index >= 1)
	and (global.create_level_from_template = false)
	{
		sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
	}
	else
	if (global.level_name != "")
	{
		sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
	}
	sprite_delete(thumbnail_sprite);
	#endregion /*Save Thumbnail END*/
	
	menu_delay = 999; /*Disable all menu control*/
	scr_save_custom_level();
	lives = 5;
	global.lives_until_assist = 0;
	global.actually_play_edited_level = false;
	global.play_edited_level = false; /*Set this to false so you don't playtest the level*/
	global.character_select_in_this_menu = "level_editor";
	create_level_from_template_save_delay += 1; /*Stop saving template level*/
}

#region /*Menu cursor image speed*/
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /*Menu cursor image speed END*/