#region /*Controls for level editor*/
gamepad_set_axis_deadzone(0, 0.5);
key_up = (keyboard_check_pressed(global.player1_key_up)) and (!keyboard_check_pressed(global.player1_key_down))or(keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down))or(keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S")))or(gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd))or(gamepad_axis_value(0, gp_axislv) < 0);
key_left = (keyboard_check_pressed(global.player1_key_left)) and (!keyboard_check_pressed(global.player1_key_right))or(keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right))or(keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D")))or(gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr))or(gamepad_axis_value(0, gp_axislh) < 0);
key_right = (keyboard_check_pressed(global.player1_key_right)) and (!keyboard_check_pressed(global.player1_key_left))or(keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left))or(keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A")))or(gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl))or(gamepad_axis_value(0, gp_axislh) > 0);
key_down = (keyboard_check_pressed(global.player1_key_down)) and (!keyboard_check_pressed(global.player1_key_up))or(keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up))or(keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W")))or(gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu))or(gamepad_axis_value(0, gp_axislv) > 0);
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1))or(keyboard_check_pressed(global.player1_key_jump))or(keyboard_check_pressed(ord("Z")))or(keyboard_check_pressed(vk_space))or(keyboard_check_pressed(vk_enter));
key_a_released = (gamepad_button_check_released(0, gp_face1))or(keyboard_check_released(global.player1_key_jump))or(keyboard_check_released(ord("Z")));
key_a_hold = (gamepad_button_check(0, gp_face1))or(keyboard_check(global.player1_key_jump))or(keyboard_check(ord("Z")));
key_b_hold = (gamepad_button_check(0, gp_face2))or(keyboard_check(global.player1_key_sprint))or(keyboard_check(ord("X")))or(keyboard_check(vk_backspace));
key_b_pressed = (gamepad_button_check_pressed(0, gp_face2))or(keyboard_check_pressed(global.player1_key_sprint))or(keyboard_check_pressed(ord("X")))or(keyboard_check_pressed(vk_backspace))or(mouse_check_button_pressed(mb_right))or(mouse_check_button_pressed(mb_side1));
key_b_released = (gamepad_button_check_released(0, gp_face2))or(keyboard_check_released(global.player1_key_sprint))or(keyboard_check_released(ord("X")))or(keyboard_check_released(vk_backspace));
#endregion /*Controls for level editor END*/

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
if (asset_get_type("obj_water_level_height") == asset_object)
{
	instance_activate_object(obj_water_level_height);
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
if (place_brush_size > 5)
{
	place_brush_size = 5;
}
if (erase_brush_size < 0)
{
	erase_brush_size = 0;
}
if (erase_brush_size > 5)
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
or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
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
		or(point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height() / 2 - 32, window_get_width(), window_get_height() / 2 + 32))
		and (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		or (global.full_level_map_screenshot = true)
		{
			
			#region /*Limit so cursor and view can't go outside room*/
			if (camera_get_view_width(view_camera[view_current]) < 1920)
			or(camera_get_view_height(view_camera[view_current]) < 1080)
			{
				camera_set_view_size(view_camera[view_current], 1920, 1080);
			}
			if (asset_get_type("scr_set_screen_size") == asset_script)
			{
				scr_set_screen_size();
			}
			
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
			
			menu_delay = 9999; /*Disable all menu control*/
			lives = 5;
			global.lives_until_assist = 0;
			global.actually_play_edited_level = false;
			global.play_edited_level = true;
			global.character_select_in_this_menu = "level_editor";
			
			if (global.world_editor = false)
			{
				ini_open(working_directory + "/save_files/custom_level_save.ini");
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "x_checkpoint", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "y_checkpoint", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
				ini_close();
				
				#region /*Save Level Thumbnail*/
				var thumbnail_sprite;
				thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
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
				#endregion /*Save Level Thumbnail END*/
				
				if (asset_get_type("scr_save_custom_level") == asset_script)
				{
					scr_save_custom_level();
				}
				
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
				or (global.full_level_map_screenshot = true)
				{
					instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_camera);
				}
				else
				{
					instance_create_depth(x, y, 0, obj_camera);
				}
			}
			else
			{
				
				#region /*Save World Thumbnail*/
				var thumbnail_sprite;
				thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
				if (global.select_level_index >= 1)
				and (global.create_level_from_template = false)
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
				}
				else
				if (global.level_name != "")
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(global.level_name) + "/automatic_thumbnail.png");
				}
				sprite_delete(thumbnail_sprite);
				#endregion /*Save World Thumbnail END*/
				
				if (asset_get_type("scr_save_custom_world") == asset_script)
				{
					scr_save_custom_world();
				}
				
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
				or (global.full_level_map_screenshot = true)
				{
					instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_player_map);
				}
				else
				{
					if (instance_exists(obj_level))
					{
						instance_create_depth(instance_nearest(x, y, obj_level).x, instance_nearest(x, y, obj_level).y, 0, obj_player_map);
					}
					else
					{
						instance_create_depth(x, y, 0, obj_player_map);
					}
				}
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
if (mouse_check_button_released(mb_left))
and (scroll_view = true)
or (mouse_check_button_released(mb_middle))
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
	
	menu_delay = 10; /*Disable all menu control*/
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

if (quit_level_editor <= 0)
{
	
	#region /*Controller Input Changes*/
	if (global.controls_used_for_menu_navigation != "controller")
	{
		x = mouse_x;
		y = mouse_y;
		cursor_x = window_mouse_get_x();
		cursor_y = window_mouse_get_y();
		controller_x = window_mouse_get_x();
		controller_y = window_mouse_get_y();
		
		if (keyboard_check(vk_control))
		{
			controller_view_speed = 16;
		}
		else
		{
			controller_view_speed = 8;
		}
		
		if (pause = false)
		{
			if (keyboard_check(global.player1_key_up)) and (!keyboard_check(global.player1_key_down))or(keyboard_check(vk_up)) and (!keyboard_check(vk_down))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed);
			}
			if (keyboard_check(global.player1_key_down)) and (!keyboard_check(global.player1_key_up))or(keyboard_check(vk_down)) and (!keyboard_check(vk_up))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed);
			}
			if (keyboard_check(global.player1_key_left)) and (!keyboard_check(global.player1_key_right))or(keyboard_check(vk_left)) and (!keyboard_check(vk_right))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current]));
			}
			if (keyboard_check(global.player1_key_right)) and (!keyboard_check(global.player1_key_left))or(keyboard_check(vk_right)) and (!keyboard_check(vk_left))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) + controller_view_speed, camera_get_view_y(view_camera[view_current]));
			}
		}
		#endregion /*Move view with gamepad END*/
		
	}
	else
	if (global.controls_used_for_menu_navigation = "controller")
	{
		x = controller_x;
		y = controller_y;
		cursor_x = controller_x;
		cursor_y = controller_y;
		
		#region /*Keep controller_x and controller_y within view*/
		if (controller_x < camera_get_view_x(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]);
		}
		else
		if (controller_x > camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			controller_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]);
		}
		else
		if (controller_y < camera_get_view_y(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]);
		}
		else
		if (controller_y > camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			controller_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]);
		}
		#endregion /*Keep controller_x and controller_y within view END*/
		
		if (key_up)
		and (controller_y > camera_get_view_y(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or(gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_y-= 8;
			}
			else
			{
				controller_y-= 4;
			}
		}
		if (key_down)
		and (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or(gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_y += 8;
			}
			else
			{
				controller_y += 4;
			}
		}
		if (key_left)
		and (controller_x > camera_get_view_x(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or(gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_x -= 8;
			}
			else
			{
				controller_x -= 4;
			}
		}
		if (key_right)
		and (controller_x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or(gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_x += 8;
			}
			else
			{
				controller_x += 4;
			}
		}
		
		#region /*Move view with gamepad*/
		if (gamepad_button_check(0, gp_face3))
		or (gamepad_button_check(0, gp_face4))
		or (gamepad_button_check(0, gp_stickl))
		{
			controller_view_speed = 16;
		}
		else
		{
			controller_view_speed = 8;
		}
		
		if (gamepad_axis_value(0, gp_axisrv) < 0)
		or (key_up)
		and (controller_y <= camera_get_view_y(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed);
			if (controller_y > camera_get_view_y(view_camera[view_current]))
			{
				controller_y -= controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrv) > 0)
		or (key_down)
		and (controller_y >= camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed);
			if (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			{
				controller_y += controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrh) < 0)
		or (key_left)
		and (controller_x <= camera_get_view_x(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current]));
			if (controller_x > camera_get_view_x(view_camera[view_current]))
			{
				controller_x -= controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrh) > 0)
		or (key_right)
		and (controller_x >= camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) + controller_view_speed, camera_get_view_y(view_camera[view_current]));
			if (controller_x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			{
				controller_x += controller_view_speed;
			}
		}
		#endregion /*Move view with gamepad END*/
		
	}
	#endregion /*Controller Input Changes END*/
	
	move_snap(global.grid_hsnap, global.grid_vsnap); /*Make sure to always move snap*/
	
	#region /*Place Object*/
	if (can_make_place_brush_size_bigger = false)
	and (mouse_check_button_pressed(mb_left))
	and (scroll_view = false)
	or(can_make_place_brush_size_bigger = true)
	and (mouse_check_button(mb_left))
	and (scroll_view = false)
	or (can_make_place_brush_size_bigger = false)
	and (key_a_released)
	and (scroll_view = false)
	or (can_make_place_brush_size_bigger = true)
	and (gamepad_button_check(0, gp_face1))
	and (scroll_view = false)
	or (can_make_place_brush_size_bigger = true)
	and (keyboard_check(ord("Z")))
	and (scroll_view = false)
	{
		if (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		and (!mouse_check_button(mb_right))
		and (drag_object = false)
		and (fill_mode = false)
		and (erase_mode = false)
		and (pause = false)
		and (menu_delay = 0)
		and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
		and (asset_get_type("obj_level_player_1_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_1_start))
		and (asset_get_type("obj_level_player_2_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_2_start))
		and (asset_get_type("obj_level_player_3_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_3_start))
		and (asset_get_type("obj_level_player_4_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_4_start))
		and (asset_get_type("obj_level_height") == asset_object)
		and (!position_meeting(x, y, obj_level_height))
		and (asset_get_type("obj_level_width") == asset_object)
		and (!position_meeting(x, y, obj_level_width))
		and (asset_get_type("obj_water_level_height") == asset_object)
		and (!position_meeting(x, y, obj_water_level_height))
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /*Can't place objects when clicking the top buttons*/
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height() / 2 - 32, window_get_width(), window_get_height() / 2 + 32)) /*Can't place objects when clicking the play button*/
		{
			if (show_grid = true)
			and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32)) /*Up and down buttons when grid is on*/
			or (show_grid = false)
			{
				if (set_difficulty_mode = true)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
				or(set_difficulty_mode = false)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
				{
					
					drag_object = false;
					
					#region /*Brush size 1*/
					if (!place_meeting(x, y, obj_leveleditor_placed_object))
					and (can_put_objects_above_other_objects = false)
					or(can_put_objects_above_other_objects = true)
					and (mouse_check_button_pressed(mb_left))
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x, y, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						obj.place_object_angle = true;
						obj.undo_value = obj_leveleditor.current_undo_value; /*Undo and Redo handeling*/
						obj.placed_for_the_first_time = true;
					
						#region /*When placing on difficulty layer*/
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer = 2)
							{
								obj.easy = false;
								obj.normal = true;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer >= 3)
							{
								obj.easy = false;
								obj.normal = false;
								obj.hard = true;
							}
						}
						#endregion /*When placing on difficulty layer END*/
					
						if (asset_get_type("snd_leveleditor_place_object") == asset_sound)
						{
							audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
							audio_play_sound(snd_leveleditor_place_object, 0, 0);
							audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);
						}
					}
					#endregion /*Brush size 1 END*/
					
					#region /*Brush size 2*/
					if (!place_meeting(x + 32, y, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 1)
					and (can_put_objects_above_other_objects = false)
					or(obj_leveleditor.place_brush_size >= 1)
					and (can_put_objects_above_other_objects = true)
					and (mouse_check_button_pressed(mb_left))
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x + 32, y, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						obj.undo_value = obj_leveleditor.current_undo_value; /*Undo and Redo handeling*/
						obj.placed_for_the_first_time = true;
					
						#region /*When placing on difficulty layer*/
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer = 2)
							{
								obj.easy = false;
								obj.normal = true;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer >= 3)
							{
								obj.easy = false;
								obj.normal = false;
								obj.hard = true;
							}
						}
						#endregion /*When placing on difficulty layer END*/
			
						if (asset_get_type("snd_leveleditor_place_object") == asset_sound)
						{
							audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
							audio_play_sound(snd_leveleditor_place_object, 0, 0);
							audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);
						}
					}
					if (!place_meeting(x + 32, y + 32, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 1)
					and (can_put_objects_above_other_objects = false)
					or(obj_leveleditor.place_brush_size >= 1)
					and (can_put_objects_above_other_objects = true)
					and (mouse_check_button_pressed(mb_left))
				
					{
						obj = instance_create_depth(x + 32, y + 32, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						obj.undo_value = obj_leveleditor.current_undo_value; /*Undo and Redo handeling*/
						obj.placed_for_the_first_time = true;
					
						#region /*When placing on difficulty layer*/
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer = 2)
							{
								obj.easy = false;
								obj.normal = true;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer >= 3)
							{
								obj.easy = false;
								obj.normal = false;
								obj.hard = true;
							}
						}
						#endregion /*When placing on difficulty layer END*/
					
						if (asset_get_type("snd_leveleditor_place_object") == asset_sound)
						{
							audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
							audio_play_sound(snd_leveleditor_place_object, 0, 0);
							audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);
						}
					}
					if (!place_meeting(x, y + 32, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 1)
					and (can_make_place_brush_size_bigger = true)
					{
						obj = instance_create_depth(x, y + 32, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/
						obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/
						obj.placed_for_the_first_time = true;
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer = 2)
							{
								obj.easy = false;
								obj.normal = true;
								obj.hard = false;
							}
							else
							if (obj_leveleditor.difficulty_layer >= 3)
							{
								obj.easy = false;
								obj.normal = false;
								obj.hard = true;
							}
						}
						/*When placing on difficulty layer END*/
						if (asset_get_type("snd_leveleditor_place_object") == asset_sound)
						{
							audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));
							audio_play_sound(snd_leveleditor_place_object, 0, 0);
							audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);
						}
					}
					#endregion /*Brush size 2 END*/
					
					#region /*Brush size 3*/
					if (!place_meeting(x + 32, y - 32, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 2)
					and (can_make_place_brush_size_bigger = true)
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x + 32, y - 32, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						/*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value;
						/*When placing on difficulty layer*/obj.placed_for_the_first_time = true;
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if (!place_meeting(x, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x, y - 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if (!place_meeting(x - 32, y - 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y - 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if (!place_meeting(x - 32, y, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if (!place_meeting(x - 32, y + 32, obj_leveleditor_placed_object)) and (obj_leveleditor.place_brush_size >= 2) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y + 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					#endregion /*Brush size 3 END*/
					
					#region /*Brush size 4 */
					if (!place_meeting(x + 64, y - 32, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 3)
					and (can_make_place_brush_size_bigger = true)
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x + 64, y - 32, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						/*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value;
						/*When placing on difficulty layer*/obj.placed_for_the_first_time = true;
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 64, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 64, y, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 64, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 64, y + 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 64, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 64, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 32, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 32, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 32, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 3) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					#endregion /*Brush size 4 END*/
					
					#region /*Brush size 5*/
					if (!place_meeting(x + 64, y - 64, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 4)
					and (can_make_place_brush_size_bigger = true)
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x + 64, y - 64, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						/*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value;
						/*When placing on difficulty layer*/obj.placed_for_the_first_time = true;
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 32, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 32, y - 64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x, y - 64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 32, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y - 64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y - 64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y - 64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y - 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y + 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 4) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					#endregion /*Brush size 5 END*/
					
					#region /*Brush size 6*/
					if (!place_meeting(x +96, y - 64, obj_leveleditor_placed_object))
					and (obj_leveleditor.place_brush_size >= 5)
					and (can_make_place_brush_size_bigger = true)
					{
						obj_leveleditor.placing_object = 1;
						obj = instance_create_depth(x +96, y - 64, 0, obj_leveleditor_placed_object);
						obj.object = obj_leveleditor.place_object;
						/*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value;
						/*When placing on difficulty layer*/obj.placed_for_the_first_time = true;
						if (obj_leveleditor.set_difficulty_mode = true)
						{
							if (obj_leveleditor.difficulty_layer = 1)
							{
								obj.easy = true;
								obj.normal = false;
								obj.hard = false;
							}
							else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x +96, y - 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x +96, y - 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x +96, y, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x +96, y, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x +96, y + 32, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x +96, y + 32, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x +96, y+64, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x +96, y+64, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x +96, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x +96, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 64, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 64, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x + 32, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x + 32, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 32, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 32, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					if!place_meeting(x - 64, y+96, obj_leveleditor_placed_object) and (obj_leveleditor.place_brush_size >= 5) and (can_make_place_brush_size_bigger = true){obj = instance_create_depth(x - 64, y+96, 0, obj_leveleditor_placed_object);obj.object = obj_leveleditor.place_object; /*Undo and Redo handeling*/obj.undo_value = obj_leveleditor.current_undo_value; /*When placing on difficulty layer*/obj.placed_for_the_first_time = true;if (obj_leveleditor.set_difficulty_mode = true){if (obj_leveleditor.difficulty_layer = 1){obj.easy = true;obj.normal = false;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer = 2){obj.easy = false;obj.normal = true;obj.hard = false;}else
					if (obj_leveleditor.difficulty_layer >= 3){obj.easy = false;obj.normal = false;obj.hard = true;}}/*When placing on difficulty layer END*/if asset_get_type("snd_leveleditor_place_object") == asset_sound{audio_sound_pitch(snd_leveleditor_place_object, random_range(0.9, 1.1));audio_play_sound(snd_leveleditor_place_object, 0, 0);audio_sound_gain(snd_leveleditor_place_object, global.sound_volume * global.main_volume, 0);}}
					#endregion /*Brush size 6 END*/
					
					#region /*Reset Level Editor Checkpoint*/
					if (asset_get_type("room_leveleditor") == asset_room)
					and (room =room_leveleditor)
					and (global.character_select_in_this_menu = "level_editor")
					and (global.create_level_from_template = false)
					{
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "x_checkpoint");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "y_checkpoint");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_direction");
						ini_close();
					}
					#endregion /*Reset Level Editor Checkpoint END*/
					
					#region /*Reset ranking highscore to actual custom level when placing objects*/
					if (global.character_select_in_this_menu = "level_editor")
					and (global.select_level_index <= 0)
					and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
					
					or (global.character_select_in_this_menu = "level_editor")
					and (global.create_level_from_template >= 2)
					and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
					
					or (global.character_select_in_this_menu = "level_editor")
					and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
					{
						if (global.character_select_in_this_menu = "level_editor")
						and (global.select_level_index <= 0)
						or(global.character_select_in_this_menu = "level_editor")
						and (global.create_level_from_template >= 2)
						{
							ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						}
						else
						if (global.character_select_in_this_menu = "level_editor")
						{
							ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
						}
						
						#region /*Reset Fastest Time Hard*/
						ini_key_delete("rank", "rank_timeattack_millisecond");
						ini_key_delete("rank", "rank_timeattack_second");
						ini_key_delete("rank", "rank_timeattack_minute");
						ini_key_delete("rank", "rank_timeattack_realmillisecond");
						#endregion /*Reset Fastest Time END*/
						
						ini_key_delete("rank", "rank_level_score");
						ini_close();
					}
					#endregion /*Reset ranking highscore to actual custom level when placing objects END*/
					
				}
			}
		}
	}
	#endregion /*Place Object END*/
	
	#region /*Nearest Placed Object Code*/
	with(instance_nearest(x, y, obj_leveleditor_placed_object))
	{
		
		#region /*Modify Objects*/
		if (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		and (!mouse_check_button(mb_right))
		and (delay > 1)
		and (instance_exists(obj_leveleditor))
		and (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		and (!mouse_check_button(mb_right))
		and (asset_get_type("obj_leveleditor") == asset_object)
		and (instance_exists(obj_leveleditor))
		and (obj_leveleditor.fill_mode = false)
		and (obj_leveleditor.erase_mode = false)
		and (obj_leveleditor.pause = false)
		and (obj_leveleditor.menu_delay = 0)
		and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
		and (asset_get_type("obj_level_player_1_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_1_start))
		and (asset_get_type("obj_level_player_2_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_2_start))
		and (asset_get_type("obj_level_player_3_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_3_start))
		and (asset_get_type("obj_level_player_4_start") == asset_object)
		and (!place_meeting(x, y, obj_level_player_4_start))
		and (asset_get_type("obj_level_height") == asset_object)
		and (!position_meeting(x, y, obj_level_height))
		and (asset_get_type("obj_level_width") == asset_object)
		and (!position_meeting(x, y, obj_level_width))
		and (asset_get_type("obj_water_level_height") == asset_object)
		and (!position_meeting(x, y, obj_water_level_height))
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, obj_leveleditor.always_show_level_editor_buttons_x + 32, room_height * 2)) /*Can't place objects when clicking the bottom buttons*/
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /*Can't place objects when clicking the top buttons*/
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), window_get_width() - 64, window_get_height() / 2 - 32, window_get_width(), window_get_height() / 2 + 32)) /*Can't place objects when clicking the play button*/
		and (obj_leveleditor.placing_object <= 0)
		{
			if (obj_leveleditor.show_grid = true)
			and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32 - 32, 80 + obj_leveleditor.icons_at_top_y + 16 - 32 - 32, display_get_gui_width() + 64 + 32, 80 + obj_leveleditor.icons_at_top_y + 16 + 32 + 32)) /*Up and down buttons when grid is on*/
			or (obj_leveleditor.show_grid = false)
			{
				if (obj_leveleditor.set_difficulty_mode = true)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
				or (obj_leveleditor.set_difficulty_mode = false)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /*Can't place objects when clicking the bottom right buttons*/
				{
					if (keyboard_check_pressed(ord("A")))
					and (!keyboard_check(vk_control))
					or (mouse_check_button_released(mb_left))
					and (dragged_from_original_place = false)
					and (placed_for_the_first_time = false)
					or (instance_exists(obj_leveleditor))
					and (obj_leveleditor.key_a_released)
					and (dragged_from_original_place = false)
					and (placed_for_the_first_time = false)
					{
						if (position_meeting(obj_leveleditor.x, obj_leveleditor.y, id))
						{
							/*Don't put a move_snap here! We don't want the object to change position when modifying it*/
							
							#region /*Object ID's to modify*/
							if (global.world_editor = false)
							{
							
								#region /*Change wall into it's different forms*/
								if (object = 1)
								{
									object = 1001;
								}
								else
								if (object = 1001)
								{
									object = 1002;
								}
								else
								if (object = 1002)
								{
									object = 1003;
								}
								else
								if (object = 1003)
								{
									object = 1004;
								}
								else
								if (object = 1004)
								{
									object = 1005;
								}
								else
								if (object = 1005)
								{
									object = 1006;
								}
								else
								if (object = 1006)
								{
									object = 1007;
								}
								else
								if (object = 1007)
								{
									object = 1;
								}
								#endregion /*Change wall into it's different forms END*/
							
								else
							
								#region /*Change bump in ground to it's different forms*/
								if (object = 28)
								{
									object = 29;
								}
								else
								if (object = 29)
								{
									object = 30;
								}
								else
								if (object = 30)
								{
									object = 31;
								}
								else
								if (object = 31)
								{
									object = 32;
								}
								else
								if (object = 32)
								{
									object = 33;
								}
								else
								if (object = 33)
								{
									object = 34;
								}
								else
								if (object = 34)
								{
									object = 35;
								}
								else
								if (object = 35)
								{
									object = 36;
								}
								else
								if (object = 36)
								{
									object = 37;
								}
								else
								if (object = 37)
								{
									object = 38;
								}
								else
								if (object = 38)
								{
									object = 39;
								}
								else
								if (object = 39)
								{
									object = 28;
								}
								#endregion /*Change bump in ground to it's different forms END*/				
							
								else
							
								#region /*Change Basic Collectible Direction*/
								if (object = 40)
								{
									object = 41;
								}
								else
								if (object = 41)
								{
									object = 42;
								}
								else
								if (object = 42)
								{
									object = 43;
								}
								else
								if (object = 43)
								{
									object = 44;
								}
								else
								if (object = 44)
								{
									object = 45;
								}
								else
								if (object = 45)
								{
									object = 46;
								}
								else
								if (object = 46)
								{
									object = 47;
								}
								else
								if (object = 47)
								{
									object = 40;
								}
								#endregion /*Change Basic Collectible Direction*/
							
								else
							
								#region /*Change Big Collectible*/
								if (object = 48)
								{
									object = 49;
								}
								else
								if (object = 49)
								{
									object = 50;
								}
								else
								if (object = 50)
								{
									object = 51;
								}
								else
								if (object = 51)
								{
									object = 52;
								}
								else
								if (object = 52)
								{
									object = 48;
								}
								#endregion /*Change Big Collectible*/
							
								else
							
								#region /*Falling Block*/
								if (object = 19)
								{
									object = 20;
								}
								else
								if (object = 20)
								{
									object = 19;
								}
								else
								if (object = 21)
								{
									object = 22;
								}
								else
								if (object = 22)
								{
									object = 21;
								}
								#endregion /*Falling Block END*/
							
								else
							
								#region /*Brick Block*/
								if (object = 4)
								{
									object = 5;
								}
								else
								if (object = 5)
								{
									object = 6;
								}
								else
								if (object = 6)
								{
									object = 7;
								}
								else
								if (object = 7)
								{
									object = 8;
								}
								else
								if (object = 8)
								{
									object = 9;
								}
								else
								if (object = 9)
								{
									object = 10;
								}
								else
								if (object = 10)
								{
									object = 10001;
								}
								else
								if (object = 10001)
								{
									object = 4;
								}
								#endregion /*Brick Block*/
							
								else
							
								#region /*Question Block*/
								if (object = 11)
								{
									object = 12;
								}
								else
								if (object = 12)
								{
									object = 13;
								}
								else
								if (object = 13)
								{
									object = 14;
								}
								else
								if (object = 14)
								{
									object = 15;
								}
								else
								if (object = 15)
								{
									object = 16;
								}
								else
								if (object = 16)
								{
									object = 17;
								}
								else
								if (object = 17)
								{
									object = 17001;
								}
								else
								if (object = 17001)
								{
									object = 11;
								}
								#endregion /*Question Block*/
							
								else
							
								#region /*Invincibility Powerup*/
								if (object = 55)
								{
									object = 55001;
								}
								else
								if (object = 55001)
								{
									object = 55;
								}
								#endregion /*Invincibility Powerup END*/
							
								else
							
								#region /*Extra Lives Pickup*/
								if (object = 56)
								{
									object = 57;
								}
								else
								if (object = 57)
								{
									object = 58;
								}
								else
								if (object = 58)
								{
									object = 56;
								}
								#endregion /*Extra Lives Pickup END*/
							
								else
							
								#region /*Basic enemy*/
								if (object = 59)
								{
									object = 5901;
								}
								else
								if (object = 5901)
								{
									object = 5902;
								}
								else
								if (object = 5902)
								{
									object = 5903;
								}
								else
								if (object = 5903)
								{
									object = 59;
								}
								#endregion /*Basic enemy END*/
							
								else
							
								#region /*Bowling ball enemy*/
								if (object = 591)
								{
									object = 592;
								}
								else
								if (object = 592)
								{
									object = 5911;
								}
								else
								if (object = 5911)
								{
									object = 5912;
								}
								else
								if (object = 5912)
								{
									object = 591;
								}
								#endregion /*Bowling ball enemy END*/
							
								else
							
								#region /*Spikes Emerge Direction*/
								if (object = 67)
								{
									object = 671;
								}
								else
								if (object = 671)
								{
									object = 672;
								}
								else
								if (object = 672)
								{
									object = 673;
								}
								else
								if (object = 673)
								{
									object = 67;
								}
								#endregion /*Spikes Emerge Direction END*/
							
								else
							
								#region /*Change Oneway Direction*/
								if (object = 68)
								{
									object = 69;
								}
								else
								if (object = 69)
								{
									object = 70;
								}
								else
								if (object = 70)
								{
									object = 71;
								}
								else
								if (object = 71)
								{
									object = 68;
								}
								#endregion /*Change Oneway Direction END*/
							
								else
							
								#region /*Change Water Rope*/
								if (object = 73)
								{
									object = 731;
								}
								else
								if (object = 731)
								{
									object = 73;
								}
								#endregion /*Change Water END*/
							
								else
							
								#region /*Change Clipped Clothing on Rope*/
								if (object = 74)
								{
									object = 75;
								}
								else
								if (object = 75)
								{
									object = 76;
								}
								else
								if (object = 76)
								{
									object = 74;
								}
								#endregion /*Change Clipped Clothing on Rope END*/
							
								else
							
								#region /*Change bucket to it's different forms*/
								if (object = 77)
								{
									object = 78;
								}
								else
								if (object = 78)
								{
									object = 79;
								}
								else
								if (object = 79)
								{
									object = 80;
								}
								else
								if (object = 80)
								{
									object = 81;
								}
								else
								if (object = 81)
								{
									object = 82;
								}
								else
								if (object = 82)
								{
									object = 83;
								}
								else
								if (object = 83)
								{
									object = 84;
								}
								else
								if (object = 84)
								{
									object = 85;
								}
								else
								if (object = 85)
								{
									object = 86;
								}
								else
								if (object = 86)
								{
									object = 87;
								}
								else
								if (object = 87)
								{
									object = 88;
								}
								else
								if (object = 88)
								{
									object = 77;
								}
								#endregion /*Change bucket to it's different forms END*/
							
								else
							
								#region /*Change Moveset Signs*/
								if (object = 90)
								{
									object = 91;
								}
								else
								if (object = 91)
								{
									object = 92;
								}
								else
								if (object = 92)
								{
									object = 93;
								}
								else
								if (object = 93)
								{
									object = 94;
								}
								else
								if (object = 94)
								{
									object = 90;
								}
								#endregion /*Change Moveset Signs END*/
								
							}
							else
							{
								#region /*Change Turn*/
								if (object = 4)
								{
									object = 5;
								}
								else
								if (object = 5)
								{
									object = 6;
								}
								else
								if (object = 6)
								{
									object = 7;
								}
								else
								if (object = 7)
								{
									object = 4;
								}
								#endregion /*Change Turn END*/
							}
							
							alarm[0] = 1; /*Update sprite initializing. That code is in alarm event, so it's not running every frame in step event*/
							
							#endregion /*Object ID's to modify END*/
							
						}
					}
				}
			}
		}
		#endregion /*Modify Objects END*/
		
	}
	#endregion /*Nearest Placed Object Code END*/
	
}

if (mouse_check_button_released(mb_left))
{
	placing_object -= 0.2;
}
if (placing_object <= 0.9)
and (placing_object > 0)
{
	placing_object -= 0.2;	
}
