/* Top Right Icons X Positions */
grid_button_x = display_get_gui_width() - 288;
zoom_out_button_x = display_get_gui_width() - 224;
zoom_reset_button_x = display_get_gui_width() - 160;
zoom_in_button_x = display_get_gui_width() - 96;
help_button_x = display_get_gui_width() - 32;
autoscroll_icon_y = display_get_gui_height() - 192;

if (instance_exists(obj_leveleditor_modify_object_menu))
{
	in_modify_object_menu = true;
}
else
{
	in_modify_object_menu = false;
}

scr_set_controls_used_to_navigate();

#region /* Navigate the level editor icon with D-Pad */
if (menu_delay == 0 && menu_joystick_delay == 0)
&& (!pause)
&& (!in_modify_object_menu)
&& (!show_autoscroll_menu)
{
	/* UP */ if (keyboard_check_pressed(ord("I")))
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_padu))
	{
		menu_delay = 3;
		if (level_editor_menu == ""){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{if (!if_daily_build){level_editor_menu = "terrain";}else{level_editor_menu = "daily_build_standard";}}}else
		
		if (level_editor_menu == "autoscroll"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{if (!if_daily_build){level_editor_menu = "terrain";}else{level_editor_menu = "daily_build_standard";}}}else
		
		if (level_editor_menu == "play"){level_editor_menu = "autoscroll";}else
		if (level_editor_menu == "pen"){level_editor_menu = "autoscroll";}else
		if (level_editor_menu == "erase"){level_editor_menu = "autoscroll";}else
		if (level_editor_menu == "fill"){level_editor_menu = "autoscroll";}else
		if (level_editor_menu == "hide"){level_editor_menu = "autoscroll";}else
		if (level_editor_menu == "difficulty_toggle"){level_editor_menu = "help";}else
		if (level_editor_menu == "wipe"){level_editor_menu = "help";}else
		if (level_editor_menu == "easy"){level_editor_menu = "help";}else
		if (level_editor_menu == "normal"){level_editor_menu = "help";}else
		if (level_editor_menu == "hard"){level_editor_menu = "help";}else
		if (level_editor_menu == "select_object_menu"){level_editor_menu = string(current_object_category);}
	}
	/* Left */ if (keyboard_check_pressed(ord("J")))
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_padl))
	{
		menu_delay = 3;
		if (level_editor_menu == ""){level_editor_menu = "play";}else
		if (level_editor_menu == "terrain"){level_editor_menu = "play";}else
		if (level_editor_menu == "decoration"){level_editor_menu = "terrain";}else
		if (level_editor_menu == "item"){level_editor_menu = "decoration";}else
		if (level_editor_menu == "enemy"){level_editor_menu = "item";}else
		if (level_editor_menu == "gizmo"){level_editor_menu = "enemy";}else
		if (level_editor_menu == "daily_build_standard"){level_editor_menu = "play";}else
		if (level_editor_menu == "daily_build_featured"){level_editor_menu = "daily_build_standard";}else
		if (level_editor_menu == "grid"){if (!if_daily_build){level_editor_menu = "gizmo";}else if (if_daily_build){level_editor_menu = "daily_build_featured"}}else
		if (level_editor_menu == "zoom_out"){level_editor_menu = "grid";}else
		if (level_editor_menu == "zoom_reset"){level_editor_menu = "zoom_out";}else
		if (level_editor_menu == "zoom_in"){level_editor_menu = "zoom_reset";}else
		if (level_editor_menu == "help"){level_editor_menu = "zoom_in";}else
		if (level_editor_menu == "pen"){level_editor_menu = "play";}else
		if (level_editor_menu == "erase"){level_editor_menu = "pen";}else
		if (level_editor_menu == "fill"){level_editor_menu = "erase";}else
		if (level_editor_menu == "hide"){level_editor_menu = "fill";}else
		if (level_editor_menu == "difficulty_toggle"){if (set_difficulty_mode){level_editor_menu = "hard";}else{level_editor_menu = "hide";}}else
		if (level_editor_menu == "wipe"){if (global.enable_difficutly_layers_in_level_editor){level_editor_menu = "difficulty_toggle";}else{level_editor_menu = "hide";}}else
		if (level_editor_menu == "easy"){level_editor_menu = "hide";}else
		if (level_editor_menu == "normal"){level_editor_menu = "easy";}else
		if (level_editor_menu == "hard"){level_editor_menu = "normal";}
	}
	/* Down */ if (keyboard_check_pressed(ord("K")))
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_padd))
	{
		menu_delay = 3;
		if (level_editor_menu == ""){level_editor_menu = "play";}else
		if (level_editor_menu == "terrain"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "decoration"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "item"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "enemy"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "gizmo"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "daily_build_standard"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "daily_build_featured"){if (show_selected_menu){level_editor_menu = "select_object_menu";}else{level_editor_menu = "autoscroll";}}else
		if (level_editor_menu == "grid"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "zoom_out"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "zoom_reset"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "zoom_in"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "help"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "select_object_menu"){level_editor_menu = "autoscroll";}else
		
		if (level_editor_menu == "autoscroll"){level_editor_menu = "play";}
	}
	/* Right */ if (keyboard_check_pressed(ord("L")))
	|| (gamepad_button_check_pressed(global.player_slot[1], gp_padr))
	{
		menu_delay = 3;
		if (level_editor_menu == ""){level_editor_menu = "help";}else
		if (level_editor_menu == "terrain"){level_editor_menu = "decoration";}else
		if (level_editor_menu == "decoration"){level_editor_menu = "item";}else
		if (level_editor_menu == "item"){level_editor_menu = "enemy";}else
		if (level_editor_menu == "enemy"){level_editor_menu = "gizmo";}else
		if (level_editor_menu == "gizmo"){level_editor_menu = "grid";}else
		if (level_editor_menu == "daily_build_standard"){level_editor_menu = "daily_build_featured";}else
		if (level_editor_menu == "daily_build_featured"){level_editor_menu = "grid";}else
		if (level_editor_menu == "grid"){level_editor_menu = "zoom_out";}else
		if (level_editor_menu == "zoom_out"){level_editor_menu = "zoom_reset";}else
		if (level_editor_menu == "zoom_reset"){level_editor_menu = "zoom_in";}else
		if (level_editor_menu == "zoom_in"){level_editor_menu = "help";}else
		if (level_editor_menu == "help"){level_editor_menu = "help";}else
		if (level_editor_menu == "play"){level_editor_menu = "pen";}else
		if (level_editor_menu == "pen"){level_editor_menu = "erase";}else
		if (level_editor_menu == "erase"){level_editor_menu = "fill";}else
		if (level_editor_menu == "fill"){level_editor_menu = "hide";}else
		if (level_editor_menu == "hide"){if (set_difficulty_mode){level_editor_menu = "easy";}else if (global.enable_difficutly_layers_in_level_editor){level_editor_menu = "difficulty_toggle";}else{level_editor_menu = "wipe";}}else
		if (level_editor_menu == "difficulty_toggle"){level_editor_menu = "wipe";}else
		if (level_editor_menu == "easy"){level_editor_menu = "normal";}else
		if (level_editor_menu == "normal"){level_editor_menu = "hard";}else
		if (level_editor_menu == "hard"){level_editor_menu = "difficulty_toggle";}
	}
	/* Back */ if (level_editor_menu != "")
	&& (level_editor_menu != "help_open")
	{
		if (key_b_pressed)
		|| (key_up)
		|| (key_left)
		|| (key_down)
		|| (key_right)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) < -0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislh) > +0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislv) < -0.3)
		|| (gamepad_axis_value(global.player_slot[1], gp_axislv) > +0.3)
		|| (global.controls_used_for_navigation == "mouse")
		|| (pause)
		{
			menu_delay = 3;
			level_editor_menu = "";
		}
	}
}
#endregion /* Navigate the level editor icon with D-Pad END */

#region /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" */
if (global.doing_clear_check_level)
{
	menu_delay = 99;
	audio_stop_sound(level_editing_music); /* Stop the background music that plays during level editing when playtesting a level */
	if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/automatic_thumbnail.png"))
	{
		instance_activate_all();
		doing_clear_check_timer += 1;
	}
	else
	{
		doing_clear_check_timer_thumbnail += 1;
	}
}

#region /* Save automatic thumbnail before doing a clear check */
if (doing_clear_check_timer_thumbnail == 2)
{
	if (instance_exists(obj_background_brightness_gameplay))
	{
		obj_background_brightness_gameplay.background_brightness_lerp = 0;
	}
	
	#region /* Limit so cursor and view can't go outside room */
	if (cam_width < 1920 || cam_height < 1080)
	{
		camera_set_view_size(view_camera[view_current], 1920, 1080);
	}
	scr_set_screen_size();
	
	/* Limit view inside room when saving screenshot */
	if (instance_exists(obj_level_width) && instance_exists(obj_level_height))
	{
		camera_set_view_pos(view_camera[view_current],
		max(0, min(cam_x, obj_level_width.x - cam_width)),
		max(0, min(cam_y, obj_level_height.y - cam_height)));
	}
	
	/* Limit controller x and y inside room */
	controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
	controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
	
	/* Limit x and y inside room */
	x = clamp(x, cam_x, cam_x + cam_width);
	y = clamp(y, cam_y, cam_y + cam_height);
	#endregion /* Limit so view and cursor can't go outside room END */
	
}
else
if (doing_clear_check_timer_thumbnail == 3)
{
	scr_automatic_screenshot();
}
#endregion /* Save automatic thumbnail before doing a clear check END */

if (doing_clear_check_timer == 1) /* Save the level before starting clear check */
{
	show_debug_message("Save the level before starting clear check");
	scr_save_custom_level_json();
}
if (doing_clear_check_timer == 3) /* Spawn the objects before starting clear check */
{
	show_debug_message("Spawn the objects before starting clear check ");
	with(obj_leveleditor_placed_object)
	{
		alarm[1] = 1;
	}
}
if (doing_clear_check_timer == 5) /* Start the clear check */
{
	show_debug_message("Start the clear check");
	audio_stop_sound(level_editing_music);
	global.character_select_in_this_menu = "level_editor";
	global.actually_play_edited_level = true;
	global.play_edited_level = true;
	room_restart();
}
#endregion /* Make sure when doing a clear check, that you actually play the level. Have this code before the "actually play edited level = true" END */

if (!global.actually_play_edited_level)
&& (!modify_object_menu)
{
	
	#region /* Hide/Show Backgrounds */
	if (keyboard_check_pressed(ord("B")))
	{
		global.enable_background_layer1 = !global.enable_background_layer1;
		global.enable_background_layer2 = !global.enable_background_layer2;
		global.enable_background_layer3 = !global.enable_background_layer3;
		global.enable_background_layer4 = !global.enable_background_layer4;
		global.enable_foreground_layer1 = !global.enable_foreground_layer1;
		global.enable_foreground_layer_1_5 = !global.enable_foreground_layer_1_5;
		global.enable_foreground_layer2 = !global.enable_foreground_layer2;
		global.enable_foreground_layer_secret = !global.enable_foreground_layer_secret;
		scr_make_background_visible();
	}
	#endregion /* Hide/Show Backgrounds END */
	
	#region /* Autosave */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		autosave_timer++;
	}
	if (autosave_timer > 18000 - 1) /* Activate all objects 1 frame before saving level, just to make sure everything gets saved */
	{
		startup_loading_timer = 0;
		instance_activate_all();
	}
	if (autosave_timer > 18000) /* After 5 minutes, autosave. 5 minutes = 300 seconds. 60 fps: 300 seconds = 18000 frames */
	{
		startup_loading_timer = 0;
		instance_activate_all();
		scr_save_custom_level_json();
		autosave_timer = 0;
	}
	#endregion /* Autosave END */
	
	#region /* Check if keys are double-tapped */
	if (key_up_pressed)
	|| (key_down_pressed)
	|| (key_left_pressed)
	|| (key_right_pressed)
	{
		if key_double_tap_timer <= 0
		&& (gamepad_axis_value(global.player_slot[1], gp_axislh) == 0)
		&& (gamepad_axis_value(global.player_slot[1], gp_axislv) == 0)
		{
			if (key_up_pressed)
			{
				key_double_tap_direction = "up";
			}
			else
			if (key_down_pressed)
			{
				key_double_tap_direction = "down";
			}
			else
			if (key_left_pressed)
			{
				key_double_tap_direction = "left";
			}
			else
			if (key_right_pressed)
			{
				key_double_tap_direction = "right";
			}
			key_double_tap_timer = room_speed * 0.2; /* Set a time window for the double-tap */
		}
		else
		if (gamepad_axis_value(global.player_slot[1], gp_axislh) == 0)
		&& (gamepad_axis_value(global.player_slot[1], gp_axislv) == 0)
		{
			if (key_up_pressed)
			&& (key_double_tap_direction == "up")
			&& (!keyboard_check(vk_shift))
			|| (key_down_pressed)
			&& (key_double_tap_direction == "down")
			&& (!keyboard_check(vk_shift))
			|| (key_left_pressed)
			&& (key_double_tap_direction == "left")
			&& (!keyboard_check(vk_shift))
			|| (key_right_pressed)
			&& (key_double_tap_direction == "right")
			&& (!keyboard_check(vk_shift))
			{
				double_tap_move_camera_faster = true;
			}
			else
			{
				key_double_tap_timer = 0;
			}
		}
	}
	if (!key_up)
	&& (!key_down)
	&& (!key_left)
	&& (!key_right)
	{
		if (double_tap_move_camera_faster)
		{
			double_tap_move_camera_faster = false;
		}
		if key_double_tap_timer > 0
		{
			key_double_tap_timer -= 1;
			if key_double_tap_timer <= 0
			{
				double_tap_move_camera_faster = false;
			}
		}
	}
	#endregion /* Check if keys are double-tapped END */
	
	cam_x = camera_get_view_x(view_camera[view_current]);
	cam_y = camera_get_view_y(view_camera[view_current]);
	cam_width = camera_get_view_width(view_camera[view_current]);
	cam_height = camera_get_view_height(view_camera[view_current]);
	get_window_height = display_get_gui_height();
	get_window_width = display_get_gui_width();
	mouse_get_x = device_mouse_x_to_gui(0);
	mouse_get_y = device_mouse_y_to_gui(0);
	view_center_x = cam_x + cam_width * 0.5;
	view_center_y = cam_y + cam_height * 0.5;
	
	if (point_in_rectangle(mouse_get_x, mouse_get_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2)) /* Can't place objects when clicking the bottom buttons */
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, grid_button_x - 32, - 64, display_get_gui_width(), + 64)) /* Can't place objects when clicking the top buttons */
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32)) /* Can't place objects when clicking the play button */
	|| (show_grid)
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 32 - 32, 80 + icon_at_top_y + 16 - 32, display_get_gui_width() + 64, 80 + icon_at_top_y + 16 + 32)) /* Up and down buttons when grid is on */
	|| (global.enable_difficutly_layers_in_level_editor)
	&& (set_difficulty_mode)
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 256 - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
	|| (global.enable_difficutly_layers_in_level_editor)
	&& (!set_difficulty_mode)
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 64 - 64, display_get_gui_height() - 64, display_get_gui_width(), room_height * 2)) /* Can't place objects when clicking the bottom right buttons */
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 64 - 64 - 32, 0, display_get_gui_width() * 0.5 + 64 + 64 + 32, 64)) /* Can't place objects when clicking the object category buttons */
	|| (welcome_to_level_editor > 0) /* Can't click on objects behind the help menu */
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() * 0.5 - 350, display_get_gui_height() * 0.5 - 200, display_get_gui_width() * 0.5 + 350, display_get_gui_height() * 0.5 + 200))
	|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64)) /* Can't place objects when clicking the undo and redo buttons */
	|| (show_selected_menu)
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, display_get_gui_width(), 192)) /* Can't place objects when clicking the object category buttons or objects in toolbar */
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 185, pause_button_y, display_get_gui_width(), pause_button_y + 42)) /* Hovering over pause button */
	|| (show_autoscroll_menu)
	&& (point_in_rectangle(mouse_get_x, mouse_get_y, 132, autoscroll_icon_y - 8, 670, autoscroll_icon_y + 48 + 42)) /* Hovering over autoscroll menu */
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, icon_at_left_x - 32, autoscroll_icon_y - 32, icon_at_left_x + 64, autoscroll_icon_y + 32)) /* Hovering over autoscroll button */
	{
		if (global.controls_used_for_navigation == "mouse")
		{
			hovering_over_icon = true;
		}
		else
		{
			hovering_over_icon = false;
		}
	}
	else
	{
		hovering_over_icon = false;
	}
	
	scr_resize_application_surface();
	
	global.leveleditor_x = x;
	global.leveleditor_y = y;
	
	#region /* Need to set the controls early in the step event */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		scr_controls_for_level_editor();
	}
	else
	{
		scr_menu_navigation_initialization(0, true);
	}
	#endregion /* Need to set the controls early in the step event END */
	
	#region /* Deactivate instances outside view. Run this code at start of Step Event */
	global.deactivate_timer ++;
	if (global.deactivate_timer >= 5)
	&& (pressing_play_timer == 0)
	&& (pause <= 1)
	{
		if (startup_loading_timer <= 3)
		{
			startup_loading_timer ++;
		}
		
		if (quit_level_editor == 0)
		&& (!global.play_edited_level)
		&& (startup_loading_timer >= 3)
		{
			instance_activate_all();
			instance_deactivate_region(cam_x - 32, cam_y - 32, cam_width + 32, cam_height + 32, false, true);
		}
		
		#region /* Activate objects that always should be active */
		instance_activate_object(obj_foreground1);
		instance_activate_object(obj_foreground1_5);
		instance_activate_object(obj_foreground2);
		instance_activate_object(obj_foreground_secret);
		instance_activate_object(obj_level_player1_start);
		instance_activate_object(obj_level_player2_start);
		instance_activate_object(obj_level_player3_start);
		instance_activate_object(obj_level_player4_start);
		instance_activate_object(obj_level_end);
		instance_activate_object(obj_level_height);
		instance_activate_object(obj_level_width);
		instance_activate_object(obj_water_level_height);
		instance_activate_object(obj_background_brightness_gameplay);
		#endregion /* Activate objects that always should be active END */
		
		if (instance_exists(obj_leveleditor_placed_object))
		{
			with (obj_leveleditor_placed_object)
			{
				scr_make_sprite_transparent_setting_difficulty_levels();
			}
		}
		
		global.deactivate_timer = 0; /* Reset the deactivate timer */
	}
	#endregion /* Deactivate instances outside view. Run this code at start of Step Event END */
	
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
		{
			audio_stop_sound(level_editing_music);
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
			&& (floor(random(3 - 1)) == 0)
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
			}
			else
			if (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg"))
			{
				level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg");
			}
			previous_selected_level_editing_music = 1;
		}
		else
		if (global.selected_level_editing_music == 2)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_1.ogg");
			previous_selected_level_editing_music = 2;
		}
		else
		if (global.selected_level_editing_music == 3)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_2.ogg");
			previous_selected_level_editing_music = 3;
		}
		else
		if (global.selected_level_editing_music == 4)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_3.ogg");
			previous_selected_level_editing_music = 4;
		}
		else
		if (global.selected_level_editing_music == 5)
		&& (file_exists("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg"))
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = audio_create_stream("resource_pack/" + string(ds_list_find_value(global.all_loaded_resource_pack, global.selected_resource_pack)) + "/sound/level_editor_music_4.ogg");
			previous_selected_level_editing_music = 5;
		}
		else
		{
			audio_stop_sound(level_editing_music);
			level_editing_music = noone;
		}
		if (file_exists("save_file/config.ini"))
		{
			ini_open(game_save_id + "save_file/config.ini");
			ini_write_real("config", "select_level_editing_music", global.selected_level_editing_music);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
	}
	
	scr_toggle_fullscreen();
	
	#region /* Always keep the brush size within these values */
	place_size = clamp(place_size, 0, 5);
	erase_size = clamp(erase_size, 0, 5);
	#endregion /* Always keep the brush size within these values END */
	
	if (get_window_height != old_window_get_height)
	|| (get_window_width != old_window_get_width)
	{
		scr_set_screen_size();
		old_window_get_height = get_window_height;
		old_window_get_width = get_window_width;
	}
	
	#region /* Holding the play key down */
	if (keyboard_check_pressed(key_play))
	&& (welcome_to_level_editor == 0)
	|| (level_editor_menu == "play")
	&& (key_a_pressed)
	&& (welcome_to_level_editor == 0)
	|| (gamepad_button_check_pressed(global.player_slot[1], button_play))
	&& (welcome_to_level_editor == 0)
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	&& (mouse_check_button_pressed(mb_left))
	{
		if (!pause)
		&& (!in_modify_object_menu)
		{
			pressing_play_timer = 1;
		}
	}
	if (keyboard_check(key_play))
	&& (welcome_to_level_editor == 0)
	|| (level_editor_menu == "play")
	&& (key_a_hold)
	&& (welcome_to_level_editor == 0)
	|| (gamepad_button_check(global.player_slot[1], button_play))
	&& (welcome_to_level_editor == 0)
	|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
	&& (mouse_check_button(mb_left))
	|| (pressing_play_timer < 3)
	{
		if (!pause)
		&& (!in_modify_object_menu)
		&& (pressing_play_timer >= 1)
		&& (!key_b_hold)
		{
			if (!audio_is_playing(snd_charge_up))
			{
				scr_audio_play(snd_charge_up, volume_source.sound);
			}
			pressing_play_timer ++;
		}
	}
	if (key_b_pressed)
	{
		pressing_play_timer = 0;
	}
	#endregion /* Holding the play key down END */
	
	#region /* Play Level when releasing Enter Key */
	if (pressing_play_timer >= 1)
	|| (global.full_level_map_screenshot)
	{
		instance_activate_all(); /* Activate all instances before saving the custom level. You need this code right here otherwise the game crashes */
		if (keyboard_check_released(key_play))
		|| (level_editor_menu == "play")
		&& (key_a_released)
		|| (gamepad_button_check_released(global.player_slot[1], button_play))
		|| (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64))
		&& (mouse_check_button_released(mb_left))
		|| (global.full_level_map_screenshot)
		|| (pressing_play_timer > frames_until_playtest_from_start)
		{
			if (!pause)
			&& (!in_modify_object_menu)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (!instance_exists(obj_camera))
				|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width - 64, get_window_height * 0.5 - 32, get_window_width, get_window_height * 0.5 + 32))
				&& (!instance_exists(obj_camera))
				{
					global.checkpoint_x = 0;
					global.checkpoint_y = 0;
					global.checkpoint_millisecond = 0;
					global.checkpoint_second = 0;
					global.checkpoint_minute = 0;
					global.checkpoint_realmillisecond = 0;
					
					menu_delay = 9999; /* Disable all menu control */
					lives = 5;
					global.lives_until_assist = 0;
					
					audio_stop_sound(level_editing_music); /* Stop the background music that plays during level editing when playtesting a level */
					
					if (!global.world_editor)
					{
						scr_save_custom_level_json();
						
						with(obj_leveleditor_placed_object)
						{
							alarm[1] = 1;
						}
						
						if (pressing_play_timer >= frames_until_playtest_from_start || global.full_level_map_screenshot)
						{
							instance_create_depth(obj_level_player1_start.x, obj_level_player1_start.y, 0, obj_camera);
						}
						else
						{
							instance_create_depth(view_center_x, view_center_y, 0, obj_camera);
						}
					}
					else
					{
						scr_save_custom_world();
						
						if (point_in_rectangle(mouse_get_x, mouse_get_y, play_level_icon_x - 32, display_get_gui_height() - 64, play_level_icon_x + 32, display_get_gui_height() + 64) || global.full_level_map_screenshot)
						{
							instance_create_depth(obj_level_player1_start.x, obj_level_player1_start.y, 0, obj_player_map);
						}
						else
						{
							var level_instance = instance_nearest(x, y, obj_level);
							instance_create_depth(level_instance ? level_instance.x : x, level_instance ? level_instance.y : y, 0, obj_player_map);
						}
					}
					
					scr_scale_background();
					global.actually_play_edited_level = false;
					global.play_edited_level = true;
					audio_stop_sound(snd_charge_up);
					scr_audio_play(snd_click, volume_source.sound);
					instance_destroy();
				}
			}
		}
	}
	#endregion /* Play Level when releasing Enter Key END */
	
	if (global.create_level_from_template)
	&& (create_level_from_template_save_delay < 10)
	{
		create_level_from_template_save_delay ++;
	}
	else
	if (global.create_level_from_template)
	&& (create_level_from_template_save_delay == 10)
	{
		
		#region /* Limit so cursor and view can't go outside room */
		if (cam_width < 1920)
		|| (cam_height < 1080)
		{
			camera_set_view_size(view_camera[view_current], 1920, 1080);
		}
		scr_set_screen_size();
		
		#region /* Limit controller x and controller y inside room */
		controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
		controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
		#endregion /* Limit controller x and controller y inside room END */
		
		#region /* Limit x and y inside room */
		x = clamp(x, cam_x, cam_x + cam_width);
		y = clamp(y, cam_y, cam_y + cam_height);
		#endregion /* Limit x and y inside room END */
		
		#region /* Limit view inside room when creating level from template */
		camera_set_view_pos(view_camera[view_current],
		max(0, min(cam_x, room_width - cam_width)),
		max(0, min(cam_y, room_height - cam_height)));
		#endregion /* Limit view inside room when creating level from template END */
		
		#endregion /* Limit so view and cursor can't go outside room END */
		
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		global.checkpoint_millisecond = 0;
		global.checkpoint_second = 0;
		global.checkpoint_minute = 0;
		global.checkpoint_realmillisecond = 0;
		
		ini_open(game_save_id + "save_file/custom_level_save.ini");
		ini_write_real(global.level_name, "checkpoint_x", 0);
		ini_write_real(global.level_name, "checkpoint_y", 0);
		ini_write_real(global.level_name, "checkpoint_millisecond", 0);
		ini_write_real(global.level_name, "checkpoint_second", 0);
		ini_write_real(global.level_name, "checkpoint_minute", 0);
		ini_write_real(global.level_name, "checkpoint_realmillisecond", 0);
		ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		
		menu_delay = 3; /* Disable all menu control */
		lives = 5;
		global.lives_until_assist = 0;
		global.actually_play_edited_level = false;
		global.play_edited_level = false; /* Set this to false so you don't playtest the level */
		global.character_select_in_this_menu = "level_editor";
		create_level_from_template_save_delay ++; /* Stop saving template level */
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
		
		#region /* Set view speed here before setting other view speed code */
		if (key_move_faster)
		|| (keyboard_check(vk_control))
		{
			controller_view_speed = 24;
		}
		else
		if (keyboard_check(vk_shift))
		{
			controller_view_speed = 2;
		}
		else
		{
			controller_view_speed = 8;
		}
		#endregion /* Set view speed here before setting other view speed code END */
		
		#region /* Controller Input Changes */
		if (global.controls_used_for_navigation == "keyboard")
		&& (!navigate_camera_with_arrowkeys)
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			if (keyboard_check(global.player_[inp.key][1][1][action.up]))
			|| (keyboard_check(global.player_[inp.key][1][2][action.up]))
			|| (keyboard_check(vk_up))
			|| (keyboard_check(global.player_[inp.key][1][1][action.down]))
			|| (keyboard_check(global.player_[inp.key][1][2][action.down]))
			|| (keyboard_check(vk_down))
			|| (keyboard_check(global.player_[inp.key][1][1][action.left]))
			|| (keyboard_check(global.player_[inp.key][1][2][action.left]))
			|| (keyboard_check(vk_left))
			|| (keyboard_check(global.player_[inp.key][1][1][action.right]))
			|| (keyboard_check(global.player_[inp.key][1][2][action.right]))
			|| (keyboard_check(vk_right))
			{
				navigate_camera_with_arrowkeys = true;
			}
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (navigate_camera_with_arrowkeys)
		{
			navigate_camera_with_arrowkeys = false;
		}
		
		if (global.controls_used_for_navigation != "gamepad")
		&& (navigate_camera_with_arrowkeys)
		{
			/* If you are controlling the cursor with arrow keys, make the cursor appear in the middle of the screen */
			x = view_center_x;
			y = view_center_y;
			cursor_x = x;
			cursor_y = y;
			controller_x = x;
			controller_y = y;
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		{
			navigate_camera_with_arrowkeys = false;
			x = mouse_x;
			y = mouse_y;
			cursor_x = mouse_get_x;
			cursor_y = mouse_get_y;
			controller_x = mouse_x;
			controller_y = mouse_y;
			
			camera_set_view_pos(view_camera[view_current], cam_x, cam_y); /* Move actual camera */
		}
		else
		if (global.controls_used_for_navigation == "gamepad")
		{
			x = controller_x;
			y = controller_y;
			cursor_x = controller_x;
			cursor_y = controller_y;
			
			#region /* Keep controller_x and controller_y within view */
			controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
			controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
			#endregion /* Keep controller_x and controller_y within view END */
			
			if (!pause)
			&& (!in_modify_object_menu)
			&& (!show_autoscroll_menu)
			{
				if (key_up)
				&& (controller_y > cam_y)
				{
					if (key_move_faster)
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
						{
							controller_view_speed = 24;
						}
						controller_y -= 12;
					}
					else
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
						{
							controller_view_speed = 8;
						}
						controller_y -= 4;
					}
				}
				if (key_down)
				&& (controller_y < cam_y + cam_height)
				{
					if (key_move_faster)
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
						{
							controller_view_speed = 24;
						}
						controller_y += 12;
					}
					else
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrv) == 0)
						{
							controller_view_speed = 8;
						}
						controller_y += 4;
					}
				}
				if (key_left)
				&& (controller_x > cam_x)
				{
					if (key_move_faster)
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrh) == 0)
						{
							controller_view_speed = 24;
						}
						controller_x -= 12;
					}
					else
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrh) == 0)
						{
							controller_view_speed = 8;
						}
						controller_x -= 4;
					}
				}
				if (key_right)
				&& (controller_x < cam_x + cam_width)
				{
					if (key_move_faster)
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrh) == 0)
						{
							controller_view_speed = 24;
						}
						controller_x += 12;
					}
					else
					{
						if (gamepad_axis_value(global.player_slot[1], gp_axisrh) == 0)
						{
							controller_view_speed = 8;
						}
						controller_x += 4;
					}
				}
			}
		}
		#endregion /* Controller Input Changes END */
		
		#region /* Move view with keyboard or gamepad*/
		var view_x_direction = 0;
		var view_y_direction = 0;
		if (!pause)
		&& (!in_modify_object_menu)
		&& (!show_autoscroll_menu)
		{
			if (gamepad_axis_value(global.player_slot[1], gp_axisrv) < 0)
			|| (global.controls_used_for_navigation != "gamepad")
			&& (key_up)
			&& (!key_down)
			|| (key_up)
			&& (y <= cam_y + (controller_view_speed * 2))
			{
				if (view_center_y > -cam_height)
				{
					view_y_direction = -controller_view_speed; /* Move camera up */
					controller_y -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player_slot[1], gp_axisrv) > +0.3)
			|| (global.controls_used_for_navigation != "gamepad")
			&& (key_down)
			&& (!key_up)
			|| (key_down)
			&& (y >= cam_y + cam_height - (controller_view_speed * 2))
			{
				if (view_center_y < obj_level_height.y + cam_height)
				{
					view_y_direction = +controller_view_speed; /* Move camera down */
					controller_y += controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player_slot[1], gp_axisrh) < -0.3)
			|| (global.controls_used_for_navigation != "gamepad")
			&& (key_left)
			&& (!key_right)
			|| (key_left)
			&& (x <= cam_x + (controller_view_speed * 2))
			{
				if (view_center_x > -cam_width)
				{
					view_x_direction = -controller_view_speed; /* Move camera left */
					controller_x -= controller_view_speed;
				}
			}
			if (gamepad_axis_value(global.player_slot[1], gp_axisrh) > +0.3)
			|| (global.controls_used_for_navigation != "gamepad")
			&& (key_right)
			&& (!key_left)
			|| (key_right)
			&& (x >= cam_x + cam_width - (controller_view_speed * 2))
			{
				if (view_center_x < obj_level_width.x + cam_width)
				{
					view_x_direction = +controller_view_speed; /* Move camera right */
					controller_x += controller_view_speed;
				}
			}
		}
		camera_set_view_pos(view_camera[view_current], cam_x + view_x_direction, cam_y + view_y_direction); /* Move actual camera */
		#endregion /* Move view with keyboard or gamepad END */
		
		if (!keyboard_check(vk_alt)) /* If you hold down the Alt key when placing objects, you ignore the grid and can place freely */
		{
			move_snap(global.grid_hsnap, global.grid_vsnap); /* Make sure to always move snap */
		}
		
		#region /* Place Object */
		if (can_make_place_size_bigger && mouse_check_button(mb_left))
		|| (mouse_check_button_pressed(mb_left))
		|| (can_make_place_size_bigger && key_a_hold)
		|| (key_a_pressed)
		{
			if (level_editor_menu == "")
			&& (!gamepad_button_check(global.player_slot[1], button_play))
			&& (!keyboard_check(key_play))
			&& (!keyboard_check(vk_space))
			&& (!mouse_check_button(mb_middle))
			&& (!mouse_check_button(mb_right))
			&& (pressing_play_timer == 0)
			&& (!scroll_view)
			&& (!drag_object)
			&& (!fill_mode)
			&& (!erase_mode)
			&& (!pause)
			&& (!in_modify_object_menu)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			&& (!place_meeting(x, y, obj_level_player1_start))
			&& (!place_meeting(x, y, obj_level_player2_start))
			&& (!place_meeting(x, y, obj_level_player3_start))
			&& (!place_meeting(x, y, obj_level_player4_start))
			&& (!position_meeting(x, y, obj_level_height))
			&& (!position_meeting(x, y, obj_level_width))
			&& (!position_meeting(x, y, obj_water_level_height))
			&& (!hovering_over_icon)
			&& (global.part_limit < 4000)
			{
				if (!obj_level_width.drag_object)
				&& (obj_level_width.drag_release_timer == 0)
				&& (!obj_level_height.drag_object)
				&& (obj_level_height.drag_release_timer == 0)
				{
					if (place_object_delay_timer < 2)
					&& (can_make_place_size_bigger)
					{
						place_object_delay_timer ++;
					}
					if (place_object_delay_timer >= 2)
					|| (!can_make_place_size_bigger)
					{
						drag_object = false;
						
						#region /* Brush size 1 */
						scr_size_place_object(   0,    0, 1, true);
						#endregion /* Brush size 1 END */
						
						#region /* Brush size 2 */
						scr_size_place_object(   0, + 32, 2, false);
						scr_size_place_object(+ 32,    0, 2, false);
						scr_size_place_object(+ 32, + 32, 2, false);
						#endregion /* Brush size 2 END */
						
						#region /* Brush size 3 */
						scr_size_place_object(   0, - 32, 3, false);
						scr_size_place_object(+ 32, - 32, 3, false);
						scr_size_place_object(- 32,    0, 3, false);
						scr_size_place_object(- 32, + 32, 3, false);
						scr_size_place_object(- 32, - 32, 3, false);
						#endregion /* Brush size 3 END */
						
						#region /* Brush size 4 */
						scr_size_place_object(   0, + 64, 4, false);
						scr_size_place_object(+ 32, + 64, 4, false);
						scr_size_place_object(+ 64,    0, 4, false);
						scr_size_place_object(+ 64, + 32, 4, false);
						scr_size_place_object(+ 64, + 64, 4, false);
						scr_size_place_object(+ 64, - 32, 4, false);
						scr_size_place_object(- 32, + 64, 4, false);
						#endregion /* Brush size 4 END */
						
						#region /* Brush size 5 */
						scr_size_place_object(   0, - 64, 5, false);
						scr_size_place_object(+ 32, - 64, 5, false);
						scr_size_place_object(+ 64, - 64, 5, false);
						scr_size_place_object(- 32, - 64, 5, false);
						scr_size_place_object(- 64,    0, 5, false);
						scr_size_place_object(- 64, + 32, 5, false);
						scr_size_place_object(- 64, + 64, 5, false);
						scr_size_place_object(- 64, - 32, 5, false);
						scr_size_place_object(- 64, - 64, 5, false);
						#endregion /* Brush size 5 END */
						
						#region /* Brush size 6 */
						scr_size_place_object(   0, + 96, 6, false);
						scr_size_place_object(+ 32, + 96, 6, false);
						scr_size_place_object(+ 64, + 96, 6, false);
						scr_size_place_object(+ 96,    0, 6, false);
						scr_size_place_object(+ 96, + 32, 6, false);
						scr_size_place_object(+ 96, + 64, 6, false);
						scr_size_place_object(+ 96, + 96, 6, false);
						scr_size_place_object(+ 96, - 32, 6, false);
						scr_size_place_object(+ 96, - 64, 6, false);
						scr_size_place_object(- 32, + 96, 6, false);
						scr_size_place_object(- 64, + 96, 6, false);
						#endregion /* Brush size 6 END */
						
						ds_list_add(placed_objects_list, place_object);
					}
				}
			}
		}
		#endregion /* Place Object END */
		
		#region /* Make object change difficulty layer depending on what difficulty layer is selected */
		if (level_editor_menu == "")
		&& (difficulty_layer > 0)
		&& (!drag_object)
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (!hovering_over_icon)
		&& (!keyboard_check(vk_space))
		&& (!mouse_check_button(mb_middle))
		{
			if (erase_mode)
			&& (mouse_check_button(mb_left))
			|| (mouse_check_button(mb_right))
			|| (erase_mode)
			&& (key_a_hold)
			|| (key_b_hold)
			|| (keyboard_check(key_erase_object))
			{
				instance_create_depth(x, y, 0, obj_erase_brush);
			}
		}
		#endregion /* Make object change difficulty layer depending on what difficulty layer is selected END */
		
		#region /* Delete / Erase Objects */
		if (level_editor_menu == "")
		&& (difficulty_layer == 0)
		&& (!drag_object)
		&& (erase_mode)
		&& (!scroll_view)
		&& (!pause)
		&& (!in_modify_object_menu)
		&& (!hovering_over_icon)
		&& (!keyboard_check(vk_space))
		&& (!keyboard_check(vk_escape))
		&& (!mouse_check_button(mb_middle))
		{
			if (mouse_check_button(mb_right))
			|| (mouse_check_button(mb_left))
			|| (key_a_hold)
			|| (key_b_hold)
			|| (keyboard_check(key_erase_object))
			{
				instance_create_depth(x, y, 0, obj_erase_brush);
			}
		}
		#endregion /* Delete / Erase Objects END */
		
		#region /* Set to appear on difficulty level */
		if (level_editor_menu == "")
		&& (difficulty_layer > 0)
		{
			if (!mouse_check_button(mb_right))
			&& (!hovering_over_icon)
			&& (mouse_check_button(mb_left))
			&& (!obj_leveleditor.drag_object)
			&& (!obj_leveleditor.erase_mode)
			&& (!obj_leveleditor.pause)
			
			|| (!obj_leveleditor.key_b_hold)
			&& (!hovering_over_icon)
			&& (!obj_leveleditor.drag_object)
			&& (!obj_leveleditor.erase_mode)
			&& (obj_leveleditor.key_a_hold)
			&& (!obj_leveleditor.pause)
			
			|| (keyboard_check(obj_leveleditor.key_erase_object))
			&& (!hovering_over_icon)
			&& (!obj_leveleditor.drag_object)
			&& (!obj_leveleditor.erase_mode)
			&& (obj_leveleditor.key_a_hold)
			&& (!obj_leveleditor.pause)
			{
				instance_create_depth(x, y, 0, obj_erase_brush);
			}
		}
		#endregion /* Set to appear on difficulty level END */
		
		#region /* Set to dissapear on difficulty level */
		if (level_editor_menu == "")
		&& (difficulty_layer > 0)
		&& (!keyboard_check(vk_escape))
		{
			if (!mouse_check_button(mb_left))
			&& (!hovering_over_icon)
			&& (mouse_check_button(mb_right))
			&& (!obj_leveleditor.pause)
			
			|| (!obj_leveleditor.key_a_hold)
			&& (!hovering_over_icon)
			&& (obj_leveleditor.key_b_hold)
			&& (!obj_leveleditor.pause)
			
			|| (!obj_leveleditor.key_a_hold)
			&& (!hovering_over_icon)
			&& (keyboard_check(obj_leveleditor.key_erase_object))
			&& (!obj_leveleditor.pause)
			{
				instance_create_depth(x, y, 0, obj_erase_brush);
			}
		}
		#endregion /* Set to dissapear on difficulty level END */
		
		if (place_object_delay_timer > 0)
		{
			place_object_delay_timer -= 0.5;
		}
		
		#region /* Nearest Placed Object Code */
		with(instance_nearest(x, y, obj_leveleditor_placed_object))
		{
			
			scr_modify_objects_in_level_editor(); /* Change object when you click on it */
			
		}
		#endregion /* Nearest Placed Object Code END */
		
	}
	#endregion /* If you haven't yet quit the level editor, then run this code END */
	
	if (mouse_check_button_released(mb_left))
	|| (key_a_released)
	|| (gamepad_button_check_released(global.player_slot[1], button_draw))
	{
		placing_object -= 0.2;
	}
	if (placing_object <= 0.9)
	&& (placing_object > 0)
	{
		placing_object -= 0.2;	
	}
	
	#region /* Keyboard Shortcuts */
	
	#region /* Press D key to change to drawing tool in level editor */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		if (keyboard_check_pressed(key_draw))
		&& (fill_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_draw))
		&& (fill_mode)
		|| (keyboard_check_pressed(key_draw))
		&& (erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_draw))
		&& (erase_mode)
		|| (keyboard_check_released(key_erase_object))
		&& (erase_mode)
		{
			fill_mode = false;
			erase_mode = false;
		}
		else
		if (keyboard_check_pressed(key_change_draw_size))
		&& (!fill_mode)
		&& (!erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_change_draw_size))
		&& (!fill_mode)
		&& (!erase_mode)
		{
			place_size = (place_size + 1) % 6;
			erase_size = place_size;
		}
	}
	#endregion /* Press D key to change to drawing tool in level editor END */
	
	#region /* Press E key to change to erase tool in level editor */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		if (keyboard_check_pressed(key_erase))
		&& (!erase_mode)
		|| (keyboard_check_pressed(key_erase_object))
		&& (!erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_erase))
		&& (!erase_mode)
		{
			erase_mode = true;
			fill_mode = false;
		}
		else
		if (keyboard_check_pressed(key_change_erase_size))
		&& (erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_change_erase_size))
		&& (erase_mode)
		{
			erase_size = (erase_size + 1) % 6;
			place_size = erase_size;
		}
	}
	#endregion /* Press E key to change to erase tool in level editor */
	
	#region /* Press F key to change to fill tool in level editor */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		if (keyboard_check_released(key_fill))
		&& (!fill_mode)
		|| (gamepad_button_check_released(global.player_slot[1], button_fill))
		&& (!fill_mode)
		{
			erase_mode = false;
			fill_mode = true;
		}
		else
		if (keyboard_check_pressed(key_change_fill_type))
		|| (gamepad_button_check_pressed(global.player_slot[1], button_change_fill_type))
		{
			if (!erase_mode && fill_mode)
			{
				switch (fill_mode_type)
				{
					case "fill":
						fill_mode_type = "horizontal";
						break;
					case "horizontal":
						fill_mode_type = "vertical";
						break;
					case "vertical":
						fill_mode_type = "fill";
						break;
					default:
						break;
				}
				erase_mode = false;
			}
		}
	}
	#endregion /* Press F key to change to fill tool in level editor */
	
	#region /* Scroll mouse wheel to change drawing tool size in level editor */
	if (!fill_mode)
	&& (!erase_mode)
	&& (mouse_check_button(mb_left))
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		if (mouse_wheel_down())
		{
			if (place_size > 0)
			{
				place_size --;
				erase_size --;
			}
		}
		else
		if (mouse_wheel_up())
		{
			if (place_size < 5)
			{
				place_size ++;
				erase_size ++;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change drawing tool size in level editor End */
	
	#region /* Scroll mouse wheel to change erase tool size in level editor */
	if (erase_mode)
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		if (mouse_wheel_down())
		{
			fill_mode = false;
			if (erase_size > 0)
			{
				erase_size --;
				place_size --;
			}
		}
		else
		if (mouse_wheel_up())
		{
			fill_mode = false;
			if (erase_size < 5)
			{
				erase_size ++;
				place_size ++;
			}
		}
	}
	#endregion /* Scroll mouse wheel to change erase tool size in level editor END */
	
	#region /* Grid hotkeys */
	if (show_grid && keyboard_check(vk_control) && !pause && !in_modify_object_menu)
	{
		if (keyboard_check(vk_shift))
		{
			var grid_snap_how_much = 16;
		}
		else
		{
			var grid_snap_how_much = 1;
		}
		if (keyboard_check_pressed(ord("A")) && global.grid_hsnap > grid_snap_how_much && global.grid_vsnap > grid_snap_how_much)
		{
			show_grid = true;
			global.grid_hsnap -= grid_snap_how_much;
			global.grid_vsnap -= grid_snap_how_much;
		}
		else if (keyboard_check_pressed(ord("S")) && global.grid_hsnap < 160 && global.grid_vsnap < 160)
		{
			show_grid = true;
			global.grid_hsnap += grid_snap_how_much;
			global.grid_vsnap += grid_snap_how_much;
		}
	}
	#endregion /* Grid hotkeys END */
	
	#endregion /* Keyboard Shortcuts END */
	
	#region /* Show or hide grid hotkey */
	if (keyboard_check_pressed(key_grid))
	&& (!pause)
	&& (!in_modify_object_menu)
	|| (gamepad_button_check_pressed(global.player_slot[1], button_grid))
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		show_grid = not show_grid;
	}
	#endregion /* Show or hide grid hotkey END */
	
	#region /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) */
	if (!pause)
	&& (!in_modify_object_menu)
	{
		
		#region /* Zoom Out */
		if (zoom_out)
		{
			if (cam_width < 3840) /* 1920 * 2 = 3840 */
			&& (cam_height < 2160) /* 1080 * 2 = 2160 */
			{
				camera_set_view_size((view_camera[view_current]), cam_width + 8, cam_height + 4.5);
				camera_set_view_pos((view_camera[view_current]), cam_x -4, cam_y - 2.5); /* Move camera position when zooming out so it doesn't look too weird */
			}
		}
		#endregion /* Zoom Out END */
		
		else
		
		#region /* Reset Zoom */
		if (zoom_reset)
		{
			
			#region /* Limit so cursor and view can't go outside room */
			scr_set_screen_size();
			
			#region /* Limit controller x and controller y inside room */
			controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
			controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
			#endregion /* Limit controller x and controller y inside room END */
			
			#region /* Limit x and y inside room */
			x = clamp(x, cam_x, cam_x + cam_width);
			y = clamp(y, cam_y, cam_y + cam_height);
			#endregion /* Limit x and y inside room END */
			
			#region /* Limit view inside room when reseting camera zoom */
			camera_set_view_pos(view_camera[view_current],
			max(0, min(cam_x, room_width - cam_width)),
			max(0, min(cam_y, room_height - cam_height)));
			#endregion /* Limit view inside room when reseting camera zoom END */
		
			#endregion /* Limit so view and cursor can't go outside room END */
		
		}
		#endregion /* Reset Zoom END */
	
		else
	
		#region /* Zoom In */
		if (zoom_in)
		{
			if (cam_width > 696)
			&& (cam_height > 368)
			{
				camera_set_view_size((view_camera[view_current]), cam_width - 8, cam_height -4.5);
				camera_set_view_pos((view_camera[view_current]), cam_x + 4, cam_y + 2.5); /* Move camera position when zooming in so it doesn't look too weird */
			}
		}
		#endregion /* Zoom In END */

	}
	#endregion /* Zoom In and Out (Draw red rectangles around the screen when you can't zoom any more) END */
	
	#region /* Select Object Menu */
	if (mouse_check_button_pressed(mb_any))
	&& (!point_in_rectangle(mouse_get_x, mouse_get_y, 0, 0, display_get_gui_width(), 192)) /* Can't make menu fade away quicker when clicking the object category buttons or objects in toolbar */
	|| (keyboard_check_pressed(vk_anykey))
	|| (key_a_pressed)
	|| (key_b_pressed)
	{
		if (menu_delay == 0 && menu_joystick_delay == 0)
		{
			show_selected_menu = false;
		}
	}
	
	if (!show_selected_menu)
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 0, 0.1);
	}
	else
	{
		selected_menu_alpha = lerp(selected_menu_alpha, 1, 0.1);
	}
	#endregion /* Select Object Menu END */
	
	#region /* Position the Cursor */
	if (quit_level_editor <= 0)
	{

	#region /* Scroll Cursor */
	if (keyboard_check(vk_space))
	&& (mouse_check_button(mb_left))
	|| (mouse_check_button(mb_middle))
	|| (keyboard_check(vk_space))
	{
		mouse_sprite = spr_cursor_scroll;
	}
	#endregion /* Scroll Cursor END */
	
	else
	
	#region /* Fill Cursor */
	if (fill_mode)
	&& (!erase_mode)
	&& (!scroll_view)
	&& (!place_meeting(x, y, obj_level_player1_start))
	&& (!place_meeting(x, y, obj_level_player2_start))
	&& (!place_meeting(x, y, obj_level_player3_start))
	&& (!place_meeting(x, y, obj_level_player4_start))
	&& (!place_meeting(x, y, obj_level_end))
	{
		mouse_sprite = spr_cursor_fill;
	}
	#endregion /* Fill Cursor END */
	
	else
	
	#region /* Erase Cursor */
	if (erase_mode)
	&& (!scroll_view)
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		mouse_sprite = spr_cursor_erase;
	}
	#endregion /* Erase Cursor END */
	
	else
	
	#region /* Default Cursor */
	if (!scroll_view)
	&& (!drag_object)
	&& (!fill_mode)
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		mouse_sprite = spr_cursor_brush;
	}
	#endregion /* Default Cursor END */
	
	}
	#endregion /* Position the Cursor END */
	
	#region /* Change modes */
	if (mouse_check_button_pressed(mb_right))
	{
		if (!pause)
		&& (!in_modify_object_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			erase_mode = true;
		}
	}
	if (mouse_check_button_released(mb_right))
	|| (gamepad_button_check_released(global.player_slot[1], button_erase))
	{
		if (!pause)
		&& (!in_modify_object_menu)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			erase_mode = false;
		}
	}
	#endregion /* Change modes END */
	
	if (quit_level_editor <= 0)
	{
		
		#region /* When pressing left click, increase current undo value */
		if (mouse_check_button_released(mb_left))
		|| (mouse_check_button_released(mb_right))
		{
			current_undo_value ++;
			max_undo_value = current_undo_value;
		}
		#endregion /* When pressing left click, increase current undo value END */
		
		#region /* Minimum undo value */
		if (current_undo_value <= 0)
		{
			current_undo_value = 0;
		}
		#endregion /* Minimum undo value END */
		
		#region /* Fill with Objects */
		if (fill_mode)
		{
			if (mouse_check_button(mb_left))
			&& (!hovering_over_icon)
			|| (keyboard_check(key_fill))
			&& (key_fill != key_change_fill_type)
			|| (gamepad_button_check(global.player_slot[1], button_fill))
			&& (button_fill != button_change_fill_type)
			{
				if (!keyboard_check(vk_space))
				&& (!mouse_check_button(mb_middle))
				&& (!mouse_check_button(mb_right))
				&& (!scroll_view)
				&& (!drag_object)
				&& (!erase_mode)
				&& (!pause)
				&& (!in_modify_object_menu)
				&& (menu_delay == 0 && menu_joystick_delay == 0)
				{
					if (place_object_delay_timer < 2)
					{
						place_object_delay_timer ++;
					}
					if (place_object_delay_timer >= 2)
					{
						if (!place_meeting(x, y, obj_leveleditor_placed_object))
						&& (!place_meeting(x, y, obj_leveleditor_fill))
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
				}
			}
		}
		#endregion /* Fill with Objects END */
		
		#region /* SELECT WHAT OBJECT TO PLACE */
		
		#region /* Scroll Objects Left */
		if (mouse_wheel_up())
		&& (!mouse_check_button(mb_middle))
		&& (!key_a_pressed)
		&& (!mouse_check_button(mb_left))
		&& (!erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_scroll_object_left))
		|| (keyboard_check_pressed(key_scroll_object_left))
		|| (level_editor_menu == "select_object_menu")
		&& (keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(global.player_slot[1], gp_padl))
		{
			if (!instance_exists(obj_leveleditor_fill))
			&& (!pause)
			&& (!in_modify_object_menu)
			{
				level_editor_menu = "select_object_menu";
				scr_audio_play(snd_leveleditor_cycle_item_left, volume_source.sound);
				if (selected_object > 0)
				{
					selected_object --;
					select_object_menu_actual_x += 100;
				}
				else
				{
					if (!if_daily_build)
					{
						if (current_object_category == "terrain")
						{
							current_object_category = "gizmo";
						}
						else
						if (current_object_category == "decoration")
						{
							current_object_category = "terrain";
						}
						else
						if (current_object_category == "item")
						{
							current_object_category = "decoration";
						}
						else
						if (current_object_category == "enemy")
						{
							current_object_category = "item";
						}
						else
						if (current_object_category == "gizmo")
						{
							current_object_category = "enemy";
						}
					}
					else
					if (if_daily_build)
					{
						if (current_object_category == "daily_build_standard")
						{
							current_object_category = "daily_build_featured";
						}
						else
						if (current_object_category == "daily_build_featured")
						{
							current_object_category = "daily_build_standard";
						}
					}
					selected_object = 9999;
				}
				global.part_limit_text_alpha = 0;
				show_selected_menu = true;
			}
		}
		#endregion /* Scroll Objects Left END */
		
		#region /* Scroll Objects Right */
		if (mouse_wheel_down())
		&& (!mouse_check_button(mb_middle))
		&& (!key_a_pressed)
		&& (!mouse_check_button(mb_left))
		&& (!erase_mode)
		|| (gamepad_button_check_pressed(global.player_slot[1], button_scroll_object_right))
		|| (keyboard_check_pressed(key_scroll_object_right))
		|| (level_editor_menu == "select_object_menu")
		&& (keyboard_check_pressed(ord("L")) || gamepad_button_check_pressed(global.player_slot[1], gp_padr))
		{
			if (!instance_exists(obj_leveleditor_fill))
			&& (!pause)
			&& (!in_modify_object_menu)
			{
				level_editor_menu = "select_object_menu";
				scr_audio_play(snd_leveleditor_cycle_item_right, volume_source.sound);
				if (selected_object < total_number_of_objects)
				{
					selected_object ++;
					select_object_menu_actual_x -= 100;
				}
				else
				{
					if (!if_daily_build)
					{
						if (current_object_category == "terrain")
						{
							current_object_category = "decoration";
						}
						else
						if (current_object_category == "decoration")
						{
							current_object_category = "item";
						}
						else
						if (current_object_category == "item")
						{
							current_object_category = "enemy";
						}
						else
						if (current_object_category == "enemy")
						{
							current_object_category = "gizmo";
						}
						else
						if (current_object_category == "gizmo")
						{
							current_object_category = "terrain";
						}
					}
					else
					if (if_daily_build)
					{
						if (current_object_category == "daily_build_standard")
						{
							current_object_category = "daily_build_featured";
						}
						else
						if (current_object_category == "daily_build_featured")
						{
							current_object_category = "daily_build_standard";
						}
					}
					selected_object = 0;
					select_object_menu_actual_x = 0;
				}
				global.part_limit_text_alpha = 0;
				show_selected_menu = true;
			}
		}
		#endregion /* Scroll Objects Right END */
		
		#endregion /* SELECT WHAT OBJECT TO PLACE END */
		
	}
	
	#region /* Menu Navigation Delay */
	if (menu_delay > 0)
	{
		menu_delay --;
	}
	#endregion /* Menu Navigation Delay END */
	
	#region /* Pause virtual key */
	if (os_type == os_ios or os_type == os_android)
	{
		virtual_key_add(1100 - 128, 0, 400, 128, vk_escape); /* Pause virtual key */
	}
	#endregion /* Pause virtual key END */
	
	#region /* End Game */
	if (quit_level_editor >= 1)
	{
		quit_level_editor ++;
		instance_activate_all(); /* Activate all instances before saving the custom level */
		
		#region /* Save Level */
		if (quit_level_editor == 3)
		{
			ini_open(game_save_id + "save_file/custom_level_save.ini");
			ini_write_real(global.level_name, "checkpoint_x", 0);
			ini_write_real(global.level_name, "checkpoint_y", 0);
			ini_write_real(global.level_name, "checkpoint_millisecond", 0);
			ini_write_real(global.level_name, "checkpoint_second", 0);
			ini_write_real(global.level_name, "checkpoint_minute", 0);
			ini_write_real(global.level_name, "checkpoint_realmillisecond", 0);
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
			
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
			global.play_edited_level = false; /* Set this to false so you don't playtest the level */
			global.character_select_in_this_menu = "level_editor";
			scr_save_custom_level_json(); /* Save level when quitting level */
		}
		#endregion /* Save Level END */
		
		#region /* Limit so cursor and view can't go outside room */
		if (quit_level_editor == 4)
		{
			if (instance_exists(obj_background_brightness_gameplay))
			{
				obj_background_brightness_gameplay.background_brightness_lerp = 0;
			}
			
			if (cam_width < 1920 || cam_height < 1080)
			{
				camera_set_view_size(view_camera[view_current], 1920, 1080);
			}
			scr_set_screen_size();
			
			/* Limit view inside room when saving screenshot */
			if (instance_exists(obj_level_width) && instance_exists(obj_level_height))
			{
				camera_set_view_pos(view_camera[view_current],
				max(0, min(cam_x, obj_level_width.x - cam_width)),
				max(0, min(cam_y, obj_level_height.y - cam_height)));
			}
			
			/* Limit controller x and y inside room */
			controller_x = clamp(controller_x, cam_x, cam_x + cam_width);
			controller_y = clamp(controller_y, cam_y, cam_y + cam_height);
			
			/* Limit x and y inside room */
			x = clamp(x, cam_x, cam_x + cam_width);
			y = clamp(y, cam_y, cam_y + cam_height);
		}
		#endregion /* Limit so view and cursor can't go outside room END */
		
		#region /* Save Thumbnail a little bit after saving level */
		if (quit_level_editor == 5 && global.level_name != "")
		{
			scr_automatic_screenshot();
		}
		#endregion /* Save Thumbnail a little bit after saving level END */
		
		if (quit_level_editor > 6)
		{
			global.create_level_from_template = false; /* Disable global.create_level_from_template after loading everything and quitting the level editor, to let every object have time to load and save */
			room_goto(rm_title);
		}
	}
	#endregion /* End Game END */
	
	#region /* Press Pause Button */
	if (quit_level_editor == 0)
	&& (!pause)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		if (keyboard_check_pressed(vk_escape))
		|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
		|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
		|| (gamepad_button_check_pressed(4, gp_start))
		|| (mouse_check_button_released(mb_left))
		&& (menu == "pause")
		&& (point_in_rectangle(mouse_get_x, mouse_get_y, display_get_gui_width() - 185, pause_button_y, display_get_gui_width(), pause_button_y + 42))
		{
			
			#region /* Get what custom assets are in the level */
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background1.jpeg"))
			{
				have_custom_asset_background1 = true;
			}
			else
			{
				have_custom_asset_background1 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background2.jpeg"))
			{
				have_custom_asset_background2 = true;
			}
			else
			{
				have_custom_asset_background2 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background3.jpeg"))
			{
				have_custom_asset_background3 = true;
			}
			else
			{
				have_custom_asset_background3 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "background4.jpeg"))
			{
				have_custom_asset_background4 = true;
			}
			else
			{
				have_custom_asset_background4 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1.jpeg"))
			{
				have_custom_asset_foreground1 = true;
			}
			else
			{
				have_custom_asset_foreground1 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground1_5.jpeg"))
			{
				have_custom_asset_foreground1_5 = true;
			}
			else
			{
				have_custom_asset_foreground1_5 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground2.jpeg"))
			{
				have_custom_asset_foreground2 = true;
			}
			else
			{
				have_custom_asset_foreground2 = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.png"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.gif"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.jpg"))
			|| (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/background/" + "foreground_secret.jpeg"))
			{
				have_custom_asset_foreground_secret = true;
			}
			else
			{
				have_custom_asset_foreground_secret = false;
			}
			
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/sound/" + "music.ogg"))
			{
				have_custom_asset_music = true;
			}
			else
			{
				have_custom_asset_music = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/sound/" + "music_underwater.ogg"))
			{
				have_custom_asset_music_underwater = true;
			}
			else
			{
				have_custom_asset_music_underwater = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/sound/" + "ambience.ogg"))
			{
				have_custom_asset_ambience = true;
			}
			else
			{
				have_custom_asset_ambience = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/sound/" + "ambience_underwater.ogg"))
			{
				have_custom_asset_ambience_underwater = true;
			}
			else
			{
				have_custom_asset_ambience_underwater = false;
			}
			if (file_exists(game_save_id + "custom_levels/" + string(global.level_name) + "/sound/" + "clear_melody.ogg"))
			{
				have_custom_asset_clear_melody = true;
			}
			else
			{
				have_custom_asset_clear_melody = false;
			}
			#endregion /* Get what custom assets are in the level END */
			
			global.pause_room = rm_leveleditor;
			in_modify_object_menu = false;
			welcome_to_level_editor = 0;
			quit_level_editor = 0;
			can_input_level_name = false;
			input_key = false;
			menu = "continue";
			pause = true;
			menu_delay = 3;
		}
	}
	#endregion /* Press Pause Button END */
	
	#region /* Keep view within the level */
	if (view_center_x < -(cam_width * 0.5))
	&& (!scroll_view)
	{
		camera_set_view_pos(view_camera[view_current], -cam_width, cam_y);
	}
	if (view_center_y < -(cam_height * 0.5))
	&& (!scroll_view)
	{
		camera_set_view_pos(view_camera[view_current], cam_x, -cam_height);
	}
	if (!obj_level_width.drag_object)
	&& (obj_level_width.drag_release_timer == 0)
	&& (view_center_x > obj_level_width.x +(cam_width * 0.5))
	&& (!scroll_view)
	{
		camera_set_view_pos(view_camera[view_current], obj_level_width.x, cam_y);
	}
	if (!obj_level_height.drag_object)
	&& (obj_level_height.drag_release_timer == 0)
	&& (view_center_y > obj_level_height.y +(cam_height * 0.5))
	&& (!scroll_view)
	{
		camera_set_view_pos(view_camera[view_current], cam_x, obj_level_height.y);
	}
	#endregion /* Keep view within the level END */
	
	#region /* Scroll View. Need to have this code at the bottom of the Step Event */
	if (mouse_check_button_pressed(mb_left))
	&& (keyboard_check(vk_space))
	&& (quit_level_editor <= 0)
	|| (mouse_check_button_pressed(mb_middle))
	&& (quit_level_editor <= 0)
	{
		if (!instance_exists(obj_leveleditor_fill))
		{
			drag_x = mouse_x;
			drag_y = mouse_y;
			scroll_view = true;
		}
	}
	if (scroll_view)
	&& (quit_level_editor <= 0)
	&& (!instance_exists(obj_leveleditor_fill))
	{
		camera_set_view_pos(view_camera[view_current], drag_x -(mouse_x -cam_x), drag_y -(mouse_y -cam_y)); /* Scroll the camera position with the mouse */
	}
	if (mouse_check_button_released(mb_left))
	&& (scroll_view)
	|| (mouse_check_button_released(mb_middle))
	&& (scroll_view)
	{
		scroll_view = false;
	}
	#endregion /* Scroll View. Need to have this code at the bottom of the Step Event END */
	
	select_object_menu_x = lerp(select_object_menu_x, select_object_menu_actual_x, 0.3); /* Lerp the object selection scrolling */
}

if (!global.actually_play_edited_level && quit_level_editor == 0)
{
	
	#region /* Undo and Redo icon */
	if (show_undo_redo_icon)
	{
		
		#region /* Click Undo icon */
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width() - 64, display_get_gui_height() - 64))
		&& (global.controls_used_for_navigation == "mouse")
		{
			tooltip = "Undo";
			show_tooltip += 2;
			if (mouse_check_button_released(mb_left))
			{
				current_undo_value --;
			}
		}
		#endregion /* Click Undo icon END */
		
		else
		
		#region /* Click Redo icon */
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		&& (global.controls_used_for_navigation == "mouse")
		{
			tooltip = "Redo";
			show_tooltip += 2;
			if (mouse_check_button_released(mb_left))
			&& (current_undo_value < max_undo_value)
			{
				current_undo_value ++;
			}
		}
		#endregion /* Click Redo icon END */
		
	}
	#endregion /* Undo and Redo icon END */
	
	if (!point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, room_height * 2))
	&& (global.controls_used_for_navigation == "mouse")
	{
		show_tooltip = 0;
	}
	
	#region /* Hover over icon reveals the icon */
	
	#region /* Make bottom row of icon appear if mouse is hovering at bottom screen */
	if (!drag_object)
	{
		if (point_in_rectangle(cursor_x, cursor_y, 0, display_get_gui_height() - 64, always_show_level_editor_buttons_x + 32, display_get_gui_height() + 64)) /* Bottom buttons on left side */
		|| (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256 - 64, display_get_gui_height() - 64 - 42, display_get_gui_width(), display_get_gui_height() + 64)) /* Bottom buttons on right side */
		|| (global.always_show_level_editor_buttons)
		{
			if (!show_icon_at_bottom)
			{
				show_icon_at_bottom = true;
			}
		}
		else
		{
			if (show_icon_at_bottom)
			{
				show_icon_at_bottom = false;
			}
		}
	}
	#endregion /* Make bottom row of icon appear if mouse is hovering at bottom screen END */
	
	#region /* Make left column of icon appear if mouse is hovering at left screen */
	if (!drag_object)
	{
		if (point_in_rectangle(cursor_x, cursor_y, 0, autoscroll_icon_y - 32, 64, autoscroll_icon_y + 32)) /* Autoscroll button on left side */
		|| (global.always_show_level_editor_buttons)
		{
			if (!show_icon_at_left)
			{
				show_icon_at_left = true;
			}
		}
		else
		{
			if (show_icon_at_left)
			{
				show_icon_at_left = false;
			}
		}
	}
	#endregion /* Make left column of icon appear if mouse is hovering at left screen END */
	
	#region /* Make undo and redo icon appear if mouse is hovering at right screen */
	if (undo_and_redo_buttons_enabled)
	&& (!drag_object)
	{
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128, display_get_gui_height() - 128, display_get_gui_width(), display_get_gui_height() - 64))
		&& (!pause)
		&& (!in_modify_object_menu)
		|| (global.always_show_level_editor_buttons)
		&& (!pause)
		&& (!in_modify_object_menu)
		{
			if (!show_undo_redo_icon)
			{
				show_undo_redo_icon = true;
			}
		}
		else
		{
			if (show_undo_redo_icon)
			{
				show_undo_redo_icon = false;
			}
		}
	}
	else
	{
		show_undo_redo_icon = false;
	}
	#endregion /* Make undo and redo icon appear if mouse is hovering at right screen END */
	
	#region /* Make top row of icon appear if mouse is hovering at top screen */
	if (!drag_object)
	{
		if (global.always_show_level_editor_buttons
		|| global.controls_used_for_navigation == "mouse"
		&& point_in_rectangle(cursor_x, cursor_y, - 32, - 64, display_get_gui_width() + 32, + 64)
		|| level_editor_menu == "terrain"
		|| level_editor_menu == "decoration"
		|| level_editor_menu == "item"
		|| level_editor_menu == "enemy"
		|| level_editor_menu == "gizmo"
		|| level_editor_menu == "daily_build_standard"
		|| level_editor_menu == "daily_build_featured"
		|| level_editor_menu == "grid"
		|| level_editor_menu == "zoom_out"
		|| level_editor_menu == "zoom_reset"
		|| level_editor_menu == "zoom_in"
		|| level_editor_menu == "help")
		{
			if (!show_icon_at_top)
			{
				show_icon_at_top = true;
			}
		}
		else
		if (global.controls_used_for_navigation == "mouse")
		&& (point_in_rectangle(cursor_x, cursor_y, - 32, + 64, display_get_gui_width() + 32, display_get_gui_height() + 64))
		|| (global.controls_used_for_navigation != "mouse")
		{
			if (show_icon_at_top)
			{
				show_icon_at_top = false;
			}
		}
	}
	if (show_icon_at_top)
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		icon_at_top_y = lerp(icon_at_top_y, - 1, 0.1);
	}
	else
	{
		icon_at_top_y = lerp(icon_at_top_y, - 100, 0.1);
	}
	#endregion /* Make top row of icon appear if mouse is hovering at top screen END */
	
	#endregion /* Hover over icon reveals the icon END */
	
	#region /* Show icon at bottom of screen */
	if (show_icon_at_bottom
	|| global.always_show_level_editor_buttons
	|| level_editor_menu == "play"
	|| level_editor_menu == "pen"
	|| level_editor_menu == "erase"
	|| level_editor_menu == "fill"
	|| level_editor_menu == "hide"
	|| level_editor_menu == "easy"
	|| level_editor_menu == "normal"
	|| level_editor_menu == "hard"
	|| level_editor_menu == "difficulty_toggle"
	|| level_editor_menu == "wipe")
	&& (!drag_object && !pause && !in_modify_object_menu)
	{
		icon_at_bottom_y = lerp(icon_at_bottom_y, 0, 0.1);
	}
	else
	{
		icon_at_bottom_y = lerp(icon_at_bottom_y, +110, 0.1);
	}
	#endregion /* Show icon at bottom of screen END */
	
	#region /* Show icon at left of screen */
	if (show_icon_at_left
	|| global.always_show_level_editor_buttons
	|| level_editor_menu == "autoscroll")
	&& (!drag_object && !pause && !in_modify_object_menu)
	|| (show_autoscroll_menu)
	{
		icon_at_left_x = lerp(icon_at_left_x, 0, 0.1);
	}
	else
	{
		icon_at_left_x = lerp(icon_at_left_x, -110, 0.1);
	}
	#endregion /* Show icon at left of screen END */
	
	#region /* Show undo and redo icon to the right of screen */
	if (show_undo_redo_icon)
	{
		undo_redo_icon_y = lerp(undo_redo_icon_y, 0, 0.1);
	}
	else
	{
		undo_redo_icon_y = lerp(undo_redo_icon_y, + 200, 0.1);
	}
	#endregion /* Show undo and redo icon to the right of screen END */
	
	#region /* Click icon at bottom of screen */
	if (show_icon_at_bottom)
	&& (!pause)
	&& (!in_modify_object_menu)
	{
		
		#region /* Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard */
		if (global.enable_difficutly_layers_in_level_editor)
		{
			
			#region /* Easy */
			if (set_difficulty_mode)
			&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 256 - 64, display_get_gui_height() - 64, display_get_gui_width() - 192 - 64, display_get_gui_height() + 64))
			&& (global.controls_used_for_navigation == "mouse")
			|| (level_editor_menu == "easy")
			{
				tooltip = "Show only objects in easy";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "easy")
				&& (key_a_pressed)
				{
					difficulty_layer = 1;
					fill_mode = false;
					erase_mode = false;
					set_difficulty_mode = true;
					if (instance_exists(obj_leveleditor_placed_object))
					{
						with (obj_leveleditor_placed_object)
						{
							scr_make_sprite_transparent_setting_difficulty_levels();
						}
					}
				}
			}
			#endregion /* Easy END */
			
			#region /* Normal */
			if (set_difficulty_mode)
			&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 192 - 64, display_get_gui_height() - 64, display_get_gui_width() - 128 - 64, display_get_gui_height() + 64))
			&& (global.controls_used_for_navigation == "mouse")
			|| (level_editor_menu == "normal")
			{
				tooltip = "Show only objects in normal";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "normal")
				&& (key_a_pressed)
				{
					difficulty_layer = 2;
					fill_mode = false;
					erase_mode = false;
					set_difficulty_mode = true;
					if (instance_exists(obj_leveleditor_placed_object))
					{
						with (obj_leveleditor_placed_object)
						{
							scr_make_sprite_transparent_setting_difficulty_levels();
						}
					}
				}
			}
			#endregion /* Normal END */
			
			#region /* Hard */
			if (set_difficulty_mode)
			&& (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 128 - 64, display_get_gui_height() - 64, display_get_gui_width() - 64 - 64, display_get_gui_height() + 64))
			&& (global.controls_used_for_navigation == "mouse")
			|| (level_editor_menu == "hard")
			{
				tooltip = "Show only objects in hard";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "hard")
				&& (key_a_pressed)
				{
					difficulty_layer = 3;
					fill_mode = false;
					erase_mode = false;
					set_difficulty_mode = true;
					if (instance_exists(obj_leveleditor_placed_object))
					{
						with (obj_leveleditor_placed_object)
						{
							scr_make_sprite_transparent_setting_difficulty_levels();
						}
					}
				}
			}
			#endregion /* Hard END */
			
			#region /* Set Difficulty Mode / Back */
			if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64 - 64, display_get_gui_height() - 64, display_get_gui_width() - 64, display_get_gui_height() + 64))
			&& (global.controls_used_for_navigation == "mouse")
			|| (level_editor_menu == "difficulty_toggle")
			{
				tooltip = "Set what objects should appear on what difficulty";
				show_tooltip += 2;
				if (mouse_check_button_pressed(mb_left))
				|| (level_editor_menu == "difficulty_toggle")
				&& (key_a_pressed)
				{
					fill_mode = false;
					erase_mode = false;
					if (set_difficulty_mode)
					{
						set_difficulty_mode = false;
						difficulty_layer = 0;
					}
					else
					{
						set_difficulty_mode = true;
					}
					var time_source = time_source_create(time_source_game, 2, time_source_units_frames, function() /*For some reason the script needs to play after a bit of delay, otherwise it doesn't do anything when clicking back*/
					{
						if (instance_exists(obj_leveleditor_placed_object))
						{
							with (obj_leveleditor_placed_object)
							{
								scr_make_sprite_transparent_setting_difficulty_levels();
							}
						}
					}
					, [], 1);
					time_source_start(time_source);
				}
			}
			#endregion /* Set Difficulty Mode / Back */
			
		}
		#endregion /* Difficulty settings, 0 = All, 1 = Easy, 2 = Normal, 3 = Hard END */
		
		#region /* Click Delete All Objects / Wipe Button */
		if (point_in_rectangle(cursor_x, cursor_y, display_get_gui_width() - 64, display_get_gui_height() - 64, display_get_gui_width(), display_get_gui_height() + 64))
		&& (global.controls_used_for_navigation == "mouse")
		|| (level_editor_menu == "wipe")
		{
			tooltip = "Delete All Objects";
			show_tooltip += 2;
			if (mouse_check_button_pressed(mb_left))
			|| (level_editor_menu == "wipe")
			&& (key_a_pressed)
			{
				menu_delay = 3;
				level_editor_option_back_to_menu = "delete_all_objects_button";
				menu = "delete_all_objects_no";
				pause = true;
			}
		}
		#endregion /* Click Delete All Objects / Wipe Button END */
		
	}
	#endregion /* Click icon at bottom of screen END */
	
}