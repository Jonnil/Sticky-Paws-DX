if (global.actually_play_edited_level == false)
{
	var get_window_height = display_get_gui_height();
	var get_window_width = display_get_gui_width();
	var mouse_get_x = device_mouse_x_to_gui(0);
	var mouse_get_y = device_mouse_y_to_gui(0);
	var view_center_x = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) * 0.5;
	var view_center_y = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) * 0.5;
	
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
	
	if (pause == false)
	{
		scr_controls_for_level_editor();
	}
	else
	if (pause == true)
	{
		scr_menu_navigation_initialization(1, true);
	}
	
	scr_toggle_fullscreen();

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
	
	#region /* Holding the play key down */
	if (keyboard_check(key_play))
	or (gamepad_button_check(global.player1_slot, button_play))
	or (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	and (mouse_check_button(mb_left))
	{
		pressing_play_timer += 1;
	}
	#endregion /* Holding the play key down END */
	
	#region /* Play Level when releasing Enter Key */
	if (keyboard_check_released(key_play))
	or (gamepad_button_check_released(global.player1_slot, button_play))
	or (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	and (mouse_check_button_released(mb_left))
	or (global.full_level_map_screenshot == true)
	or (pressing_play_timer > 60)
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
			or (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32))
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
				global.character_select_in_this_menu = "level_editor";
				
				audio_stop_sound(level_editing_music); /* Stop the background music that plays during level editing when playtesting a level */
				
				if (global.world_editor == false)
				{
					ini_open(working_directory + "/save_files/custom_level_save.ini");
					ini_write_real(string(global.level_name), "checkpoint_x", 0);
					ini_write_real(string(global.level_name), "checkpoint_y", 0);
					ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
					ini_write_real(string(global.level_name), "checkpoint_second", 0);
					ini_write_real(string(global.level_name), "checkpoint_minute", 0);
					ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
					ini_close();
					
					#region /* Save Level Thumbnail */
					var thumbnail_sprite;
					thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
					if (global.level_name != "")
					{
						sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
					}
					scr_delete_sprite_properly(thumbnail_sprite);
					#endregion /* Save Level Thumbnail END */
					
					scr_save_custom_level();
					
					if (pressing_play_timer >= 60)
					or (global.full_level_map_screenshot == true)
					{
						if (asset_get_type("obj_camera") == asset_object)
						and (!instance_exists(obj_camera))
						{
							instance_activate_object(obj_camera);
							instance_create_depth(obj_level_player_1_start.x, obj_level_player_1_start.y, 0, obj_camera);
						}
					}
					else
					{
						if (asset_get_type("obj_camera") == asset_object)
						and (!instance_exists(obj_camera))
						{
							instance_activate_object(obj_camera);
							instance_create_depth(view_center_x, view_center_y, 0, obj_camera);
						}
					}
				}
				else
				{
					
					#region /* Save World Thumbnail */
					var thumbnail_sprite;
					thumbnail_sprite = sprite_create_from_surface(application_surface, 0, 0, camera_get_view_width(view_camera[view_current]), camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
					if (global.level_name != "")
					{
						sprite_save(thumbnail_sprite, 0, working_directory + "/custom_worlds/" + string(global.level_name) + "/automatic_thumbnail.png");
					}
					scr_delete_sprite_properly(thumbnail_sprite);
					#endregion /* Save World Thumbnail END */
					
					if (asset_get_type("scr_save_custom_world") == asset_script)
					{
						scr_save_custom_world();
					}
					
					if (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
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
				scr_scale_background();
				global.actually_play_edited_level = false;
				global.play_edited_level = true;
				instance_destroy();
			}
		}
	}
	#endregion /* Play Level when releasing Enter Key END */
	
	#region /* Scroll View */
	if (mouse_check_button_pressed(mb_left))
	and (keyboard_check(vk_space))
	and (quit_level_editor <= 0)
	or (mouse_check_button_pressed(mb_middle))
	and (quit_level_editor <= 0)
	{
		if (!instance_exists(obj_leveleditor_fill))
		{
			drag_x = mouse_x;
			drag_y = mouse_y;
			scroll_view = true;
		}
	}
	if (scroll_view == true)
	and (quit_level_editor <= 0)
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
		ini_write_real(string(global.level_name), "checkpoint_x", 0);
		ini_write_real(string(global.level_name), "checkpoint_y", 0);
		ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
		ini_write_real(string(global.level_name), "checkpoint_second", 0);
		ini_write_real(string(global.level_name), "checkpoint_minute", 0);
		ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
		ini_close();
	
		#region /* Save Thumbnail */
		var thumbnail_sprite;
		thumbnail_sprite = sprite_create_from_surface(application_surface,
		camera_get_view_x(view_camera[view_current]),
		camera_get_view_y(view_camera[view_current]),
		camera_get_view_width(view_camera[view_current]),
		camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
		if (global.level_name != "")
		{
			sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
		}
		scr_delete_sprite_properly(thumbnail_sprite);
		#endregion /* Save Thumbnail END */
		
		menu_delay = 10; /* Disable all menu control */
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
			cursor_x = mouse_get_x;
			cursor_y = mouse_get_y;
			controller_x = mouse_get_x;
			controller_y = mouse_get_y;
			
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
				if (keyboard_check(global.player_[inp.key][1][1][action.up]))
				and (!keyboard_check(global.player_[inp.key][1][1][action.down]))
				or (keyboard_check(vk_up))
				and (!keyboard_check(vk_down))
				{
					if (view_center_y > 0)
					{
						camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed); /* Move camera up */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.down]))
				and (!keyboard_check(global.player_[inp.key][1][1][action.up]))
				or (keyboard_check(vk_down))
				and (!keyboard_check(vk_up))
				{
					if (instance_exists(obj_level_height))
					and (view_center_y < obj_level_height.y)
					{
						camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed); /* Move camera down */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.left]))
				and (!keyboard_check(global.player_[inp.key][1][1][action.right]))
				or (keyboard_check(vk_left))
				and (!keyboard_check(vk_right))
				{
					if (view_center_x > 0)
					{
						camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera left */
					}
				}
				if (keyboard_check(global.player_[inp.key][1][1][action.right]))
				and (!keyboard_check(global.player_[inp.key][1][1][action.left]))
				or (keyboard_check(vk_right))
				and (!keyboard_check(vk_left))
				{
					if (instance_exists(obj_level_width))
					and (view_center_x < obj_level_width.x)
					{
						camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) + controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera right */
					}
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
			
			if (pause == false)
			{
				if (key_up)
				and (controller_y > camera_get_view_y(view_camera[view_current]))
				{
					if (key_move_faster)
					{
						controller_y -= 12;
					}
					else
					{
						controller_y -= 4;
					}
				}
				if (key_down)
				and (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
				{
					if (key_move_faster)
					{
						controller_y += 12;
					}
					else
					{
						controller_y += 4;
					}
				}
				if (key_left)
				and (controller_x > camera_get_view_x(view_camera[view_current]))
				{
					if (key_move_faster)
					{
						controller_x -= 12;
					}
					else
					{
						controller_x -= 4;
					}
				}
				if (key_right)
				and (controller_x < camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]))
				{
					if (key_move_faster)
					{
						controller_x += 12;
					}
					else
					{
						controller_x += 4;
					}
				}
			}
		
			#region /* Move view with gamepad */
			if (key_move_faster)
			{
				controller_view_speed = 24;
			}
			else
			{
				controller_view_speed = 8;
			}
		
			if (gamepad_axis_value(global.player1_slot, gp_axisrv) < 0)
			or (key_up)
			and (controller_y <= camera_get_view_y(view_camera[view_current]))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) - controller_view_speed); /* Move camera up */
				if (controller_y > camera_get_view_y(view_camera[view_current]))
				{
					controller_y -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrv) > 0)
			or (key_down)
			and (controller_y >= camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]) + controller_view_speed); /* Move camera down */
				if (controller_y < camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]))
				{
					controller_y += controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrh) < 0)
			or (key_left)
			and (controller_x <= camera_get_view_x(view_camera[view_current]))
			{
				camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]) - controller_view_speed, camera_get_view_y(view_camera[view_current])); /* Move camera left */
				if (controller_x > camera_get_view_x(view_camera[view_current]))
				{
					controller_x -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player1_slot, gp_axisrh) > 0)
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
		
		or (can_make_place_brush_size_bigger == true)
		and (mouse_check_button(mb_left))
		
		or (can_make_place_brush_size_bigger == false)
		and (key_a_pressed)
		
		or (can_make_place_brush_size_bigger == true)
		and (key_a_hold)
		{
			if (!keyboard_check(vk_space))
			and (!mouse_check_button(mb_middle))
			and (!mouse_check_button(mb_right))
			and (pressing_play_timer == 0)
			and (scroll_view == false)
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
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
			and (!point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32)) /* Can't place objects when clicking the play button */
			{
				if (show_grid == true)
				and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32, 80 + icons_at_top_y + 16 - 32, display_get_gui_width() + 64, 80 + icons_at_top_y + 16 + 32)) /* Up and down buttons when grid is on */
				or (show_grid == false)
				{
					if (global.enable_difficulty_selection_settings == true)
					and (global.enable_difficutly_layers_in_level_editor == true)
					and (set_difficulty_mode == true)
					and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
					or (global.enable_difficulty_selection_settings == true)
					and (global.enable_difficutly_layers_in_level_editor == true)
					and (set_difficulty_mode == false)
					and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
					or (global.enable_difficulty_selection_settings == false)
					or (global.enable_difficutly_layers_in_level_editor == false)
					{
						if (x > -16) /* Can only place objects within the level */
						and (y > -16)
						and (instance_exists(obj_level_width))
						and (obj_level_width.drag_object == false)
						and (obj_level_width.drag_release_timer == 0)
						and (x < obj_level_width.x + 16)
						and (instance_exists(obj_level_height))
						and (obj_level_height.drag_object == false)
						and (obj_level_height.drag_release_timer == 0)
						and (y < obj_level_height.y + 16)
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
							
							/* Unlocked objects should be set as not recently unlocked anymore */
							ini_open(working_directory + "/save_files/file" + string(global.file) + ".ini");
							if (ini_read_real("Unlock Placable Objects", place_object, false) == true) /* Only update if the current object is recently unlocked */
							{
								ini_write_real("Unlock Placable Objects", place_object, 2); /* Set that the unlockable object isn't recently unlocked and "New" anymore */
							}
							ini_close();
							
							#region /* Reset Level Editor Checkpoint */
							if (asset_get_type("room_leveleditor") == asset_room)
							and (room == room_leveleditor)
							and (global.character_select_in_this_menu == "level_editor")
							and (global.create_level_from_template == false)
							{
								ini_open(working_directory + "/save_files/custom_level_save.ini");
								ini_key_delete(global.level_name, "checkpoint_x");
								ini_key_delete(global.level_name, "checkpoint_y");
								ini_key_delete(global.level_name, "checkpoint_millisecond");
								ini_key_delete(global.level_name, "checkpoint_second");
								ini_key_delete(global.level_name, "checkpoint_minute");
								ini_key_delete(global.level_name, "checkpoint_realmillisecond");
								ini_key_delete(global.level_name, "checkpoint_direction");
								ini_close();
							}
							#endregion /* Reset Level Editor Checkpoint END */
							
							#region /* Reset ranking highscore to actual custom level when placing objects */
							if (global.character_select_in_this_menu == "level_editor")
							and (file_exists(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini"))
							{
								if (global.character_select_in_this_menu == "level_editor")
								{
									ini_open(working_directory + "/custom_levels/" + string(global.level_name) + "/data/level_information.ini");
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
	
	scr_set_controls_used_to_navigate();
	
	#region /* Make background visible */
	if (room == room_leveleditor)
	{
		if (global.custom_background1 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background")), false)
		}
		
		if (global.custom_background2 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_2")), false)
		}
		
		if (global.custom_background3 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_3")), false)
		}
		
		if (global.custom_background4 > noone)
		and (global.full_level_map_screenshot == false)
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), true)
		}
		else
		{
			layer_background_visible(layer_background_get_id(layer_get_id("Background_4")), false)
		}
	}
	#endregion /* Make background visible END */
	
	#region /* Keyboard Shortcuts */
	
	#region /* Press D key to change to drawing tool in level editor */
	if (keyboard_check_pressed(key_draw))
	and (pause == false)
	or (gamepad_button_check_pressed(global.player1_slot, button_draw))
	and (pause == false)
	{
		if (fill_mode == false)
		and (erase_mode == false)
		{
			if (place_brush_size == 0)
			{
				place_brush_size = 1;
			}
			else
			if (place_brush_size == 1)
			{
				place_brush_size = 2;
			}
			else
			if (place_brush_size == 2)
			{
				place_brush_size = 3;
			}
			else
			if (place_brush_size == 3)
			{
				place_brush_size = 4;
			}
			else
			if (place_brush_size == 4)
			{
				place_brush_size = 5;
			}
			else
			if (place_brush_size == 5)
			{
				place_brush_size = 0;
			}
		}
		else
		{
			fill_mode = false;
			erase_mode = false;
		}
	}
	#endregion /* Press D key to change to drawing tool in level editor END */
	
	#region /* Press E key to change to erase tool in level editor */
	if (keyboard_check_pressed(key_erase))
	and (pause == false)
	or (gamepad_button_check_pressed(global.player1_slot, button_erase))
	and (pause == false)
	{
		if (erase_mode == false)
		{
			erase_mode = true;
			fill_mode = false;
		}
		else
		if (erase_mode == true)
		{
			fill_mode = false;
			if (erase_brush_size == 0)
			{
				erase_brush_size = 1;
			}
			else
			if (erase_brush_size == 1)
			{
				erase_brush_size = 2;
			}
			else
			if (erase_brush_size == 2)
			{
				erase_brush_size = 3;
			}
			else
			if (erase_brush_size == 3)
			{
				erase_brush_size = 4;
			}
			else
			if (erase_brush_size == 4)
			{
				erase_brush_size = 5;
			}
			else
			if (erase_brush_size == 5)
			{
				erase_brush_size = 0;
			}
		}
	}
	#endregion /* Press E key to change to erase tool in level editor */
	
	#region /* Press F key to change to fill tool in level editor */
	if (keyboard_check_pressed(key_fill))
	and (pause == false)
	or (gamepad_button_check_pressed(global.player1_slot, button_fill))
	and (pause == false)
	{
		if (fill_mode == false)
		{
			erase_mode = false;
			fill_mode = true;
		}
		else
		if (fill_mode_type == "fill")
		and (erase_mode == false)
		and (fill_mode == true)
		{
			erase_mode = false;
			fill_mode_type = "horizontal";
		}
		else
		if (fill_mode_type == "horizontal")
		and (erase_mode == false)
		and (fill_mode == true)
		{
			erase_mode = false;
			fill_mode_type = "vertical";
		}
		else
		if (fill_mode_type == "vertical")
		and (erase_mode == false)
		and (fill_mode == true)
		{
			erase_mode = false;
			fill_mode_type = "fill";
		}
	}
	#endregion /* Press F key to change to fill tool in level editor */
	
	#region /* Scroll mouse wheel to change drawing tool size in level editor */
	if (fill_mode == false)
	and (erase_mode == false)
	and (mouse_check_button(mb_left))
	and (pause == false)
	{
		if (mouse_wheel_down())
		{
			if (place_brush_size > 0)
			{
				place_brush_size -= 1;
			}
		}
		else
		if (mouse_wheel_up())
		{
			if (place_brush_size < 5)
			{
				place_brush_size += 1;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change drawing tool size in level editor End */
	
	#region /* Scroll mouse wheel to change erase tool size in level editor */
	if (erase_mode == true)
	and (pause == false)
	{
		if (mouse_wheel_down())
		{
			fill_mode = false;
			if (erase_brush_size > 0)
			{
				erase_brush_size -= 1;
			}
		}
		else
		if (mouse_wheel_up())
		{
			fill_mode = false;
			if (erase_brush_size < 5)
			{
				erase_brush_size += 1;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change erase tool size in level editor END */
	
	#region /* Grid hotkeys */
	if (keyboard_check(vk_control))
	and (keyboard_check(vk_shift))
	and (keyboard_check_pressed(ord("A")))
	and (pause == false)
	{
		show_grid = true;
		if (global.grid_hsnap > 16)
		or (global.grid_vsnap > 16)
		{
			global.grid_hsnap -= 16;
			global.grid_vsnap -= 16;
		}
	}
	else
	if (keyboard_check(vk_control))
	and (keyboard_check(vk_shift))
	and (keyboard_check_pressed(ord("S")))
	and (pause == false)
	{
		show_grid = true;
		global.grid_hsnap += 16;
		global.grid_vsnap += 16;
	}
	else
	if (keyboard_check(vk_control))
	and (!keyboard_check(vk_shift))
	and (keyboard_check_pressed(ord("A")))
	and (pause == false)
	{
		show_grid = true;
		if (global.grid_hsnap > 1)
		or (global.grid_vsnap > 1)
		{
			global.grid_hsnap -= 1;
			global.grid_vsnap -= 1;
		}
	}
	else
	if (keyboard_check(vk_control))
	and (!keyboard_check(vk_shift))
	and (keyboard_check_pressed(ord("S")))
	and (pause == false)
	{
		show_grid = true;
		global.grid_hsnap += 1;
		global.grid_vsnap += 1;
	}
	#endregion /* Grid hotkeys END */

	#endregion /* Keyboard Shortcuts END */
	
	#region /* Show or hide grid hotkey */
	if (keyboard_check_pressed(key_grid))
	and (pause == false)
	or (gamepad_button_check_pressed(global.player1_slot, button_grid))
	and (pause == false)
	{
		if (show_grid == false)
		{
			show_grid = true;
		}
		else
		{
			show_grid = false;
		}
	}
	#endregion /* Show or hide grid hotkey END */
	
	#region /* Fade grid in and out when toggeling */
	if (show_grid == true)
	{
		grid_alpha = lerp(grid_alpha, 0.25, 0.1);
	}
	else
	{
		grid_alpha = lerp(grid_alpha, 0, 0.1);
	}
	#endregion /* Fade grid in and out when toggeling END */
	
	#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
	if (pause == false)
	{
		
		#region /* Zoom Out */
		if (zoom_out == true)
		{
			if (camera_get_view_width(view_camera[view_current]) < 3840) /* 1920 * 2 = 3840 */
			and (camera_get_view_height(view_camera[view_current]) < 2160) /* 1080 * 2 = 2160 */
			{
				camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) + 8, camera_get_view_height(view_camera[view_current]) + 4.5);
				camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) -4, camera_get_view_y(view_camera[view_current]) - 2.5); /* Move camera position when zooming out so it doesn't look too weird */
			}
		}
		#endregion /* Zoom Out END */
		
		else
		
		#region /* Reset Zoom */
		if (zoom_reset == true)
		{
			
			#region /* Limit so cursor and view can't go outside room */
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
		
		}
		#endregion /* Reset Zoom END */
	
		else
	
		#region /* Zoom In */
		if (zoom_in == true)
		{
			if (camera_get_view_width(view_camera[view_current]) > 696)
			and (camera_get_view_height(view_camera[view_current]) > 368)
			{
				camera_set_view_size((view_camera[view_current]), camera_get_view_width(view_camera[view_current]) - 8, camera_get_view_height(view_camera[view_current]) -4.5);
				camera_set_view_pos((view_camera[view_current]), camera_get_view_x(view_camera[view_current]) + 4, camera_get_view_y(view_camera[view_current]) + 2.5); /* Move camera position when zooming in so it doesn't look too weird */
			}
		}
		#endregion /* Zoom In END */

	}
	#endregion /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END */
	
	#region /* Select Object Menu */
	if (mouse_check_button(mb_any))
	or (keyboard_check(vk_anykey))
	or (key_a_hold)
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.1);
	}
	else
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.01);
	}
	#endregion /* Select Object Menu END */
	
	#region /* Position the Cursor */
	if (quit_level_editor <= 0)
	{

	#region /* Scroll Cursor */
	if (keyboard_check(vk_space))
	and (mouse_check_button(mb_left))
	or (mouse_check_button(mb_middle))
	{
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			mouse_sprite = spr_cursor_scroll;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_size_all);
		}
	}
	else
	if (keyboard_check(vk_space))
	{
		if (asset_get_type("spr_cursor_scroll") == asset_sprite)
		{
			mouse_sprite = spr_cursor_scroll;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_size_all);
		}
	}
	#endregion /* Scroll Cursor END */

	else

	#region /* Fill Cursor */
	if (fill_mode == true)
	and (erase_mode == false)
	and (scroll_view == false)
	and (!place_meeting(x, y, obj_level_player_1_start))
	and (!place_meeting(x, y, obj_level_player_2_start))
	and (!place_meeting(x, y, obj_level_player_3_start))
	and (!place_meeting(x, y, obj_level_player_4_start))
	and (!place_meeting(x, y, obj_level_end))
	{
		if (asset_get_type("spr_cursor_fill") == asset_sprite)
		{
			mouse_sprite = spr_cursor_fill;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Fill Cursor END */
	
	else
	
	#region /* Erase Cursor */
	if (erase_mode == true)
	and (scroll_view == false)
	and (pause == false)
	{
		if (asset_get_type("spr_cursor_erase") == asset_sprite)
		{
			mouse_sprite = spr_cursor_erase;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Erase Cursor END */
	
	else
	
	#region /* Default Cursor */
	if (asset_get_type("obj_leveleditor_placed_object") == asset_object)
	and (scroll_view == false)
	and (drag_object == false)
	and (fill_mode == false)
	and (pause == false)
	{
		if (asset_get_type("spr_cursor_brush") == asset_sprite)
		{
			mouse_sprite = spr_cursor_brush;
			window_set_cursor(cr_none);
		}
		else
		{
			window_set_cursor(cr_arrow);
		}
	}
	#endregion /* Default Cursor END */
	
	}
	#endregion /* Position the Cursor END */
	
	#region /* Change modes */
	if (mouse_check_button_pressed(mb_right))
	{
		if (pause == false)
		and (menu_delay == 0)
		{
			erase_mode = true;
		}
	}
	if (mouse_check_button_released(mb_right))
	{
		if (pause == false)
		and (menu_delay == 0)
		{
			erase_mode = false;
		}
	}
	#endregion /* Change modes END */

	if (quit_level_editor <= 0)
	{
	
		#region /* When pressing left click, increase current undo value */
		if (mouse_check_button_pressed(mb_left))
		{
			current_undo_value += 1;
		}
		#endregion /* When pressing left click, increase current undo value END */
	
		#region /* Minimum undo value */
		if (current_undo_value <= 0)
		{
			current_undo_value = 0;
		}
		#endregion /* Minimum undo value END */
		
		#region /* Fill with Objects */
		if (mouse_check_button(mb_left))
		and (!keyboard_check(vk_space))
		and (!mouse_check_button(mb_middle))
		and (!mouse_check_button(mb_right))
		and (!key_b_hold)
		and (scroll_view == false)
		and (drag_object == false)
		and (fill_mode == true)
		and (erase_mode == false)
		and (pause == false)
		and (menu_delay == 0)
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom buttons */
		and (!point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
		{
			if (!place_meeting(x, y, obj_leveleditor_placed_object))
			and (!place_meeting(x, y, obj_leveleditor_fill))
			{
				if (fill_mode_type == "fill")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "fill";
					}
				}
				else
				if (fill_mode_type == "horizontal")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "horizontal";
					}
				}
				else
				if (fill_mode_type == "vertical")
				{
					with (instance_create_depth(x, y, 0, obj_leveleditor_fill))
					{
						fill_mode_type = "vertical";
					}
				}
			}
		}
		#endregion /* Fill with Objects END */
	
		#region /* SELECT WHAT OBJECT TO PLACe */
	
		#region /* Scroll Objects Left */
		if (mouse_wheel_up())
		and (!mouse_check_button(mb_middle))
		and (!key_a_pressed)
		and (!mouse_check_button(mb_left))
		and (erase_mode == false)
		and (pause == false)
		or (gamepad_button_check_pressed(global.player1_slot, gp_padl))
		and (erase_mode == false)
		and (pause == false)
		{
			if (asset_get_type("obj_leveleditor_fill") == asset_object)
			and (!instance_exists(obj_leveleditor_fill))
			{
				scr_audio_play(snd_leveleditor_cycle_item_left, volume_source.sound);
				if (selected_object > 0)
				{
					selected_object -= 1;
					selected_object_menu_x += 64;
				}
				else
				{
					selected_object = total_number_of_objects;
					selected_object_menu_x =- 64 *total_number_of_objects;
				}
				selected_menu_alpha = 2;
			}
		}
		#endregion /* Scroll Objects Left END */
	
		#region /* Scroll Objects Right */
		if (mouse_wheel_down())
		and (!mouse_check_button(mb_middle))
		and (!key_a_pressed)
		and (!mouse_check_button(mb_left))
		and (erase_mode == false)
		and (pause == false)
		or (gamepad_button_check_pressed(global.player1_slot, gp_padr))
		and (erase_mode == false)
		and (pause == false)
		{
			if (asset_get_type("obj_leveleditor_fill") == asset_object)
			and (!instance_exists(obj_leveleditor_fill))
			{
				scr_audio_play(snd_leveleditor_cycle_item_right, volume_source.sound);
				if (selected_object < total_number_of_objects)
				{
					selected_object += 1;
					selected_object_menu_x -= 64;
				}
				else
				{
					selected_object = 0;
					selected_object_menu_x = 0;
				}
				selected_menu_alpha = 2;
			}
		}
		#endregion /* Scroll Objects Right END */
	
		#endregion /* SELECT WHAT OBJECT TO PLACE END */
	
	}

	#region /* Menu Navigation Delay */
	if (menu_delay > 0)
	{
		menu_delay -= 1;
	}
	if (menu_delay < 0)
	{
		menu_delay = 0;
	}
	#endregion /* Menu Navigation Delay END */
	
	#region /* Pause virtual key */
	if (os_type == os_ios)
	or (os_type == os_android)
	{
		virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /* Pause virtual key */
	}
	#endregion /* Pause virtual key END */
	
	#region /* End Game */
	if (quit_level_editor >= true)
	{
		quit_level_editor += 1;
		instance_activate_all(); /* Activate all instances before saving the custom level */
		
		#region /* Save Level */
		if (quit_level_editor == 3)
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
			ini_write_real(string(global.level_name), "checkpoint_x", 0);
			ini_write_real(string(global.level_name), "checkpoint_y", 0);
			ini_write_real(string(global.level_name), "checkpoint_millisecond", 0);
			ini_write_real(string(global.level_name), "checkpoint_second", 0);
			ini_write_real(string(global.level_name), "checkpoint_minute", 0);
			ini_write_real(string(global.level_name), "checkpoint_realmillisecond", 0);
			ini_close();
			
			menu_delay = 9999; /* Disable all menu control */
			lives = 5;
			global.lives_until_assist = 0;
			global.actually_play_edited_level = false;
			global.play_edited_level = false; /* Set this to false so you don't playtest the level */
			global.character_select_in_this_menu = "level_editor";
		}
		#endregion /* Save Level END */
		
		#region /* Save Thumbnail a little bit after saving level */
		if (quit_level_editor == 4)
		{
			var thumbnail_sprite;
			thumbnail_sprite = sprite_create_from_surface(application_surface,
			camera_get_view_x(view_camera[view_current]),
			camera_get_view_y(view_camera[view_current]),
			camera_get_view_width(view_camera[view_current]),
			camera_get_view_height(view_camera[view_current]), false, true, 0, 0);
			if (global.level_name != "")
			{
				sprite_save(thumbnail_sprite, 0, working_directory + "/custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png");
			}
			scr_delete_sprite_properly(thumbnail_sprite);
		}
		#endregion /* Save Thumbnail a little bit after saving level END */
		
		if (quit_level_editor > 5)
		{
			global.create_level_from_template = false; /* Disable global.create_level_from_template after loading everything and quitting the level editor, to let every object have time to load and save */
			room_goto(room_title);
		}
	}
	#endregion /* End Game END */
	
	#region /* Deactivate instances outside view, run this code last in step event */
	deactivate_timer += 1;
	if (deactivate_timer >= 10)
	{
		if (startup_loading_timer <= 3)
		{
			startup_loading_timer += 1;
		}
		
		if (quit_level_editor == 0)
		and (global.play_edited_level == false)
		and (startup_loading_timer >= 3)
		{
			instance_activate_all();
			//instance_deactivate_region(
			//camera_get_view_x(view_camera[view_current]) - 32,
			//camera_get_view_y(view_camera[view_current]) - 32,
			//camera_get_view_width(view_camera[view_current]) + 32 /* Camera Width */,
			//camera_get_view_height(view_camera[view_current]) + 32 /* Camera Height */,
			//false, true);
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
		
		deactivate_timer = 0;
	}
	#endregion /* Deactivate instances outside view, run this code last in step event END */
	
	#region /* Keep view within the level */
	if (view_center_x < 0)
	and (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], 0 - camera_get_view_width(view_camera[view_current]) * 0.5, camera_get_view_y(view_camera[view_current]));
	}
	if (view_center_y < 0)
	and (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), 0 - camera_get_view_height(view_camera[view_current]) * 0.5);
	}
	if (instance_exists(obj_level_width))
	and (obj_level_width.drag_object == false)
	and (obj_level_width.drag_release_timer == 0)
	and (view_center_x > obj_level_width.x)
	and (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], obj_level_width.x - camera_get_view_width(view_camera[view_current]) * 0.5, camera_get_view_y(view_camera[view_current]));
	}
	if (instance_exists(obj_level_height))
	and (obj_level_height.drag_object == false)
	and (obj_level_height.drag_release_timer == 0)
	and (view_center_y > obj_level_height.y)
	and (scroll_view == false)
	{
		camera_set_view_pos(view_camera[view_current], camera_get_view_x(view_camera[view_current]), obj_level_height.y - camera_get_view_height(view_camera[view_current]) * 0.5);
	}
	#endregion /* Keep view within the level END */
	
}