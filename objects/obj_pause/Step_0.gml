var get_window_height = display_get_gui_height();
var get_window_width = display_get_gui_width();
var mouse_get_x = device_mouse_x_to_gui(0);
var mouse_get_y = device_mouse_y_to_gui(0);

scr_set_menu_font_color();
scr_set_controls_used_to_navigate();
scr_menu_navigation_initialization(0);

fade_in_pause_alpha = lerp(fade_in_pause_alpha, 1, 0.1);

if (menu_delay > 0)
{
	menu_delay --;
}

if (global.narrator >= 0)
{
	menuvoice_1player = noone;
	menuvoice_2player = noone;
	menuvoice_3player = noone;
	menuvoice_4player = noone;
	menuvoice_leveleditor = noone;
	menuvoice_leveleditor_denied = noone;
	voice_options = noone;
}

#region /* Hide menu for clean screenshots */
if (hide_menu_for_clean_screenshots_timer < 60 * 3)
{
	if (menu == "continue") /* Can only hide menu when on these buttons specifically */
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	{
		hide_menu_for_clean_screenshots_timer ++;
	}
}
if (menu != "continue")
&& (menu != "options")
&& (menu != "restart")
&& (menu != "quit")
&& (menu != "report")
{
	hide_menu_for_clean_screenshots_timer = 0;
	hide_menu_for_clean_screenshots_alpha = lerp(hide_menu_for_clean_screenshots_alpha, 0, 0.01);
}
if (hide_menu_for_clean_screenshots_timer = 60 * 3)
{
	hide_menu_for_clean_screenshots_alpha = lerp(hide_menu_for_clean_screenshots_alpha, 1, 0.01);
}
if (in_settings)
|| (menu == "quit_game_yes")
|| (menu == "quit_game_no")
{
	hide_menu_for_clean_screenshots_alpha = 0;
	hide_menu_for_clean_screenshots_timer = 0;
}

if (keyboard_check_pressed(ord("Y")))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face4))
{
	if (menu == "continue") /* Can only hide menu when on these buttons specifically */
	|| (menu == "options")
	|| (menu == "restart")
	|| (menu == "quit")
	|| (menu == "report")
	{
		if (!hide_menu_for_clean_screenshots)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		&& (in_settings == false)
		&& (menu != "quit_game_yes")
		&& (menu != "quit_game_no")
		{
			hide_menu_for_clean_screenshots = true;
			menu_delay = 3;
		}
	}
}

if (keyboard_check_pressed(vk_anykey))
|| (mouse_check_button_released(mb_middle))
|| (mouse_check_button_released(mb_right))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_face4))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face1))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face2))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face3))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_face4))
{
	if (hide_menu_for_clean_screenshots)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		hide_menu_for_clean_screenshots = false;
		menu_delay = 3;
	}
}
#endregion /* Hide menu for clean screenshots END */

gamepad_set_vibration(0, 0, 0);
gamepad_set_vibration(1, 0, 0);
gamepad_set_vibration(2, 0, 0);
gamepad_set_vibration(3, 0, 0);
gamepad_set_vibration(4, 0, 0);

#region /* Set screen size */
camera_set_view_border(view_camera[view_current], 1920, 1080); /* View Border */
camera_set_view_size(view_camera[view_current], 1920, 1080);

if (!instance_exists(obj_leveleditor))
{
	camera_set_view_target(view_camera[view_current], self);
}
scr_set_screen_size();
#endregion /* Set screen size END */

scr_toggle_fullscreen();

#region /* Menu cursor image speed */
menu_cursor_index += 0.3;
if (menu_cursor_index > 4)
{
	menu_cursor_index = 0;
}
#endregion /* Menu cursor image speed END */

if (unpause)
{
	scr_delete_sprite_properly(global.pause_screenshot);
	room_goto(global.pause_room); /* Go back to room where you paused. You want to use room_goto, not room = global.pause_room, as that makes it go to incorrect rooms */
}

#region /* Show loading icon and reset level */
if (show_loading_icon)
{
	global.loading_spinning_angle -= 10;
	
	if (menu == "reset_from_checkpoint")
	&& (global.loading_spinning_angle < -20)
	{
		
		#region /* Restart Level */
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		unpause = true;
		#endregion /* Restart Level END */
		
	}
	
	if (menu == "reset_from_start")
	&& (global.loading_spinning_angle < -20)
	|| (menu == "restart")
	&& (global.loading_spinning_angle < -20)
	{
		
		#region /* Restart Level */
		
		#region /* Reset timer back to zero */
		global.timeattack_realmillisecond = 0;
		global.timeattack_millisecond = 0;
		global.timeattack_second = 0;
		global.timeattack_minute = 0;
		#endregion /* Reset timer back to zero END */
		
		if (global.character_select_in_this_menu == "main_game")
		{
			var level_name = string(ds_list_find_value(global.all_loaded_main_levels, global.select_level_index));
			
			ini_open(working_directory + "save_file/file" + string(global.file) + ".ini");
			ini_key_delete(level_name, "checkpoint_x");
			ini_key_delete(level_name, "checkpoint_y");
			ini_key_delete(level_name, "checkpoint_direction");
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		else
		if (global.character_select_in_this_menu == "level_editor")
		{
			var level_name = global.level_name;
			
			ini_open(working_directory + "save_file/custom_level_save.ini");
			ini_key_delete(level_name, "checkpoint_x");
			ini_key_delete(level_name, "checkpoint_y");
			ini_key_delete(level_name, "checkpoint_direction");
			ini_close(); switch_save_data_commit(); /* Remember to commit the save data! */
		}
		
		global.checkpoint_x = 0;
		global.checkpoint_y = 0;
		
		global.restart_level = true;
		audio_stop_all();
		global.pause = false;
		unpause = true;
		#endregion /* Restart Level END */
			
	}
}
#endregion /* Show loading icon and reset level END */

#region /* Return to game */
if (keyboard_check_pressed(vk_escape))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_start))
|| (gamepad_button_check_pressed(global.player_slot[1], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[2], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[3], gp_select))
|| (gamepad_button_check_pressed(global.player_slot[4], gp_select))
{
	if (can_remap_key == false)
	&& (!input_key)
	&& (menu_delay == 0 && menu_joystick_delay == 0)
	{
		scr_config_save(); /* Save Config */
		audio_resume_all();
		audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
		audio_sound_gain(global.music_underwater, 0, 0);
		audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
		audio_sound_gain(global.ambience_underwater, 0, 0);
		global.pause = false;
		unpause = true;
	}
}
#endregion /* Return to game END */

/* PAUSE LEVEL SELECT / LEVEL EDITOR MENU */
if (!hide_menu_for_clean_screenshots)
{
	if (room == rm_world_map)
	&& (show_loading_icon == false)
	|| (room == rm_leveleditor)
	&& (show_loading_icon == false)
	|| (global.pause_room == rm_world_map)
	&& (show_loading_icon == false)
	|| (global.pause_room == rm_leveleditor)
	&& (show_loading_icon == false)
	{
		
		#region /* Continue */
		if (menu == "continue")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
			
				#region /* Return to game */
				audio_resume_all();
				audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
				audio_sound_gain(global.music_underwater, 0, 0);
				audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
				audio_sound_gain(global.ambience_underwater, 0, 0);
				global.pause = false;
				unpause = true;
				#endregion /* Return to game END */
			
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				&& (global.search_id != "")
				{
					menu = "report";
				}
				else
				if (global.goal_active == false)
				{
					menu = "quit";
				}
				else
				{
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "options";
			}
		}
		#endregion /* Continue END */
		
		else
		
		#region /* Options */
		if (menu == "options")
		{
			
			#region /* Select Options */
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				scr_audio_play(voice_options, volume_source.voice);
				menu = noone;
				can_navigate_settings_sidebar = true;
				in_settings = true;
			}
			#endregion /* Select Options END */

			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "continue";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.goal_active == false)
				{
					if (global.pause_room == rm_leveleditor)
					{
						holding_key_timer = 0;
						menu_delay = 3;
						menu = "restart";
					}
					else
					{
						menu_delay = 3;
						menu = "quit";
					}
				}
				else
				{
					menu_delay = 3;
					menu = "continue";
				}
			}
		}
		#endregion /* Options END */
		
		else
		
		#region /* Restart */
		if (menu == "restart")
		&& (global.goal_active == false)
		{
			if (global.checkpoint_x == 0)
			&& (global.checkpoint_y == 0)
			&& (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x != 0)
			&& (global.checkpoint_y != 0)
			&& (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x == 0)
			&& (global.checkpoint_y == 0)
			&& (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			
			|| (global.checkpoint_x != 0)
			&& (global.checkpoint_y != 0)
			&&(global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.checkpoint_x == 0)
				&& (global.checkpoint_y == 0)
				{
					holding_key_timer ++;
					
					#region /* Restart Level */
					if (holding_key_timer > 61)
					{
						show_loading_icon = true;
					}
					#endregion /* Restart Level END */
					
				}
				else
				{
					holding_key_timer = 0;
					menu_delay = 3;
					menu = "reset_from_checkpoint";
				}
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "options";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit";
			}
		}
		#endregion /* Restart END */
		
		else
		
		#region /* Reset from Checkpoint */
		if (menu == "reset_from_checkpoint")
		&& (global.goal_active == false)
		{
			if (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer ++;
				
				#region /* Restart Level */
				if (holding_key_timer > 61)
				{
					show_loading_icon = true;
				}
				#endregion /* Restart Level END */
				
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart_nevermind";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_start";
			}
		}
		#endregion /* Restart to Checkpoint END */
		
		else
		
		#region /* Reset from Start */
		if (menu == "reset_from_start")
		&& (global.goal_active == false)
		{
			if (key_a_hold)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (mouse_check_button(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer ++;
				
				#region /* Restart Level */
				if (holding_key_timer > 61)
				{
					show_loading_icon = true;
				}
				#endregion /* Restart Level END */
				
			}
			else
			if (holding_key_timer > 0)
			{
				holding_key_timer --;
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart_nevermind";
			}
		}
		#endregion /* Reset from Start END */
		
		else
		
		#region /* Restart Nevermind */
		if (menu == "restart_nevermind")
		&& (global.goal_active == false)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_start";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "reset_from_checkpoint";
			}
		}
		#endregion /* Restart Nevermind END */
		
		else
		
		#region /* Quit */
		if (menu == "quit")
		&& (global.goal_active == false)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
				{
					menu_delay = 3;
					menu = "quit_to_map";
				}
				else
				{
					menu_delay = 3;
					menu = "quit_to_title";
				}
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				if (global.pause_room == rm_leveleditor)
				{
					holding_key_timer = 0;
					menu_delay = 3;
					menu = "restart";
				}
				else
				{
					menu_delay = 3;
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.character_select_in_this_menu == "level_editor")
				&& (global.search_id != "")
				{
					menu = "report";
				}
				else
				{
					menu = "continue";
				}
			}
		}
		#endregion /* Quit END */
		
		else
		
		#region /* Report */
		if (menu == "report")
		&& (global.character_select_in_this_menu == "level_editor")
		&& (global.search_id != "")
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, 0, get_window_height - 42, get_window_width + 370, get_window_height))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				report_back_to_menu = "report";
				menu = "report_next";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.goal_active == false)
				{
					menu = "quit";
				}
				else
				{
					menu = "options";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "continue";
			}
		}
		#endregion /* Report END */
		
		else
		
		#region /* Quit to Map */
		if (menu == "quit_to_map")
		&& (global.goal_active == false)
		&& (global.pause_room == rm_leveleditor)
		{
			if (global.character_select_in_this_menu == "level_editor")
			{
				menu = "quit_to_title";
			}
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
			
				#region /* Return to Map */
			
				#region /* Reset timer back to zero */
				global.timeattack_realmillisecond = 0;
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute = 0;
				#endregion /* Reset timer back to zero END */
			
				global.quit_level = true;
				global.quit_to_map = true;
				audio_stop_all();
				global.pause = false;
				unpause = true;
				#endregion /* Return to Map END */
			
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_nevermind";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
		}
		#endregion /* Quit to Map END */
		
		else
		
		#region /* Quit to Title */
		if (menu == "quit_to_title")
		&& (global.goal_active == false)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.character_select_in_this_menu == "level_editor")
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				
				#region /* Return to Title */
				
				/* Reset timer back to zero */
				global.timeattack_realmillisecond = 0;
				global.timeattack_millisecond = 0;
				global.timeattack_second = 0;
				global.timeattack_minute = 0;
				
				global.quit_level = true;
				global.quit_to_title = true;
				audio_stop_all();
				global.pause = false;
				unpause = true;
				#endregion /* Return to Title END */
				
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
				{
					menu = "quit_to_map";
				}
				else
				{
					menu = "quit_nevermind";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.enable_options_for_pc)
				{
					menu = "quit_to_desktop";
				}
				else
				{
					menu = "quit_nevermind";
				}
			}
		}
		#endregion /* Quit to Title END */
		
		else
		
		#region /* Quit to Desktop */
		if (menu == "quit_to_desktop")
		&& (global.goal_active == false)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.enable_options_for_pc)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (global.enable_options_for_pc)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.enable_options_for_pc)
			&& (global.character_select_in_this_menu == "level_editor")
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_game_no";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_to_title";
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit_nevermind";
			}
		}
		#endregion /* Quit to Desktop END */
		
		else
		
		#region /* Quit Nevermind */
		if (menu == "quit_nevermind")
		&& (global.goal_active == false)
		{
			if (key_a_pressed)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_world_map)
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			|| (global.pause_room == rm_leveleditor)
			&& (global.character_select_in_this_menu == "level_editor")
			&& (point_in_rectangle(mouse_get_x, mouse_get_y, get_window_width * 0.5 - 185, get_window_height * 0.5 + 2 + 42 + 42, get_window_width * 0.5 + 185, get_window_height * 0.5 + 41 + 42 + 42))
			&& (mouse_check_button_released(mb_left))
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				menu = "quit";
			}
			if (key_up)
			&& (!key_down)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.enable_options_for_pc)
				{
					menu = "quit_to_desktop";
				}
				else
				{
					menu = "quit_to_title";
				}
			}
			else
			if (key_down)
			&& (!key_up)
			&& (menu_delay == 0 && menu_joystick_delay == 0)
			{
				menu_delay = 3;
				if (global.pause_room == rm_leveleditor)
				&& (global.character_select_in_this_menu == "main_game")
				{
					menu = "quit_to_map";
				}
				else
				{
					menu = "quit_to_title";
				}
			
			}
		}
		#endregion /* Quit Nevermind END */
		
		#region /* Return to game by pressing the back key */
		if (key_b_pressed)
		&& (menu_delay == 0 && menu_joystick_delay == 0)
		{
			if (menu == "continue")
			|| (menu == "options")
			|| (menu == "restart")
			|| (menu == "quit")
			{
				scr_config_save(); /* Save Config */
				audio_resume_all();
				audio_sound_gain(global.music, global.volume_music * global.volume_main, 0);
				audio_sound_gain(global.music_underwater, 0, 0);
				audio_sound_gain(global.ambience, global.volume_ambient * global.volume_main, 0);
				audio_sound_gain(global.ambience_underwater, 0, 0);
				global.pause = false;
				unpause = true; /* Return to game END */
			}
			else
			
			#region /* Return to first menu */
			if (menu == "reset_from_checkpoint")
			|| (menu == "reset_from_start")
			|| (menu == "restart_nevermind")
			{
				holding_key_timer = 0;
				menu_delay = 3;
				menu = "restart";
			}
			else
			if (menu == "quit_to_map")
			|| (menu == "quit_to_title")
			|| (menu == "quit_to_desktop")
			|| (menu == "quit_nevermind")
			{
				menu_delay = 3;
				menu = "quit";
			}
			#endregion /* Return to first menu END */
			
		}
		#endregion /* Return to game by pressing the back key END */
		
	}
}