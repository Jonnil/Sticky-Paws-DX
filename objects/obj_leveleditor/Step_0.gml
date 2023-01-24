var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();

grid_button_x = display_get_gui_width() - 224;

scr_audio_play(level_editing_music, volume_source.music);

if (global.selected_level_editing_music != previous_selected_level_editing_music)
{
	if (global.selected_level_editing_music == 0)
	{
		audio_stop_sound(level_editing_music);
		level_editing_music = noone;
		previous_selected_level_editing_music = 0;
	}
	else
	if (global.selected_level_editing_music == 1)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
	{
		audio_stop_sound(level_editing_music);
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
		previous_selected_level_editing_music = 1;
	}
	else
	if (global.selected_level_editing_music == 2)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
	{
		audio_stop_sound(level_editing_music);
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
		previous_selected_level_editing_music = 2;
	}
	else
	if (global.selected_level_editing_music == 3)
	and (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
	{
		audio_stop_sound(level_editing_music);
		level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
		previous_selected_level_editing_music = 3;
	}
	else
	{
		audio_stop_sound(level_editing_music);
		level_editing_music = noone;
	}
	if (file_exists("config.ini"))
	{
		ini_open(working_directory + "config.ini");
		ini_write_real("config", "selected_level_editing_music", global.selected_level_editing_music);
		ini_close();
	}
}

#region /* Controls for level editor */
key_up = (keyboard_check_pressed(global.player1_key_up)) and (!keyboard_check_pressed(global.player1_key_down)) or (keyboard_check_pressed(vk_up)) and (!keyboard_check_pressed(vk_down)) or (keyboard_check_pressed(ord("W"))) and (!keyboard_check_pressed(ord("S"))) or (gamepad_button_check_pressed(0, gp_padu)) and (!gamepad_button_check_pressed(0, gp_padd)) or (gamepad_axis_value(0, gp_axislv) < 0);
key_left = (keyboard_check_pressed(global.player1_key_left)) and (!keyboard_check_pressed(global.player1_key_right)) or (keyboard_check_pressed(vk_left)) and (!keyboard_check_pressed(vk_right)) or (keyboard_check_pressed(ord("A"))) and (!keyboard_check_pressed(ord("D"))) or (gamepad_button_check_pressed(0, gp_padl)) and (!gamepad_button_check_pressed(0, gp_padr)) or (gamepad_axis_value(0, gp_axislh) < 0);
key_right = (keyboard_check_pressed(global.player1_key_right)) and (!keyboard_check_pressed(global.player1_key_left)) or (keyboard_check_pressed(vk_right)) and (!keyboard_check_pressed(vk_left)) or (keyboard_check_pressed(ord("D"))) and (!keyboard_check_pressed(ord("A"))) or (gamepad_button_check_pressed(0, gp_padr)) and (!gamepad_button_check_pressed(0, gp_padl)) or (gamepad_axis_value(0, gp_axislh) > 0);
key_down = (keyboard_check_pressed(global.player1_key_down)) and (!keyboard_check_pressed(global.player1_key_up)) or (keyboard_check_pressed(vk_down)) and (!keyboard_check_pressed(vk_up)) or (keyboard_check_pressed(ord("S"))) and (!keyboard_check_pressed(ord("W"))) or (gamepad_button_check_pressed(0, gp_padd)) and (!gamepad_button_check_pressed(0, gp_padu)) or (gamepad_axis_value(0, gp_axislv) > 0);
key_a_pressed = (gamepad_button_check_pressed(0, gp_face1)) or (keyboard_check_pressed(global.player1_key_jump)) or (keyboard_check_pressed(ord("Z"))) or (keyboard_check_pressed(vk_space)) or (keyboard_check_pressed(vk_enter));
key_a_released = (gamepad_button_check_released(0, gp_face1)) or (keyboard_check_released(global.player1_key_jump)) or (keyboard_check_released(ord("Z")));
key_a_hold = (gamepad_button_check(0, gp_face1)) or (keyboard_check(global.player1_key_jump)) or (keyboard_check(ord("Z")));
key_b_hold = (gamepad_button_check(0, gp_face2)) or (keyboard_check(global.player1_key_sprint)) or (keyboard_check(ord("X"))) or (keyboard_check(vk_backspace));
key_b_pressed = (gamepad_button_check_pressed(0, gp_face2)) or (keyboard_check_pressed(global.player1_key_sprint)) or (keyboard_check_pressed(ord("X"))) or (keyboard_check_pressed(vk_backspace)) or (mouse_check_button_pressed(mb_right)) or (mouse_check_button_pressed(mb_side1));
key_b_released = (gamepad_button_check_released(0, gp_face2)) or (keyboard_check_released(global.player1_key_sprint)) or (keyboard_check_released(ord("X"))) or (keyboard_check_released(vk_backspace));
#endregion /* Controls for level editor END */

scr_toggle_fullscreen();

#region /* Deactivate instances outside view */
if (startup_loading_timer <= 3)
{
	startup_loading_timer += 1;
}

if (quit_level_editor == 0)
and (global.play_edited_level == false)
and (startup_loading_timer >= 3)
{
	instance_activate_all();
	if (global.deactivate_objects_outside_view == true)
	{
		instance_deactivate_region(
		camera_get_view_x(view_camera[view_current]) - 32,
		camera_get_view_y(view_camera[view_current]) - 32,
		camera_get_view_width(view_camera[view_current]) + 32 /* Camera Width */,
		camera_get_view_height(view_camera[view_current]) + 32 /* Camera Height */,
		false, true);
	}
}
else
if (global.play_edited_level == false)
{
	instance_activate_all();
}

#region /* Activate objects that always should be active */
if (asset_get_type("obj_player") == asset_object)
{
	instance_activate_object(obj_player);
}
if (asset_get_type("obj_player_lose") == asset_object)
{
	instance_activate_object(obj_player_lose);
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
#endregion /* Activate objects that always should be active END */

#endregion /* Deactivate instances outside view END */

#region /* Always keep the brush size within these values */
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
#endregion /* Always keep the brush size within these values END */

if (get_window_height != old_window_get_height)
or (get_window_width != old_window_get_width)
{
	scr_set_screen_size();
	old_window_get_height = get_window_height;
	old_window_get_width = get_window_width;
}

#region /* Play Level when pressing Enter Key */
if (keyboard_check_pressed(vk_enter))
or (gamepad_button_check_pressed(0, gp_select))
or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
and (mouse_check_button_pressed(mb_left))
or (global.full_level_map_screenshot == true)
{
	if (pause == false)
	and (menu_delay == 0)
	and (global.character_select_in_this_menu == "level_editor")
	and (asset_get_type("obj_level_player_1_start") == asset_object)
	and (asset_get_type("obj_level_player_2_start") == asset_object)
	and (asset_get_type("obj_level_player_3_start") == asset_object)
	and (asset_get_type("obj_level_player_4_start") == asset_object)
	{
		instance_activate_all(); /* Activate all instances before saving the custom level */
		
		if (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		and (asset_get_type("obj_leveleditor_placed_object") == asset_object)
		and (!place_meeting(x, y, obj_leveleditor_placed_object))
		or (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), get_window_width - 64, get_window_height / 2 - 32, get_window_width, get_window_height / 2 + 32))
		and (asset_get_type("obj_camera") == asset_object)
		and (!instance_exists(obj_camera))
		or (global.full_level_map_screenshot == true)
		{
			
			#region /* Limit so cursor and view can't go outside room */
			if (camera_get_view_width(view_camera[view_current]) < 1920)
			or (camera_get_view_height(view_camera[view_current]) < 1080)
			{
				camera_set_view_size(view_camera[view_current], 1920, 1080);
			}
			if (asset_get_type("scr_set_screen_size") == asset_script)
			{
				scr_set_screen_size();
			}
			
			#region /* Limit controller x and controller y inside room */
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
			#endregion /* Limit controller x and controller y inside room END */
			
			#region /* Limit x and y inside room */
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
			#endregion /* Limit x and y inside room END */
			
			#region /* Limit view inside room */
			camera_set_view_pos(view_camera[view_current],
			max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
			max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
			#endregion /* Limit view inside room END */
			
			#endregion /* Limit so view and cursor can't go outside room END */
			
			global.checkpoint_x = 0;
			global.checkpoint_y = 0;
			global.checkpoint_millisecond = 0;
			global.checkpoint_second = 0;
			global.checkpoint_minute = 0;
			global.checkpoint_realmillisecond = 0;
			
			menu_delay = 9999; /* Disable all menu control */
			lives = 5;
			global.lives_until_assist = 0;
			global.actually_play_edited_level = false;
			global.play_edited_level = true;
			global.character_select_in_this_menu = "level_editor";
			
			audio_stop_sound(level_editing_music); /* Stop the background music that plays during level editing when playtesting a level */
			
			if (global.world_editor == false)
			{
				ini_open(working_directory + "/save_files/custom_level_save.ini");
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_x", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_y", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
				ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
				ini_close();
				
				#region /* Save Level Thumbnail */
				var thumbnail_sprite;
				thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
				if (global.select_level_index >= 1)
				and (global.create_level_from_template == false)
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
				}
				else
				if (global.level_name != "")
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
				}
				sprite_delete(thumbnail_sprite);
				#endregion /* Save Level Thumbnail END */
				
				if (asset_get_type("scr_save_custom_level") == asset_script)
				{
					scr_save_custom_level();
				}
				
				if (instance_exists(obj_leveleditor_placed_object))
				{
					with(obj_leveleditor_placed_object)
					{
						scr_spawn_objects_when_starting_room(); /*Only spawn objects after saving custom level*/
					}
				}
				
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
				or (global.full_level_map_screenshot == true)
				{
					if (asset_get_type("obj_camera") == asset_object)
					and (!instance_exists(obj_camera))
					{
						instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_camera);
					}
				}
				else
				{
					if (asset_get_type("obj_camera") == asset_object)
					and (!instance_exists(obj_camera))
					{
						instance_create_depth(x, y, 0, obj_camera);
					}
				}
			}
			else
			{
				
				#region /* Save World Thumbnail */
				var thumbnail_sprite;
				thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
				if (global.select_level_index >= 1)
				and (global.create_level_from_template == false)
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
				}
				else
				if (global.level_name != "")
				{
					sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(global.level_name) + "/automatic_thumbnail.png");
				}
				sprite_delete(thumbnail_sprite);
				#endregion /* Save World Thumbnail END */
				
				if (asset_get_type("scr_save_custom_world") == asset_script)
				{
					scr_save_custom_world();
				}
				
				if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
				or (global.full_level_map_screenshot == true)
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
#endregion /* Play Level when pressing Enter Key END */

#region /* Scroll View */
if (mouse_check_button_pressed(mb_left))
and (keyboard_check(vk_space))
and (quit_level_editor <= 0)
or (mouse_check_button_pressed(mb_middle))
and (quit_level_editor <= 0)
{
	if (pause == false)
	and (!instance_exists(obj_leveleditor_fill))
	{
		drag_x = mouse_x;
		drag_y = mouse_y;
		scroll_view = true;
	}
}
if (scroll_view == true)
and (quit_level_editor <= 0)
and (pause == false)
and (!instance_exists(obj_leveleditor_fill))
{
	camera_set_view_pos(view_camera[view_current], drag_x -(mouse_x -camera_get_view_x(view_camera[view_current])), drag_y -(mouse_y -camera_get_view_y(view_camera[view_current]))); /* Scroll the camera position with the mouse */
}
if (mouse_check_button_released(mb_left))
and (scroll_view == true)
or (mouse_check_button_released(mb_middle))
and (scroll_view == true)
{
	scroll_view = false;
}
#endregion /* Scroll View END */

if (global.create_level_from_template == true)
and (create_level_from_template_save_delay < 10)
{
	create_level_from_template_save_delay += 1;
}
else
if (global.create_level_from_template == true)
and (create_level_from_template_save_delay == 10)
{
	
	#region /* Limit so cursor and view can't go outside room */
	if (camera_get_view_width(view_camera[view_current]) < 1920)
	or (camera_get_view_height(view_camera[view_current]) < 1080)
	{
		camera_set_view_size(view_camera[view_current], 1920, 1080);
	}
	scr_set_screen_size();
	
	#region /* Limit controller x and controller y inside room */
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
	#endregion /* Limit controller x and controller y inside room END */
	
	#region /* Limit x and y inside room */
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
	#endregion /* Limit x and y inside room END */
	
	#region /* Limit view inside room */
	camera_set_view_pos(view_camera[view_current],
	max(0, min(camera_get_view_x(view_camera[view_current]), room_width - camera_get_view_width(view_camera[view_current]))),
	max(0, min(camera_get_view_y(view_camera[view_current]), room_height - camera_get_view_height(view_camera[view_current]))));
	#endregion /* Limit view inside room END */
	
	#endregion /* Limit so view and cursor can't go outside room END */
	
	global.checkpoint_x = 0;
	global.checkpoint_y = 0;
	global.checkpoint_millisecond = 0;
	global.checkpoint_second = 0;
	global.checkpoint_minute = 0;
	global.checkpoint_realmillisecond = 0;
	
	ini_open(working_directory + "/save_files/custom_level_save.ini");
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_x", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_y", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_millisecond", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_second", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_minute", 0);
	ini_write_real(string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)), "checkpoint_realmillisecond", 0);
	ini_close();
	
	#region /* Save Thumbnail */
	var thumbnail_sprite;
	thumbnail_sprite = sprite_create_from_surface(application_surface,
	camera_get_view_x(view_camera[view_current]),
	camera_get_view_y(view_camera[view_current]),
	camera_get_view_width(view_camera[view_current]),
	camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
	if (global.select_level_index >= 1)
	and (global.create_level_from_template == false)
	{
		sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/automatic_thumbnail.png");
	}
	else
	if (global.level_name != "")
	{
		sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
	}
	sprite_delete(thumbnail_sprite);
	#endregion /* Save Thumbnail END */
	
	menu_delay = 10; /* Disable all menu control */
	scr_save_custom_level();
	lives = 5;
	global.lives_until_assist = 0;
	global.actually_play_edited_level = false;
	global.play_edited_level = false; /* Set this to false so you don't playtest the level */
	global.character_select_in_this_menu = "level_editor";
	create_level_from_template_save_delay += 1; /* Stop saving template level */
}

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

#region /* If you haven't yet quit the level editor, then run this code */
if (quit_level_editor <= 0)
{
	
	#region /* Controller Input Changes */
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
		
		#region /* Move view with gamepad */
		if (pause == false)
		{
			if (keyboard_check(global.player1_key_up))
			and (!keyboard_check(global.player1_key_down))
			or (keyboard_check(vk_up))
			and (!keyboard_check(vk_down))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed); /* Move camera up */
			}
			if (keyboard_check(global.player1_key_down))
			and (!keyboard_check(global.player1_key_up))
			or (keyboard_check(vk_down))
			and (!keyboard_check(vk_up))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed); /* Move camera down */
			}
			if (keyboard_check(global.player1_key_left))
			and (!keyboard_check(global.player1_key_right))
			or (keyboard_check(vk_left))
			and (!keyboard_check(vk_right))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera left */
			}
			if (keyboard_check(global.player1_key_right))
			and (!keyboard_check(global.player1_key_left))
			or (keyboard_check(vk_right))
			and (!keyboard_check(vk_left))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) + controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera right */
			}
		}
		#endregion /* Move view with gamepad END */
		
	}
	else
	if (global.controls_used_for_menu_navigation == "controller")
	{
		x = controller_x;
		y = controller_y;
		cursor_x = controller_x;
		cursor_y = controller_y;
		
		#region /* Keep controller_x and controller_y within view */
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
		#endregion /* Keep controller_x and controller_y within view END */
		
		if (key_up)
		and (controller_y > camera_get_view_y(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or (gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_y -= 8;
			}
			else
			{
				controller_y -= 4;
			}
		}
		if (key_down)
		and (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			if (gamepad_button_check(0, gp_face3))
			or (gamepad_button_check(0, gp_face4))
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
			or (gamepad_button_check(0, gp_face4))
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
			or (gamepad_button_check(0, gp_face4))
			or (gamepad_button_check(0, gp_stickl))
			{
				controller_x += 8;
			}
			else
			{
				controller_x += 4;
			}
		}
		
		#region /* Move view with gamepad */
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
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed); /* Move camera up */
			if (controller_y > camera_get_view_y(view_camera[view_current]))
			{
				controller_y -= controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrv) > 0)
		or (key_down)
		and (controller_y >= camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed); /* Move camera down */
			if (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			{
				controller_y += controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrh) < 0)
		or (key_left)
		and (controller_x <= camera_get_view_x(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera left */
			if (controller_x > camera_get_view_x(view_camera[view_current]))
			{
				controller_x -= controller_view_speed;
			}
		}
		if (gamepad_axis_value(0, gp_axisrh) > 0)
		or (key_right)
		and (controller_x >= camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
		{
			camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) + controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera right */
			if (controller_x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
			{
				controller_x += controller_view_speed;
			}
		}
		#endregion /* Move view with gamepad END */
		
	}
	#endregion /* Controller Input Changes END */
	
	move_snap(global.grid_hsnap, global.grid_vsnap); /* Make sure to always move snap */
	
	#region /* Place Object */
	if (can_make_place_brush_size_bigger == false)
	and (mouse_check_button_pressed(mb_left))
	and (scroll_view == false)
	or (can_make_place_brush_size_bigger == true)
	and (mouse_check_button(mb_left))
	and (scroll_view == false)
	or (can_make_place_brush_size_bigger = false)
	and (key_a_released)
	and (scroll_view == false)
	or (can_make_place_brush_size_bigger == true)
	and (gamepad_button_check(0, gp_face1))
	and (scroll_view == false)
	or (can_make_place_brush_size_bigger == true)
	and (keyboard_check(ord("Z")))
	and (scroll_view == false)
	{
		if (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		and (!mouse_check_button(mb_right))
		and (drag_object == false)
		and (fill_mode == false)
		and (erase_mode == false)
		and (pause == false)
		and (menu_delay == 0)
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
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
		and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), get_window_width - 64, get_window_height / 2 - 32, get_window_width, get_window_height / 2 + 32)) /* Can't place objects when clicking the play button */
		{
			if (show_grid == true)
			and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32)) /* Up and down buttons when grid is on */
			or (show_grid == false)
			{
				if (global.enable_difficulty_selection_settings == true)
				and (set_difficulty_mode == true)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
				or (global.enable_difficulty_selection_settings == true)
				and (set_difficulty_mode == false)
				and (!point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
				or (global.enable_difficulty_selection_settings == false)
				{
					
					drag_object = false;
					
					#region /* Brush size 1 */
					scr_brush_size_place_object(   0,    0, 1, true);
					#endregion /* Brush size 1 END */
					
					#region /* Brush size 2 */
					scr_brush_size_place_object(   0, + 32, 2, false);
					scr_brush_size_place_object(+ 32,    0, 2, false);
					scr_brush_size_place_object(+ 32, + 32, 2, false);
					#endregion /* Brush size 2 END */
					
					#region /* Brush size 3 */
					scr_brush_size_place_object(   0, - 32, 3, false);
					scr_brush_size_place_object(+ 32, - 32, 3, false);
					scr_brush_size_place_object(- 32,    0, 3, false);
					scr_brush_size_place_object(- 32, + 32, 3, false);
					scr_brush_size_place_object(- 32, - 32, 3, false);
					#endregion /* Brush size 3 END */
					
					#region /* Brush size 4 */
					scr_brush_size_place_object(   0, + 64, 4, false);
					scr_brush_size_place_object(+ 32, + 64, 4, false);
					scr_brush_size_place_object(+ 64,    0, 4, false);
					scr_brush_size_place_object(+ 64, + 32, 4, false);
					scr_brush_size_place_object(+ 64, + 64, 4, false);
					scr_brush_size_place_object(+ 64, - 32, 4, false);
					scr_brush_size_place_object(- 32, + 64, 4, false);
					#endregion /* Brush size 4 END */
					
					#region /* Brush size 5 */
					scr_brush_size_place_object(   0, - 64, 5, false);
					scr_brush_size_place_object(+ 32, - 64, 5, false);
					scr_brush_size_place_object(+ 64, - 64, 5, false);
					scr_brush_size_place_object(- 32, - 64, 5, false);
					scr_brush_size_place_object(- 64,    0, 5, false);
					scr_brush_size_place_object(- 64, + 32, 5, false);
					scr_brush_size_place_object(- 64, + 64, 5, false);
					scr_brush_size_place_object(- 64, - 32, 5, false);
					scr_brush_size_place_object(- 64, - 64, 5, false);
					#endregion /* Brush size 5 END */
					
					#region /* Brush size 6 */
					scr_brush_size_place_object(   0, + 96, 6, false);
					scr_brush_size_place_object(+ 32, + 96, 6, false);
					scr_brush_size_place_object(+ 64, + 96, 6, false);
					scr_brush_size_place_object(+ 96,    0, 6, false);
					scr_brush_size_place_object(+ 96, + 32, 6, false);
					scr_brush_size_place_object(+ 96, + 64, 6, false);
					scr_brush_size_place_object(+ 96, + 96, 6, false);
					scr_brush_size_place_object(+ 96, - 32, 6, false);
					scr_brush_size_place_object(+ 96, - 64, 6, false);
					scr_brush_size_place_object(- 32, + 96, 6, false);
					scr_brush_size_place_object(- 64, + 96, 6, false);
					#endregion /* Brush size 6 END */
					
					#region /* Reset Level Editor Checkpoint */
					if (asset_get_type("room_leveleditor") == asset_room)
					and (room == room_leveleditor)
					and (global.character_select_in_this_menu == "level_editor")
					and (global.create_level_from_template == false)
					{
						ini_open(working_directory + "/save_files/custom_level_save.ini");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_x");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_y");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_millisecond");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_second");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_minute");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_realmillisecond");
						ini_key_delete(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index), "checkpoint_direction");
						ini_close();
					}
					#endregion /* Reset Level Editor Checkpoint END */
					
					#region /* Reset ranking highscore to actual custom level when placing objects */
					if (global.character_select_in_this_menu == "level_editor")
					and (global.select_level_index <= 0)
					and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
					
					or (global.character_select_in_this_menu == "level_editor")
					and (global.create_level_from_template >= 2)
					and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
					
					or (global.character_select_in_this_menu == "level_editor")
					and (file_exists(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini"))
					{
						if (global.character_select_in_this_menu == "level_editor")
						and (global.select_level_index <= 0)
						or (global.character_select_in_this_menu == "level_editor")
						and (global.create_level_from_template >= 2)
						{
							ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
						}
						else
						if (global.character_select_in_this_menu == "level_editor")
						{
							ini_open(working_directory + "/custom_levels/" + string(ds_list_find_value(global.all_loaded_custom_levels, global.select_level_index)) + "/data/level_information.ini");
						}
						
						#region /* Reset Fastest Time Hard */
						ini_key_delete("rank", "rank_timeattack_millisecond");
						ini_key_delete("rank", "rank_timeattack_second");
						ini_key_delete("rank", "rank_timeattack_minute");
						ini_key_delete("rank", "rank_timeattack_realmillisecond");
						#endregion /* Reset Fastest Time END */
						
						ini_key_delete("rank", "rank_level_score");
						ini_close();
					}
					#endregion /* Reset ranking highscore to actual custom level when placing objects END */
					
				}
			}
		}
	}
	#endregion /* Place Object END */
	
	#region /* Nearest Placed Object Code */
	with(instance_nearest(x, y, obj_leveleditor_placed_object))
	{
		
		scr_modify_objects_in_level_editor();
		
	}
	#endregion /* Nearest Placed Object Code END */
	
}
#endregion /* If you haven't yet quit the level editor, then run this code END */

if (mouse_check_button_released(mb_left))
{
	placing_object -= 0.2;
}
if (placing_object <= 0.9)
and (placing_object > 0)
{
	placing_object -= 0.2;	
}